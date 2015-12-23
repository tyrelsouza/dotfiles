#!/bin/bash

ln -s $(pwd)/bash_aliases ~/.bash_aliases 
ln -s $(pwd)/gitconfig ~/.gitconfig 
ln -s $(pwd)/gitignore ~/.gitignore 
ln -s $(pwd)/hushlogin ~/.hushlogin 
ln -s $(pwd)/vim ~/.vim 
ln -s $(pwd)/vimrc ~/.vimrc 
ln -s $(pwd)/vimrc.bundles ~/.vimrc.bundles 
ln -s $(pwd)/vimrc.bundles.local ~/.vimrc.bundles.local 
ln -s $(pwd)/vimrc.local ~/.vimrc.local 
ln -s $(pwd)/zshrc ~/.zshrc 
ln -s $(pwd)/zshrc.local ~/.zshrc.local 

rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
