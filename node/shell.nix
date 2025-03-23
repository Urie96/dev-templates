{
  nixpkgs ? <nixpkgs>,
}:
let
  pkgs = import nixpkgs {
    config = { };
    overlays = [
      (final: prev: rec {
        nodejs = prev.nodejs;
        yarn = (prev.yarn.override { inherit nodejs; });
      })
    ];
  };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    node2nix
    nodejs
    nodePackages.pnpm
    yarn
  ];
}
