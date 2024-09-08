# -------------------------------------------------------------------------------- 
# Oh My Zsh configuration

export ZSH="$HOME/.oh-my-zsh"
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv

ZSH_THEME="random"

plugins=(git python)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------------------- 
# Vi key bindings
bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

# -------------------------------------------------------------------------------- 
# Configure Neovim as the default editor
export EDITOR=nvim
alias vi="nvim"

# -------------------------------------------------------------------------------- 
# Alias checkoutmanager.sh function calls

source $HOME/.checkoutmanager.sh
alias up="cm co; cm up"

# -------------------------------------------------------------------------------- 
# Alias python plugin functions to manage venvs
alias v="mkv"
alias s="vrun"

# -------------------------------------------------------------------------------- 
# RIP https://github.com/aclark4life/vanity
alias stats="pypistats overall"

# -------------------------------------------------------------------------------- 
# Terminal colors and dock shortcuts
case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  sh $HOME/.add_shortcuts_folder_to_dock.sh
  ;;
esac

# Homebrew
# --------------------------------------------------------------------------------
export HOMEBREW_NO_ENV_HINTS=1

# --------------------------------------------------------------------------------
# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# --------------------------------------------------------------------------------
# Python Version Manager
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# --------------------------------------------------------------------------------
# Load environment variables from a secret manager quietly
if command -v aws &> /dev/null; then
  secret=$(aws secretsmanager get-secret-value --secret-id YOUR_SECRET_ID --query SecretString --output text 2> /dev/null)
  if [ $? -eq 0 ]; then
    eval "$secret"
  else
    # Optionally log an error quietly (e.g., to a log file or just ignore it)
    # echo "Failed to load secrets from AWS Secrets Manager" >> /path/to/logfile
    :
  fi
fi
