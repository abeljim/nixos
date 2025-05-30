let
  mouse = {
    right =
      # Lua
      "'vertical sbuffer %d'";
    close =
      # Lua
      ''
        function(bufnum)
          require("mini.bufremove").delete(bufnum)
        end
      '';
  };
in {
  programs.nixvim.plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          offsets = [
            {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            }
          ];
          close_command.__raw = mouse.close;
          right_mouse_command.__raw = mouse.right;
        };
      };
      # For Transparent
      luaConfig.post =
        #Lua
        ''
          vim.g.transparent_groups = vim.list_extend(
                 vim.g.transparent_groups or {},
                 vim.tbl_map(function(v)
                         return v.hl_group
                 end, vim.tbl_values(require("bufferline.config").highlights))
          )
        '';
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      # action = "<cmd>:bp | bd #<cr>";
      action = "<cmd>:lua Snacks.bufdelete()<cr>";
      options = {
        desc = "Delete buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<cr>";
      options = {
        desc = "Delete buffers to the right";
      };
    }

    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = {
        desc = "Delete buffers to the left";
      };
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }

    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }
  ];
}
