{ pkgs ? import <nixpkgs> { } }:

rec {
  inherit pkgs;

  driverctl = (import ./driverctl.nix { inherit pkgs; });
}
