#!/bin/bash

function rl() {
    for var in "$@"
    do
        open -a iTerm ~/rl/$var
        settitle $var
    done
}


function gsub() {
  git submodule update --init --recursive --remote
}

alias portalshell="docker-compose -f docker-compose.yml exec portald bash"
