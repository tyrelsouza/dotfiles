# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fino-time"
plugins=(git)
source $ZSH/oh-my-zsh.sh



# User configuration Exports
export LC_ALL=C
export LANG=en_US.UTF-8
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export GOPATH=$HOME/go
export PHP_AUTOCONF="/usr/local/bin/autoconf"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel


export PATH="$HOME/bin:$HOME/.rvm.bin:$NPM_PACKAGES/bin:$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Sourcing aliases and functions
source ~/.bash_aliases

# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

function adg {
    workon addgene
}


# Local changes
source $HOME/.zshrc.local
