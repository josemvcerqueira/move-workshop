
module workshop::methods;

use workshop::methods;

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

public fun set_x(self: &mut MyStruct, x: u64) {
    self.x = x;
}

public fun mut_y(self: &mut MyStruct) {
    let x = methods::new(1, 2); 

    methods::x(x);

    x.x();

    x.y();
}



