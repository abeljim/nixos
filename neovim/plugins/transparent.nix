{
  programs.nixvim.plugins = {
    transparent = {
      enable = true;
      # autoLoad = true;
      settings = {
        exclude_groups = [];
        extra_groups = [
          "Pmenu"
          "Float"
          "NormalFloat"
        ];
      };
    };
  };
}
