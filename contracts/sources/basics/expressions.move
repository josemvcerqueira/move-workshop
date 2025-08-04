#[allow(unused_variable)]
module workshop::expressions;

public fun expressions() {
    let mut a = 1 + 2;
    let b = 3 - 4;
    let c = 5 * 6;
    let d = 7 / 8;
    let e = 9 % 10;

    let sum = {
        let a = 1;
        let b = 2;
        a + b // last expression is the value of the block
    };

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
}
