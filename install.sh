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

brew install the_silver_searcher

echo "Install nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

echo "Install YCM"
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --js-completer

cd $basePath

echo "Install global npm packages"
yarn global add eslint eslint_d pm2 instant-markdown-d react-native-cli lock-cli alfred-lock yeoman-generator generator-generator

echo "Finish"
