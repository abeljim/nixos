{
  pkgs,
  inputs,
  lib,
  monitors,
  monitor_configs,
  ...
}: let
  inherit (lib) mkForce;
in {
  imports = [
    ../rofi
    # (import ../waybar {inherit pkgs monitors;})
  ];

  home.packages = [
    pkgs.udiskie
    pkgs.hyprshot
    # pkgs.mako
    pkgs.hyprcursor
  ];

  home.pointerCursor = {
    name = "Bibata-Original-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
    hyprcursor.enable = true;
  };

  programs.caelestia = {
    enable = true;
    cli.enable = true;
    settings = {
      general = {
        idle = {
          lockBeforeSleep = false;
          inhibitWhenAudio = true;
          timeouts = [
            # {
            #   timeout = 300;
            #   idleAction = "dpms off";
            #   returnAction = "dpms on";
            # }
            # {
            #   timeout = 600;
            #   idleAction = ["systemctl" "suspend-then-hibernate"];
            # }
          ];
        };
      };
    };
  };

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
    ];

    monitor = [
      "${builtins.elemAt monitor_configs 0}"
      "${builtins.elemAt monitor_configs 1}"
      # For random monitors
      " , preferred, auto-right, 1"
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

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        grace = 2;
      };

      background = mkForce {
        color = "rgba(25, 20, 20, 1.0)";
        path = "screenshot";
        blur_passes = 2;
        brightness = 0.5;
      };

      label = {
        text = "パスワードをご入力ください";
        color = "rgba(222, 222, 222, 1.0)";
        font_size = 50;
        font_family = "Noto Sans CJK JP";
        position = "0, 70";
        halign = "center";
        valign = "center";
      };

      input-field = {
        size = "50, 50";
        dots_size = 0.33;
        dots_spacing = 0.15;
        outer_color = mkForce "rgba(25, 20, 20, 0)";
        inner_color = mkForce "rgba(25, 20, 20, 0)";
        font_color = mkForce "rgba(222, 222, 222, 1.0)";
        placeholder_text = "パスワード";
      };
    };
  };
}
