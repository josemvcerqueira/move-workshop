module workshop::init;

public struct INIT() has drop;

public struct Registry has key {
 id: UID,
 
}

// Runs once at deployment
// Does not run again on upgrades
fun init(otw: INIT, ctx: &mut TxContext) {

 let registry = Registry {
    id: object::new(ctx)
 };

 transfer::share_object(registry);    
}