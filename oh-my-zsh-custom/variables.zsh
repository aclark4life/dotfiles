# Brew command completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

export EDITOR="nvim"

export HOMEBREW_NO_ENV_HINTS=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


export TMUXAI_OPENROUTER_API_KEY="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"
