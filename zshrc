# ================================================================================ 

export HOMEBREW_NO_ENV_HINTS=1
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="random"

plugins=(aliases git python)

source $ZSH/oh-my-zsh.sh

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

alias vi="nvim"
export EDITOR="nvim"

case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  sh $HOME/.add_shortcuts_folder_to_dock.sh
  source $HOME/.checkoutmanager.sh
  source $HOME/.direnv_lite.sh
  ;;
esac

case `uname` in
  Darwin)
  alias u="cm co && cm up && brew update && brew upgrade"
  ;;
  Linux)
  alias u="cm co && cm up && sudo dnf update -y"
  ;;
esac

alias v="mkv"
alias s="vrun"

mkv () {
  local name="${1:-$PYTHON_VENV_NAME}" 
  local venvpath="${name:P}" 
  uv venv "${name}" || return
  echo "Created venv in '${venvpath}'" >&2
  vrun "${name}"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

t() {
  cd "$(mktemp -d)"
}

alias o="pypistats overall"
alias e="env | sort"
