{
  pkgs,
  username,
  ...
}: {
  home = {
    file.".config" = { source = ./supervised; recursive = true; };
    homeDirectory = "/Users/${username}";
    stateVersion = "23.11";
    username = username;
  };

  home.packages = [
    pkgs.colima 
    pkgs.dasel
    pkgs.dbeaver
    pkgs.docker
    pkgs.docker-buildx
    pkgs.docker-compose
    pkgs.git
    pkgs.go
    pkgs.home-manager
    pkgs.hurl
    pkgs.kubectl
    pkgs.neovim
    pkgs.ripgrep
    pkgs.spotify
    pkgs.obsidian
    pkgs.temurin-bin-17
    pkgs.vale
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        theme = "Nord";
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      defaultOptions = [
        "--margin 15%"
        "--border rounded" 
        "--bind 'tab:toggle-up,btab:toggle-down,ctrl-u:preview-up,ctrl-d:preview-down'"
      ];
    };

    k9s = {
      enable = true;
      settings = {
        k9s = {
          ui.skin = "nord";
        };
      };
    };

    kitty = {
      enable = true;
      extraConfig = builtins.readFile ./managed/kitty/kitty.conf +
        builtins.readFile ./managed/kitty/add-font-features-monaspace.conf;
      font = {
        package = pkgs.monaspace;
        name = "Monaspace Neon Var";
        size = 10;
      };
      shellIntegration.enableBashIntegration = true;
      theme = "Nord";
    };

    tmux = {
      enable = true;
      extraConfig = builtins.readFile ./managed/tmux/tmux.conf;
      plugins =  with pkgs; [
        tmuxPlugins.nord
      ];
    };

    zsh = {
      enable = true;
      dotDir = ".config/zsh";
    };
  };

  xdg.enable = true;
}
