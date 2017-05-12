#!/usr/local/bin/zsh

# Aliases
alias adg="workon addgene-core"
alias adocs='cd $ADDGENE_CORE_REPO_DIR/docs && make html && open $ADDGENE_CORE_REPO_DIR/docs/build/html/index.html'
alias aenv='env | sort | grep ADDGENE'
alias ag='\ag --pager="less"'
alias cg='cd "$(git rev-parse --show-toplevel)"'
alias dots="cd $(dirname `readlink ~/.vim`)"
alias g='git'
alias gp='git push'
alias pdb="python -m pdb"
alias ppjson="python -m json.tool"
alias shrug="echo -n '¯\_(ツ)_/¯' | pbcopy"
alias sl="source local.env"
alias stabbats='sudo killall VDCAssistant && open https://appear.in/stab-bats'

if [[ $OSTYPE == darwin* ]]; then
    alias rm=trash;
fi;

# Functions
function adtest () {
    no_slashes="$(echo "$1" | sed -e 's/\//\./g')";
    a_test="$(echo "$no_slashes" | sed -e 's/.py//g')";
    a_project=$(echo -n "$a_test" | python -c "import sys; print sys.stdin.read().split('.', 1)[0]");
    run_test=$(echo "bin/manage_$a_project.py test $a_test");
    echo "Evaling $run_test";
    eval $run_test;
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
function h () {
        if [ -z "$*" ]
        then
            history
        else
            history | egrep "$@"
        fi
}

