#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias pacman='sudo pacman'
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

eval "$(starship init bash)"
