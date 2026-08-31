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

PATH="/Users/alex.clark/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/alex.clark/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/alex.clark/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/alex.clark/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/alex.clark/perl5"; export PERL_MM_OPT;
