{ pkgs, config, lib, ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "alfred"
      "discord"
      "divvy"
      "firefox"
      "gpg-suite"
      "jetbrains-toolbox"
      "karabiner-elements"
      "slack"
      "thunderbird"
    ];
  };
}
