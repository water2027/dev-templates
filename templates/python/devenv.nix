{ ... }:

{
  packages = [

  ];

  languages.python = {
    enable = true;
    # edit this
    version = "3.8.18";
    # directory = "./project";
    venv = {
      enable = true;
      # requirements = ./requirements.txt;
    };
    uv = {
      enable = true;
      # sync.enable = true;
    };
  };

  enterShell = ''
    python --version
  '';
}
