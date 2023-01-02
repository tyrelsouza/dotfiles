#!/bin/bash

sudo rm -rf /opt/nightlies/neovim
git clone https://github.com/neovim/neovim /opt/nightlies/neovim
cd /opt/nightlies/neovim
git checkout stable
make -j4
sudo make install
