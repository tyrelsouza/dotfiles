# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
plugins=(git brew sudo github django python pip)
ZSH_THEME="candy"
source $ZSH/oh-my-zsh.sh


export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export GOPATH=$HOME/go
export PHP_AUTOCONF="/usr/local/bin/autoconf"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/AddGeneProjects
source /usr/local/bin/virtualenvwrapper_lazy.sh
source $HOME/bin/virtualenv-auto-activate.sh



export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '


export PATH="$HOME/bin:$HOME/.rvm.bin:$NPM_PACKAGES/bin:$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH=/bin:/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/Users/tsouza/bin:/opt/local/bin:$PATH
export PATH="$HOME/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Sourcing aliases and functions
source ~/.bash_aliases
alias cg='cd "$(git rev-parse --show-toplevel)"'
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias ag='\ag --pager="less"'


if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


export ADDGENE_CORE_REPO_DIR=/Users/tyrelsouza/AddGeneProjects/addgene-core

# VMware Fusion
if [ -d "/Applications/VMware Fusion.app/Contents/Library" ]; then
    export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"
fi
export GREP_OPTIONS="--color=auto --exclude=*.pyc --exclude-dir=.git"
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
 



alias hideprev='history -d $((HISTCMD-2)) && history -d $((HISTCMD-1))' # Hide the previous command you just ran and forgot to use space.
#let g:user_emmet_leader_key='<C-Z>'
