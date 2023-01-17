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
      "meetingbar"
      "qsyncthingtray"
      "scrivener"
      "slack"
      "spotify"
      "steam"
      "syncthing"
      "tailscale"
      "telegram-desktop"
      "thunderbird"
    ];
  };
}
