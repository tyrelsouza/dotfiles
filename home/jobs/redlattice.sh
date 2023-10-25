#!/bin/bash

function rl() {
    for var in "$@"
    do
        open -a iTerm ~/rl/$var
        settitle $var
    done
}

