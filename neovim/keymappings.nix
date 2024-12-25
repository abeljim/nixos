{
  programs.nixvim {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  };

  keymaps = [
    {
      action = ":Neotree toggle";
      key = "<leader>e";

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
}
