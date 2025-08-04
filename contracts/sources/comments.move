module workshop::comments;

// This is a comment

/*
This is a multi-line comment
*/

/// @dev Add two numbers
/// @param x The first number
/// @param y The second number
/// @return u64 The sum of x and y
public fun add(x: u64, y: u64): u64 {
    x + y
}
