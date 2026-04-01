{config, pkgs, ... }: {
  imports = [
  ];

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "24.05";
  };

  home.packages = [ pkgs.fastfetch ];

  home.file."antigen.zsh".source = "${pkgs.antigen}/share/antigen/antigen.zsh";
}
