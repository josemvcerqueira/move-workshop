module workshop::struct_;

public struct Struct {
    a: u64,
    b: u64,
}

public fun struct_() {
    let s = Struct { a: 1, b: 2 };

    let Struct { a, b } = s;

    assert!(a == 1);
    assert!(b == 2);    

    let mut x = Struct { a: 1, b: 2 }; 

    x.a = 3;
    x.b = 4;

    assert!(x.a == 3);
    assert!(x.b == 4);

    let Struct { a: _, b: _ } = x;
}

// === Drop ===

public struct DropStruct has drop {
    a: u64,
    b: u64,
}

// We do not need to destroy it
public fun drop_struct() {
    DropStruct { a: 1, b: 2 };
}

// === Copy ===

public struct CopyStruct has copy, drop {
    a: u64,
    b: u64,
}

public fun copy_struct() {
    let s = CopyStruct { a: 1, b: 2 };
    let _x = s;
}

// === Store ===

public struct InnerStruct has store, drop {
    a: u64,
    b: u64,
}

public struct StoreStruct has store, drop {
    a: u64,
    b: u64,
    inner: InnerStruct,
}

public fun store_struct() {
    StoreStruct { a: 1, b: 2, inner: InnerStruct { a: 3, b: 4 } };
}

// === Key ===

public struct KeyStruct has key {
   id: UID,
}

public fun key_struct(ctx: &mut TxContext) {
    let x = KeyStruct { id: object::new(ctx) };

    let KeyStruct { id } = x;

    id.delete();
}