{ config, lib, pkgs, ... }: {
  wsl.enable = true;
  wsl.defaultUser = "dave";


  networking.hostName = "nixos-wsl";

  environment.systemPackages = with pkgs; [
    nodejs
    python3
  ];

  system.stateVersion = "25.11"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
