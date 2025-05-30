{
  pkgs,
  inputs,
  monitors,
  ...
}: {
  home.packages = [
    inputs.hyprpanel.packages.${pkgs.system}.wrapper
  ];

  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

  programs.hyprpanel = {
    # Enable the module.
    # Default: false
    enable = true;

    # Automatically restart HyprPanel with systemd.
    # Useful when updating your config so that you
    # don't need to manually restart it.
    # Default: false
    systemd.enable = true;

    # Add '/nix/store/.../hyprpanel' to your
    # Hyprland config 'exec-once'.
    # Default: false
    hyprland.enable = true;

    # Fix the overwrite issue with HyprPanel.
    # See below for more information.
    # Default: false
    overwrite.enable = true;

    # Import a theme from './themes/*.json'.
    # Default: ""
    # theme = "gruvbox_split";

    # Override the final config with an arbitrary set.
    # Useful for overriding colors in your selected theme.
    # Default: {}
    # override = {
    #   theme.bar.menus.text = "#123ABC";
    # };

    # Configure bar layouts for monitors.
    # See 'https://hyprpanel.com/configuration/panel.html'.
    # Default: null
    # layout = {
    #   "bar.layouts" = {
    #     "0" = {
    #       left = ["dashboard" "workspaces"];
    #       middle = ["media"];
    #       right = ["volume" "systray" "notifications"];
    #     };
    #   };
    # };

    # Configure and theme almost all options from the GUI.
    # Options that require '{}' or '[]' are not yet implemented,
    # except for the layout above.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      # bar.launcher.autoDetectIcon = true;
      # bar.workspaces.show_icons = true;
      #
      # menus.clock = {
      #   time = {
      #     military = true;
      #     hideSeconds = true;
      #   };
      #   weather.unit = "metric";
      # };

      # menus.dashboard.directories.enabled = false;
      # menus.dashboard.stats.enable_gpu = true;

      layout = {
        "bar.layouts" = {
          "0" = {
            left = ["dashboard" "workspaces"];
            middle = ["media"];
            right = ["volume" "systray" "clock" "notifications"];
          };
          "1" = {
            left = [];
            middle = [];
            right = [];
          };
        };
      };

      theme.bar.transparent = true;

      bar.launcher.autoDetectIcon = true;
      # theme.font = {
      #   name = "CaskaydiaCove NF";
      #   size = "16px";
      # };
    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
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
