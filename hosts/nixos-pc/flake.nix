{
  description = "pc-specific NixOS configuration";

  # Host-spezifische Inputs (optional, falls nötig)
  inputs = {
    common.url = "path:../..";
    nixpkgs.follows = "common/nixpkgs";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    };
  };

  outputs = { self, nixpkgs, common,  ... }@inputs: {
    nixosConfigurations.nixos-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        inherit (common) nixosModules;
      };
      modules = [
        ./hardware-configuration.nix
        common.nixosModules.common
        ./configuration.nix
      ];
    };
  };
}
