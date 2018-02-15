export ZSH=/Users/aleshko/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
#s≈ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
# ZSH_THEME="hyperzsh"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zsh-syntax-highlighting ruby rails bower brew history node npm nvm sudo web-search yarn)

# User configuration

source $ZSH/oh-my-zsh.sh

# aliases
alias npmls="npm ls --depth=0"
alias npmgls="npm ls -g --depth=0"

unalias yo
alias yout="yarn outdated"
alias yui="yarn upgrade-interactive --latest"
alias yls="yarn list --depth=0"
alias ygls="yarn global list --depth=0"

DEFAULT_USER="aleshko"

export NVM_DIR="/Users/aleshko/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="/usr/local/sbin:$PATH:$HOME/.config/yarn/global/node_modules/.bin/"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
