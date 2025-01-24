{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    #colorschemes.tokyonight.enable = true;
    colorschemes.kanagawa.enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Common LSP are enabled here so they can be overridden by virtual environments.
  home.packages = [
    # For Nix LSP
    pkgs.nil
    # For Toml Format & LSP
    pkgs.taplo
    # For Spelling LSP
    pkgs.typos
    # For Markdown FMT
    pkgs.deno
    # For YAML FMT
    pkgs.yamlfmt
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
