
module workshop::visibility;

/// Visible to all.
public fun public_func() {
   
}

/// Visible to all in the package.
public(package) fun package_func() {
   
}

/// Only visible within the module.
fun private() {
   
}
