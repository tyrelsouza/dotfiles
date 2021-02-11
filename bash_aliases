#!/usr/local/bin/zsh
export EDITOR=vim
# Aliases
alias ag='\ag --pager="less"'
alias c='\cat'
alias cat='bat'
alias cg='cd "$(git rev-parse --show-toplevel)"'
alias ctags="`brew --prefix`/bin/ctags"
alias dots="cd $(dirname `readlink ~/.vim`)"
alias g='git'
alias gp='git push -u'
alias ppjson="python -m json.tool"
alias shrug="echo -n '¯\_(ツ)_/¯' | pbcopy"
alias httpie="http"
alias fuckingip="curl https://wtfismyip.com/json"

# Functions
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

settitle () {
    echo -ne "\033]0;"$*"\007"
}


tide() {
    for var in "$@"
    do
        open -a iTerm ~/code/tidelift/$var
        settitle $var
    done
}


# options
export LESS=-RFX
export PAGER="less"

pullall (){
    for d in ./*/ ; do (cd "$d" && pwd && git pull); done
}

new_dock_space (){
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock
}
