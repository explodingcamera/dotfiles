{
  description = "henry's nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; # stable nixpkgs
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # unstable nixpkgs
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    hostname = "nixos";
    username = "henry";
  in {
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs hostname username;
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };

        modules = [
          modules/user.nix
          modules/system.nix
          system/configuration.nix
        ];
      };
    };
  };
}
