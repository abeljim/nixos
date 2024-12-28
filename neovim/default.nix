let 
  icons = import ./icons.nix;
in
{

  imports = [
    ./keymappings.nix
    ./options.nix
    ./plugins { inherit icons; }
    ./lsp/lsp.nix
    ./lsp/rustaceanvim.nix
  ];
}
