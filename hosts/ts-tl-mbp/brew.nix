{ pkgs, config, lib, ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "alfred"
      "discord"
      "divvy"
      "firefox"
      "karabiner-elements"
      "slack"
      "thunderbird"
    ];
  };
}
