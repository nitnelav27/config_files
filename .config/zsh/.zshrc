# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export PATH=$HOME/.config/scripts:$PATH
export PATH=/opt/cuda/bin:$PATH
export PATH=/opt/cuda/include:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

# Enable colors
autoload -U colors && colors

# Enable autocompletion
autoload -Uz compinit
compinit

# remove annoying message at startup
ZSH_DISABLE_COMPFIX="true"

# Load aliases
source $ZDOTDIR/aliases

# Now the plugins, syntax highlighying must be at the end
#source $ZDOTDIR/plugins/cask.plugin.zsh
source $ZDOTDIR/plugins/colored-man-pages.plugin.zsh
source $ZDOTDIR/plugins/colorize.plugin.zsh
source $ZDOTDIR/plugins/git.plugin.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
eval "$(starship init zsh)"
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=10000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/vsvh/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
