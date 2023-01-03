{ pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.tyrel = { pkgs, ... }: {
    # Common Imports
    imports = [
        ./home.nix
        ../_common/home.nix
        ../_common/programs.nix
        ../_common/xdg.nix
    ];
    home.sessionVariables = {
      XDG_CONFIG_HOME = "/Users/tyrel/.config";
    };

    # XDG CONFIGS
    xdg.configFile."karabiner" = {
        source = ../../home/config/karabiner;
        recursive = true;
    };
  }; # -- HomeManager
 
}
