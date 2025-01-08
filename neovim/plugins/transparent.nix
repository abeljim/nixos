{
  programs.nixvim.plugins = {
    transparent = {
      enable = true;
      # autoLoad = true;
      settings = {
        exclude_groups = [ ];
        # :Telescope highlights
        # To find the groups
        extra_groups = [
          "Pmenu"
          "Float"
          "NormalFloat"
          "FloatBorder"
          "TelescopeBorder"
          "NeoTreeFloatTitle"
        ];
      };
    };
  };
}
