# TODO
Your username is danieljim. If not you will need to change. In all the files. 
You need to set your git info in to config.


# Instructions
1. Download or clone to your home directory. Use `nix-shell -p git` 

2. Remove the hardware-configuration and flake.lock files 

3. Copy over the install hardware-configuration.nix from /etc/nixos/ into ./machines/desktop/

4. Modify to your needs then run `sudo nixos-rebuild switch --flake ~/nixos/#mini`

# Commands
`nupdate` - downloads the flake updates

`nupgrade` - applies the changes to the system, you can add programs without running update its will just use that snapshot
