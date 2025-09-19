{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ../commonhome.nix
    ../../modules/gnome
    ../../modules/fonts/oxanium
  ];

  nixGL.packages = inputs.nixgl.packages;
  nixGL.defaultWrapper = "mesa";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # pkgs.nerd-fonts.jetbrains-mono
    # pkgs.nerd-fonts.zed-mono
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.zed-mono
    pkgs.roboto

    (config.lib.nixGL.wrap pkgs.dsview)
    (config.lib.nixGL.wrap pkgs.vial)
    pkgs.orca-slicer

    pkgs.tio
    pkgs.probe-rs-tools
    #  It is necessary to add the following line to the /etc/udev/rules.d/60-dreamsourcelab.rules file:
    # SUBSYSTEM=="usb", ATTRS{idVendor}=="2a0e", MODE="0666"
  ];

  fonts.fontconfig.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.git = {
    userEmail = "abelj1@uci.edu";
    userName = "abeljim";
  };

  home.shellAliases = {
    nupdate = lib.mkForce "nix flake update";
    nclean = lib.mkForce "nix-env --delete-generations 7d";
    ngarbage = lib.mkForce "nix-collect-garbage -d";
    nupgrade = "home-manager switch --flake ~/nixos/#abeljim";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/abeljim/etc/profile.d/hm-session-vars.sh
  #
}
