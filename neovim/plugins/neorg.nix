{...}: {
  programs.nixvim.autoCmd = [
    {
      event = "FileType";
      pattern = "norg";
      command = "setlocal conceallevel=3";
    }
    {
      event = "BufWritePre";
      pattern = "*.norg";
      command = "normal gg=G``zz";
    }
  ];

  programs.nixvim.plugins.neorg = {
    enable = true;
    # Not sure what this does.
    # telescopeIntegration.enable = true;

    lazyLoading = true;

    modules = {
      "core.defaults" = {__empty = null;};

      "core.keybinds".config.hook.__raw = ''
        function(keybinds)
          keybinds.unmap('norg', 'n', '<C-s>')

          keybinds.map(
            'norg',
            'n',
            '<leader>c',
            ':Neorg toggle-concealer<CR>',
            {silent=true}
          )
        end
      '';

      "core.dirman".config.workspaces = {
        notes = "~/notes";
        nix = "~/perso/nix/notes";
      };

      "core.concealer".__empty = null;
      "core.completion".config.engine = "nvim-cmp";
    };
  };
}
