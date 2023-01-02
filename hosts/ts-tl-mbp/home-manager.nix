{ pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.tyrel = { pkgs, ... }: {
    # Common Imports
    imports = [
        ../_common/home.nix
        ../_common/programs.nix
        ../_common/xdg.nix
    ];

    # XDG CONFIGS
    xdg.configFile."karabiner" = {
        source = ../../home/config/karabiner;
        recursive = true;
    };
  }; # -- HomeManager
 
}
