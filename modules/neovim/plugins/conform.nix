{
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;

      luaConfig.pre = ''
        local slow_format_filetypes = {}
      '';

      settings = {
        default_format_opts = {
          lsp_format = "fallback";
        };

        format_on_save =
          # Lua
          ''
            function(bufnr)
              if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
              end

               -- Disable autoformat for slow filetypes
              if slow_format_filetypes[vim.bo[bufnr].filetype] then
                return
              end

               -- Disable autoformat for files in a certain path
              local bufname = vim.api.nvim_buf_get_name(bufnr)
              if bufname:match("/node_modules/") or bufname:match("/.direnv/") then
                return
              end

              local function on_format(err)
                if err and err:match("timeout$") then
                  slow_format_filetypes[vim.bo[bufnr].filetype] = true
                end
              end

              return { timeout_ms = 200, lsp_fallback = true }, on_format
             end
          '';

        format_after_save =
          # Lua
          ''
            function(bufnr)
              if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
              end

              if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                return
              end

              return { lsp_fallback = true }
            end
          '';

        # NOTE:
        # Conform will run multiple formatters sequentially
        # [ "1" "2" "3"]
        # Add stop_after_first to run only the first available formatter
        # { "__unkeyed-1" = "foo"; "__unkeyed-2" = "bar"; stop_after_first = true; }
        # Use the "*" filetype to run formatters on all filetypes.
        # Use the "_" filetype to run formatters on filetypes that don't
        # have other formatters configured.
        formatters_by_ft = {
          bash = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          bicep = ["bicep"];
          c = ["clang-format"];
          cmake = ["cmake_format"];
          cpp = ["clang-format"];
          cs = ["csharpier"];
          css = ["biome"];
          fish = ["fish_indent"];
          fsharp = ["fantomas"];
          gdscript = ["gdformat"];
          gleam = ["gleam"];
          go = ["goimports" "gofmt"];
          java = ["google-java-format"];
          # javascript = ["biome"];
          # typescript = ["biome"];
          # javascriptreact = ["biome"];
          # typescriptreact = ["biome"];
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "biome";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          javascriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "biome";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          json = ["biome"];
          lua = ["stylua"];
          markdown = ["deno_fmt"];
          nix = ["alejandra"];
          python = [
            "isort"
            "ruff_format"
          ];
          rust = ["rustfmt"];
          sh = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          sql = ["sqlfluff"];
          swift = ["swift_format"];
          templ = ["templ"];
          terraform = ["tofu_fmt"];
          toml = ["taplo"];
          typescript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "biome";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          typescriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "biome";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          xml = [
            "xmlformat"
            "xmllint"
          ];
          yaml = ["yamlfmt"];
          zig = ["zigfmt"];
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };
      };
    };
  };
}
