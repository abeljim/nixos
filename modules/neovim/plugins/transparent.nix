{
  programs.nixvim.plugins = {
    transparent = {
      enable = true;
      # autoLoad = true;
      settings = {
        exclude_groups = [];
        # :Telescope highlights
        # To find the groups
        extra_groups = [
          # General
          "Pmenu"
          "Float"
          "NormalFloat"
          "FloatBorder"
          # Telescope
          "TelescopeBorder"
          # NeoTree
          "NeoTreeFloatTitle"
          # Git Signs
          "GitSignsAdd"
          "GitSignsChange"
          "GitSignsDelete"
          "GitSignsChangeDelete"
        ];
      };
    };
  };
}
