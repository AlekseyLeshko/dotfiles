export ZSH=/Users/aleshko/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git zsh-syntax-highlighting ruby rails bower brew history node npm nvm sudo web-search yarn)

# User configuration
source $ZSH/oh-my-zsh.sh

unalias yo
alias yout="yarn outdated"
alias yui="yarn upgrade-interactive --latest"

DEFAULT_USER="aleshko"

export NVM_DIR="/Users/aleshko/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="/usr/local/sbin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
