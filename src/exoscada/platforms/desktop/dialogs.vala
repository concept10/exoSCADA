class ErrorDialog : AlertDialog {
    public ErrorDialog(Gtk.Window? parent, string title, string? description) {
        base (parent, Gtk.MessageType.ERROR, title, description, Stock._OK, null, null,
            Gtk.ResponseType.NONE, null);
        }
    }


class ConfirmationDialog : AlertDialog {
    public ConfirmationDialog(Gtk.Window? parent, string title, string? description,
        string? ok_button, string? ok_action_type = "") {
            base (parent, Gtk.MessageType.WARNING, title, description, ok_button, Stock._CANCEL,
                null, Gtk.ResponseType.NONE, ok_action_type);
        }
    }
    