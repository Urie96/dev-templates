{
  nixpkgs ? <nixpkgs>,
}:
let
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in
pkgs.mkShell {
  packages =
    with pkgs;
    [
      clang-tools
      cmake
      codespell
      conan
      cppcheck
      doxygen
      gtest
      lcov
      vcpkg
      vcpkg-tool
    ]
    ++ (if pkgs.stdenv.system == "aarch64-darwin" then [ ] else [ gdb ]);
}
