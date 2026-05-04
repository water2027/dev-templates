{ pkgs, inputs, ... }:

{
  packages = [

  ];

  languages.javascript = {
    enable = true;
    package = inputs.nixpkgs-nodejs.packages.${pkgs.system}."latest-lts";
    # directory = "";
    corepack = {
      enable = true;
    };
    nodejs = {
      enable = true;
    };
    npm = {
      enable = true;
    };
    pnpm = {
      enable = true;
      package = pkgs.pnpm;
    };
    bun = {
      enable = true;
    };
  };

  enterShell = "";
}
