module workshop::context;

public fun get_sender(ctx: &mut TxContext) {
    let sender = ctx.sender();
    let id = object::new(ctx); 

    ctx.epoch();

    ctx.fresh_object_address();

    ctx.sponsor();

    ctx.reference_gas_price();

    ctx.gas_price();

    id.delete();
}