{
  description = "Embedded Rust on microbit v2";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        from-rust-toolchain-file = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            pkg-config
            from-rust-toolchain-file
            rust-analyzer
            probe-rs # (cargo-embed) can be used to flash binaries onto microcontrollers
            cargo-binutils # tools for examining rust binaries (`cargo-size`, `cargo-strip`, `cargo-objdump`)
            libusb
            gdb
            picocom
            svd2rust
          ];

          shellHook = ''
          '';
        };
      }
    );
}
    #= help: consider downloading the target with `rustup target add avr-atmega328p`
