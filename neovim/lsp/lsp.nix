{
  programs.nixvim.plugins = {
    lsp-signature.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        typos_lsp = {
          enable = true; # Spelling
          extraOptions.init_options.diagnosticSeverity = "Hint";
        };
        taplo.enable = true; # TOML
        zls.enable = true; # Zig
        nil_ls.enable = true; # Nix

        gleam = {
          enable = true;
          package = null;
        };

        # Python Linter
        ruff = {
          enable = true;
          package = null;
        };

        # Python Static Type Checker
        basedpyright = {
          enable = true;
          package = null;
        };

        clangd = {
          enable = true;
          package = null;
        };
      };

      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
    };

    lint.enable = true;

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
