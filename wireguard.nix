{ pkgs, ... }: {
  networking.wireguard.interfaces = let
    # [Peer] section -> Endpoint
    server_ip = "cowcloud.duckdns.org";
  in {
    wg0 = {
      # [Interface] section -> Address
      ips = [ "10.13.13.2" ];

      # [Peer] section -> Endpoint:port
      listenPort = 51820;

      # Path to the private key file.
      privateKeyFile = "/etc/cowcloud-vpn.key";

      peers = [{
        # [Peer] section -> PublicKey
        publicKey = "RZB4jK/Q9xnaqNGNKRSR7uDM4EX5hLjjYy4CazMEHj0=";
        # [Peer] section -> AllowedIPs
        allowedIPs = [ "0.0.0.0/0" ];
        # [Peer] section -> Endpoint:port
        endpoint = "${server_ip}:51820";
        persistentKeepalive = 25;
      }];
    };
  };
}

