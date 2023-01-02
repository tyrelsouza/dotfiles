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

    # Load Common Packages
    common = pkgs.callPackage ../_common/homepkgs.nix {};

    # XDG CONFIGS
    xdg.configFile = {
      "karabiner" = {
        source = ../../home/config/karabiner;
        recursive = true;
      };
    };
  }; # -- HomeManager
 
}
