# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export PATH=$HOME/.config/scripts:$PATH
export PATH=/opt/cuda/bin:$PATH
export PATH=/opt/cuda/include:$PATH
export PATH=$HOME/.config/emacs/bin:$PATH
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

if [[ "$OSTYPE" == "darwin"* ]]; then
#	export PATH=/opt/homebrew/opt/python@3.10/bin:$PATH
	export PATH=/opt/homebrew/bin:$PATH
#	export PATH=/Users/vsvh/Library/Python/3.10/bin:$PATH
	export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"
fi

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
#zstyle :compinstall filename '/Users/vsvh/.config/zsh/.zshrc'

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

if [[ "$OSTYPE" == "darwin"* ]]; then
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fi

# Starship prompt
eval "$(starship init zsh)"
