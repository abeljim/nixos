{pkgs, ...}: {
  home.packages = [
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
              GTK_THEME=Adwaita nohup kicad "$file" >/dev/null 2>&1 &
          end
      end

      # Copy command that uses rsync
      function cp2
        if test (count $argv) -ne 2
         echo "Usage: cp2 <source> <destination>"
         return 1
        end

        set source $argv[1]
        set destination $argv[2]

        # Use rsync with progress and resumable options
        rsync -ah --progress --partial --inplace $source $destination
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
