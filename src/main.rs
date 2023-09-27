#![no_main]
#![no_std]

// NOTE: cargo will not compile the project properly if we dont import the `microbit` libs
use microbit::hal::prelude::*;

// NOTE: The purpose of these imports, is to be able to see panic error messages through rtt
use rtt_target::{rtt_init_print, rprintln};
use panic_rtt_target as _;

// NOTE: this is a more production friendly panic version with no rtt
// use panic_halt as _;

use cortex_m_rt::entry;


#[entry]
fn main() -> ! {
    rtt_init_print!();

    rprintln!("hello world!");
    loop {}
}
