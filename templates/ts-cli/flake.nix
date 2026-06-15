{
  description = "ts-cli template";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      features = {
        browser = false;
        playwright = false;
        typescript = true;
        vue = false;
      };
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          inherit (pkgs) lib stdenv;

          basePackages = with pkgs; [
            vscode-langservers-extracted
            eslint_d

            pnpm
            nodejs_24
            corepack
            bun
            openssl
          ];

          optionalPackages =
            lib.optionals (features.browser && stdenv.isLinux) [ pkgs.chromium ]
            ++ lib.optionals features.playwright [ pkgs.playwright-driver.browsers ]
            ++ lib.optionals features.typescript (
              with pkgs;
              [
                typescript-language-server
                vtsls
              ]
            )
            ++ lib.optionals features.vue [ pkgs.vue-language-server ];

          playwrightEnv = lib.optionalAttrs features.playwright {
            PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
            PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";
          };
        in
        {
          default = pkgs.mkShell (
            {
              packages = basePackages ++ optionalPackages;

              npm_config_registry = "https://registry.npmmirror.com/";
              NPM_CONFIG_REGISTRY = "https://registry.npmmirror.com/";
              COREPACK_NPM_REGISTRY = "https://registry.npmmirror.com/";

              shellHook = ''
                export PATH="${pkgs.pnpm}/bin:$PATH"
                node --version
                pnpm --version
              '';
            }
            // playwrightEnv
          );
        }
      );
    };
}
