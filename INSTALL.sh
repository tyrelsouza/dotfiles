#!/bin/bash

# get initial directories setup 
ln -s $(pwd)/bin ~/bin

if [[ $OSTYPE == darwin* ]]; then
    ~/bin/setup-usr-local.sh
fi


rm -rf ~/.zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto

# delete existing dotfiles
rm -rf ~/.bash_aliases
rm -rf ~/.gitconfig 
rm -rf ~/.gitignore 
rm -rf ~/.git_template
rm -rf ~/.hushlogin 
rm -rf ~/.vim 
rm -rf ~/.emacs
rm -rf ~/.vimrc 
rm -rf ~/.zshrc 
rm -rf ~/.pythonstartup.py
rm -rf ~/.zlogin
rm -rf ~/.zlogout
rm -rf ~/.zpreztorc
rm -rf ~/.zprofile
rm -rf ~/.zshenv
rm -rf ~/.zshrc
rm -rf ~/.tmux
rm -rf ~/.tmux.conf
rm -rf ~/.pryrc

# set Symlinks to configs
ln -s $(pwd)/bash_aliases ~/.bash_aliases 
ln -s $(pwd)/gitconfig ~/.gitconfig 
ln -s $(pwd)/gitignore ~/.gitignore 
ln -s $(pwd)/git_template ~/.git_template
ln -s $(pwd)/hushlogin ~/.hushlogin 
ln -s $(pwd)/emacs ~/.emacs
ln -s $(pwd)/vim ~/.vim 
ln -s $(pwd)/vimrc ~/.vimrc 
ln -s $(pwd)/zshrc ~/.zshrc 
ln -s $(pwd)/pythonstartup.py ~/.pythonstartup.py
ln -s $(pwd)/zprofile.local ~/.zprofile.local
ln -s $(pwd)/zpreztorc ~/.zpreztorc
ln -s $(pwd)/tmux ~/.tmux
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/pryrc ~/.pryrc

ln -s $HOME/.zprezto/runcoms/zlogin ~/.zlogin
ln -s $HOME/.zprezto/runcoms/zlogout ~/.zlogout
ln -s $HOME/.zprezto/runcoms/zshenv ~/.zshenv
ln -s $HOME/.zprezto/runcoms/zshrc ~/.zshrc
ln -s $HOME/.zprezto/runcoms/zprofile ~/.zprofile
echo "source ~/.zprofile.local" >> ~/.zprofile

# cleanup fish config
mkdir -p ~/.config/fish
rm -rf ~/.config/fish
ln -s $(pwd)/config/fish ~/.config/fish

# Setup vim
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
# Put Bundles Here
git clone git@github.com:JamshedVesuna/vim-markdown-preview.git
git clone git@github.com:Shougo/denite.nvim.git
git clone git@github.com:croaky/vim-colors-github.git
git clone git@github.com:danro/rename.vim.git
git clone git@github.com:fatih/vim-go.git
git clone git@github.com:kien/ctrlp.vim.git
git clone git@github.com:mileszs/ack.vim.git
git clone git@github.com:pbrisbin/vim-mkdir.git
git clone git@github.com:scrooloose/syntastic.git
git clone git@github.com:spolu/dwm.vim.git
git clone git@github.com:tpope/vim-surround.git
git clone git@github.com:vim-airline/vim-airline-themes.git
git clone git@github.com:vim-airline/vim-airline.git
