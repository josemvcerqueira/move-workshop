#[allow(unused_const)]
module workshop::constants;

const ITEM_PRICE: u64 = 100;
const TAX_RATE: u64 = 10;
const SHIPPING_COST: u64 = 5;

const ITEMS: vector<u64> = vector[
    1,
    2,
    3,
];

/// Error constant.
const EItemNotFound: u64 = 1;

/// Returns the price of an item.
public fun item_price(): u64 { ITEM_PRICE }
/// Returns the tax rate.
public fun tax_rate(): u64 { TAX_RATE }
/// Returns the shipping cost.
public fun shipping_cost(): u64 { SHIPPING_COST }