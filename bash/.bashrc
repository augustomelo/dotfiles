#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
[ -z "$PS1" ] && return

force_color_prompt=yes

## ALIAS

# ls
alias ls='ls --color=auto'

# xrandr
alias moHdmiPLeft='xrandr --output HDMI1 --auto --primary --left-of eDP1 --output eDP1 --auto'
alias moEDPPLeft='xrandr --output eDP1 --auto --primary --left-of HDM1 --output HDM1 --auto'
alias moHdmiPRight='xrandr --output HDMI1 --auto --primary --right-of eDP1 --output eDP1 --auto'
alias moEDPPRight='xrandr --output eDP1 --auto --primary --right-of HDMI1 --output HDMI1 --auto'
alias moHdmiPClone='xrandr --output HDMI1 --auto --primary --same-as eDP1 --output eDP1 --auto'
alias moEDPPClone='xrandr --output eDP1 --auto --primary --same-as HDMI1 --output HDMI1 --auto'
alias moHdmiOnly='xrandr --output HDMI1 --auto --primary --output eDP1 --off'
alias moEDPOnly='xrandr --output eDP1 --auto --primary --output HDM1 --off'


## PS1
PS1="\[\e[1;32m\] \w \[\e[0m\]\n \$ "
