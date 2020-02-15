/*
* Copyright (c) 2020 Daniel Hyldebrandt Hemmingsen <daniel@dhhit.dk>
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Daniel Hyldebrandt Hemmingsen <daniel@dhhit.dk>
*/

public class Vaper.Layouts.Main : Gtk.ApplicationWindow {
    private GLib.Settings settings;

    public Vaper.HeaderBar header_bar;
    public Vaper.Views.Welcome welcome;

    public Main (Application app) {
        Object (
            application: app
        );
    }

    construct {
        /*
         * Setting Gtk.HeaderBar with HeaderBar.vala
         */
        header_bar = new Vaper.HeaderBar (this);
        set_titlebar (header_bar);

        /*
         * Default size and positioning on screen.
         */
        set_default_size (600, 400);
        window_position = Gtk.WindowPosition.CENTER;

        /*
         * Welcome Screen
         */
        welcome = new Vaper.Views.Welcome (this);
        add (welcome);

        init_settings ();

        show_all ();
    }

    public void init_settings () {
        settings = new GLib.Settings ("com.github.dhhdev.vaper");
        move (
            settings.get_int ("window-x"),
            settings.get_int ("window-y")
        );
        resize (
            settings.get_int ("window-width"),
            settings.get_int ("window-height")
        );

        delete_event.connect (e => {
            return before_destroy ();
        });
    }

    public bool before_destroy () {
        int width, height, x, y;

        get_size (out width, out height);
        get_position (out x, out y);

        settings.set_int ("window-x", x);
        settings.set_int ("window-y", y);
        settings.set_int ("window-width", width);
        settings.set_int ("window-height", height);

        return false;
    }
}