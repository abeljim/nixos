{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.abeljim = {
    isNormalUser = true;
    description = "Abel Jimenez";
    extraGroups = ["networkmanager" "wheel" "dialout" "docker"];
    packages = with pkgs; [
      # firefox
      fish
      xclip
      nix-index
    ];
  };

  nix.settings.trusted-users = ["abeljim"];
}
