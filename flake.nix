{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

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
    ...
  } @ inputs:
  # let
  #   machineType = builtins.getEnv "MACHINE_TYPE";
  #   validMachineTypes = [ "laptop" "desktop" ];
  #   isValidMachineType = machineType != null && builtins.elem machineType validMachineTypes;
  #
  #   isLaptop = machineType == "laptop";
  #   isDesktop = machineType == "desktop";
  #   # isServer = machineType == "server";
  # in
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix 
        inputs.home-manager.nixosModules.default
      ];
      
      # modules = lib.assert (
      #   isValidMachineType
      # ) "Error: ENV variable MACHINE_TYPE must be one of 'laptop', 'desktop', or 'server'.";
      #
      # modules = [
      #   (if isDesktop then ./machines/desktop/configuration.nix else null)
      #   (if is 
      #   inputs.home-manager.nixosModules.default
      # ] ++ lib.filter (x: x != null) [];
    };
  };
}
