{
  description = "Flake configuration";

  inputs = {
    nixpkgs.url =  "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    nixpkgs, 
    home-manager,
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
      modules = [ ./home.nix ];
      extraSpecialArgs = {
        inherit username;
      };
    };
  };
}
