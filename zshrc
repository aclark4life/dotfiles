# -------------------------------------------------------------------------------- 
# Oh My Zsh configuration

export ZSH="$HOME/.oh-my-zsh"
export PYTHON_AUTO_VRUN=true

ZSH_THEME="random"

plugins=(git python)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------------------- 

alias vi="nvim"

# Alias checkoutmanager.sh function calls
source $HOME/.checkoutmanager.sh
alias up="cm co; cm up"

# Alias python plugin functions
alias v="mkv"
alias s="vrun"

# RIP https://github.com/aclark4life/vanity
alias stats="pypistats overall"

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  sh $HOME/.add_shortcuts_folder_to_dock.sh
  ;;
esac

export EDITOR=nvim
export HOMEBREW_NO_ENV_HINTS=1
export PYTHON_VENV_NAME=.venv

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# # Load environment variables from a secret manager
# if command -v aws &> /dev/null; then
#     eval "$(aws secretsmanager get-secret-value --secret-id YOUR_SECRET_ID --query SecretString --output text)"
# fi
