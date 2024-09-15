# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Would you like to use another custom folder than $ZSH/custom? Yes.
ZSH_CUSTOM=$HOME/.custom

# Add plugins wisely, as too many plugins slow down shell startup.
plugins=(aliases git python)

export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

export EDITOR="nvim"

export HOMEBREW_NO_ENV_HINTS=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# aliases and functions defined in files in
# the $ZSH_CUSTOM folder with .zsh extension.
# 
# custom/
# ├── add_shortcuts_folder_to_dock.zsh
# ├── aliases.zsh
# ├── direnv.zsh
# ├── functions.zsh
# └── terminal_change_color.zsh
