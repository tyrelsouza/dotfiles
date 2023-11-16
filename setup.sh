#!/bin/bash

HOME=/home/coder

sudo apt update

sudo curl https://pyenv.run | bash

ln -s ./home/config $HOME/.config
ln -s ./home/bin $HOME/bin
ln -s ./home/gitconfig $HOME/.gitconfig
ln -s ./home/shell_aliases $HOME/.shell_aliases
ln -s ./home/shell_funcs $HOME/.shell_funcs
#ln -s home/zshrc $HOME/.zshrc
#
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /home/coder/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/coder/.bashrc
echo 'eval "$(pyenv init -)"' >> /home/coder/.bashrc

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

pyenv install 3.10
pyenv global 3.10
