#[allow(unused_variable)]
module workshop::expressions;

public fun empty(): () {

}

public fun expressions() {
    let mut a = 1 + 2;
    let b = 3 - 4;
    let c = 5 * 6;
    let d = 7 / 8;
    let e = 9 % 10;

    // Blocks

    let sum = {
        let a = 1;
        let b = 2;
        a + b // last expression is the value of the block
    };

    // Control flows

    let f = if (a > b) {
        a
    } else {
        b
    };

    while (a < b) {
        a = a + 1;
    };

    loop {
        a = a + 1;
        if (a > b) {
            break
        }
    };

    // Function calls
    empty();
}

public fun literals() {
    let a = 10; 
    let b = true;
    let c = 0x1; 
    let d = b"Hello, world!"; 
    let e = x"12"; 
    let f = vector[1, 2, 3]; 
}