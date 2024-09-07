# Oh My ZSH
export ZSH="$HOME/.oh-my-zsh"
export PYTHON_AUTO_VRUN=true

ZSH_THEME="random"

plugins=(git python)

source $HOME/.checkoutmanager.sh
source $ZSH/oh-my-zsh.sh

# User configuration
alias vi="nvim"
alias up="cm co; cm up"

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

# Created by `m`
# export PATH="$(m bin 7.0.0-ent):$PATH"

# Created by `nvm`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pyenv`
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# # Load environment variables from a secret manager
# if command -v aws &> /dev/null; then
#     eval "$(aws secretsmanager get-secret-value --secret-id YOUR_SECRET_ID --query SecretString --output text)"
# fi

# RIP https://github.com/aclark4life/vanity
alias vanity="pypistats overall"
