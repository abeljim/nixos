# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  # config,
  pkgs,
  inputs,
  secrets,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../commonconfig.nix
    (import ../../modules/tailscale/server.nix {inherit pkgs secrets;})
  ];

  networking.hostName = "cowcloud"; # Define your hostname.

  # enable mdadm used for raid. I use it cloning my boot ssd but right now I just have 1.
  boot.swraid.enable = true;
  boot.swraid.mdadmConf = "MAILADDR abelj1@uci.edu";
  # # sudo mount /dev/md125 /mnt/nvme
  # # I think below is suppose to be 125
  # fileSystems."/mnt/nvme" = {
  #   device = "/dev/md127";
  #   fsType = "ext4";
  # };

  # Add ZFS Support. Might not needs these two lines
  boot.supportedFilesystems = ["zfs"];
  boot.initrd.supportedFilesystems = ["zfs"];
  # For ZFS
  # https://mynixos.com/nixpkgs/option/networking.hostId
  networking.hostId = "80ccecb1";
  boot.zfs.extraPools = ["scratchdata" "lilboi" "fatboi"];
  services.zfs.autoScrub.enable = true;

  # Configure Samba File Share. Recommended for sharing with windows.
  # sudo smbpasswd -a yourusername; to add users.
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "cowcloud";
        "netbios name" = "cowcloud";
        "security" = "user";
        #"use sendfile" = "yes";
        #"max protocol" = "smb2";
        # note: localhost is the ipv6 localhost ::1
        # "hosts allow" = "192.168.0. 127.0.0.1 localhost";
        # "hosts deny" = "0.0.0.0/0";
        #"guest account" = "nobody";
        #"map to guest" = "bad user";
      };
      "cloud" = {
        "path" = "/fatboi/personal";
        "browsable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        #"force user" = "username";
        #"force group" = "groupname";
      };
    };
  };

  # Allows window to discover samba server.
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  # Enable NFS for linux file share.
  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /fatboi/content/media  192.168.50.94(ro,nohide,insecure,no_subtree_check) 192.168.50.185(rw,sync,nohide,insecure,no_subtree_check,no_root_squash)
    /fatboi  192.168.50.185(rw,sync,nohide,insecure,no_subtree_check,no_root_squash)
  '';

  home-manager = {
    extraSpecialArgs = {inherit inputs secrets;};
    backupFileExtension = "backup";
    users = {
      "abeljim" = import ./home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    # Enable ZFS
    linuxKernel.packages.linux_6_6.zfs
    # Enable ZFS userspace tools
    zfs
    # podman-compose
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.firewall = {
    allowedUDPPorts = [51820]; # Clients and peers can use the same port, see listenport
  };
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
