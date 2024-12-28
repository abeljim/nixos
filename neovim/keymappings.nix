{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

  keymaps = [
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
