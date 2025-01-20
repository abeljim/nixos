{
  # config,
  pkgs,
  inputs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "abelj1";
  home.homeDirectory = "/home/abelj1";

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./neovim
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Allow the use of non opensource software.
  nixpkgs.config.allowUnfree = true;

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

    # Programming
    pkgs.devenv
    pkgs.direnv
    pkgs.git
    pkgs.gh
    pkgs.gcc
    pkgs.gnumake
    pkgs.rustup

    # LSP
    pkgs.lua-language-server
    pkgs.typos

    # CLI Tools
    pkgs.yt-dlp
    pkgs.podman-tui
    pkgs.oxker
    pkgs.intel-gpu-tools
    pkgs.zenith
    pkgs.zellij
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.fd

    # Formatters
    pkgs.yamlfmt
    pkgs.taplo # Toml
    pkgs.alejandra # Nix
    pkgs.deno # Seems like best option for markdown.
  ];

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

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Disable greeting for fish shell
       set fish_greeting

      # Copy command that uses rsync
      function cp2
        if test (count $argv) -ne 2
         echo "Usage: cp2 <source> <destination>"
         return 1
        end

        set source $argv[1]
        set destination $argv[2]

        # Use rsync with progress and resumable options
        rsync -ah --progress --partial --inplace $source $destination
      end
    '';
  };

  # Configure GIT settings.
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "abelj1@uci.edu";
    userName = "abeljim";
    extraConfig = {
      # Sets how keys are stored.
      # Works with gnome and kde need to test on server.
      credential.helper = "store";
    };
  };

  # Enable DIRENV for fish
  programs.direnv.enableFishIntegration = true;

  # Enable Starship prompt for Fish
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;

  # shellAliases for cli commands
  home.shellAliases = {
    nupdate = "sudo nix flake update";
    nupgrade = "sudo nixos-rebuild switch --flake ~/nixos/#default";
    nclean = "nix-env --delete-generations 3d";
    ngarbage = "sudo nix-collect-garbage -d";
    cd = "z";
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
  home.sessionVariables = {
    # Set your default editors.
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
