module username_registry::username_registry {

    use std::signer;
    use std::string;
    use std::table;

    const E_USERNAME_ALREADY_EXISTS: u64 = 0;
    const E_USERNAME_NOT_FOUND: u64 = 1;
    const E_NOT_OWNER: u64 = 2;

    /// Add `store` ability
    struct UsernameInfo has key, store {
        owner: address,
    }

    struct Registry has key {
        usernames: table::Table<string::String, UsernameInfo>,
    }

    entry fun initialize(account: &signer) {
        move_to(account, Registry {
            usernames: table::new<string::String, UsernameInfo>(),
        });
    }

    public fun register_username(account: &signer, username: string::String) acquires Registry {
        let registry = borrow_global_mut<Registry>(signer::address_of(account));
        if (table::contains(&registry.usernames, username)) {
            abort E_USERNAME_ALREADY_EXISTS;
        };
        table::add(&mut registry.usernames, username, UsernameInfo {
            owner: signer::address_of(account),
        });
    }

    public fun get_owner(account: address, username: string::String): address acquires Registry {
        let registry = borrow_global<Registry>(account);
        if (!table::contains(&registry.usernames, username)) {
            abort E_USERNAME_NOT_FOUND;
        };
        let info = table::borrow(&registry.usernames, username);
        info.owner
    }

    public fun update_username(account: &signer, username: string::String, new_owner: address) acquires Registry {
        let registry = borrow_global_mut<Registry>(signer::address_of(account));
        if (!table::contains(&registry.usernames, username)) {
            abort E_USERNAME_NOT_FOUND;
        };
        let info = table::borrow_mut(&mut registry.usernames, username);
        if (info.owner != signer::address_of(account)) {
            abort E_NOT_OWNER;
        };
        info.owner = new_owner;
    }
}
