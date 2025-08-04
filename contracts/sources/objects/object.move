module workshop::object;

// === Structs === 

public struct SoulBound has key {
    id: UID
}

public struct Object has key, store {
    id: UID,
}


// === Functions === 

public fun storage_functions(ctx: &mut TxContext) {
    let soulbound = SoulBound {
        id: object::new(ctx)
    };

    transfer::share_object( soulbound);

    let soulbound = SoulBound {
        id: object::new(ctx)
    };

    transfer::transfer(soulbound, ctx.sender());

    let object = Object {
        id: object::new(ctx)
    };

    transfer::public_transfer(object, ctx.sender());

    let object = Object {
        id: object::new(ctx)
    };

    transfer::public_share_object(object);
}