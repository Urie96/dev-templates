{
  nixpkgs ? <nixpkgs>,
}:
let
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [ ];
  env = { };
  shellHook = '''';
}
