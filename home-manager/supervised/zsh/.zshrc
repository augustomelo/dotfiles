for func in $ZDOTDIR/functions/*(N:t); autoload $func

source "$ZDOTDIR/.aliases"
source "$ZDOTDIR/.completion"
source "$ZDOTDIR/.fzf"
source "$ZDOTDIR/.prompt"

# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt extendedhistory histreduceblanks histsavenodups incappendhistory sharehistory
setopt emacs

# The history configuration needs to be here, if the env varibles are on
# .zshenv they are rolled back to the default values
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=50000
export SAVEHIST=50000

eval "$(direnv hook zsh)"
eval "$(zoxide init --cmd cd zsh)"
