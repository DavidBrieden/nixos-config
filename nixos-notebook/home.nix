{config, pkgs, ... }: {
  imports = [
  ];

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "24.05";
  };

  home.packages = [ pkgs.fastfetch ];
  home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.gitconfig";

}
