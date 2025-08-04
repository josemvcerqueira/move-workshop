module workshop::generics;

use std::string::String;

/// Container for any type `T`.
public struct Container<T> has drop {
    value: T,
}

/// Function that creates a new `Container` with a generic value `T`.
public fun new<T>(value: T): Container<T> {
    Container { value }
}

public fun example() {
    new<u64>(10);
    new<u8>(10);
    new<bool>(true);
    new<String>(b"Hello, world!".to_string());
    new<vector<u64>>(vector[1, 2, 3]);
    new<vector<vector<u64>>>(vector[vector[1, 2, 3], vector[4, 5, 6]]);
    new<vector<vector<vector<u64>>>>(vector[vector[vector[1, 2, 3], vector[4, 5, 6]], vector[vector[7, 8, 9], vector[10, 11, 12]]]);
    
    
    
}