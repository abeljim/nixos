{pkgs, ...}: {
  home.packages = [
    # Cli Tools
    pkgs.git
    pkgs.ripgrep
    pkgs.fd
    pkgs.zellij
    pkgs.gh
    pkgs.lazygit
    pkgs.btop
    pkgs.yazi
    pkgs.fzf
    pkgs.fastfetch
    pkgs.just
  ];
}
