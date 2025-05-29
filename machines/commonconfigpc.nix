{
  # config,
  # lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.probe-rs-rules.nixosModules.x86_64-linux.default
  ];
  hardware.probe-rs.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable the Gnome Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  programs.hyprland.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.zed-mono
  ];

  environment.systemPackages = with pkgs; [
    # Embedded
    (segger-jlink.override {acceptLicense = true;})
    vial
  ];

  services.flatpak.enable = true;

  services.udev.packages = [
    (pkgs.segger-jlink.override {acceptLicense = true;})
    pkgs.vial
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "segger-jlink-qt4-810"
  ];
}
