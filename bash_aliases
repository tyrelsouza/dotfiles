#!/usr/local/bin/zsh
# Aliases
alias ag='\ag --pager="less"'
alias cat='bat'
alias cg='cd "$(git rev-parse --show-toplevel)"'
alias ctags="`brew --prefix`/bin/ctags"
alias dots="cd $(dirname `readlink ~/.vim`)"
alias g='git'
alias gp='git push'
alias ppjson="python -m json.tool"
alias shrug="echo -n '¯\_(ツ)_/¯' | pbcopy"
alias httpie="http"

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
settitle() {
    printf "\033k$1\033\\"
}


tide() {
    for var in "$@"
    do
        tmux new-window -c "/code/tidelift/$var" -n "$var"
        printf "\033k$var\033\\"
    done

}


# options
export LESS=-RFX
export PAGER="less"
alias love="/Applications/love.app/Contents/MacOS/love"

pullall (){
    for d in ./*/ ; do (cd "$d" && pwd && git pull); done
}

new_dock_space (){
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock
}
