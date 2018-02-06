#!/usr/bin/env sh
basePath=`pwd`

clear

echo "Start install"

echo "Install brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install YCM"
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --js-completer

cd $basePath

echo "Install global npm packages"
yarn global add eslint eslint_d pm2 instant-markdown-d react-native-cli lock-cli alfred-lock

echo "Finish install"
