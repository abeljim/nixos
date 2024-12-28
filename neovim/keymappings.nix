{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        action = "<C-w>h";
        key = "<C-h>";
        options.desc = "Go to Left Window";
      }

      {
        mode = "n";
        action = "<C-w>j";
        key = "<C-j>";
        options.desc = "Go to Lower Window";
      }

      {
        mode = "n";
        action = "<C-w>k";
        key = "<C-k>";
        options.desc = "Go to Upper Window";
      }

      {
        mode = "n";
        action = "<C-w>l";
        key = "<C-l>";
        options.desc = "Go to Right Window";
      }

      {
        action = ":Neotree toggle<CR>";
        key = "<leader>e";
        options = {
          silent = true;
          noremap = true;
          desc = "Toggle Neotree";
        };
      }

      {
        action = ":qa<CR>";
        key = "<leader>qq";
        options = {
          silent = true;
          noremap = true;
          desc = "Exit All";
        };
      }

      {
        mode = "n";
        action = ":Telescope find_files<CR>";
        key = "<leader><leader>";
        options = {
          silent = true;
          noremap = true;
          desc = "Search Files";
        };
      }

      {
        mode = "n";
        action = ":LazyGit<CR>";
        key = "<leader>gg";
        options = {
          silent = true;
          noremap = true;
          desc = "LazyGit";
        };
      }
    ];
  };
}
