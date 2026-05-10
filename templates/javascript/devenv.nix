{ pkgs, ... }:

{
  packages = [

  ];

  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_24;
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
