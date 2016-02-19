#!/bin/bash

ln -s $(pwd)/bash_aliases ~/.bash_aliases 
ln -s $(pwd)/gitconfig ~/.gitconfig 
ln -s $(pwd)/gitignore ~/.gitignore 
ln -s $(pwd)/hushlogin ~/.hushlogin 
ln -s $(pwd)/vim ~/.vim 
ln -s $(pwd)/vimrc ~/.vimrc 
ln -s $(pwd)/vimrc.bundles ~/.vimrc.bundles 
ln -s $(pwd)/vimrc.local ~/.vimrc.local 
ln -s $(pwd)/zshrc ~/.zshrc 

# Setup vim
rm -rf ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
