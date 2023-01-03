{ pkgs, config, lib, ... }:
{
  homebrew = {
    enable = true;
    casks = [
      "alfred"
      "affinity-photo"
      "affinity-designer"
      "affinity-publisher"
      "commander-one"
      "discord"
      "divvy"
      "firefox"
      "gpg-suite"
      "jetbrains-toolbox"
      "karabiner-elements"
      "slack"
      "spotify"
      "steam"
      "tailscale"
      "telegram-desktop"
      "thunderbird"
    ];
  };
}
