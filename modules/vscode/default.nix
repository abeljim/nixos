{
  # config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.vscode
  ];

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      myriad-dreamin.tinymist
      ms-vscode-remote.remote-containers
    ];
  };
}
