{
  programs.nixvim.plugins = {
    yazi = {
      enable = true;

      settings = {
        yazi_floating_window_winblend = 0;
        open_for_directories = true;
        open_file_in_tab = false;
      };
    };
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Yazi toggle<cr>";
      options = {
        silent = true;
        desc = "Toggle Yazi (root dir)";
      };
    }
  ];
}
