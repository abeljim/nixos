{...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      window-padding-x = 20;
      window-padding-y = 10;
      theme = "dark:kanagawa-wave, light:kanagawa-white-lotus";
      font-family = "JetBrainsMonoNL Nerd Font";
      font-size = 16;
      background-opacity = 0.95;
      clipboard-paste-protection = false;
    };
  };

  home.file = {
    ".config/ghostty/themes/kanagawa-wave".text = ''
      palette = 0=#16161d
      palette = 1=#c34043
      palette = 2=#76946a
      palette = 3=#c0a36e
      palette = 4=#7e9cd8
      palette = 5=#957fb8
      palette = 6=#6a9589
      palette = 7=#c8c093
      palette = 8=#727169
      palette = 9=#e82424
      palette = 10=#98bb6c
      palette = 11=#e6c384
      palette = 12=#7fb4ca
      palette = 13=#938aa9
      palette = 14=#7aa89f
      palette = 15=#dcd7ba

      background = 1f1f28
      foreground = dcd7ba
      cursor-color = c8c093
      selection-background = 2d4f67
      selection-foreground = c8c093
    '';
    ".config/ghostty/themes/kanagawa-white-lotus".text = ''
      palette = 0=#1f1f28
      palette = 1=#c84053
      palette = 2=#6f894e
      palette = 3=#77713f
      palette = 4=#4d699b
      palette = 5=#b35b79
      palette = 6=#597b75
      palette = 7=#545464
      palette = 8=#8a8980
      palette = 9=#d7474b
      palette = 10=#6e915f
      palette = 11=#836f4a
      palette = 12=#6693bf
      palette = 13=#624c83
      palette = 14=#5e857a
      palette = 15=#43436c

      background = f9f6e0
      foreground = 545464
      cursor-color = 43436c
      selection-background = c9cbd1
      selection-foreground = 43436c
    '';
  };
}
