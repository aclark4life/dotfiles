# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="random"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
alias vi="nvim"
alias cm="checkoutmanager"
alias ll="ls -l"
alias up="pushd ~/Dotfiles; make; popd; checkoutmanager co; checkoutmanager up"
alias co="checkoutmanager co"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2024-09-04 01:33:51
export PATH="$PATH:/Users/alex.clark/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$(m bin 7.0.0-ent):$PATH"

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

case `uname` in
  Darwin)
  osascript $HOME/.terminal_change_color.scpt
  ;;
esac

export HOMEBREW_NO_ENV_HINTS=1
