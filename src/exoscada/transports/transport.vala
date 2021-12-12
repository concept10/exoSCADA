


public bool transport_active() {
    switch (get_status()) {
        case exo.transport_active_global:
        case exo.transport_active_primary:
        case
            return true;
        
        default:
            return false;
    }
}