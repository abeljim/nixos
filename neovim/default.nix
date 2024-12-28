{
  programs.nixvim = {
    enable = true;
    colorschemes.tokyonight.enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  imports = [
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./lsp/lsp.nix
    ./lsp/rustaceanvim.nix
  ];
}
