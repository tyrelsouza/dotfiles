{ pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.tyrel = { pkgs, ... }: {
    programs.home-manager.enable = true;
    home.stateVersion = "22.05";
    home.sessionVariables = {
      XDG_CONFIG_HOME = "/Users/tyrel/.config";
    };


    # XDG CONFIGS
    xdg.configFile = {
      "karabiner" = {
        source = ../../home/config/karabiner;
        recursive = true;
      };
    };

  }; # -- HomeManager
 
}
