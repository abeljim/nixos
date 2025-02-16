{...}: let
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
          table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
in {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        mapping = {
          "<C-b>" =
            # Lua
            "cmp.mapping.scroll_docs(-4)";
          "<C-f>" =
            # Lua
            "cmp.mapping.scroll_docs(4)";
          "<C-Space>" =
            # Lua
            "cmp.mapping.complete()";
          "<C-e>" =
            # Lua
            "cmp.mapping.close()";
          "<Tab>" =
            # Lua
            "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
          "<S-Tab>" =
            # Lua
            "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
          "<CR>" =
            # Lua
            "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })";
        };

        preselect =
          # Lua
          "cmp.PreselectMode.None";

        snippet.expand =
          # Lua
          "function(args) require('luasnip').lsp_expand(args.body) end";

        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_signature_help";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_document_symbol";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "treesitter";
            priority = 850;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "buffer";
            priority = 500;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "path";
            priority = 300;
          }
        ];

        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
            scrollbar = false;
          };
          documentation = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
            scrollbar = false;
          };
        };
        # window = {
        #   completion.__raw = ''cmp.config.window.bordered()'';
        #   documentation.__raw = ''cmp.config.window.bordered()'';
        # };

        experimental = {
          ghost_text = true;
        };

        formatting.format = ''
          function(entry, item)
            -- local icons = LazyVim.config.icons.kinds
            -- if icons[item.kind] then
            --   item.kind = icons[item.kind] .. item.kind
            -- end

            local widths = {
              abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
              menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
            }

            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
              end
            end

            return item
          end
        '';
      };
    };
  };
}
