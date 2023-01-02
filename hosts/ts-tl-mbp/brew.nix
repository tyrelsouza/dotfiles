{ pkgs, config, lib, ... }:
{
  homebrew = {
    enable = true;
    casks = [
    "alfred"
    "discord"
    "slack"
    "karabiner-elements"
    ];
  };
}
