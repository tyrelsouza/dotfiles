#!/bin/bash

sudo apt update
sudo apt install python3 python3-venv zsh

sudo curl https://pyenv.run | bash

ln -s home/config $HOME/.config
ln -s home/bin $HOME/bin
ln -s home/gitconfig $HOME/.gitconfig
ln -s home/shell_aliases $HOME/.shell_aliases
ln -s home/shell_funcs $HOME/.shell_funcs
#ln -s home/zshrc $HOME/.zshrc
