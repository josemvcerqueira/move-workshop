module workshop::dynamic;

use std::string::String;

use sui::{dynamic_field as df, dynamic_object_field as dof};

// === Constants ===

public struct WeaponSlot() has copy, drop, store;

const ACCESSORY_SLOT: vector<u8> = b"accessory";

// === Structs ===

public struct Hero has key, store {
    id: UID,
    class: String,
}

public struct Weapon has key, store {
    id: UID,
    name: String,
    damage: u64,
}

public struct Accessory has store {
    name: String,
}

public fun hero_example(ctx: &mut TxContext): Hero {
    let mut hero = Hero {
        id: object::new(ctx),
        class: b"Warrior".to_string()
    };

    let weapon = Weapon {
        id: object::new(ctx),
        name: b"Sword".to_string(),
        damage: 10,
    };

    let accessory = Accessory {
        name: b"Shield".to_string(),
    };

    dof::add(&mut hero.id, WeaponSlot(), weapon);

    df::add(&mut hero.id, ACCESSORY_SLOT, accessory);

    hero
}

// === Make your own Table ===

public struct Table<phantom K: copy + store + drop, phantom V: store> has key, store {
    id: UID,
}

public fun new<K: copy + store + drop, V: store>(ctx: &mut TxContext): Table<K, V> {
    Table {
        id: object::new(ctx),
    }
}

public fun add<K: copy + store + drop, V: store>(self: &mut Table<K, V>, key: K, value: V) {
    df::add(&mut self.id, key, value)
}


#[syntax(index)]
public fun get<K: copy + store + drop, V: store>(self: &Table<K, V>, key: K): &V {
    df::borrow(&self.id, key)
}

#[syntax(index)]
public fun get_mut<K: copy + store + drop, V: store>(self: &mut Table<K, V>, key: K): &mut V {
    df::borrow_mut(&mut self.id, key)
}

public fun contains<K: copy + store + drop, V: store>(self: &Table<K, V>, key: K): bool {
    df::exists_(&self.id, key)
}

public fun remove<K: copy + store + drop, V: store>(self: &mut Table<K, V>, key: K): Option<V> {
    df::remove_if_exists(&mut self.id, key)
}