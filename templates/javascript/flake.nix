{
  description = "JavaScript development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
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
            packages = with pkgs; [
              vscode-langservers-extracted

              pnpm
              nodejs_24
              corepack
              bun
            ];

            npm_config_registry = "https://registry.npmmirror.com/";
            NPM_CONFIG_REGISTRY = "https://registry.npmmirror.com/";
            COREPACK_NPM_REGISTRY = "https://registry.npmmirror.com/";

            shellHook = ''
              export PATH="${pkgs.pnpm}/bin:$PATH"
            '';
          };
        }
      );
    };
}
