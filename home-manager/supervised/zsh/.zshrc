for func in $ZDOTDIR/functions/*(N:t); autoload $func

source $ZDOTDIR/.prompt
source $ZDOTDIR/.completion
source $ZDOTDIR/.aliases

setopt extendedhistory incappendhistory sharehistory histsavenodups histreduceblanks
# The history configuration needs to be here, if the env varibles are on
# .zshenv they are rolled back to the default values
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=50000
export SAVEHIST=50000

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

source $ZDOTDIR/.fzf

eval "$(zoxide init --cmd cd zsh)"
