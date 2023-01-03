#!/bin/bash

hostname=$(hostname| sed 's/.local//')
./result/sw/bin/darwin-rebuild switch --flake ./hosts/$hostname
