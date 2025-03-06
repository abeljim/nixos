{pkgs, ...}: {
  home.packages = [
    pkgs.zsh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      expireDuplicatesFirst = true;
      save = 100000000;
      size = 1000000000;
      ignorePatterns = ["rm *" "pkill *" "cp *"];
    };

    # Should not be needed bug with Home Manager
    initExtra = ''
      eval "$(direnv hook zsh)"
    '';
  };
}
