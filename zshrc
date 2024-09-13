# ================================================================================ 
# Oh My Zsh configuration

export ZSH="$HOME/.oh-my-zsh"
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv

ZSH_THEME="random"

plugins=(aliases git python)

source $ZSH/oh-my-zsh.sh

# ================================================================================ 
# Configure vi key bindings, vi alias and neovim as the default editor

alias vi="nvim"

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

export EDITOR=nvim

# ================================================================================ 
# Aliases for omz python plugin functions and custom mkv function
# based on omz python plugin that uses uv instead of venv

alias v="mkv"
alias s="vrun"

mkv () {
  local name="${1:-$PYTHON_VENV_NAME}" 
  local venvpath="${name:P}" 
  uv venv "${name}" || return
  echo "Created venv in '${venvpath}'" >&2
  vrun "${name}"
}

# ================================================================================ 
# RIP https://github.com/aclark4life/vanity

alias stats="pypistats overall"

# ================================================================================ 
# Terminal colors and dock shortcuts

case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  sh $HOME/.add_shortcuts_folder_to_dock.sh
  ;;
esac

# ================================================================================
# Node Version Manager

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ================================================================================
# Python Version Manager

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ================================================================================
# Update all the things (checkoutmanager, brew, dnf)

source $HOME/.checkoutmanager.sh

case `uname` in
  Darwin)
  alias u="cm co && cm up && brew update && brew upgrade"
  ;;
  Linux)
  alias u="cm co && cm up && sudo dnf update -y"
  ;;
esac

# --------------------------------------------------------------------------------
# HOMEBREW_NO_ENV_HINTS
#
# If set, do not print any hints about changing Homebrew’s behaviour with
# environment variables.

export HOMEBREW_NO_ENV_HINTS=1

# ================================================================================
# Direnv lite

source $HOME/.direnv_lite.sh

# ================================================================================
# Sort env

alias env="env | sort"

# ================================================================================
# Change to temp directory

t() {
  cd "$(mktemp -d)"
}
