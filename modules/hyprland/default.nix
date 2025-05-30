{
  programs.wofi.enable = true;
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland.conf;

  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload = ["/home/abeljim/nixos/machines/wallpaper.png"];

    wallpaper = [
      "DP-3,/home/abeljim/nixos/machines/wallpaper.png"
      "HDMI-A-1,/home/abeljim/nixos/machines/wallpaper.png"
    ];
  };
}
