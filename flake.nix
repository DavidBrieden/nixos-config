{
  description = "Common NixOS Flake with shared inputs and modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosModules = {
      common = { config, lib, pkgs, ... }: {
        imports = [
          home-manager.nixosModules.home-manager
          ./common.nix
        ];
      };
    };
  };
}
