{ pkgs, config, lib, ... }:
{
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  system.defaults.dock.autohide = true;
}
