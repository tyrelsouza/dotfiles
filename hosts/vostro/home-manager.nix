{ pkgs, ... }:
{
  # Common Imports
  imports = [
      ./home.nix
      ../_common/home.nix
      ../_common/programs.nix
      ../_common/xdg.nix
  ];
  home.sessionVariables = {
    XDG_CONFIG_HOME = "/home/tyrel/.config";
  };

 
}
