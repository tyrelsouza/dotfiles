#!/bin/bash

#git add . # YOLO
#nix build ./_ubuntu --extra-experimental-features "nix-command flakes" -vvv
nix run _ubuntu switch
