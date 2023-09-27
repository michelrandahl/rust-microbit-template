# Cargo template for microbit-v2
Simple minimal template for setting up a Rust microbit-v2 project.
Contains `flake.nix` for nix development environment and `.neoconf.json` for neovim support.

## Get started
- Run `cargo-generate --git https://github.com/michelrandahl/rust-microbit-template.git --name my-project`
- Run `nix develop` to create a minimal development environment with necessary packages.
- Physically connect microbit-v2 and run `make embed`

## Adjustments
- Change the 'rust-channel-version' in `./rust-toolchain.toml`. Default is latest, eg. `nightly`.
- Adjust neovim lsp settings for the project in `.neoconf.json` (requires `folke/neoconf.nvim` plugin)
