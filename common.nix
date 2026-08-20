
{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git wget curl vim gnumake gh
  ];

  programs.zsh.enable = true;
  programs.neovim.enable = true;
  programs.nix-ld.enable = true; # this is necessary for nvim and running eg. lsps in there

  users.defaultUserShell = pkgs.zsh;

  # Home-Manager-Konfiguration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.dave = ./home.nix;  # Pfad zur Home-Config (relativ zum common-Verzeichnis)
  };
}
