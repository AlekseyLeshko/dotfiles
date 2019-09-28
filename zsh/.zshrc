export LC_ALL=en_US.UTF-8
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
alias gd="git difftool"
alias npmls="npm ls --depth=0"
alias npmgls="npm ls -g --depth=0"

alias yout="yarn outdated"
alias yui="yarn upgrade-interactive --latest"
alias yls="yarn list --depth=0"
alias ygls="yarn global list --depth=0"

DEFAULT_USER="aleshko"

export NVM_DIR="/Users/aleshko/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="/usr/local/sbin:$PATH:$HOME/.config/yarn/global/node_modules/.bin/"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
