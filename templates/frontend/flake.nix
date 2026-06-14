{
  description = "Frontend development shell";

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
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages =
              with pkgs;
              [
                git
                jq
                openssl
                pkg-config
                vips
              ]
              ++ lib.optionals stdenv.isLinux [
                chromium
              ]
              ++ [
                playwright-driver.browsers
                vscode-langservers-extracted
                typescript-language-server
                vtsls
                vue-language-server

                pnpm
                nodejs_24
                corepack
                bun
              ];

            npm_config_registry = "https://registry.npmmirror.com/";
            NPM_CONFIG_REGISTRY = "https://registry.npmmirror.com/";
            COREPACK_NPM_REGISTRY = "https://registry.npmmirror.com/";

            PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
            PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";

            shellHook = ''
              export PATH="${pkgs.pnpm}/bin:$PATH"
              node --version
              pnpm --version
            '';
          };
        }
      );
    };
}
