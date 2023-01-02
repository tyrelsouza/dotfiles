## Setup
.PHONY: rebuild-macos

## Management

git-add:
	git add .

update: update-neovim

update-os:
	sudo nixos-rebuild switch

update-homemanager:
	home-manager switch

update-neovim:
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

outdated: sync
	sudo nixos-rebuild dry-build --upgrade

sync:
	sudo nix-channel --update
	nix-channel --update

clean:
	sudo nix-collect-garbage --delete-older-than 7d
	home-manager expire-generations "-7 days"

sup: # What's new?
	nix-shell -p nvd --run 'nvd diff $$(ls -dv /nix/var/nix/profiles/system-*-link | tail -2)'

rebuild-macos: git-add
	./result/sw/bin/darwin-rebuild switch --flake _macos

rebuild-ubuntu: git-add
	NIX_PATH=nixpkgs=/nix/var/nix/profiles/per-user/tyrel/channels/nixpkgs:/nix/var/nix/profiles/per-user/tyrel/channels
	nix run ./_ubuntu switch -vv
	home-manager switch --flake ./_ubuntu
