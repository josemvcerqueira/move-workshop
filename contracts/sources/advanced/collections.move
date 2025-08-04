#[allow(unused_variable)]
module workshop::collections; 

use sui::{vec_map, vec_set, table, table_vec, object_table, linked_table, bag};

public struct Object has key, store {
    id: UID,
}

public fun vector_based_collections() {
    let vec = vector<u64>[];

    let map = vec_map::empty<address, u64>();

    let set = vec_set::empty<u64>();
}

public fun scalable_collections(ctx: &mut TxContext) {
    let table = table::new<address, u64>(ctx);

    let table_vec = table_vec::empty<address>(ctx);

    let object_table = object_table::new<address, Object>(ctx);

    let linked_table = linked_table::new<address, u64>(ctx);

    let mut bag = bag::new(ctx);

    bag.add(ctx.sender(), 1);
    bag.add(ctx.sender(), b"s".to_string());

    abort
}