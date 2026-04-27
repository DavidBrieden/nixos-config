{config, lib, pkgs, ... }: {
  imports = [
  ];

  home = {
    username = "dave";
    homeDirectory = "/home/dave";
    stateVersion = "24.05";
  };

  home.packages = [ pkgs.fastfetch ];

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
  home.file.".config/hypr" = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/hypr"; recursive = true; };
  home.file.".config/quickshell" = { source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.config/quickshell"; recursive = true; };
}
