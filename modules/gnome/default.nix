{
  # config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./dconf.nix
  ];

  home.packages = [
    pkgs.gnome-tweaks
    pkgs.kanagawa-gtk-theme
    pkgs.kanagawa-icon-theme
    pkgs.gnomeExtensions.just-perfection
    pkgs.gnomeExtensions.media-controls
    pkgs.gnomeExtensions.open-bar
    pkgs.gnomeExtensions.pop-shell
    pkgs.dconf2nix
    pkgs.bibata-cursors
  ];
}
