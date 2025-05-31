{pkgs, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "${pkgs.btop}/share/btop/themes/kanagawa-wave.theme";

      # If the theme set background should be shown, set to False if you want terminal background transparency.
      theme_background = false;

      vim_keys = false;
    };
  };
}
