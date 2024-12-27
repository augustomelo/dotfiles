{
  pkgs,
  username,
  lib,
  ...
}: {
  catppuccin = {
    bat.enable = true;
    flavor = "macchiato";
    fzf.enable = true;
    k9s.enable = true;
  };

  home = {
    file.".config" = { source = ./config; recursive = true; };
    homeDirectory = "/Users/${username}";
    stateVersion = "23.11";
    username = username;

    # https://github.com/nix-community/home-manager/issues/1341
    # Comment used as solution: https://github.com/nix-community/home-manager/issues/1341#issuecomment-901513436
    activation = {
      aliasApplications = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        app_folder=$(echo ~/Applications);
        if [[ ! -e $app_folder ]]; then
          mkdir $app_folder
        fi
        for app in $(find "$newGenPath/home-path/Applications" -type l); do
          $DRY_RUN_CMD rm -f $app_folder/$(basename $app)
          $DRY_RUN_CMD /usr/bin/osascript -e "tell app \"Finder\"" -e "make new alias file to POSIX file \"$(readlink $app)\" at POSIX file \"$app_folder\"" -e "set name of result to \"$(basename $app)\"" -e "end tell"
        done
      '';
    };

    packages = with pkgs; [
      colima
      dasel
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
      obsidian
      raycast
      ripgrep
      spotify
      starship
      vale
      wezterm
      zoxide
    ];
  };

  programs = {
    bat = {
      enable = true;
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
      defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
      defaultOptions = [
        "--bind 'ctrl-u:preview-up,ctrl-d:preview-down'"
      ];
      fileWidgetCommand = "fd --type=f --hidden --strip-cwd-prefix --exclude .git";
      fileWidgetOptions = [
        "--preview 'bat --number --color=always --line-range :500 {}'"
      ];
    };

    k9s = {
      enable = true;
    };

    zsh = {
      enable = true;
      dotDir = ".config/zsh";
    };
  };

  nix.gc = {
    automatic = true;
    frequency = "weekly";
    randomizedDelaySec = "10m";
    persistent = true;
    options = "--delete-older-than 15d";
  };

  xdg.enable = true;
}
