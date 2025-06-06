# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  # config,
  # pkgs,
  inputs,
  secrets,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../commonconfig.nix
    ../commonconfigpc.nix
  ];

  networking.hostName = "x1"; # Define your hostname.

  home-manager = {
    extraSpecialArgs = {inherit inputs secrets;};
    backupFileExtension = "backup";
    users = {
      "abeljim" = import ./home.nix;
    };
  };

  networking.firewall = {
    allowedUDPPorts = [51820]; # Clients and peers can use the same port, see listenport
  };

  programs.adb.enable = true;

  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable udev rules for saleae-logic.
  hardware.saleae-logic.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
