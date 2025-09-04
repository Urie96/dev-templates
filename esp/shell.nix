let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/fd487183437963a59ba763c0cc4f27e3447dd6dd.tar.gz";
  nixpkgs-esp-dev = fetchTarball "https://github.com/mirrexagon/nixpkgs-esp-dev/archive/52a23afb15a1643a3dbeeb963097945a3f35b0fb.tar.gz";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
  esp-pkgs = import nixpkgs-esp-dev { pkgs = pkgs; };
in

pkgs.mkShell {
  name = "esp-idf-full-shell";

  buildInputs = with esp-pkgs; [
    esp-idf-full # esp32
    # esp8266-rtos-sdk # esp8266
  ];
}
