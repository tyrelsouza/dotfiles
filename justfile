#!/usr/bin/env -S just --justfile

# Naive check if /Users or /home for home.
OS := if "${HOME}" =~ '/U.*' { "macos" } else { "ubuntu" }
HOSTNAME := `hostname| sed 's/.local//'`

git-add:
	git add .

update: update-neovim

update-os:
	sudo nixos-rebuild switch

update-neovim:
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

sync:
	sudo nix-channel --update
	nix-channel --update

clean:
	sudo nix-collect-garbage --delete-older-than 7d
	home-manager expire-generations "-7 days"

rebuild: git-add clean
  just rebuild-{{OS}}

rebuild-macos:
  ./result/sw/bin/darwin-rebuild switch --flake ./hosts/{{HOSTNAME}}

rebuild-ubuntu:
  NIX_PATH=nixpkgs=/nix/var/nix/profiles/per-user/tyrel/channels/nixpkgs:/nix/var/nix/profiles/per-user/tyrel/channels
  nix run ./hosts/{{HOSTNAME}} switch -vv
  home-manager switch --flake ./hosts/{{HOSTNAME}}
