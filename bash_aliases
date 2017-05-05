#!/usr/local/bin/zsh
export HOMEBREW_GITHUB_API_TOKEN="caf4cd85c6eb6ddcf006d4571d4a294c0b0592e4"
alias ag='\ag --pager="less"'
alias cg='cd "$(git rev-parse --show-toplevel)"'
alias fuck='eval $(thefuck $(fc -ln -1)); \history -r'
alias g='git'
alias pdb="python -m pdb"
alias ppjson="python -m json.tool"

# Addgene specific
alias adocs='cd $ADDGENE_CORE_REPO_DIR/docs && make html && open $ADDGENE_CORE_REPO_DIR/docs/build/html/index.html'
alias aenv='env | sort | grep ADDGENE'
alias sl="source local.env.$(basename $SHELL)"

if [[ $OSTYPE == darwin* ]]; then
    alias rm=trash;
fi;

function adtest () {
    no_slashes="$(echo "$1" | sed -e 's/\//\./g')";
    a_test="$(echo "$no_slashes" | sed -e 's/.py//g')";
    a_project=$(echo -n "$a_test" | python -c "import sys; print sys.stdin.read().split('.', 1)[0]");
    run_test=$(echo "bin/manage_$a_project.py test $a_test");
    echo "Evaling $run_test";
    eval $run_test;
}

function dots(){
    cd $(dirname `readlink ~/.vim`)
}

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

alias shrug="echo -n '¯\_(ツ)_/¯' | pbcopy"

function h () {
        if [ -z "$*" ]
        then
            history
        else
            history | egrep "$@"
        fi
}

alias stabbats='sudo killall VDCAssistant && open https://appear.in/stab-bats'
