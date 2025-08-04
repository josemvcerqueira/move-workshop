module workshop::assert;

public fun throw() {
    assert!(true, 42);
    assert!(false, 42);

    abort 10; 

    abort; 
}
