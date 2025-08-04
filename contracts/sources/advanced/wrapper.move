module workshop::wrapper;

public struct Set<T: store>(vector<T>) has copy, store, drop;

public fun empty<T: store>(): Set<T> {
    Set(vector[])
}

public fun insert<T: store>(self: &mut Set<T>, value: T) {
    assert!(!self.0.contains(&value));
    self.0.push_back(value);
}

public fun contains<T: store>(self: &Set<T>, value: &T): bool {
    self.0.contains(value)
}

public fun remove<T: store>(self: &mut Set<T>, value: &T): T {
    let (pred, index) = self.0.index_of(value);
    
    if (!pred) abort 0; 

    self.0.remove(index)
}

public fun size<T: store>(self: &Set<T>): u64 {
    self.0.length()
}