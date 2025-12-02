{
	description = "NixOs from scratch MikeJohnP";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = { self, nixpkgs, home-manager, ...} @inputs:
	let
		mkNixosConfig =
        system: extraModules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs system; };
          modules = extraModules;
        };
	in
	{
		nixosConfigurations = {
			nixos-btw = mkNixosConfig "x86_64-linux" [
				./nixos/vm-dev/configuration.nix
			];
		};

		homeConfigurations = {
			"nixos-btw" = home-manager.lib.homeManagerConfiguration
          	{
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				extraSpecialArgs = { inherit inputs; };
				modules = [
					./users/vmdev/home.nix
				];
          	};
		};

	};

}
