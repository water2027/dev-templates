{ ... }:

{
  packages = [

  ];

  languages.rust = {
    enable = true;
    channel = "stable";
    version = "latest";
    components = [
      "rustc"
      "cargo"
      "clippy"
      "rustfmt"
      "rust-analyzer"
    ]; # default
    # targets = [ ];
    # toolchainFile = ./rust-toolchain.toml;
  };

  enterShell = "";
}
