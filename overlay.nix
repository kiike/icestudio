prev: final: {
  icestudio-node-modules = (final.callPackage ./default.nix {nodejs = final.nodejs_20;}).nodeDependencies;
  icestudio = final.callPackage ./package.nix {};
}
