#[allow(unused_assignment)]
module workshop::func;

public fun nothing(): () {
   
}

public fun return_u64(): u64 {
    10
}

public fun return_u64_and_u64(): (u64, u64) {
   (10, 20)
}

public fun unpack() {
    let (x, y) = return_u64_and_u64(); 

    let (mut x, _) = return_u64_and_u64();

    x = 11; 
}
