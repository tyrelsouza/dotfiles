## Setup
.PHONY: rebuild-macos

## Management
install-just:
	curl --proto '=https' --tlsv1.3 -sSf https://just.systems/install.sh | bash -s -- --to ~/
	sudo cp ~/just /usr/local/bin
