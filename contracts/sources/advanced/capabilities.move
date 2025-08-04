module workshop::capabilities;

const ADMIN: address = @admin;

public struct Admins has key {
    id: UID,
    admins: vector<address>,
}

public struct AdminCapability has key, store {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let admins = Admins {
        id: object::new(ctx),
        admins: vector[]
    };

    transfer::share_object(admins);

    let admin_capability = AdminCapability {
        id: object::new(ctx)
    };

    transfer::public_transfer(admin_capability, ctx.sender());
}

public fun is_admin(self: &Admins, admin: address, ctx: &mut TxContext): bool {
    self.admins.contains(&admin)
}

// More composable
public fun is_admin_gated(_: &AdminCapability) {

}