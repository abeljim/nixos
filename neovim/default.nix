{
  icons = import ./icons.nix

  imports = [
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./lsp/lsp.nix
    ./lsp/rustaceanvim.nix
  ];
}
