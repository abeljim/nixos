Download to your home directory 

remove the hardware-configuration and flack.lock files 

copy over the install hardware-configuration from /etc/nixos/

modify to your needs then run sudo nixos-rebuild switch --flake ~/nixos/#default

nupdate - downloads the flake updates
nupgrade - applies the changes to the system, you can add programs without running update its will just use that snapshot


# Setup for Ubuntu 24.04
1. Setup nix and home-manager
2. Install pop-shell using master-jammy branch. `sudo apt install git node-typescript make gnome-shell-extension-prefs`. `make local-install`
2. Install non-nix dependencies `sudo apt install gnome-shell-extension-prefs fish`
2. TODO
1. `nix-shell -p git-crypt just git`
2. Unencrypt secrets file
3. `home-manager switch --flake ~/nixos/#abeljim`

todo need to fix gnome config for home
