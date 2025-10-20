#[allow(unused_variable)]
module workshop::option;


public fun option() {
    let some: Option<u64> =  option::some(10);
    let none: Option<u64> =  option::none();

    assert!(option::is_some(&some));
    assert!(option::is_none(&none));
    
}
