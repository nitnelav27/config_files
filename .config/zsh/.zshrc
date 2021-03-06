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

# This changes the cursor between in sert and normal modes
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# Now the plugins, syntax highlighying must be at the end
#source $ZDOTDIR/plugins/cask.plugin.zsh
source $ZDOTDIR/plugins/colored-man-pages.plugin.zsh
source $ZDOTDIR/plugins/colorize.plugin.zsh
source $ZDOTDIR/plugins/git.plugin.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
eval "$(starship init zsh)"
