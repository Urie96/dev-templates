{
  nixpkgs ? <nixpkgs>,
}:
let
  goVersion = 22; # Change this to update the whole stack

  pkgs = import nixpkgs {
    config = { };
    overlays = [
      (final: prev: {
        go = final."go_1_${toString goVersion}";
      })
    ];
  };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    go
    # gotools
    # golangci-lint
  ];
}
