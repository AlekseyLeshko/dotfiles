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

echo "Install zsh plugins"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Set Oh-my-zsh config"
cp zsh/.zshrc ~/

echo "Start install"

echo "Install silver searcher"
brew install the_silver_searcher

echo "Install fuzzy finder"
brew install fzf

echo "Install yarn"
brew install yarn

echo "Install neovim"
brew install neovim

echo "Install aws cli"
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -rf awscli-bundle awscli-bundle.zip

cd $basePath

echo "Install global npm packages"
yarn global add eslint eslint_d instant-markdown-d fast-cli fx git-stats gitinspector gtop http-server leasot npx ntl

echo "Finish"
