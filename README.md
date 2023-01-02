# Nix

Install Nix and Home-Manager

For Macos:

Install nix-darwin
```shell
$ nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
$ ./result/bin/darwin-installer
$ ./result/sw/bin/darwin-rebuild switch --flake .
```



# How To

Clone the repository, then symlink `ln -s` each file to the dotted version in your homedirectory.

ex:

```ln -s dotfiles/shell_funcs ~/.shell_funcs```
