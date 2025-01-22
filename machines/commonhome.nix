{
  # config,
  pkgs,
  inputs,
  ...
}: {
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
    ../modules/gnome/dconf.nix
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
    pkgs.chromium
    inputs.zen-browser.packages.x86_64-linux.default
    pkgs.nerdfonts

    # Gnome
    pkgs.gnome-tweaks
    pkgs.kanagawa-gtk-theme
    pkgs.kanagawa-icon-theme
    pkgs.gnomeExtensions.just-perfection
    pkgs.gnomeExtensions.media-controls
    pkgs.gnomeExtensions.open-bar
    pkgs.gnomeExtensions.pop-shell
    pkgs.dconf2nix

    # Electrical
    pkgs.kicad

    # Media Software
    pkgs.darktable

    # Discord
    pkgs.vesktop

    # Gnome
    pkgs.gnome-tweaks
    pkgs.kanagawa-gtk-theme
    pkgs.kanagawa-icon-theme
    pkgs.gnomeExtensions.just-perfection
    pkgs.gnomeExtensions.media-controls
    pkgs.gnomeExtensions.open-bar
    pkgs.gnomeExtensions.pop-shell
    pkgs.dconf2nix
    pkgs.bibata-cursors

    # Programming
    pkgs.devenv
    pkgs.direnv
    pkgs.python313
    pkgs.vscode
    pkgs.erlang
    pkgs.gleam
    pkgs.alejandra
    pkgs.rustup
    pkgs.vscode
    pkgs.git
    pkgs.gcc
    pkgs.gnumake
    pkgs.zig

    # lsp
    pkgs.taplo
    pkgs.lua-language-server
    pkgs.typos-lsp

    # Shell
    pkgs.nushell

    # Cli Tools
    pkgs.ripgrep
    pkgs.fd
    pkgs.zellij
    pkgs.gh
    pkgs.lazygit
    pkgs.alacritty
    pkgs.alacritty-theme
    inputs.ghostty.packages.x86_64-linux.default
    pkgs.btop
    pkgs.yazi
    pkgs.zoxide
    pkgs.fzf
    pkgs.fastfetch
    pkgs.wget
    pkgs.unzip
    pkgs.libarchive
    pkgs.fishPlugins.bass
    pkgs.rip2
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      myriad-dreamin.tinymist
      ms-vscode-remote.remote-containers
    ];
  };

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

  xdg.configFile."ghostty/config".text = ''
    window-padding-x = 20
    window-padding-y = 10
    theme = "Kanagawa Wave"
    font-family = "JetBrainsMonoNL Nerd Font"
    background-opacity = 0.9
  '';

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.padding.x = 30;
    window.padding.y = 30;
    font.normal.family = "JetBrainsMonoNL Nerd Font";
    font.normal.style = "Regular";
    window.opacity = 0.9;
    general.import = ["${pkgs.alacritty-theme}/tokyo-night.toml"];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -x PATH ~/.cargo/bin/ $PATH

      function kopen
          set file (find . -type f -name "*.kicad_pro" | head -n 1)
          if test -n "$file"
              nohup kicad "$file" >/dev/null 2>&1 &
          end
      end
    '';
  };

  programs.direnv.enableFishIntegration = true;

  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;

  home.shellAliases = {
    nupdate = "sudo nix flake update";
    nclean = "nix-env --delete-generations 7d";
    ngarbage = "sudo nix-collect-garbage -d";
    cd = "z";
    rm = "rip";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
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
  #programs.devenv.enable = true;
}
