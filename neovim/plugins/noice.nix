{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        progress.enabled = true;
      };

      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        # Not enabled for lazyvim
        # inc_rename = true;
        # lsp_doc_border = true;
      };
      notify.enabled = true;

      routes = [
        {
          filter = {
            event = "msg_show";
            any = [
              {find = "%d+L, %d+B";}
              {find = "; after #%d+";}
              {find = "; before #%d+";}
            ];
          };
          view = "mini";
        }
      ];
    };
  };

  # programs.nixvim.keymaps = [
  #
  #   # {
  #   #   action = "<leader>sn";
  #   #   key = "";
  #   #   options.desc = "+noice";
  #   # }
  #
  #   {
  #     mode = "n";
  #     action = ":lua require('noice').cmd('history')<CR>";
  #     key = "<leader>snl";
  #     options = {
  #       silent = true;
  #       noremap = true;
  #       desc = "Noice Last Message";
  #     };
  #   }
  #
  #   {
  #     mode = "n";
  #     action = "lua require('noice').cmd('history')";
  #     key = "<leader>snh";
  #     options.desc = "Noice History";
  #   }
  #
  #   {
  #     mode = "n";
  #     action = "lua require('noice').cmd('all')";
  #     key = "<leader>sna";
  #     options.desc = "Noice All";
  #   }
  #
  #   {
  #     mode = "n";
  #     action = "lua require('noice').cmd('dismiss')";
  #     key = "<leader>snd";
  #     options.desc = "Dismiss All";
  #   }
  #
  #   {
  #     mode = "n";
  #     action = "lua require('noice').cmd('pick')";
  #     key = "<leader>snt";
  #     options.desc = "Noice Picker (Telescope/FzfLua)";
  #   }
  #
  #   {
  #     mode = "c";
  #     action = "lua require('noice').redirect(vim.fn.getcmdline())";
  #     key = "<S-Enter>";
  #     options.desc = "Redirect Cmdline";
  #   }
  #
  #   {
  #     mode = "i";
  #     action = "lua if not require('noice.lsp').scroll(4) then return '<c-f>' end";
  #     key = "<c-f>";
  #     options.desc = "Scroll Forward";
  #   }
  #
  #   {
  #     mode = "n";
  #     action = "lua if not require('noice.lsp').scroll(4) then return '<c-f>' end";
  #     key = "<c-f>";
  #     options.desc = "Scroll Forward";
  #   }
  #
  #   {
  #     mode = "s";
  #     action = "lua if not require('noice.lsp').scroll(4) then return '<c-f>' end";
  #     key = "<c-f>";
  #     options.desc = "Scroll Forward";
  #   }
  #
  #   {
  #     mode = "i";
  #     action = "lua if not require('noice.lsp').scroll(-4) then return '<c-b>' end";
  #     key = "<c-b>";
  #     options.desc = "Scroll Backward";
  #   }
  #
  #   {
  #     mode = "n";
  #     action = "lua if not require('noice.lsp').scroll(-4) then return '<c-b>' end";
  #     key = "<c-b>";
  #     options.desc = "Scroll Backward";
  #   }
  #
  #   {
  #     mode = "s";
  #     action = "lua if not require('noice.lsp').scroll(-4) then return '<c-b>' end";
  #     key = "<c-b>";
  #     options.desc = "Scroll Backward";
  #   }
  # ];
}
