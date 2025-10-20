module workshop::struct_;

// === Drop ===

// Allows a struct to be destroyed when it goes out of scope 

public struct Struct has drop {
    a: u64,
    b: u64,
}

#[test]
fun test_struct_() {
    let s = Struct { a: 1, b: 2 };

    assert!(s.a == 1);
    assert!(s.b == 2);   

    // We did not need to destroy it because it is a drop struct
}

// === Copy ===

// Allows Structs to be copied ===

public struct CopyStruct has copy, drop {
    a: u64,
    b: u64,
}

#[test]
fun test_copy_struct() {
    let s = CopyStruct { a: 1, b: 2 };
    let mut x = s;

    x.a = 3; 

    assert!(s.a == 1);
    assert!(x.a == 3);
}

// === Store ===

// Allows structs to be stored in other structs

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

// Makes structs into objects, they become unique resources in the database.

public struct KeyStruct has key {
   id: UID,
}

public fun key_struct(ctx: &mut TxContext) {
    let x = KeyStruct { id: object::new(ctx) };

    let KeyStruct { id } = x;

    id.delete();
}

//! Move does not struct recursion 

// === NO Abilities ===

public struct HotPotatoe {

}

public fun flash_loan() {
    // Must be consumed in the same transaction
    let hot_potatoe = HotPotatoe {};  

    let HotPotatoe { } = hot_potatoe;
}


// === Conflicting abilities ===

// You cannot have conflicting abilities such as key and drop or key and copy
