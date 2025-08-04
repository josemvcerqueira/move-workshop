module workshop::ownership;

public struct MyStruct has store, copy, drop {
    x: u8,
    y: u8,
}

public fun new(): MyStruct {
    MyStruct { x: 10, y: 20 }
} // a is returned

public fun take_ownership(v: MyStruct) {
    // v is owned by `take_ownership`
} // v is dropped here

#[test]
fun test_owner() {
    let a = new();
    // `u8` is copyable, pass `move a` when calling the function to force the transfer of its ownership
    take_ownership(move a);

    a;
    // a is not valid here 

    let b = &mut new(); 

    // Cant be moved because it is a reference
    // take_ownership(move b);
  
    let a = new();
    // `u8` is copyable, pass `move a` when calling the function to force the transfer of its ownership
    take_ownership(copy a);
    // a is not valid here 

    a;
}