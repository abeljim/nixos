{...}: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      window-padding-x = 20;
      window-padding-y = 10;
      theme = "Kanagawa Wave";
      font-family = "JetBrainsMonoNL Nerd Font";
      background-opacity = 0.9;
      clipboard-paste-protection = false;
    };
  };
}
