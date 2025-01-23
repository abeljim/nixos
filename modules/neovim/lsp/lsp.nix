{
  programs.nixvim.plugins = {
    lsp-signature.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        # Spelling
        typos_lsp = {
          enable = true;
          extraOptions.init_options.diagnosticSeverity = "Hint";
          package = null;
        };

        # TOML
        taplo = {
          enable = true;
          package = null;
        };

        # Zig
        zls = {
          enable = true;
          package = null;
        };

        # Nix
        nil_ls = {
          enable = true;
          package = null;
        };

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
          extraOptions.capabilities.offsetEncoding = ''{ "utf-16" }'';
        };

        terraform_lsp = {
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
  };
}
