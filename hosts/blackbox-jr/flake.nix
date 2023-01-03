{
  description = "Tyrel Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager } : 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
      homeConfigurations = {
        "tyrel" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./default.nix
            ./home-manager.nix
            {
            home = {
              homeDirectory = "/home/tyrel";
              username = "tyrel";
              stateVersion = "22.05";
            };
          }
        ];


      };
    };
  };
}

