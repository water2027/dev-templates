{ pkgs, inputs, ... }:

{
  packages = with pkgs; [
    git
    jq
    openssl
    pkg-config
    vips
    chromium
    playwright-driver.browsers
  ];

  env = {
    PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
    PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";
  };

  languages.javascript = {
    enable = true;
    package = inputs.nixpkgs-javascript.packages.${pkgs.system}."latest-lts";
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

  processes.dev.exec = "pnpm dev --host 0.0.0.0";

  enterShell = ''
    node --version
    pnpm --version
  '';
}
