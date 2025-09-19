{
  config,
  pkgs,
  ...
}: {
  # home.packages = [
  #   (config.lib.nixGL.wrap pkgs.vscode)
  # ];

  programs.vscode = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.vscode;
    # enableSandbox = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      myriad-dreamin.tinymist
      ms-vscode-remote.remote-containers
    ];
  };
}
