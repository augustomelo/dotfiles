#!/bin/zsh

# https://nix-community.github.io/home-manager/index.xhtml#_why_are_the_session_variables_not_set
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

export SHELL="$HOME/.nix-profile/bin/zsh"

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export fpath=($XDG_DATA_HOME/zsh/completion $ZDOTDIR/functions $fpath)

export DICPATH=$XDG_DATA_HOME/dictionaries # used by vale as other resources to dictionaries
export EDITOR="nvim"
export JDTLS_JVM_ARGS="-javaagent:$XDG_DATA_HOME/nvim/mason/packages/jdtls/lombok.jar"
export KUBECONFIG="$HOME/.kube/config"

export PATH="$PATH:$HOME/.krew/bin:$HOME/go/bin"
