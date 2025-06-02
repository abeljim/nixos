{
  pkgs,
  inputs,
  monitors,
  ...
}: {
  imports = [
    ../rofi
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        output = [
          "${builtins.elemAt monitors 0}"
          "${builtins.elemAt monitors 1}"
        ];

        layer = "top";
        position = "top";
        spacing = 0;
        height = 34;

        modules-left = [
          "custom/logo"
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "memory"
          "network"
          "wireplumber"
          "battery"
          "custom/power"
        ];

        "wlr/taskbar" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "on-click-right" = "fullscreen";
          "icon-theme" = "WhiteSur";
          "icon-size" = 25;
          "tooltip-format" = "{title}";
        };

        "hyprland/workspaces" = {
          "on-click" = "activate";
          "format" = "{icon}";
          "format-icons" = {
            "default" = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "active" = "󱓻";
            "urgent" = "󱓻";
          };
          "persistent_workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
        };

        "memory" = {
          "interval" = 5;
          "format" = "󰍛 {}%";
          "max-length" = 10;
        };

        "tray" = {
          "spacing" = 10;
        };

        "clock" = {
          "tooltip-format" = "{calendar}";
          "format-alt" = "  {:%a, %d %b %Y}";
          "format" = "  {:%I:%M %p}";
        };

        "network" = {
          "format-wifi" = "{icon}";
          "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          "format-ethernet" = "󰀂";
          "format-alt" = "󱛇";
          "format-disconnected" = "󰖪";
          "tooltip-format-wifi" = "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          "tooltip-format-ethernet" = "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          "tooltip-format-disconnected" = "Disconnected";
          "on-click" = "~/.config/rofi/wifi/wifi.sh &";
          "on-click-right" = "~/.config/rofi/wifi/wifinew.sh &";
          "interval" = 5;
          "nospacing" = 1;
        };

        "wireplumber" = {
          "format" = "{icon}";
          "format-bluetooth" = "󰂰";
          "nospacing" = 1;
          "tooltip-format" = "Volume : {volume}%";
          "format-muted" = "󰝟";
          "format-icons" = {
            "headphone" = "";
            "default" = ["󰖀" "󰕾" ""];
          };
          "on-click" = "pamixer -t";
          "scroll-step" = 1;
        };

        "custom/logo" = {
          "format" = "  ";
          "tooltip" = false;
          "on-click" = "~/.config/rofi/launchers/misc/launcher.sh &";
        };

        "battery" = {
          "format" = "{capacity}% {icon}";
          "format-icons" = {
            "charging" = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            "default" = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          "format-full" = "Charged ";
          "interval" = 5;
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "tooltip" = false;
        };
        "custom/power" = {
          "format" = "󰤆";
          "tooltip" = false;
          "on-click" = "~/.config/rofi/powermenu/type-2/powermenu.sh &";
        };
      };
    };

    style = ''
            * {
              border: none;
              border-radius: 0;
              min-height: 0;
              font-family: JetBrainsMono Nerd Font;
              font-size: 13px;
            }

            window#waybar {
              background-color: transparent;
              transition-property: background-color;
              transition-duration: 0.5s;
            }

            window#waybar.hidden {
              opacity: 0.5;
            }

      #workspaces {
              background-color: transparent;
            }

      #workspaces button {
              all: initial;
              /* Remove GTK theme values (waybar #1351) */
              min-width: 0;
              /* Fix weird spacing in materia (waybar #450) */
              box-shadow: inset 0 -3px transparent;
              /* Use box-shadow instead of border so the text isn't offset */
              padding: 6px 18px;
              margin: 6px 3px;
              border-radius: 4px;
              background-color: #1F1F28;
              color: #DCD7BA;
            }

      #workspaces button.active {
              color: #1F1F28;
              background-color: #DCD7BA;
            }

      #workspaces button:hover {
              box-shadow: inherit;
              text-shadow: inherit;
              color: #1F1F28;
              background-color: #DCD7BA;
            }

      #workspaces button.urgent {
              background-color: #D27E99;
            }

      #memory,
      #custom-power,
      #battery,
      #backlight,
      #wireplumber,
      #network,
      #clock,
      #tray {
              border-radius: 4px;
              margin: 6px 3px;
              padding: 6px 12px;
              background-color: #1F1F28;
              color: #181820;
            }

      #custom-power {
              margin-right: 6px;
            }

      #custom-logo {
              padding-right: 7px;
              padding-left: 7px;
              margin-left: 5px;
              font-size: 15px;
              border-radius: 8px 0px 0px 8px;
              color: #7E9CD8;
            }

      #memory {
              background-color: #FFA066;
            }

      #battery {
              background-color: #D27E99;
            }

      #battery.warning,
      #battery.critical,
      #battery.urgent {
              background-color: #E82424;
              color: #DCA561;
            }

      #battery.charging {
              background-color: #98BB6C;
              color: #181820;
            }

      #backlight {
              background-color: #FFA066;
            }

      #wireplumber {
              background-color: #E6C384;
            }

      #network {
              background-color: #7AA89F;
              padding-right: 17px;
            }

      #clock {
              font-family: JetBrainsMono Nerd Font;
              background-color: #957FB8;
            }

      #custom-power {
              background-color: #D27E99;
            }

            tooltip {
              border-radius: 8px;
              padding: 15px;
              background-color: #16161D;
            }

            tooltip label {
              padding: 5px;
              background-color: #16161D;
            }
    '';
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
      "10, monitor:${builtins.elemAt monitors 1}"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland.conf;

  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    ipc = "on";
    splash = false;
    splash_offset = 2.0;

    preload = ["/home/abeljim/nixos/machines/wallpaper.png"];

    wallpaper = [
      "${builtins.elemAt monitors 0},/home/abeljim/nixos/machines/wallpaper.png"
      "${builtins.elemAt monitors 1},/home/abeljim/nixos/machines/wallpaper.png"
    ];
  };
}
