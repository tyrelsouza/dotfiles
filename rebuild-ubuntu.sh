#!/bin/bash

NIX_PATH=nixpkgs=/nix/var/nix/profiles/per-user/tyrel/channels/nixpkgs:/nix/var/nix/profiles/per-user/tyrel/channels

nix run ./_ubuntu switch -vv
home-manager switch --flake ./_ubuntu
