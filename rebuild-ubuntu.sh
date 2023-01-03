#!/bin/bash

NIX_PATH=nixpkgs=/nix/var/nix/profiles/per-user/tyrel/channels/nixpkgs:/nix/var/nix/profiles/per-user/tyrel/channels
hostname=$(hostname)

nix run ./hosts/$hostname switch -vv
home-manager switch --flake ./hosts/$hostname
