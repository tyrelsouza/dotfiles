#! /bin/sh
# Taken from Cayla Fauver https://cay.la/

#rm -rf /usr/local/*

test -d /usr/local/Homebrew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

while read homebrew; do
    brew install ${homebrew}
done < ~/bin/packages/homebrew.txt

while read casks; do
    brew cask install ${casks}
done < ~/bin/packages/homebrew-casks.txt

while read pips; do
    pip install ${pips}
done < ~/bin/packages/pip.txt
