export ZSH=$HOME/.oh-my-zsh
plugins=(git brew sudo github django python pip cp vagrant virtualenv nmap rvm)
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    ZSH_THEME="soliah"
else
    ZSH_THEME="candy"
    ZSH_THEME="tyrel"
    export VIRTUAL_ENV_DISABLE_PROMPT=1
fi
source $ZSH/oh-my-zsh.sh
##### ^^^ Oh my ZSH ^^^^ #####

export EDITOR=vim
export GOPATH=$HOME/go
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESS=' -R '
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export NPM_PACKAGES="${HOME}/.npm-packages"
export PHP_AUTOCONF="/usr/local/bin/autoconf"

# Virtualenv + Wrapper
export PROJECT_HOME=$HOME/AddGeneProjects
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


export PATH="$NPM_PACKAGES/bin:$GOPATH/bin:$HOME/bin:$PATH"



#
if [ -e ~/.ssh/id_rsa ];then
  ssh-add ~/.ssh/id_addgene
fi
#
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/id_addgene
fi


export MP_FULLNAME="Tyrel Souza"

function adg () {
    workon addgene-core
}
function cpbr () {
    if branch=$(git symbolic-ref --short -q HEAD)
    then
      printf "$branch" | pbcopy
      osascript -e "display notification \"$branch copied to clipboard\" with title \"cpbr\""
    else
      echo "no branch, can't copy"
    fi
}
function hidden() { ls -a "$@" | grep '^\.'; }

if [ -e ~/.zshrc.local ];then
  source ~/.zshrc.local
fi

# Sourcing aliases
source ~/.bash_aliases
source $HOME/.profile
source $HOME/.credentials
