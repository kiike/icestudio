{
  inputs = {
    utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/release-23.11";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (system: let
      overlays = [
        (import ./overlay.nix)
      ];
      pkgs = import nixpkgs {
        inherit system overlays;
      };
      lib = pkgs.lib;
    in rec {
      # `nix develop`
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [nodejs_20 node2nix];
      };

      packages = rec {
        icestudio = pkgs.icestudio;
        default = icestudio;
      };
    }) // {
      overlays.default = import ./overlay.nix;
    };
}
