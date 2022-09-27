#!/bin/bash -e

echo "Setting up Linux ..."
CURRENT_PATH=`pwd`
echo "Current path: $CURRENT_PATH"

cp inputrc $HOME/.inputrc

cp vimrc $HOME/.vimrc

# Update the base package list
echo "sudo apt-get update"
sudo apt-get update

# Install some prequisite tools for getting anything else done.
echo "\n\nInstall some prequisite tools for getting anything else done ..."
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates curl \
  software-properties-common

# Install base development packages
echo "\n\nInstalling base development packages ..."
sudo apt-get update && \
  sudo apt-get install -y \
  build-essential \
  cmake \
  vim \
  gfortran \
  git \
  jq \
  libaio1 \
  libbz2-dev \
  libglu1-mesa-dev \
  libgoogle-glog-dev \
  liblz4-dev \
  libusb-1.0-0-dev \
  libvulkan-dev \
  openjdk-8-jdk \
  pkg-config \
  qt5-default \
  sudo \
  unzip \
  wget \
  libzmq3-dev \
  zip \
  zlib1g-dev \
  libnl-3-dev \
  libnl-genl-3-dev
sudo apt-get autoremove
exit

# Install and switch to python 3.7
echo "\n\nInstalling python 3.7 ..."
ubuntu_version=`lsb_release -rs`;\
    if [ ${ubuntu_version} = "16.04" ]; then\
      sudo add-apt-repository -y ppa:deadsnakes/ppa;\
      sudo apt-get update;\
    else \
      sudo apt-get install -y python3-distutils;\
    fi
sudo apt-get install -y python3.7-dev;\
    python_bin="/usr/bin/python3.7";\
    sudo update-alternatives --install /usr/bin/python python ${python_bin} 1; \
    sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1;

sudo apt remove python3-apt
sudo apt autoremove
sudo apt autoclean
sudo apt install python3-apt

# Install pip
echo "\n\nInstalling pip ..."
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && \
python /tmp/get-pip.py
export PATH="$HOME/.local/bin:$PATH"

echo "\n\nInstalling pip libs ..."
pip install awscli==1.18.177 \
    boto3==1.16.17 \
    pandas==0.24.2 \
    pyarrow==0.15.1 \
    requests==2.25.0 \
    matplotlib==3.3.3 \
    opencv-python==3.4.3.18 \
    opencv-contrib-python==3.4.3.18 \
    mock future

echo "build --spawn_strategy=standalone --genrule_strategy=standalone" \
  > ~/.bazelrc

# Change default python to python 3.7
# sudo update-alternatives --config python
#
# Terminal won't show up?
# sudo vim /usr/bin/gnome-terminal, change !/usr/bin/python3 to !/usr/bin/python3.6
#
# No module named apt_pkg?
# sudo vim /usr/bin/add-apt-repository, change !/usr/bin/python3 to !/usr/bin/python3.6

# Install Neovim 0.5
# sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt-get update
# sudo apt-get install neovim
#echo "Configuring NeoVim ..."
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#mkdir -p $HOME/.config
#ln -s ~/.vim $HOME/.config/nvim
#ln -s ~/.vimrc $HOME/.config/nvim/init.vim
#
# Neovim python support
# pip install neovim && \
# pip3 install neovim

# pip install neovim --upgrade && \
# pip3 install neovim --upgrade

# Install Go
# tar -C $HOME -xzf ~/Downloads/go1.17.2.linux-amd64.tar.gz
# export PATH=$PATH:/usr/local/go/bin
# $ go version

# Install buildifier
# go install github.com/bazelbuild/buildtools/buildifier@latest
