## Setup
.PHONY: rebuild-macos

## Management

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

rebuild-macos: git-add
	./rebuild-macos.sh

rebuild-ubuntu: git-add
	./rebuild-ubuntu.sh
