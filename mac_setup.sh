#!/bin/bash -e

echo "Setting up Mac ..."

CURRENT_PATH=`pwd`
echo "Current path: $CURRENT_PATH"

# Install homebrew.
echo "Installing Homebrew ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew upgrade

# Python3
echo "Installing Python3 ..."
brew install python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Jupyter notebook
echo "Installing Jupyter Notebook ..."
pip install jupyterlab

# Oh-my-zsh
brew install zsh
echo "Installing oh-my-zsh ..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp zshrc $HOME/.zshrc
source $HOME/.zshrc
cd $HOME/Downloads
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
cd $CURRENT_PATH

cp inputrc $HOME/.inputrc
source $HOME/.inputrc

cp vimrc $HOME/.vimrc
