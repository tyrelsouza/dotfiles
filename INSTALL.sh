#!/bin/bash

ln -s $(pwd)/bash_aliases ~/.bash_aliases 
ln -s $(pwd)/gitconfig ~/.gitconfig 
ln -s $(pwd)/gitignore ~/.gitignore 
ln -s $(pwd)/hushlogin ~/.hushlogin 
ln -s $(pwd)/vim ~/.vim 
ln -s $(pwd)/vimrc ~/.vimrc 
ln -s $(pwd)/vimrc.bundles ~/.vimrc.bundles 
ln -s $(pwd)/zshrc ~/.zshrc 
ln -s $(pwd)/tyrel.zsh-theme ~/.oh-my-zsh/themes/tyrel.zsh-theme

# Setup vim
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
# Put Bundles Here
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/danro/rename.vim.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/croaky/vim-colors-github.git
git clone https://github.com/pbrisbin/vim-mkdir.git
git clone https://github.com/tpope/vim-surround.git

