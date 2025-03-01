{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "gnn";
            node_incremental = "grn";
            scope_incremental = "grc";
            node_decremental = "grm";
          };
        };

        highlight.enable = true;
        highlight.additional_vim_regex_highlighting = true;
        indent.enable = true;
      };
    };
  };
}
