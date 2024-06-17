{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = {
    self, 
    nixpkgs, 
    home-manager, 
    hyprland, 
    nixvim, 
    ags, 
    sops-nix,
    ... 
  }@inputs:
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/default/configuration.nix
        home-manager.nixosModules.default
        sops-nix.nixosModules.sops
        {
          sops = {
            defaultSopsFile = ./secrets/secrets.yaml;
            defaultSopsFormat = "yaml";
            age = {
              sshKeyPaths = [ "/home/tai/.ssh/id_ed25519" ];
              keyFile = "/home/tai/.config/sops/age/keys.txt";
              generateKey = false;
            };
            secrets = {
              git-username = { 
                owner = "sometestservice";
              };
              git-email = { 
                owner = "sometestservice";
              };
              test = { 
                owner = "sometestservice";
              };
            };
          };

        }
      ];
    };
    homeConfigurations."tai@nixos" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        hyprland.homeManagerModules.default
        nixvim.homeManagerModules.nixvim
      ];
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
