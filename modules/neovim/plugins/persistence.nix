{...}: {
  programs.nixvim.plugins = {
    persistence = {
      enable = true;

      # lazyLoad.settings.event = "BufReadPre";
    };

    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>P";
        group = "Persistence";
        icon = "󰘛";
      }
    ];
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>Pl";
      action.__raw = "function() require('persistence').load() end";
      options.desc = "Load the session for the current directory";
    }
    {
      mode = "n";
      key = "<leader>Ps";
      action.__raw = "function() require('persistence').select() end";
      options.desc = "Select a session to load";
    }
    {
      mode = "n";
      key = "<leader>PL";
      action.__raw = "function() require('persistence').load({ last = true }) end";
      options.desc = "Load the last session";
    }
    {
      mode = "n";
      key = "<leader>PS";
      action.__raw = "function() require('persistence').stop() end";
      options.desc = "Stop Persistence";
    }
  ];
}
