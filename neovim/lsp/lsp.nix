  {
    programs.nixvim.plugins = {
      lsp-signature.enable = true;

      lsp = {
        enable = true;
        servers.typos_lsp.enable = true;
        keymaps.lspBuf = {
          "<c-k>" = "signature_help";
          "gi" = "implementation";
        };
      };
      lint.enable = true;
    };
  }
