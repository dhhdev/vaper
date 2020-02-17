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
    public weak Vaper.Application app_vaper { get; construct; }

    public Vaper.HeaderBar header_bar;
    public Vaper.Layouts.Paned paned_content;

    public Main (Vaper.Application app_vaper) {
        Object (
            application: app_vaper
        );
    }

    construct {
        /*
         * CSS Provider
         */
        var css_provider = new Gtk.CssProvider ();
		css_provider.load_from_resource ("/com/github/dhhdev/vaper/stylesheet.css");

		Gtk.StyleContext.add_provider_for_screen (
			Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        );
        
        /*
         * Is dark theme preffered?
         */
        Gtk.Settings.get_default ().gtk_application_prefer_dark_theme = settings.dark_theme;

        /*
         * Setting Gtk.HeaderBar with HeaderBar.vala
         */
        header_bar = new Vaper.HeaderBar (this);
        set_titlebar (header_bar);
        set_border_width (0);

        /*
         * Main UI (Gtk.Pane and Gtk.Stack)
         */
        paned_content = new Vaper.Layouts.Paned (this);
        add (paned_content);

        /*
         * Settings
         */
        init_settings ();

        /*
         * Connect Destroy Method
         */
        delete_event.connect (before_destroy);

        /*
         * Show Window
         */
        show_all ();
    }

    public void init_settings () {
        move (settings.window_x, settings.window_y);
        resize (settings.window_width, settings.window_height);
    }

    public bool before_destroy () {
        update_settings ();

        return false;
    }

    public void update_settings () {
        int width, height, x, y;

        get_size (out width, out height);
        get_position (out x, out y);

        settings.window_x = x;
        settings.window_y = y;
        settings.window_width = width;
		settings.window_height = height;
    }
}