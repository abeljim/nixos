{
  pkgs,
  inputs,
  monitors,
  monitor_configs,
  ...
}: {
  imports = [
    ../rofi
    (import ../waybar {inherit pkgs monitors;})
  ];

  home.packages = [
    pkgs.udiskie
  ];

  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, monitor:${builtins.elemAt monitors 0}"
      "2, monitor:${builtins.elemAt monitors 0}"
      "3, monitor:${builtins.elemAt monitors 0}"
      "4, monitor:${builtins.elemAt monitors 0}"
      "5, monitor:${builtins.elemAt monitors 0}"
      "6, monitor:${builtins.elemAt monitors 0}"
      "7, monitor:${builtins.elemAt monitors 0}"
      "8, monitor:${builtins.elemAt monitors 0}"
      "9, monitor:${builtins.elemAt monitors 0}"
      # "10, monitor:${builtins.elemAt monitors 1}"

      "monitor=${builtins.elemAt monitor_configs 0}"
      "monitor=${builtins.elemAt monitor_configs 1}"
      # For random monitors
      "monitor = , preferred, auto, 1"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland.conf;

  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload = ["/home/abeljim/nixos/machines/wallpaper.png"];

    # wallpaper = [
    #   "${builtins.elemAt monitors 0},/home/abeljim/nixos/machines/wallpaper.png"
    #   "${builtins.elemAt monitors 1},/home/abeljim/nixos/machines/wallpaper.png"
    # ];

    wallpaper = [
      ",/home/abeljim/nixos/machines/wallpaper.png"
    ];
  };
}
