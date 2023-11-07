# XDG directory specification
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X/xinitrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export DOOMDIR="${XDG_CONFIG_HOME:-$HOME/.config}/doom"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

# Default Apps
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="alacritty"
export VIDEO="mpv"
export IMAGE="feh"
export OPENER="xdg-open"
export PAGER="less"
export WM="bspwm"
