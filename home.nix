{config, lib, pkgs, ... }:
let
  wallpaper = pkgs.fetchurl {
    url = "https://images.pexels.com/photos/1114896/pexels-photo-1114896.jpeg";
    hash = "sha256-mQkBGvBq3dx58K5PN2SAy4QYWXJiT08Ug80sLD90kCI=";
  };
in
{
  imports = [
  ];

  home = {
    username = "dave";
    homeDirectory = lib.mkForce "/home/dave";
    stateVersion = "24.05";
  };

  home.packages = [ pkgs.fastfetch ];
  home.pointerCursor.enable = true;
  home.pointerCursor = {
    name = "nordzy-cursor-theme";
    package = pkgs.nordzy-cursor-theme;
    size = 24;
    gtk.enable = true;
    hyprcursor = {
      size = 24;
    };
  }; 

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "";
          path = "${wallpaper}";
        }
      ];
    };
  };

  # Clone my private repo to home
  home.activation.cloneDotFiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "${config.home.homeDirectory}/dotfiles" ]; then
      ${pkgs.git}/bin/git clone \
        https://github.com/DavidBrieden/dotfiles.git \
        "${config.home.homeDirectory}/dotfiles"
    fi
  '';

  home.file."antigen.zsh".source = "${pkgs.antigen}/share/antigen/antigen.zsh";
  home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.gitconfig";
  home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.zshrc";
  home.file.".config/nvim" = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/nvim"; recursive = true; };
  home.file.".config/hypr/hyprland.lua" = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/hypr/hyprland.lua"; };
  home.file.".config/foot" = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/foot"; recursive = true; };
}
