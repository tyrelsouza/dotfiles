#!/usr/bin/fish
set -x EDITOR nvim
set -x VISUAL nvim

# Aliases
#alias ag='ag --pager="less -r"'
alias cat='bat'
alias dots='cd ~/code/dotfiles/'
alias fuckingip="curl https://wtfismyip.com/json"
alias g='git'
alias gp='git push -u'
alias ls="exa -lhFgxUm --git --time-style long-iso --group-directories-first"
alias vimini="vim ~/.config/nvim/init.vim"
alias vim=nvim

# Functions
function httpdiff  
  diff --color -r -c <(curl -s "$1" 2>&1) <(curl -s "$2" 2>&1)
end

function cg
   set _dir_ (git rev-parse --show-toplevel)
   cd $_dir_
end

function cpbr 
    set branch (git symbolic-ref --short -q HEAD)
    if test branch
    then
      printf "$branch" | pbcopy
      osascript -e "display notification \"$branch copied to clipboard\" with title \"cpbr\""
    else
      echo "no branch, can't copy"
    end
end

function settitle 
    echo -ne "\033]0;"$argv"\007"
end


function pullall 
    for d in ./*/ ; do (cd "$d" && pwd && git pull); end
end

function gh_mainall 
    for d in ./*/ ; do (cd "$d" && pwd && git checkout main && git pull); end
end

function allbranches 
    for d in ./*/ ; do (cd "$d" && pwd && git remote -v origin && git pull); end
end

function new_dock_space 
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock
end

# Jupyter lab!
function lab  
  source ~/JUPYTER/bin/activate
  cd ~/scratch
  powerpip
  pip install -r jupyter_requirements.txt
  jupyter lab
  deactivate
end

source ~/code/dotfiles/jobs/everquote.fish
