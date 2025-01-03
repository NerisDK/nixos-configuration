{
  description = "My NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {

    nixosConfigurations = { 
      pc = nixpkgs.lib.nixosSystem {      
        system = "x86_64-linux";      
        modules = [ ./hosts/pc/configuration.nix ];
      };

      gpd = nixpkgs.lib.nixosSystem {      
        system = "x86_64-linux";
        modules = [ ./hosts/gpd/configuration.nix ];
      };    

      lenovo = nixpkgs.lib.nixosSystem {      
        system = "x86_64-linux";
        modules = [ ./hosts/lenovo/configuration.nix ];
      }; 
    };

  };
}
