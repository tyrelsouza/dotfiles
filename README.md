# Nix

Install Nix and Home-Manager
```shell
$ nix-channel --add https://nixos.org/channels/nixos-22.11 nixos
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz home-manager 
$ nix-channel --update
```

For Macos:

Install nix-darwin
```shell
$ nix-channel --add https://github.com/LnL7/nix-darwin/archive/master.tar.gz darwin 
$ nix-channel --update
$ nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
$ ./result/bin/darwin-installer
$ ./result/sw/bin/darwin-rebuild switch --flake .
```



# How To

Clone the repository, then symlink `ln -s` each file to the dotted version in your homedirectory.

ex:

```ln -s dotfiles/shell_funcs ~/.shell_funcs```
