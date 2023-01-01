# hosts/ts-tl-mbp/default.nix
{ pkgs, ... }:
{

  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;

  # Installs a version of nix, that dosen't need "experimental-features = nix-command flakes" in /etc/nix/nix.conf
  services.nix-daemon.package = pkgs.nixFlakes;
  
  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;

  homebrew = {
	  enable = true;
	  autoUpdate = true;
	  # updates homebrew packages on activation,
	  # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
	  casks = [
	    "alfred"
	    "discord"
	  ];
	};


  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.tyrel = { pkgs, ... }: {
  
    stateVersion = "22.11"; # read below
  
  };


}
