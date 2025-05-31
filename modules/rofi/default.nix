{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "window,drun,run,ssh";
      show-icons = false;
      font = "JetBrainsMonoNL Nerd Font 16";
      line-margin = 10;
      display-ssh = "";
      display-run = "";
      display-drun = "";
      display-window = "";
      display-combi = "";
    };

    location = "center";
    terminal = "${pkgs.alacritty}/bin/alacritty";

    # Rofi theme for kanagawa wave
    theme = mkForce {
      "*" = {
        color0 = mkLiteral "#16161D";
        color1 = mkLiteral "#181820";
        color2 = mkLiteral "#1a1a22";
        color3 = mkLiteral "#1F1F28";

        color4 = mkLiteral "#C8C093";
        color5 = mkLiteral "#DCD7BA";
        color6 = mkLiteral "#727169";

        color7 = mkLiteral "#b8b4d0";
        color8 = mkLiteral "#7E9CD8";
        color9 = mkLiteral "#938AA9";
        color10 = mkLiteral "#7FB4CA";
        color11 = mkLiteral "#E46876";

        color12 = mkLiteral "#FFA066";
        color13 = mkLiteral "#E6C384";
        color14 = mkLiteral "#98BB6C";
        color15 = mkLiteral "#957FB8";

        color16 = mkLiteral "#DCD7BA";
        color17 = mkLiteral "#2D4F67";

        foreground = mkLiteral "@color4";
        backlight = mkLiteral "#16161DDD";
        background-color = mkLiteral "transparent";

        highlight = mkLiteral "underline bold #223249";

        transparent = mkLiteral "rgba(31,31,40,0)";
      };

      window = {
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        transparency = "screenshot";
        padding = mkLiteral "10px";
        border = mkLiteral "0px";
        border-radius = mkLiteral "6px";

        background-color = mkLiteral "@transparent";
        spacing = mkLiteral "0";
        children = map mkLiteral ["mainbox"];
        orientation = mkLiteral "horizontal";
      };

      mainbox = {
        spacing = mkLiteral "0";
        children = map mkLiteral ["inputbar" "message" "listview"];
      };

      message = {
        color = mkLiteral "@color0";
        padding = mkLiteral "5";
        border-color = mkLiteral "@foreground";
        border = mkLiteral "0px 2px 2px 2px";
        background-color = mkLiteral "@color7";
      };

      inputbar = {
        color = mkLiteral "@color6";
        padding = mkLiteral "11px";
        background-color = mkLiteral "@color3";

        border = mkLiteral "1px";
        border-radius = mkLiteral "6px 6px 0px 0px";
        border-color = mkLiteral "@color10";
      };

      "entry, prompt, case-indicator" = {
        text-font = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      prompt = {
        margin = mkLiteral "0px 1em 0em 0em";
      };

      listview = {
        padding = mkLiteral "8px";
        border-radius = mkLiteral "0px 0px 6px 6px";
        border-color = mkLiteral "@color10";
        border = mkLiteral "0px 1px 1px 1px";
        background-color = mkLiteral "rgba(31,31,40,0.9)";
        dynamic = false;
      };

      element = {
        padding = mkLiteral "3px";
        vertical-align = mkLiteral "0.5";
        border-radius = mkLiteral "4px";
        background-color = mkLiteral "transparent";
        color = mkLiteral "@foreground";
        text-color = mkLiteral "@color16";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@color17";
        text-color = mkLiteral "@color16";
      };

      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      button = {
        padding = mkLiteral "6px";
        color = mkLiteral "@foreground";
        horizontal-align = mkLiteral "0.5";

        border = mkLiteral "2px 0px 2px 2px";
        border-radius = mkLiteral "4px 0px 0px 4px";
        border-color = mkLiteral "@foreground";
      };

      "button selected normal" = {
        border = mkLiteral "2px 0px 2px 2px";
        border-color = mkLiteral "@foreground";
      };

      textbox = {
        padding = mkLiteral "8px";
        border-radius = mkLiteral "6px 6px 6px 6px";
        border-color = mkLiteral "@color10";
        border = mkLiteral "1px 1px 1px 1px";
        background-color = mkLiteral "rgba(31,31,40,0.9)";
        dynamic = true;
        text-color = mkLiteral "@backlight";
      };
    };
  };
}
