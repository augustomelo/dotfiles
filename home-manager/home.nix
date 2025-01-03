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
    tmux = {
      enable = true;
      extraConfig = ''
        set -g @catppuccin_window_status_style "rounded"
        set -g @catppuccin_window_text " #W"
        set -g @catppuccin_window_current_text " #W"
      '';
    };
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
        if [[ ! -d $app_folder ]]; then
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
      ghostty
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

    tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      escapeTime = 5;
      extraConfig = ''
        set-option -g display-time 4000
        set-option -g status-left ""
        set-option -g status-position top
        set-option -g window-status-separator ""
        set-option -gF  status-right "#{@catppuccin_status_directory}"

        bind-key r source-file ~/.config/tmux/tmux.conf \; display-message "~/.tmux.conf reloaded"
        bind-key s run-shell "tmux new-window ~/.config/zsh/functions/sessionizer"
        bind-key - split-window -v
        bind-key | split-window -h
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi y send-keys -X copy-selection
        bind-key -n M-h select-pane -L
        bind-key -n M-j select-pane -D
        bind-key -n M-k select-pane -U
        bind-key -n M-l select-pane -R

        unbind-key -T copy-mode-vi MouseDragEnd1Pane
        unbind-key '"'
        unbind-key %
      '';
      focusEvents = true;
      historyLimit = 50000;
      keyMode = "vi";
      mouse = true;
      prefix = "C-s";
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
