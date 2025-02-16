{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    nix-citizen.url = "github:LovingMelody/nix-citizen";

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-cosmic,
    ...
  } @ inputs: {
    nixosConfigurations = {
      "spectre" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://ghostty.cachix.org"
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          nixos-cosmic.nixosModules.default
          ./machines/laptop/laptop.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      "north" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://nix-gaming.cachix.org"
                "https://ghostty.cachix.org"
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
                "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          nixos-cosmic.nixosModules.default
          ./machines/desktop/desktop.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      "X1" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://ghostty.cachix.org"
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          nixos-cosmic.nixosModules.default
          ./machines/work/work.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      "cowcloud" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./machines/server/server.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      "quiet" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          {
            nix.settings = {
              substituters = [
                "https://ghostty.cachix.org"
                "https://cosmic.cachix.org/"
              ];
              trusted-public-keys = [
                "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
                "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
              ];
            };
          }
          nixos-cosmic.nixosModules.default
          ./machines/research/research.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
