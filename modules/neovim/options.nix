let
  icons = import ./icons.nix;
in {
  programs.nixvim = {
    extraConfigLuaPre = ''
      vim.fn.sign_define(
        'DiagnosticSignError',
        { texthl = 'DiagnosticSignError', text = '${icons.diagnostics.BoldError}', numhl = 'DiagnosticSignError' }
      )

      vim.fn.sign_define(
        'DiagnosticSignWarn',
        { texthl = 'DiagnosticSignWarn', text = '${icons.diagnostics.BoldWarning}', numhl = 'DiagnosticSignWarn' }
      )

      vim.fn.sign_define(
        'DiagnosticSignHint',
        { texthl = 'DiagnosticSignHint', text = '${icons.diagnostics.BoldHint}', numhl = 'DiagnosticSignHint' }
      )

      vim.fn.sign_define(
        'DiagnosticSignInfo',
        { texthl = 'DiagnosticSignInfo', text = '${icons.diagnostics.BoldInformation}', numhl = 'DiagnosticSignInfo' }
      )

      vim.diagnostic.config({
        signs = {
          --support diagnostic severity / diagnostic type name
          text = { [1] = '${icons.diagnostics.BoldError}', ['WARN'] = '${icons.diagnostics.BoldWarning}', ['HINT'] = '${icons.diagnostics.BoldHint}' },
        },
      })

    '';

    extraConfigLuaPost = ''
      -- Fix todo color set to lotus yellow 4
      vim.api.nvim_set_hl(0, "Todo", { fg = "#f9d791" })

      -- Turn off mouse support
      vim.o.mouse = ""
    '';

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    # feature that enhances the way Neovim loads and executes Lua modules,
    # offering improved performance and flexibility.
    luaLoader.enable = true;

    opts = {
      relativenumber = true;
      number = true;

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      smartindent = true;
      wrap = true;

      # Smart indent on word wrap
      breakindent = true;

      # Undo stuff from days ago
      swapfile = false;
      backup = false;
      undofile = true;

      # Incremental search
      hlsearch = true;
      incsearch = true;

      # Better splitting
      splitbelow = true;
      splitright = true;

      # Enable ignorecase + smartcase for better searching
      ignorecase = true;
      smartcase = true; # Don't ignore case with capitals

      # Better colors
      termguicolors = true;

      # Decrease updatetime
      updatetime = 50; # faster completion (4000ms default)

      scrolloff = 8; # Will never have less than 8 characters as you scroll down

      numberwidth = 4;
    };
  };
}
