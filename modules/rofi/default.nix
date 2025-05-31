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

    theme = mkForce {
      "*" = {
        color0 = mkLiteral "#2e3440";
        color1 = mkLiteral "#3b4252";
        color2 = mkLiteral "#434c5e";
        color3 = mkLiteral "#4c566a";

        color4 = mkLiteral "#d8dee9";
        color5 = mkLiteral "#e5e9f0";
        color6 = mkLiteral "#eceff4";

        color7 = mkLiteral "#8fbcbb";
        color8 = mkLiteral "#88c0d0";
        color9 = mkLiteral "#81a1c1";
        color10 = mkLiteral "#5e81ac";
        color11 = mkLiteral "#bf616a";

        color12 = mkLiteral "#d08770";
        color13 = mkLiteral "#ebcb8b";
        color14 = mkLiteral "#a3be8c";
        color15 = mkLiteral "#b48ead";

        foreground = mkLiteral "@color9";
        backlight = mkLiteral "#ccffeedd";
        background-color = mkLiteral "transparent";

        highlight = mkLiteral "underline bold #eceff4";

        transparent = mkLiteral "rgba(46,52,64,0)";
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
        background-color = mkLiteral "#3b4252";

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
        background-color = mkLiteral "rgba(46,52,64,0.9)";
        dynamic = false;
      };

      element = {
        padding = mkLiteral "3px";
        vertical-align = mkLiteral "0.5";
        border-radius = mkLiteral "4px";
        background-color = mkLiteral "transparent";
        color = mkLiteral "@foreground";
        text-color = mkLiteral "rgb(216, 222, 233)";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@color7";
        text-color = mkLiteral "#2e3440";
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
        background-color = mkLiteral "rgba(46,52,64,0.9)";
        dynamic = true;
        text-color = mkLiteral "@backlight";
      };
    };
  };
}
