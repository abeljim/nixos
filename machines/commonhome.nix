{
  # config,
  pkgs,
  inputs,
  secrets,
  ...
}:
# let
#   pkgs = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
# in
{
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
    ../modules/neovim
    ../modules/zsh
    ../modules/gnome
    ../modules/fish
    ../modules/vscode
    ../modules/cli
    ../modules/helix
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
    pkgs.chromium
    inputs.zen-browser.packages.x86_64-linux.default

    # Electrical
    pkgs.kicad

    # Media Software
    pkgs.darktable

    # Discord
    pkgs.vesktop

    # Programming
    pkgs.devenv
    pkgs.direnv
    pkgs.python313
    pkgs.erlang
    pkgs.gleam
    pkgs.rustup
    pkgs.gcc
    pkgs.gnumake
    pkgs.zig
    pkgs.nodejs_22
    pkgs.zed-editor
    pkgs.esp-generate

    # Terminal
    pkgs.alacritty
    pkgs.alacritty-theme
    pkgs.ghostty

    # Other Tools
    pkgs.ventoy

    # Office
    pkgs.libreoffice
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

  xdg.configFile."ghostty/config".text = ''
    window-padding-x = 20
    window-padding-y = 10
    theme = "Kanagawa Wave"
    font-family = "JetBrainsMonoNL Nerd Font"
    background-opacity = 0.9
    clipboard-paste-protection = false
  '';

  xdg.configFile."btop/btop.conf".text = ''
    color_theme = "${pkgs.btop}/share/btop/themes/tokyo-night.theme"

    #* If the theme set background should be shown, set to False if you want terminal background transparency.
    theme_background = False

    vim_keys = False
  '';

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.padding.x = 30;
    window.padding.y = 30;
    font.normal.family = "JetBrainsMonoNL Nerd Font";
    font.normal.style = "Regular";
    window.opacity = 0.9;
    general.import = ["${pkgs.alacritty-theme}/kanagawa_wave.toml"];
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
