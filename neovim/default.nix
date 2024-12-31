{
  programs.nixvim = {
    enable = true;
    #colorschemes.tokyonight.enable = true;
    colorschemes.kanagawa.enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  imports = [
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./lsp/lsp.nix
    ./lsp/lspsaga.nix
    ./lsp/rustaceanvim.nix
  ];
}
