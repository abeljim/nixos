{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.danielj = {
    isNormalUser = true;
    description = "Daniel Jimenez";
    extraGroups = ["networkmanager" "wheel" "dialout" "docker" "adbusers" "kvm"];
    packages = with pkgs; [
      firefox
      fish
      xclip
      nix-index
    ];
  };

  nix.settings.trusted-users = ["danielj"];
}
