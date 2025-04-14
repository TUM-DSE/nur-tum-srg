{
  description = "A collection of Nix packages that we use for our research";
  inputs = {
    unstable-nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    stable-nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { 
    self
    , unstable-nixpkgs
    , stable-nixpkgs
    , flake-utils
  }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      inherit (flake-utils.lib) eachSystem filterPackages;
    in eachSystem systems (system:
      let
        pkgs = import stable-nixpkgs {
          inherit system;
          config.allowBroken = true;
        };
      in {
        packages = (filterPackages system (import ./pkgs/default.nix {inherit pkgs;}));
        #lib = import ./lib {inherit pkgs;};
      });
      /*// {
        nixosModules =
          builtins.mapAttrs (name: path: import path) (import ./modules);
      };*/
}
