# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Would you like to use another custom folder than $ZSH/custom? Yes.
ZSH_CUSTOM=$HOME/.zsh

# Add plugins wisely, as too many plugins slow down shell startup.
plugins=(aliases git python)

# Python plugin settings
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix
