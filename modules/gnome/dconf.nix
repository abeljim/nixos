# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/danielj/nixos/machines/wallpaper.png";
      picture-uri-dark = "file:///home/danielj/nixos/machines/wallpaper.png";
      primary-color = "#3071AE";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/interface" = {
      accent-color = "red";
      clock-format = "12h";
      color-scheme = "prefer-dark";
      enable-animations = true;
      gtk-theme = "Adwaita";
      icon-theme = "Kanagawa";
      cursor-theme = "Bibata-Modern-Ice";
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
      primary-color = "#3071AE";
      secondary-color = "#000000";
    };

    "org/gnome/mutter" = {
      edge-tiling = false;
      experimental-features = ["scale-monitor-framebuffer" "variable-refresh-rate"];
      workspaces-only-on-primary = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "nothing";
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = ["light-style@gnome-shell-extensions.gcampax.github.com" "rounded-window-corners@fxgn" "just-perfection-desktop@just-perfection" "status-icons@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx"];
      enabled-extensions = ["mediacontrols@cliffniff.github.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" "openbar@neuromorph" "user-theme@gnome-shell-extensions.gcampax.github.com" "pop-shell@system76.com" "launch-new-instance@gnome-shell-extensions.gcampax.github.com"];
      favorite-apps = ["org.gnome.Geary.desktop" "org.gnome.Calendar.desktop" "org.gnome.Music.desktop" "org.gnome.Nautilus.desktop" "zen.desktop"];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "47.2";
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      pipeline = "pipeline_default_rounded";
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.6;
      pipeline = "pipeline_default";
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = true;
      background-menu = true;
      clock-menu-position = 0;
      controls-manager-spacing-size = 0;
      dash = true;
      dash-icon-size = 0;
      double-super-to-appgrid = true;
      max-displayed-search-results = 0;
      osd = true;
      panel = true;
      panel-in-overview = true;
      ripple-box = true;
      search = true;
      show-apps-button = true;
      startup-status = 1;
      theme = false;
      top-panel-position = 0;
      window-demands-attention-focus = false;
      window-picker-icon = true;
      window-preview-caption = true;
      window-preview-close-button = true;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-popup = true;
      workspaces-in-app-grid = true;
    };

    "org/gnome/shell/extensions/openbar" = {
      accent-color = ["0" "0.75" "0.75"];
      autohg-bar = true;
      autohg-menu = true;
      autotheme-dark = "Dark";
      autotheme-font = true;
      autotheme-light = "Light";
      autotheme-refresh = true;
      balpha = 0.85;
      bartype = "Trilands";
      bcolor = ["0.886" "0.796" "0.624"];
      bg-change = false;
      bgalpha = 0.0;
      bgalpha2 = 0.74;
      bgcolor = ["0.208" "0.263" "0.333"];
      bgcolor-wmax = ["0.118" "0.118" "0.118"];
      bgcolor2 = ["0.271" "0.325" "0.380"];
      bguri = "file:///home/danielj/.config/background";
      boxalpha = 0.0;
      boxcolor = ["0.208" "0.263" "0.333"];
      bradius = 20.0;
      bwidth = 0.0;
      color-scheme = "prefer-dark";
      count1 = 510040;
      count10 = 1152;
      count11 = 508;
      count12 = 26;
      count2 = 21411;
      count3 = 14165;
      count4 = 3765;
      count5 = 3348;
      count6 = 2457;
      count7 = 2060;
      count8 = 1690;
      count9 = 1378;
      dark-bcolor = ["0.886" "0.796" "0.624"];
      dark-bgcolor = ["0.208" "0.263" "0.333"];
      dark-bgcolor-wmax = ["0.118" "0.118" "0.118"];
      dark-bgcolor2 = ["0.271" "0.325" "0.380"];
      dark-bguri = "file:///home/danielj/.config/background";
      dark-boxcolor = ["0.208" "0.263" "0.333"];
      dark-hscd-color = ["0.776" "0.329" "0.361"];
      dark-iscolor = ["0.208" "0.263" "0.333"];
      dark-mbcolor = ["0.612" "0.620" "0.714"];
      dark-mbgcolor = ["0.133" "0.157" "0.204"];
      dark-mscolor = ["0.776" "0.329" "0.361"];
      dark-mshcolor = ["0.000" "0.000" "0.000"];
      dark-palette1 = ["44" "52" "68"];
      dark-palette10 = ["71" "90" "118"];
      dark-palette11 = ["124" "157" "184"];
      dark-palette12 = ["156" "158" "182"];
      dark-palette2 = ["92" "131" "171"];
      dark-palette3 = ["187" "103" "109"];
      dark-palette4 = ["226" "203" "159"];
      dark-palette5 = ["119" "88" "102"];
      dark-palette6 = ["82" "108" "140"];
      dark-palette7 = ["63" "79" "100"];
      dark-palette8 = ["83" "68" "81"];
      dark-palette9 = ["202" "149" "130"];
      dark-shcolor = ["0.000" "0.000" "0.000"];
      dark-smbgcolor = ["0.271" "0.325" "0.380"];
      dark-vw-color = ["0.776" "0.329" "0.361"];
      dark-winbcolor = ["0.776" "0.329" "0.361"];
      dashdock-style = "Menu";
      dborder = false;
      default-font = "Sans 12";
      disize = 48.0;
      dshadow = false;
      fgalpha = 1.0;
      fgcolor = ["1.0" "1.0" "1.0"];
      halpha = 0.71;
      hcolor = ["0" "0.7" "0.9"];
      heffect = false;
      hscd-color = ["0.776" "0.329" "0.361"];
      import-export = false;
      isalpha = 0.95;
      iscolor = ["0.208" "0.263" "0.333"];
      light-bcolor = ["0.886" "0.796" "0.624"];
      light-bgcolor = ["0.820" "0.851" "0.878"];
      light-bgcolor-wmax = ["0.922" "0.922" "0.922"];
      light-bgcolor2 = ["0.745" "0.761" "0.800"];
      light-bguri = "file:///home/danielj/.config/background";
      light-boxcolor = ["0.820" "0.851" "0.878"];
      light-hscd-color = ["0.859" "0.349" "0.384"];
      light-iscolor = ["0.820" "0.851" "0.878"];
      light-mbcolor = ["0.325" "0.267" "0.318"];
      light-mbgcolor = ["0.902" "0.914" "0.925"];
      light-mscolor = ["0.859" "0.349" "0.384"];
      light-mshcolor = ["0.000" "0.000" "0.000"];
      light-palette1 = ["44" "52" "68"];
      light-palette10 = ["71" "90" "118"];
      light-palette11 = ["124" "157" "184"];
      light-palette12 = ["156" "158" "182"];
      light-palette2 = ["92" "131" "171"];
      light-palette3 = ["187" "103" "109"];
      light-palette4 = ["226" "203" "159"];
      light-palette5 = ["119" "88" "102"];
      light-palette6 = ["82" "108" "140"];
      light-palette7 = ["63" "79" "100"];
      light-palette8 = ["83" "68" "81"];
      light-palette9 = ["202" "149" "130"];
      light-shcolor = ["0.000" "0.000" "0.000"];
      light-smbgcolor = ["0.745" "0.761" "0.800"];
      light-vw-color = ["0.859" "0.349" "0.384"];
      light-winbcolor = ["0.859" "0.349" "0.384"];
      mbcolor = ["0.612" "0.620" "0.714"];
      mbgcolor = ["0.133" "0.157" "0.204"];
      mfgalpha = 1.0;
      mfgcolor = ["1.0" "1.0" "1.0"];
      mhcolor = ["0" "0.7" "0.9"];
      mscolor = ["0.776" "0.329" "0.361"];
      mshcolor = ["0.000" "0.000" "0.000"];
      neon = false;
      palette1 = ["44" "52" "68"];
      palette10 = ["71" "90" "118"];
      palette11 = ["124" "157" "184"];
      palette12 = ["156" "158" "182"];
      palette2 = ["92" "131" "171"];
      palette3 = ["187" "103" "109"];
      palette4 = ["226" "203" "159"];
      palette5 = ["119" "88" "102"];
      palette6 = ["82" "108" "140"];
      palette7 = ["63" "79" "100"];
      palette8 = ["83" "68" "81"];
      palette9 = ["202" "149" "130"];
      pause-reload = false;
      position = "Top";
      radius-bottomleft = true;
      radius-bottomright = true;
      radius-topleft = true;
      radius-topright = true;
      reloadstyle = false;
      shadow = false;
      shcolor = ["0.000" "0.000" "0.000"];
      smbgcolor = ["0.271" "0.325" "0.380"];
      smbgoverride = true;
      trigger-autotheme = false;
      trigger-reload = true;
      vw-color = ["0.776" "0.329" "0.361"];
      winbcolor = ["0.776" "0.329" "0.361"];
    };

    "org/gnome/shell/extensions/pop-shell" = {
      gap-inner = mkUint32 0;
      gap-outer = mkUint32 0;
      show-title = true;
      smart-gaps = false;
      tile-by-default = true;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Kanagawa-BL";
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1735491680;
      first-run = false;
      flatpak-purge-timestamp = mkInt64 1735493454;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      selected-color = mkTuple [true 1.0 1.0 1.0 1.0];
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 157;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [26 23];
      window-size = mkTuple [1231 902];
    };

    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
    };

    "org/gnome/desktop/wm/keybindings" = {
      move-to-workspace-left = ["<Super>F1"];
      move-to-workspace-right = ["<Super>F2"];
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-last = [];
    };
  };
}
