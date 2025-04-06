Download to your home directory 

remove the hardware-configuration and flake.lock files 

copy over the install hardware-configuration.nix from /etc/nixos/ into ./machines/desktop/

modify to your needs then run sudo nixos-rebuild switch --flake ~/nixos/#mini

nupdate - downloads the flake updates
nupgrade - applies the changes to the system, you can add programs without running update its will just use that snapshot
