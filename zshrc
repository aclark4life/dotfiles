# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="random"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
alias vi="nvim"
alias ll="ls -l"
alias cm="checkoutmanager -c ~/.checkoutmanager/checkoutmanager.cfg"
alias up="cm up; fortune"
alias co="cm co; fortune"

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

export HOMEBREW_NO_ENV_HINTS=1

case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  ;;
esac

# Created by `pyenv`
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx`
export PATH="$PATH:~/.local/bin"

# Created by `nvm`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `m`
export PATH="$(m bin 7.0.0-ent):$PATH"

# Load environment variables from a secret manager
if command -v aws &> /dev/null; then
    eval "$(aws secretsmanager get-secret-value --secret-id YOUR_SECRET_ID --query SecretString --output text)"
fi
