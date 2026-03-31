{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };
  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations.nixos-wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        nixos-wsl.nixosModules.default
        ./nixos-wsl/configuration.nix
      ];
    };
  };
}
