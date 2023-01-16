#!/usr/bin/env -S just --justfile

# Naive check if /Users or /home for home.
OS := if "${HOME}" =~ '/U.*' { "macos" } else { "ubuntu" }
HOSTNAME := `hostname| sed 's/.local//'`
NIXPATH := "nixpkgs=/nix/var/nix/profiles/per-user/tyrel/channels/nixpkgs:/nix/var/nix/profiles/per-user/tyrel/channels"

setup:
	just setup-{{OS}}

setup-ubuntu:
	NIX_PATH={{NIXPATH}} nix-channel --add https://nixos.org/channels/nixos-22.11 nixos
	NIX_PATH={{NIXPATH}} nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz home-manager 
	NIX_PATH={{NIXPATH}} nix-channel --update
	NIX_PATH={{NIXPATH}} nix-shell '<home-manager>' -A install

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
	nix-collect-garbage --delete-older-than 7d
	home-manager expire-generations "-7 days"

rebuild: git-add clean
  just rebuild-{{OS}}

rebuild-macos:
  ./result/sw/bin/darwin-rebuild switch --flake ./hosts/{{HOSTNAME}}

rebuild-ubuntu:
  NIX_PATH={{NIXPATH}} nix run ./hosts/{{HOSTNAME}} switch -vv
  NIX_PATH={{NIXPATH}} home-manager switch --flake ./hosts/{{HOSTNAME}}
