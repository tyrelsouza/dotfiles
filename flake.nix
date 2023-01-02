{
  description = "Tyrel Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs"; 
  };


  outputs = { self, nixpkgs, home-manager, darwin }: {
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
    homeConfigurations."ts-tl-mbp" = {
      "tyrel" = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-darwin";
        homeDirectory = "/Users/tyrel";
        username = "tyrel";
        configuration.imports = [ ./home.nix ];
      };
    };
    darwinConfigurations."ts-tl-mbp" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ home-manager.darwinModules.home-manager ./hosts/ts-tl-mbp/default.nix ];
    };
  };

}
