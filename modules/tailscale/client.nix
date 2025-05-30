{
  pkgs,
  secrets,
  ...
}: {
  # This module will auto login to tailscale
  imports = [
    (import ../../modules/tailscale/common.nix {inherit pkgs secrets;})
  ];

  services.tailscale.useRoutingFeatures = "client";
}
