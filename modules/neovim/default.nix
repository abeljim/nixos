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
    # For Nix
    pkgs.nil
    # For Toml
    pkgs.taplo
    # For Spelling
    pkgs.typos
    # For Markdown
    pkgs.deno
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
