{
  description = "Tyrel Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-22.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix";
    darwin.inputs.nixpkgs.follows = "nixpkgs"; 
  };
  outputs = { self, nixpkgs, home-manager, darwin }: {
    defaultPackage.x86_64 = home-manager.defaultPackage.x86_64;

    homeConfigurations = {
      "tyrel" = home-manager.lib.homeManagerConfiguration {
        system = "x86_64";
        homeDirectory = "/home/tyrel";
        username = "tyrel";
        configuration.imports = [ 
	      ../hosts/ts-tl-mbp/home-manager.nix
        ];
      };
    };


  };
}
