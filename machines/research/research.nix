# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  secrets,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../commonconfig.nix
    ../commonconfigpc.nix
    # (import ../../modules/tailscale/server.nix {inherit pkgs secrets;})
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  networking.hostName = "quiet"; # Define your hostname.

  home-manager = {
    extraSpecialArgs = {inherit inputs secrets;};
    backupFileExtension = "backup";
    users = {
      "abeljim" = import ./home.nix;
    };
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["abeljim"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  networking.firewall.enable = false;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # gamescopeSession.enable = true;
  };

  programs.gamescope = {
    enable = true;
    # capSysNice = true;
  };

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
