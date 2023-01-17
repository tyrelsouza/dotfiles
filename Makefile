## Setup
.PHONY: install-just install-nix

## Management
install-just:
	curl --proto '=https' --tlsv1.3 -sSf https://just.systems/install.sh | bash -s -- --to ~/
	sudo cp ~/just /usr/local/bin

install-nix:
	sh <(curl -L https://nixos.org/nix/install) --daemon

