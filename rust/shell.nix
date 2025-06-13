let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/fd487183437963a59ba763c0cc4f27e3447dd6dd.tar.gz";
  rust-overlay = import (
    builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/10d4529b7ead35863caa77993915104345524bed.tar.gz"
  );
  pkgs = import nixpkgs {
    config = { };
    overlays = [
      rust-overlay
      (final: prev: {
        rustToolchain =
          let
            rust = prev.rust-bin;
          in
          if builtins.pathExists ./rust-toolchain.toml then
            rust.fromRustupToolchainFile ./rust-toolchain.toml
          else if builtins.pathExists ./rust-toolchain then
            rust.fromRustupToolchainFile ./rust-toolchain
          else
            rust.stable.latest.default.override {
              extensions = [
                "rust-src"
                "rustfmt"
              ];
            };
      })
    ];
  };
in
pkgs.mkShell {
  packages = with pkgs; [
    rustToolchain
    openssl
    pkg-config
    cargo-deny
    cargo-edit
    cargo-watch
    rust-analyzer
  ];

  env = {
    # Required by rust-analyzer
    RUST_SRC_PATH = "${pkgs.rustToolchain}/lib/rustlib/src/rust/library";
  };
}
