#!/bin/zsh

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$XDG_CONFIG_HOME/zsh

export FZF_DEFAULT_OPTS="--margin 15% --border rounded --bind 'tab:toggle-up,btab:toggle-down,ctrl-u:preview-up,ctrl-d:preview-down'"
export JDTLS_JVM_ARGS="-javaagent:$XDG_DATA_HOME/nvim/mason/packages/jdtls/lombok.jar"
