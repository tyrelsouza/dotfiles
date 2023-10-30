#!/bin/bash

function rl() {
    for var in "$@"
    do
        open -a iTerm ~/rl/$var
        settitle $var
    done
}


function rl-gsub() {
  git submodule update --init --recursive --remote
}

function rl-portalshell() {
  docker-compose -f /Users/tyrel/rl/vail-dev/docker-compose.yml exec portald bash
}
