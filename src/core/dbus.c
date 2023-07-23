#include <glib.h>
#include <gio/gio.h>

/* Define the D-Bus interface name and method name */
#define DBUS_INTERFACE_NAME "com.example.SampleInterface"
#define DBUS_METHOD_NAME "Hello"

/* Define the object type */
typedef struct _SampleObject {
    GObject parent;
} SampleObject;

/* Define the object type macro */
#define TYPE_SAMPLE_OBJECT (sample_object_get_type())

G_DECLARE_FINAL_TYPE(SampleObject, sample_object, SAMPLE, OBJECT, GObject)

/* Define the method callback */
static gboolean on_hello(SampleObject *obj, GDBusMethodInvocation *invocation, gpointer user_data) {
    g_dbus_method_invocation_return_value(invocation, g_variant_new("(s)", "Hello, D-Bus!"));
    return TRUE;
}

/* Define the D-Bus interface with the method */
static const GDBusInterfaceVTable interface_vtable = {
    NULL, /* Method call method, we don't need it for this example */
    on_hello,
    NULL
};

/* Initialize the type */
G_DEFINE_TYPE(SampleObject, sample_object, G_TYPE_OBJECT)

/* Implement the init function */
static void sample_object_init(SampleObject *obj) {}

/* Implement the class init function */
static void sample_object_class_init(SampleObjectClass *klass) {
    GDBusNodeInfo *introspection_data;
    GError *error = NULL;

    introspection_data = g_dbus_node_info_new_for_xml(
        "<node>"
        "  <interface name='" DBUS_INTERFACE_NAME "'>"
        "    <method name='" DBUS_METHOD_NAME "'>"
        "      <arg type='s' name='response' direction='out'/>"
        "    </method>"
        "  </interface>"
        "</node>",
        &error
    );

    if (error != NULL) {
        g_error("Error creating introspection data: %s", error->message);
        g_clear_error(&error);
        return;
    }

    g_signal_emit_by_name(klass, "add-interface", introspection_data->interfaces[0], NULL);
    g_dbus_node_info_unref(introspection_data);
}

int main() {
    /* Initialize the GType system and D-Bus */
    g_type_init();
    g_bus_own_name(G_BUS_TYPE_SESSION, DBUS_INTERFACE_NAME, G_BUS_NAME_OWNER_FLAGS_NONE, NULL, NULL, NULL, NULL);

    /* Run the main event loop */
    GMainLoop *loop = g_main_loop_new(NULL, FALSE);
    g_main_loop_run(loop);

    return 0;
}