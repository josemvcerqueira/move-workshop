module workshop::hello_world;

use std::string::String;

#[test_only]
use sui::test_utils::assert_eq;

/// Returns the "Hello, World!" as a `String`.
public fun hello_world(): String {
    b"Hello, World!".to_string()
}

#[test]
fun test_hello_world() {
    assert_eq(hello_world(), b"Hello, World!".to_string());
}
