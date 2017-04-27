export ZSH=$HOME/.oh-my-zsh
plugins=(git sudo github django python pip cp vagrant virtualenv nmap rvm)
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    ZSH_THEME="soliah"
else
    ZSH_THEME="candy"
    ZSH_THEME="tyrel"
    export VIRTUAL_ENV_DISABLE_PROMPT=1
fi

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
if [ -e $HOME/.local/bin/virtualenvwrapper.sh ];then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi


export PATH="$NPM_PACKAGES/bin:$GOPATH/bin:$HOME/bin:$PATH"
if [[ $OSTYPE == "*darwin*" ]];then
	export PATH="/usr/local/opt/gnupg/libexec/gpgbin:$PATH"
fi



#
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add ~/.ssh/id_rsa
fi
#
if [ -e ~/.ssh/id_addgene ];then
  ssh-add ~/.ssh/id_addgene
fi


export MP_FULLNAME="Tyrel Souza"

function adg () {
    workon addgene-core
}
function ipa(){
    ifconfig | grep inet
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
if [ -e $HOME/.credentials ];then
	source $HOME/.credentials
fi
export PYTHONSTARTUP=$HOME/.pythonstartup.py

function adtest () {
    no_slashes="$(echo "$1" | sed -e 's/\//\./g')";
    a_test="$(echo "$no_slashes" | sed -e 's/.py//g')";
    a_project=$(echo -n "$a_test" | python -c "import sys; print sys.stdin.read().split('.', 1)[0]");
    run_test=$(echo "bin/manage_$a_project.py test $a_test");
    echo "Evaling $run_test";
    eval $run_test;
}

function dots(){
    cd $(dirname `readlink ~/.zshrc`)
}
eval "$(pyenv init -)"
