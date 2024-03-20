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
    pkgs.vale
  ];

  programs = {
    #fzf = {
      #enable = true;
    #};

    git.enable = true;

    home-manager.enable = true;

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

    neovim.enable = true;

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
