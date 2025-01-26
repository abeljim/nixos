{pkgs, ...}: {
  home.packages = [
    pkgs.rip2
    pkgs.zoxide
    pkgs.fishPlugins.bass
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set -x PATH ~/.cargo/bin/ $PATH

      function kopen
          set file (find . -type f -name "*.kicad_pro" | head -n 1)
          if test -n "$file"
              nohup kicad "$file" >/dev/null 2>&1 &
          end
      end
    '';
    shellAliases = {
      cd = "z";
      rm = "rip";
    };
  };

  programs.direnv.enableFishIntegration = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      gcloud.disabled = true;
      directory.truncate_to_repo = false;
      # directory.truncation_length = 5;
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
