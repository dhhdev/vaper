public class Vaper : Gtk.Application {
    public Vaper () {
        Object (
            application_id: "com.github.dhhdev.vaper",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.default_height = 300;
        main_window.default_width = 300;
        main_window.title = "Vaper";
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new Vaper ();
        return app.run (args);
    }
}