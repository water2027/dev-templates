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
        rust = {
          path = ./templates/rust;
          description = "rust";
        };
      };
    };
}
