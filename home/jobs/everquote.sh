#!/bin/bash

# ALIASES
alias kubectl=/opt/homebrew/Cellar/kubernetes-cli@1.22/1.22.15/bin/kubectl
alias ibrew="arch -x86_64 /usr/local/bin/brew"


# FUNCTIONS 
function poweruser (){
  aws sso login --profile=poweruser
}
function powerpip (){
  aws codeartifact login --tool pip --repository internal --domain eq-remarketing --profile poweruser
}

function kubestaging () {
  kubectl config use-context shared1-east1-us-staging
  kubectl config set-context --current --namespace=remarketing
}

function kubeprod () {
  kubectl config use-context shared1-east1-us-prod
  kubectl config set-context --current --namespace=remarketing
}
function setup_crypto () {
  # Needed for cryptography
  export LDFLAGS="$LDFLAGS -L$(brew --prefix openssl@1.1)/lib"
  export CFLAGS="$CFLAGS -I$(brew --prefix openssl@1.1)/include"
}

function brew_venv_39 () {
  $(brew --cellar python@3.9)/3.9.10/bin/python3 -m venv venv
}
function brew_venv_37 () {
  /usr/local/opt/python@3.7/bin/python3 -m venv venv
}
# Prompts for aurora password and doesn't echo it to the terminal, safer for history
function set_aurora () {
  echo -ne "Aurora Username: "
  read -rs AURORA_USERNAME
  export AURORA_USERNAME

  echo -ne "\nAurora Password: "
  read -rs AURORA_PASSWORD
  export AURORA_PASSWORD
  echo "\nSet username/password for $AURORA_USERNAME"
}


