
module workshop::methods;

public struct MyStruct has store, copy, drop {
    x: u64,
    y: u64,
}

public fun new(x: u64, y: u64): MyStruct {
    MyStruct { x, y }
}

public fun x(self: MyStruct): u64 {
    self.x
}

public fun y(self: MyStruct): u64 {
    self.y
}

public fun mut_x(self: &mut MyStruct): &mut u64 {
    &mut self.x
}

public fun mut_y(self: &mut MyStruct): &mut u64 {
    &mut self.y
}

