#!/bin/zsh

export SHELL="$HOME/.nix-profile/bin/zsh"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export fpath=($ZDOTDIR/functions $fpath)

export BAT_THEME="Nord"
export EDITOR="nvim"
export FZF_DEFAULT_OPTS="--margin 15% --border rounded --bind 'tab:toggle-up,btab:toggle-down,ctrl-u:preview-up,ctrl-d:preview-down'"
export JDTLS_JVM_ARGS="-javaagent:$XDG_DATA_HOME/nvim/mason/packages/jdtls/lombok.jar"
export KUBECONFIG="${HOME}/.kube/config"
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"

export PATH="${PATH}:${HOME}/.krew/bin:${HOME}/go/bin:${HOME}/.nvm/versions/node/v14.21.1/bin/"
