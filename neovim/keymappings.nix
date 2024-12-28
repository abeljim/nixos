{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

  keymaps = [

    {
      action = "<C-w>h";
      key = "<C-h>";
      options = {
        silent = true;
	      remap = true;
	      desc = "Go to Left Window";
      };
    }

    {
      action = "<C-w>j";
      key = "<C-j>";
      options = {
        silent = true;
	      remap = true;
	      desc = "Go to Lower Window";
      };
    }

    {
      action = "<C-w>k";
      key = "<C-k>";
      options = {
        silent = true;
	      remap = true;
	      desc = "Go to Upper Window";
      };
    }

    {
      action = "<C-w>l";
      key = "<C-l>";
      options = {
        silent = true;
	      remap = true;
	      desc = "Go to Right Window";
      };
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
      action = ":Telescope find_files<CR>";
      key = "<leader><leader>";
      options = {
        silent = true;
	      noremap = true;
	      desc = "Search Files";
      };
    }

    {
      action = ":LazyGit<CR>";
      key = "<leader>gg";
      options = {
        silent = true;
	      noremap = true;
	      desc = "LazyGit";
      };
    }

      # {
      #   action = ":Oil<CR>";
      #   key = "<leader>o";
      #   options = {
      #     silent = true;
      #     noremap = true;
      #     desc = "Oil Mapping";
      #   };
      # }
  ];
  };
}
