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
          description = "web or nodejs or bun";
        };
        frontend = {
          path = ./templates/frontend;
          description = "frontend app with node, pnpm, bun, chromium on Linux and playwright";
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
