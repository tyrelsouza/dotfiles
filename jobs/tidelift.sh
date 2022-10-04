#!/bin/bash

function pulldep() {
  git pull
  bundle
  bundle exec rake db:migrate
}
