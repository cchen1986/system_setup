#!/bin/bash -e

echo "Setting up Mac ..."

CURRENT_PATH=`pwd`
echo "Current path: $CURRENT_PATH"

cp inputrc $HOME/.inputrc
source $HOME/.inputrc

cp vimrc $HOME/.vimrc

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
pip3 install --user jupyterlab

brew cask install iterm2

# Oh-my-zsh
echo "Installing oh-my-zsh ..."
brew install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source $HOME/.zshrc
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

cp zshrc $HOME/.zshrc
source $HOME/.zshrc

# Install neovim
echo "Installing Neovim"
brew install neovim
# Vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.config
ln -s ~/.vim $HOME/.config/nvim
ln -s ~/.vimrc $HOME/.config/nvim/init.vim

pip2 install --user neovim
pip3 install --user neovim

brew install cmake

# Google Vim-codefmt
brew install clang-format
brew install go
mkdir $HOME/go
cd $HOME/go
go get github.com/bazelbuild/buildtools/buildifier
