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

echo "Finish install"
