# ================================================================================ 
# Oh My Zsh and Homebrew configuration

export HOMEBREW_NO_ENV_HINTS=1
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="random"

plugins=(aliases git python)

source $ZSH/oh-my-zsh.sh

# ================================================================================ 
# Terminal colors and dock shortcuts and configure direnv_lite and checkoutmanager

case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  sh $HOME/.add_shortcuts_folder_to_dock.sh
  source $HOME/.checkoutmanager.sh
  source $HOME/.direnv_lite.sh
  ;;
esac

# ================================================================================
# Alias to update git clones && homebrew || dnf

case `uname` in
  Darwin)
  alias u="cm co && cm up && brew update && brew upgrade"
  ;;
  Linux)
  alias u="cm co && cm up && sudo dnf update -y"
  ;;
esac

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
# Node and Python Version Managers

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ================================================================================
# Function to create temp directory and cd into it

t() {
  cd "$(mktemp -d)"
}

# ================================================================================ 
# RIP https://github.com/aclark4life/vanity

alias o="pypistats overall"

# ================================================================================
# Sorted env

alias e="env | sort"
