#!/bin/bash

# get initial directories setup 
mv ~/bin/* $(pwd)/bin/
rm -rf ~/bin/
ln -s $(pwd)/bin ~/bin
if [[ $OSTYPE == darwin* ]]; then
    ~/bin/setup-usr-local.sh
fi

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# delete existing dotfiles
rm -rf ~/.bash_aliases 
rm -rf ~/.gitconfig 
rm -rf ~/.gitignore 
rm -rf ~/.hushlogin 
rm -rf ~/.vim 
rm -rf ~/.vimrc 
rm -rf ~/.zshrc 
rm -rf ~/.oh-my-zsh/themes/tyrel.zsh-theme
rm -rf ~/.pythonstartup.py
# set Symlinks to configs
ln -s $(pwd)/bash_aliases ~/.bash_aliases 
ln -s $(pwd)/gitconfig ~/.gitconfig 
ln -s $(pwd)/gitignore ~/.gitignore 
ln -s $(pwd)/hushlogin ~/.hushlogin 
ln -s $(pwd)/vim ~/.vim 
ln -s $(pwd)/vimrc ~/.vimrc 
ln -s $(pwd)/zshrc ~/.zshrc 
ln -s $(pwd)/tyrel.zsh-theme ~/.oh-my-zsh/themes/tyrel.zsh-theme
ln -s $(pwd)/pythonstartup.py ~/.pythonstartup.py


# cleanup fish config
mkdir -p ~/.config/fish
rm -rf ~/.config/fish
ln -s $(pwd)/config/fish ~/.config/fish

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

