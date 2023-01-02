{ pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.tyrel = { pkgs, ... }: {
    programs.home-manager.enable = true;
    home.stateVersion = "22.05";
    home.sessionVariables = {
      XDG_CONFIG_HOME = "/home/tyrel/.config";
    };

  }; # -- HomeManager
 
}
