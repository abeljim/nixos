Download to your home directory 

remove the hardware-configuration and flack.lock files 

copy over the install hardware-configuration from /etc/nixos/

modify to your needs then run sudo nixos-rebuild switch --flake ~/nixos/#default

nupdate - downloads the flake updates
nupgrade - applies the changes to the system, you can add programs without running update its will just use that snapshot
