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

  home.packages = with pkgs; [
    colima 
    dasel
    dbeaver
    docker
    docker-buildx
    docker-compose
    fzf-git-sh
    git
    go
    home-manager
    hurl
    kubectl
    neovim
    ripgrep
    spotify
    obsidian
    temurin-bin-17
    vale
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
      colors = {
        fg = "#e5e9f0,bg:#3b4252,hl:#81a1c1";
        "fg+" = "#e5e9f0,bg+:#3b4252,hl+:#81a1c1";
        info = "#eacb8a,prompt:#bf6069,pointer:#b48dac";
        marker = "#a3be8b,spinner:#b48dac,header:#a3be8b";

      };
      defaultOptions = [
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
      shellIntegration.enableZshIntegration = true;
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
