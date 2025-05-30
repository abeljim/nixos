{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    colorschemes.kanagawa.enable = true;
    colorschemes.kanagawa.settings = {
      transparent = true;
    };

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Common LSP are enabled here so they can be overridden by virtual environments.
  home.packages = [
    pkgs.tree-sitter
    # For Nix LSP
    pkgs.nil
    pkgs.nixd
    # For Toml Format & LSP
    pkgs.taplo
    # For Spelling LSP
    pkgs.typos-lsp
    # For JavaScript, TypeScript, JSX, TSX, JSON, CSS FMT
    pkgs.biome
    # For YAML FMT
    pkgs.yamlfmt
    # NIX FMT
    pkgs.alejandra
    # LUA LSP
    pkgs.lua-language-server
    # Typescript Lsp
    pkgs.typescript-language-server
    # Typst
    pkgs.tinymist
  ];

  imports = [
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./lsp/lsp.nix
    ./lsp/treesitter.nix
    ./lsp/lspsaga.nix
    ./lsp/rustaceanvim.nix
  ];
}
