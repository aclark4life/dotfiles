# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Would you like to use another custom folder than $ZSH/custom? Yes.
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Add plugins wisely, as too many plugins slow down shell startup.
plugins=(aliases direnv git python)

# Python plugin settings
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv

export PIPX_ROOT="$HOME/.local"
[[ -d $PIPX_ROOT/bin ]] && export PATH="$PIPX_ROOT/bin:$PATH"

# Cargo
export PATH=".cargo/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

setopt share_history

unsetopt AUTO_CD

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
