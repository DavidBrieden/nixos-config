# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "dave";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos-wsl";

  environment.systemPackages = with pkgs; [
    git wget curl vim gh
    nodejs
    python3
  ];

  programs.zsh.enable = true;
  programs.neovim.enable = true;

  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "25.11"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
