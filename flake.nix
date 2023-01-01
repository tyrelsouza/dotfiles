{
	description = "Tyrel Nix";

inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";


    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # nix will normally use the nixpkgs defined in home-managers inputs, we only want one copy of nixpkgs though

};

outputs = { self, nixpkgs, home-manager, darwin }: {
  darwinConfigurations."ts-tl-mbp" = darwin.lib.darwinSystem {
    system = "x86_64-darwin";
    modules = [ home-manager.darwinModules.home-manager ./hosts/ts-tl-mbp/default.nix ]; # will be important later
  };
};

}
