#!/usr/bin/env sh
basePath=`pwd`

clear

echo "Start"

echo "Vim"
echo "Copy vimrc"
cp vim/.vimrc ~/

vim +PluginInstall +qall > /dev/null &

echo "Git"
cp git/.gitconfig ~/
cp git/.gitexcludes ~/
cp git/.gitmessage ~/

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Set Oh-my-zsh config"
cp zsh/.zshrc ~/

echo "Start install"

echo "Install brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install silver searcher"
brew install the_silver_searcher

echo "Install fuzzy finder"
brew install fzf

echo "Install yarn"
brew install yarn

echo "Install neovim"
brew install neovim

echo "Install rvm"
\curl -sSL https://get.rvm.io | bash -s stable

echo "Install ruby"
rvm install 2.6.5
rvm --default 2.6.5

echo "Install colorls"
gem install colorls

echo "Install nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

echo "Install nodejs"
nvm install v10.10.0

echo "Install YCM"
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --js-completer

cd $basePath

echo "Install global npm packages"
yarn global add eslint eslint_d instant-markdown-d fast-cli fx git-stats gitinspector gtop http-server leasot npx ntl

echo "Finish"
