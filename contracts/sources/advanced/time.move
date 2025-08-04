module workshop::time;

use sui::clock::Clock;

public fun get_time(clock: &Clock, ctx: &mut TxContext) {
    let now = clock.timestamp_ms();
    // 24 hours
    let current_epoch = ctx.epoch();
}