{
  description = "Flake configuration";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url =  "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { 
    catppuccin,
    home-manager,
    nixpkgs, 
    ... 
  }: let
    system = "aarch64-darwin";
    username = "meloaugu";
  in {
    defaultPackage.${system} = home-manager.defaultPackage.${system};

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      pkgs =  import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      modules = [
        ./home.nix  
        catppuccin.homeManagerModules.catppuccin
      ];
      extraSpecialArgs = {
        inherit username;
      };
    };
  };
}
