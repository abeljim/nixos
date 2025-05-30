{
  pkgs,
  secrets,
  ...
}: {
  imports = [
    (import ../../modules/tailscale/common.nix {inherit pkgs secrets;})
  ];

  services.tailscale.extraSetFlags = [
    "--advertise-exit-node"
  ];

  services.tailscale.useRoutingFeatures = "both";
}
