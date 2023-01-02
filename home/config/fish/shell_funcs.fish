#!/usr/bin/fish

# Functions
function httpdiff  
  diff --color -r -c <(curl -s "$1" 2>&1) <(curl -s "$2" 2>&1)
end

function cg
   set _dir_ (git rev-parse --show-toplevel)
   cd $_dir_
end

function ve
    set base (git rev-parse --show-toplevel)
    source $base/venv/bin/activate.fish
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
    for d in ./*/
        cd "$d" && pwd && git pull 
        cd ..
    end
end

function gh_mainall 
    for d in ./*/
        cd "$d" && pwd && git checkout main; git pull 
        cd ..
    end
end

function allbranches 
    for d in ./*/
        cd "$d"
        set branch (git symbolic-ref --short -q HEAD)
        set repo (basename (pwd))
        echo $branch $repo
        cd ..
    end
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
