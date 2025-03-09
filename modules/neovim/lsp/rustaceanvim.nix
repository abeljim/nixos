{
  programs.nixvim.plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        dap = {
          autoloadConfigurations = true;
        };

        server = {
          default_settings = {
            rust-analyzer = {
              cargo = {
                buildScripts.enable = true;
                features = "all";
              };

              diagnostics = {
                enable = true;
                styleLints.enable = true;
              };

              checkOnSave = true;
              check = {
                command = "clippy";
                features = "all";
              };

              files = {
                excludeDirs = [
                  ".cargo"
                  ".direnv"
                  ".git"
                  "node_modules"
                  "target"
                ];
              };

              inlayHints = {
                bindingModeHints.enable = true;
                closureStyle = "rust_analyzer";
                closureReturnTypeHints.enable = "always";
                discriminantHints.enable = "always";
                # expressionAdjustmentHints.enable = "always";
                # implicitDrops still needs development before use
                # implicitDrops.enable = true;
                # lifetimeElisionHints.enable = "always";
                rangeExclusiveHints.enable = true;
              };

              procMacro = {
                enable = true;
              };

              rustc.source = "discover";
            };
          };
        };
      };
    };

    # Had issues with tauri disabled for now
    crates-nvim = {
      enable = false;
    };
  };
}
