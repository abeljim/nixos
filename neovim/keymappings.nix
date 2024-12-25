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
