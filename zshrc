# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aliases git python)

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

export HOMEBREW_NO_ENV_HINTS=1
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export EDITOR="nvim"

# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension.

alias vi="nvim"

mkv () {
  local name="${1:-$PYTHON_VENV_NAME}" 
  local venvpath="${name:P}" 
  uv venv "${name}" || return
  echo "Created venv in '${venvpath}'" >&2
  vrun "${name}"
}

case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  sh $HOME/.add_shortcuts_folder_to_dock.sh
  source $HOME/.checkoutmanager.sh
  source $HOME/.direnv_lite.sh
  ;;
esac

alias o="pypistats overall"
alias e="env | sort"
alias v="mkv"
alias s="vrun"

case `uname` in
  Darwin)
  alias u="cm co && cm up && brew update && brew upgrade"
  ;;
  Linux)
  alias u="cm co && cm up && sudo dnf update -y"
  ;;
esac

t () {
  cd "$(mktemp -d)"
}
