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
    pkgs.oxker
    pkgs.tokei
  ];

  home.shellAliases = {
    nupdate = "sudo nix flake update";
    nclean = "nix-env --delete-generations 7d";
    ngarbage = "sudo nix-collect-garbage -d";
    lg = "lazygit";
    gs = "git status";
    gl = "git prettylog";
  };
}
