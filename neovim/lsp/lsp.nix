{
  programs.nixvim.plugins = {
    lsp-signature.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;
      servers.typos_lsp.enable = true;
      # servers.rust_analyzer.enable = true;
      # servers.rust_analyzer.installRustc = false;
      # servers.rust_analyzer.installCargo = false;

      servers = {
        taplo.enable = true; # TOML
      };

      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
    };
    lint.enable = true;
  };
}
