{ pkgs, ... }: {
  networking.wg-quick.interfaces = let
    # [Peer] section -> Endpoint
    server_ip = "cowcloud.duckdns.org";
    presharedKey = builtins.readFile ./cowcloud-vpn-preshared.key;
  in {
    wg0 = {
      # [Interface] section -> Address
      address = [ "10.13.13.2/32" ];

      # [Peer] section -> Endpoint:port
      listenPort = 51820;

      # Path to the private key file.
      # This is just a file with the key text.
      privateKeyFile = "/etc/cowcloud-vpn.key";

      peers = [{
        # [Peer] section -> PublicKey
        publicKey = "RZB4jK/Q9xnaqNGNKRSR7uDM4EX5hLjjYy4CazMEHj0=";
        presharedKey = presharedKey;
        # [Peer] section -> AllowedIPs
        allowedIPs = [ "0.0.0.0/0" ];
        # [Peer] section -> Endpoint:port
        endpoint = "${server_ip}:51820";
        persistentKeepalive = 25;
      }];

    };
  };
}

