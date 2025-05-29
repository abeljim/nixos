{
  programs.kitty.enable = true; # required for the default Hyprland config
  wayland.windowManager.hyprland.enable = true; # enable Hyprland

  wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland.conf;
}
