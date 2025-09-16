{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    (pkgs.stdenv.mkDerivation {
      pname = "oxanium";
      version = "1.0";
      
      src = ./.;
      
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp *.ttf $out/share/fonts/truetype/
      '';
      
      meta = with lib; {
        description = "Oxanium font family";
        platforms = platforms.all;
      };
    })
  ];
  
  fonts.fontconfig.enable = true;
}