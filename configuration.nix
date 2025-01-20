# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  # config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # This doesn't seen to be needed anymore.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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

  # Even those these are experimental-features they are commonly used. I would highly recommended keeping.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Automatically delete old images.
  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 30d";
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.abelj1 = {
    isNormalUser = true;
    description = "Abel Jimenez";
    extraGroups = ["networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      # Enable Fish Shell
      fish
      # For text clipboard
      xclip
    ];
  };

  # Enable common container config files in /etc/containers
  # Enable Docker containers
  virtualisation.containers.enable = true;
  virtualisation = {
    # podman = {
    #   enable = true;
    #
    #   # Required for containers under podman-compose to be able to talk to each other.
    #   defaultNetwork.settings.dns_enabled = true;
    # };
    docker = {
      enable = true;
    };
  };

  boot.kernel.sysctl = {
    # I don't remember what this is for. I think this was required by rootless containers.
    # Don't think its needed anymore but im gonna leave it for now.
    "net.ipv4.ip_unprivileged_port_start" = 80;
  };

  # Set the trusted users for the nix package manager.
  nix.settings.trusted-users = ["abelj1"];

  # Set fish to the default shell.
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Enable Home manager so you can use home.nix to configure your system.
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "abelj1" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    # Enable ZFS
    linuxKernel.packages.linux_6_6.zfs
    # Enable ZFS userspace tools
    zfs
    # podman-compose
  ];

  # services.flatpak.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
