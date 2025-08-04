module workshop::init;

public struct INIT() has drop;

// Runs once at deployment
// Does not run again on upgrades
fun init(otw: INIT, ctx: &mut TxContext) {
    
}