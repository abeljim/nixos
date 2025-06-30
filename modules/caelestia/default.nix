{
  pkgs,
  inputs,
  lib,
  monitors,
  ...
}: {
  # imports = [
  #   ../rofi
  #   (import ../waybar {inherit pkgs monitors;})
  # ];

  home.packages = [
    inputs.quickshell.packages.x86_64-linux.default
    pkgs.ddcutil
    pkgs.brightnessctl
    # missing app2unit
    pkgs.cava
    # I think network manager is installed on its own
    pkgs.lm_sensors
    # skipping fish
    pkgs.curl
    pkgs.aubio
    pkgs.pipewire.dev
    pkgs.glibc
    pkgs.qt6.qtdeclarative
    pkgs.material-symbols
    # also needs jetbrains mono - nerd. I already have it installed.
    pkgs.grim
    pkgs.swappy
    pkgs.libqalculate
  ];
}
