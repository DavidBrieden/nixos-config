inputs@{ nixpkgs, nixos-wsl, home-manager, ... }:
{
  nixos-wsl = import ./nixos-wsl inputs;
  nixos-notebook = import ./nixos-notebook inputs;
}
