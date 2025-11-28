# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Would you like to use another custom folder than $ZSH/custom? Yes.
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Add plugins wisely, as too many plugins slow down shell startup.
plugins=(aliases direnv git python)

# Python plugin settings
export PYTHON_AUTO_VRUN=true
export PYTHON_VENV_NAME=.venv

export PIPX_ROOT="$HOME/.local"
[[ -d $PIPX_ROOT/bin ]] && export PATH="$PIPX_ROOT/bin:$PATH"

# Cargo
export PATH=".cargo/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '\t' expand-or-complete-prefix

setopt share_history

unsetopt AUTO_CD

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

# GCLI Terminal Integration (auto-record interactive shells)
if [ -t 1 ] && [ -z "$GCLI_RECORDING" ]; then
    if [ "$(ps -p $PPID -o comm= 2>/dev/null | tr -d " ")" != "script" ]; then
        TTY=$(tty 2>/dev/null || echo "notty")
        LOGFILE="/tmp/$(basename "$TTY" | sed "s|/|_|g")_$(uuidgen).log"
        # Create the logfile immediately to ensure it exists
        touch "$LOGFILE"
        export LOGFILE
        export GCLI_RECORDING=1
        # macOS script command syntax
        exec script -q "$LOGFILE" zsh
    else
        if [ -n "$LOGFILE" ]; then
            trap "rm -f '$LOGFILE'" EXIT
        fi
    fi
fi
export PATH="$HOME/.gcli/bin:$PATH"
alias gcli="$HOME/.gcli/bin/gcli"

