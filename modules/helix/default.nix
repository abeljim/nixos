{pkgs, ...}: {
  home.packages = [
    pkgs.helix
  ];

  programs.helix.enable = true;
  programs.helix.settings = {
    theme = "kanagawa";
    editor = {
      line-number = "relative";
      mouse = false;
      lsp.display-inlay-hints = true;
    };
    keys.normal = {
      space.space = "file_picker";
      space.q.q = ":qa";
    };
  };
}
