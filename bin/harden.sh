#!/bin/bash
# https://github.com/drduh/macOS-Security-and-Privacy-Guide
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
cd ~/bin
git clone git@github.com:karek314/macOS-home-call-drop.git
cd macOS-home-call-drop
bash homecall.sh fixmacos
