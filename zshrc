# Oh My ZSH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="random"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
alias vi="nvim"

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  ;;
esac

# Load the checkoutmanager configuration files found
# in ~/.checkoutmanager.
cm() {
  local cmd=$1
  for cfg in ~/.checkoutmanager/*.cfg; do
    [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
  done
  for cfg in ~/.config/checkoutmanager/*.cfg; do
    [ -f "$cfg" ] && checkoutmanager "$cmd" -c "$cfg"
  done
  fortune
}

export HOMEBREW_NO_ENV_HINTS=1

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
