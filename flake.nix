{
  description = "water's nix develop templates";

  outputs =
    { ... }:
    {
      templates = {
        python = {
          path = ./templates/python;
          description = "python with uv";
        };
        javascript = {
          path = ./templates/javascript;
          description = "javascript with optional browser, playwright, typescript, and vue tooling";
        };
        cpp = {
          path = ./templates/cpp;
          description = "c++ with gcc, clang-tools, cmake, ninja, gdb on Linux and lldb on Darwin";
        };
        rust = {
          path = ./templates/rust;
          description = "rust";
        };
        ts-monorepo = {
          path = ./templates/ts-monorepo;
          description = "monorepo";
        };
      };
    };
}
