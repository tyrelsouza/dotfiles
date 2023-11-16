#!/bin/bash

HOME=/home/coder

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt-get install -y libncurses5-dev neovim
sudo apt-get install -y build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev

export MAKEDEB_RELEASE='makedeb'
bash -c "$(wget -qO - 'https://shlink.makedeb.org/install')"

curl https://sh.rustup.rs -sSf | sh

sudo curl https://pyenv.run | bash

mv ./home/config/nvim /home/coder/.config/nvim
mv ./home/bin /home/coder/bin
mv ./home/gitconfig /home/coder/.gitconfig
mv ./home/shell_aliases /home/coder/.shell_aliases
mv ./home/shell_funcs /home/coder/.shell_funcs
#ln -s home/zshrc /home/coder/.zshrc
#
echo 'export PYENV_ROOT="/home/coder/.pyenv"' >> /home/coder/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/coder/.bashrc
echo 'eval "$(pyenv init -)"' >> /home/coder/.bashrc
source ~/.bashrc

pyenv install 3.10.13
pyenv global 3.10.13


mkdir ~/.buildsrc
pushd ~/.buildsrc

git clone 'https://mpr.makedeb.org/just'
cd just
makedeb -si

popd

just vimpacker
just pi
