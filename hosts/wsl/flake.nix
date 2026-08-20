{
  description = "wsl-specific NixOS configuration";

  # Host-spezifische Inputs (optional, falls nötig)
  inputs = {
    common.url = "path:../..";
    nixpkgs.follows = "common/nixpkgs";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, common,  ... }@inputs: {
    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        inherit (common) nixosModules;
      };
      modules = [
        nixos-wsl.nixosModules.default
        common.nixosModules.common
        ./configuration.nix
      ];
    };
  };
}
