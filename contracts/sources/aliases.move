module workshop::aliases;

public struct MyStruct has key {
    id: UID
}

public fun addr(self: &MyStruct): address {
    self.id.to_address()
}

public fun example(self: &MyStruct): address {
    self.address()
}

use fun addr as MyStruct.address;
