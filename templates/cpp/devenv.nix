{ pkgs, ... }:

{
  packages = with pkgs; [
    gcc
    clang-tools
    cmake
    ninja
    gdb
    pkg-config
  ];

  enterShell = ''
    c++ --version
    cmake --version
  '';
}
