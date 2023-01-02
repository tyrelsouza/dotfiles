{
  description = "Tyrel Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix";
    darwin.inputs.nixpkgs.follows = "nixpkgs"; 
  };
  outputs = { self, nixpkgs, home-manager, darwin }: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
      "tyrel" = home-manager.lib.homeManagerConfiguration {
        system = "x86_64";
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
