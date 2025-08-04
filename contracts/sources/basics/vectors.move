#[allow(unused_variable)]
module workshop::vectors;

use std::vector;

public fun vectors() {
    // An empty vector of bool elements.
    let empty: vector<bool> = vector[];

    // A vector of u8 elements.
    let v: vector<u8> = vector[10, 20, 30];

    v[0];

    vector::borrow(&v, 0);

    // A vector of vector<u8> elements.
    let vv: vector<vector<u8>> = vector[vector[10, 20], vector[30, 40]];

    vv[0][0];

    // macros
    v.filter!(|x| {
        *x > 10
    });
}
