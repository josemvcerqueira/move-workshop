#[allow(unused_const, unused_function, unused_use)]
module workshop::modules;

use workshop::todo;

// a constant
const CONST: u8 = 0;

// a struct
public struct Struct {}

// method alias
public use fun function as Struct.struct_fun;

// function
fun function(_: &Struct) {}
