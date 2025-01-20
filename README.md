# NIXOS Docker

# Setup

1. Clone to your home directory and enter folder.
2. Delete the hardware-configuration.nix and cp your systems.
   `sudo cp /etc/nixos/hardware-configuration.nix .`
3. Important!! - Make sure you change the system.stateVersion to match your
   install. It is currently 24.11. This can be located in ./configuration.nix.
4. Change your name and email in all the sections that require it in
   ./configuration.nix and ./home.nix.
5. Delete ./flake.lock to start a fresh lockfile. Or you can follow mine.
6. Run for the first time `sudo nixos-rebuild switch --flake ~/nixos/#default`

# Commands

### Update

Updates the flake.lock to the latest version. Needs to be ran from inside this
folder. `nupdate`

### Upgrade

Upgrades your packages based on the flake.nix, also how you apply changes made
to the nix config. Any changes that require new config files requires them to be
committed first or nix won't see them. `nupgrade`

### Garbage

Deletes unused nix packages. `ngarbage`

### Clean

Removed old nixos images. Saves last 3 days. Automatic garbage collections is
already configured. Run if you want to clean up after making lots of changes.
Make sure they were successful first. `nclean`
