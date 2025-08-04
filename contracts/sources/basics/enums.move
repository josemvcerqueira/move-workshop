module workshop::enums;

use std::string::String;

/// `Segment` enum definition.
/// Defines various string segments.
public enum Segment has copy, drop {
    /// Empty variant, no value.
    Empty,
    /// Variant with a value (positional style).
    String(String),
    /// Variant with named fields.
    Special {
        content: vector<u8>,
        encoding: u8, // Encoding tag.
    },
}

public fun create_and_match() {
    let empty: Segment = Segment::Empty;

    let string: Segment = Segment::String(b"Hello, world!".to_string()); 

    let special: Segment = Segment::Special {
        content: vector[1, 2, 3],
        encoding: 1,
    };

    match (empty) {
        Segment::Empty => {
            assert!(true, 42);
        },
        _ => abort
    };

    match (string) {
        Segment::String(s) => {
            assert!(s == b"Hello, world!".to_string());
        },
        _ => abort
    };

    match (special) {   
        Segment::Special { content, encoding } => {
            assert!(content == vector[1, 2, 3]);
            assert!(encoding == 1);
        },
        _ => abort
    };
}