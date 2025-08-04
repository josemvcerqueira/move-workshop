#[allow(unused_variable)]
module workshop::primitives;

use sui::address;

public fun primitives() {
    let a: u8 = 1;
    let b = 2u16;
    let c: u32 = 3;
    let d: u64 = 4;
    let e: u128 = 5;
    let f: u256 = 6;
    let mut _e: bool = true;
    let f: address = @0x1;

    _e = false;
}

public fun addresses() {
    let a = @0x1;

    let address_bytes = a.to_bytes();

    let b = address::from_bytes(address_bytes);

    let address_u256 = b.to_u256();

    let c = address::from_u256(address_u256);

    let address_asci_string = c.to_ascii_string();

    let address_string = c.to_string();
}
