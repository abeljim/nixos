{...}: let
  icons = import ../icons.nix;
in {
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    # closeIfLastWindow = true;
    sources = [
      "filesystem"
      "buffers"
      "git_status"
      "document_symbols"
    ];
    popupBorderStyle = "rounded"; # “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code

    filesystem = {
      bindToCwd = false;
      useLibuvFileWatcher = true;
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = true;
      };
      filteredItems = {
        hideDotfiles = false;
        hideHidden = false;
        neverShowByPattern = [
          ".direnv"
          ".devenv"
          ".git"
        ];
        visible = true;
      };
    };

    defaultComponentConfigs = {
      gitStatus = {
        symbols = {
          added = icons.git.LineAdded;
          conflict = icons.git.FileConflict;
          deleted = icons.git.FileDeleted;
          ignored = icons.git.FileIgnored;
          modified = icons.git.LineModified;
          renamed = icons.git.FileRenamed;
          staged = icons.git.FileStaged;
          unstaged = icons.git.FileUnstaged;
          untracked = icons.git.FileUntracked;
        };
      };
    };

    window.mappings = {
      "<space>" = "none";
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        silent = true;
        desc = "Explorer NeoTree (root dir)";
      };
    }
  ];
}
