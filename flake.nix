{
  description = "water's development templates";

  outputs =
    { ... }:
    {
      devenvModules = { };
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
          description = "frontend app with node, pnpm, bun, chromium and playwright";
        };
        rust = {
          path = ./templates/rust;
          description = "rust";
        };
      };
    };
}
