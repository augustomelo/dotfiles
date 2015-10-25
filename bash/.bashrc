#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
[ -z "$PS1" ] && return

force_color_prompt=yes

alias ls='ls --color=auto'

PS1="\[\e[1;32m\] \w \[\e[0m\]\n \$ "



