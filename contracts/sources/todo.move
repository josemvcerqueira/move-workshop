module workshop::sui_lisbon_todo;

use std::string::String;

/// List of todos. Can be managed by the owner and shared with others.
public struct TodoList has key, store {
    id: UID,
    items: vector<String>,
}

/// Create a new todo list.
public fun new(ctx: &mut TxContext): TodoList {
    TodoList {
        id: object::new(ctx),
        items: vector[],
    }
}

/// Add a new todo item to the list.
public fun add(self: &mut TodoList, item: String) {
    self.items.push_back(item);
}

/// Remove a todo item from the list by index.
public fun remove(self: &mut TodoList, index: u64): String {
    self.items.remove(index)
}

/// Delete the list and the capability to manage it.
public fun delete(self: TodoList) {
    let TodoList { id, items } = self;

    assert!(items.length() == 0);

    id.delete();
}

/// Get the number of items in the list.
public fun length(self: &TodoList): u64 {
    self.items.length()
}
