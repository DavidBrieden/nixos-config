{ config, lib, pkgs, ... }: {
  wsl.enable = true;
  wsl.defaultUser = "dave";
  wsl.docker-desktop.enable = true;

  networking.hostName = "nixos-wsl";

  environment.systemPackages = with pkgs; [
    nodejs yarn-berry
    python3
    
    # rust
    rustc
    cargo
    rustfmt
    clippy

    httpyac
  ];

  virtualisation.docker.enable = true;
  users.users.dave.extraGroups = [ "docker" ];

  system.stateVersion = "25.11"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
