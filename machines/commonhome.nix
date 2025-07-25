{
  config,
  pkgs,
  inputs,
  secrets,
  ...
}: let
  system = pkgs.system;
  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "abeljim";
  home.homeDirectory = "/home/abeljim";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  # -- home.stateVersion = "24.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.modali-launcher.homeManagerModules.default
    ../modules/neovim
    ../modules/zsh
    ../modules/fish
    ../modules/vscode
    ../modules/cli
    ../modules/helix
    ../modules/ghostty
    ../modules/alacritty
    ../modules/btop
    ../modules/zed
    ../modules/modali
  ];

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

    # Web Browsers
    (config.lib.nixGL.wrap pkgs.chromium)
    (config.lib.nixGL.wrap inputs.zen-browser.packages.x86_64-linux.default)

    # Electrical
    (config.lib.nixGL.wrap pkgs.kicad)

    # Media Software
    (config.lib.nixGL.wrap pkgs.darktable)

    # Discord
    (config.lib.nixGL.wrap pkgs.vesktop)

    # Programming
    pkgs.devenv
    pkgs.direnv
    pkgs.python313
    pkgs.erlang
    pkgs.rebar3
    pkgs.gleam
    pkgs.rustup
    pkgs.gcc
    pkgs.gnumake
    pkgs.zig
    pkgs.zls
    pkgs.nodejs_22
    pkgs.pnpm_10
    pkgs.esp-generate
    pkgs.espflash

    # Other Tools
    pkgs.ventoy

    # Office
    pkgs.libreoffice
    pkgs.typst

    # IDE
    (config.lib.nixGL.wrap pkgs.jetbrains.idea-community-bin)

    # AI
    pkgs-unstable.claude-code
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.05"
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

  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig = {
      credential.helper = "store";
      init.defaultBranch = "main";
      pull.ff = "true";
      color.ui = true;
    };
    aliases = {
      prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
    };
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
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
