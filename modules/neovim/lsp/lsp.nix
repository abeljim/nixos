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
          settings = {
            nix.flake.autoArchive = true;
          };
        };

        # Gleam Lang
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

        # C Lang
        clangd = {
          enable = true;
          package = null;
          extraOptions.capabilities.offsetEncoding = ''{ "utf-16" }'';
        };

        # Terraform & opentofu
        terraform_lsp = {
          enable = true;
          package = null;
        };

        # Web
        biome = {
          enable = true;
          package = null;
        };

        # Typescript
        ts_ls = {
          enable = true;
          package = null;
        };

        # Go Lang
        gopls = {
          enable = true;
          package = null;
        };

        # Go Templ
        templ = {
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

  programs.nixvim.keymaps = [
    {
      mode = "n";
      action = "<cmd>LspStop<CR>";
      key = "<leader>cs";
      options.desc = "Stop LSP";
    }
  ];
}
