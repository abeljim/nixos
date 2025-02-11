# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../commonconfig.nix
    ../commonconfigpc.nix
  ];

  # services.desktopManager.cosmic.enable = true;
  # services.displayManager.cosmic-greeter.enable = true;

  networking.hostName = "quiet"; # Define your hostname.

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "backup";
    users = {
      "abeljim" = import ./home.nix;
    };
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["abeljim"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # services.ollama = {
  #   enable = true;
  #   acceleration = "rocm";
  # };
  # services.open-webui.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
