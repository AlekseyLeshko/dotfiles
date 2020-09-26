# export LC_ALL=en_US.UTF-8
export ZSH=/Users/alekseyleshko/.oh-my-zsh

# Look in ~/.oh-my-zsh/custom/themes/
ZSH_THEME="powerlevel10k/powerlevel10k"
#s≈ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="hyperzsh"

POWERLEVEL9K_MODE="awesome-patched"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting ruby nvm bower brew history node npm nvm sudo web-search yarn)

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

alias ll="colorls -l --sd"
alias ls="colorls"

DEFAULT_USER="alekseyleshko"

export NVM_DIR="/Users/alekseyleshko/.nvm"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# zsh-completions
autoload -U compinit && compinit

# colors
source $(dirname $(gem which colorls))/tab_complete.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi
