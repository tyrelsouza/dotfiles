#!/bin/bash

function pulldep() {
  git pull
  bundle
  bundle exec rake db:migrate
}

function tide() {
    for var in "$@"
    do
        open -a iTerm ~/code/tidelift/$var
        settitle $var
    done
}

