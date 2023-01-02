{ pkgs, config, lib, ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "alfred"
      "discord"
      "divvy"
      "firefox"
      "jetbrains-toolbox"
      "karabiner-elements"
      "slack"
      "thunderbird"
    ];
  };
}
