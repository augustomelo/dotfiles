{
  pkgs,
  username,
  lib,
  ...
}: {
  home = {
    file.".config" = { source = ./supervised; recursive = true; };
    homeDirectory = "/Users/${username}";
    stateVersion = "23.11";
    username = username;

    # https://github.com/nix-community/home-manager/issues/1341
    # Comment used as solution: https://github.com/nix-community/home-manager/issues/1341#issuecomment-901513436
    activation = {
      aliasApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        app_folder=$(echo ~/Applications);
        for app in $(find "$newGenPath/home-path/Applications" -type l); do
          $DRY_RUN_CMD rm -f $app_folder/$(basename $app)
          $DRY_RUN_CMD /usr/bin/osascript -e "tell app \"Finder\"" -e "make new alias file to POSIX file \"$(readlink $app)\" at POSIX file \"$app_folder\"" -e "set name of result to \"$(basename $app)\"" -e "end tell"
        done
      '';
    };

    packages = with pkgs; [
      colima 
      dasel
      dbeaver
      delta
      docker
      docker-buildx
      docker-compose
      eza
      fd
      fzf-git-sh
      git
      go
      home-manager
      hurl
      kubectl
      kubelogin-oidc
      neovim
      ripgrep
      spotify
      obsidian
      vale
      zoxide
    ];
  };

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
      changeDirWidgetCommand = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
      changeDirWidgetOptions = [
        "--preview 'eza --tree --color=always {} | head -200'"
      ];
      colors = {
        "bg+" = "#3B4252";
        bg = "#2E3440";
        "fg+" = "#D8DEE9";
        fg = "#D8DEE9";
        header = "#616E88";
        "hl+" = "#81A1C1";
        hl = "#616E88";
        info = "#81A1C1";
        marker = "#81A1C1";
        pointer = "#81A1C1";
        prompt = "#81A1C1";
        spinner = "#81A1C1";
      };
      defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
      defaultOptions = [
        "--bind 'tab:toggle-up,btab:toggle-down,ctrl-u:preview-up,ctrl-d:preview-down'"
      ];
      fileWidgetCommand = "fd --type=f --hidden --strip-cwd-prefix --exclude .git";
      fileWidgetOptions = [
        "--preview 'bat --number --color=always --line-range :500 {}'"
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
        size = 11;
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
