{
  description = "Python development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-python = {
      url = "github:cachix/nixpkgs-python";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-python,
      ...
    }:
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
          python = nixpkgs-python.packages.${system}."3.8.18";
        in
        {
          default = pkgs.mkShell {
            packages = [
              python
              pkgs.uv
            ];

            shellHook = ''
              python --version

              if [ ! -d .venv ]; then
                uv venv --python ${python}/bin/python .venv
              fi

              source .venv/bin/activate
            '';
          };
        }
      );
    };
}
