{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options = {
        silent = true;
        desc = "Live grep (root dir)";
      };
    }
  ];
}
