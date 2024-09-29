export EDITOR="nvim"

export HOMEBREW_NO_ENV_HINTS=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PIPX_ROOT="$HOME/.local"
[[ -d $PIPX_ROOT/bin ]] && export PATH="$PIPX_ROOT/bin:$PATH"

