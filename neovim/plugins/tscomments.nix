{
  programs.nixvim.plugins = {
    # Handles more complex file where there is more formats in a single file than one
    # Useful for Vue
    ts-comments = {
      enable = true;
    };
  };
}
