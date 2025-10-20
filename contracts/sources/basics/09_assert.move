#[allow(dead_code)]
module workshop::assert;
#[error(code = 0)]
const ENotImplemented: vector<u8> = b"Not implemented";

public fun throw() {
    assert!(true, ENotImplemented);
    assert!(false);

    abort 10; 

    abort; 
}
