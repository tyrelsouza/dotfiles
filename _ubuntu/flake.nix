{
  description = "Tyrel Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager} : {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
      "tyrel" = home-manager.lib.homeManagerConfiguration {
        targets.genericLinux.enable = true;
        system = "x86_64-linux";
        homeDirectory = "/home/tyrel";
        username = "tyrel";
        configuration.imports = [ 
	      ../hosts/blackbox-jr/default.nix
	      ../hosts/blackbox-jr/home-manager.nix
        ];
      };
    };


  };
}
