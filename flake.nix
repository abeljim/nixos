{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-master.url = "github:nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    nix-citizen.url = "github:LovingMelody/nix-citizen";

    probe-rs-rules.url = "github:jneem/probe-rs-rules";

    modali-launcher = {
      url = "github:danieljimenez1337/modali";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    secrets = builtins.fromJSON (builtins.readFile "${self}/secrets/secrets.json");
  in {
    nixosConfigurations = {
      "spectre" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs secrets;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          ./machines/laptop/laptop.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      "north" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs secrets;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://nix-gaming.cachix.org"
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          ./machines/desktop/desktop.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      "X1" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs secrets;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          ./machines/work/work.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      "cowcloud" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs secrets;};
        modules = [
          ./machines/server/server.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      "quiet" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs secrets;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          ./machines/research/research.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };

    homeConfigurations = {
      "abeljim" = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {inherit inputs secrets;};
        pkgs = import nixpkgs {system = "x86_64-linux";};
        modules = [
          ./machines/ubuntu/home.nix
        ];
      };
    };
  };
}
