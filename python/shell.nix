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
  venvDir = ".venv";
  packages =
    with pkgs;
    [ python311 ]
    ++ (with pkgs.python311Packages; [
      pip
      venvShellHook
    ]);
}
