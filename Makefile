LAST_DIR_NAME := $(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

docs:
	cargo doc --open --target thumbv7em-none-eabihf
build:
	cargo build --target thumbv7em-none-eabihf
test:
	cargo test --target x86_64-unknown-linux-gnu
build-release:
	cargo build --target thumbv7em-none-eabihf --release
check:
	cargo check --target thumbv7em-none-eabihf
clean:
	cargo clean
embed:
	cargo embed --target thumbv7em-none-eabihf
embed-release:
	cargo embed --target thumbv7em-none-eabihf --release
serial:
	picocom /dev/ttyACM0 -b 115200 --omap crcrlf
size:
	cargo size --target thumbv7em-none-eabihf -- -A
size-release:
	cargo size --target thumbv7em-none-eabihf --release -- -A
readobj:
	cargo readobj --target thumbv7em-none-eabihf --bin $(LAST_DIR_NAME) -- --file-headers
readobj-release:
	cargo readobj --release --target thumbv7em-none-eabihf --bin $(LAST_DIR_NAME) -- --file-headers
gdb:
	gdb ./target/thumbv7em-none-eabihf/debug/$(LAST_DIR_NAME) -x ./.gdbinit
