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

public class Vaper.HeaderBar : Gtk.HeaderBar {
    public weak Vaper.Layouts.Main window { get; construct; }

    private Granite.ModeSwitch mode_switch;
    private Gtk.Popover menu_popover;

    public HeaderBar (Vaper.Layouts.Main window) {
        Object (
			window: window
        );
        
        set_title (Vaper._APP_NAME);
        set_show_close_button (true);
    }

    construct {
        /*
         * Prefer Dark Theme Option
         */
        mode_switch = new Granite.ModeSwitch.from_icon_name ("display-brightness-symbolic", "weather-clear-night-symbolic");
        mode_switch.primary_icon_tooltip_text = _("Light background");
		mode_switch.secondary_icon_tooltip_text = _("Dark background");
		mode_switch.valign = Gtk.Align.CENTER;
		mode_switch.bind_property ("active", settings, "dark-theme");
		mode_switch.notify.connect (() => {
			Gtk.Settings.get_default ().gtk_application_prefer_dark_theme = settings.dark_theme;
		});

		if (settings.dark_theme) {
			mode_switch.active = true;
        }

        /*
         * Measurement Mode
         */
        var measurement_label = new Gtk.Label (_("Measurement Style"));
        measurement_label.halign = Gtk.Align.CENTER;
        measurement_label.hexpand = true;
        measurement_label.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        var measurement_mode = new Granite.Widgets.ModeButton ();
        measurement_mode.margin_bottom = 6;
        measurement_mode.append_text (_("Volume (%)"));
        measurement_mode.append_text (_("Weight (mg/ml)"));
        measurement_mode.set_active (settings.measurement_mode);
        measurement_mode.notify.connect (() => {
            if (measurement_mode.selected == 1) {
                settings.measurement_mode_text = "mg/ml";
            } else {
                settings.measurement_mode_text = "%";
            }
            settings.measurement_mode = measurement_mode.selected;
            debug (settings.measurement_mode_text);
        });

        /*
         * Hide Nicotine Option
         */
        var hide_nicotine_label = new Gtk.Label (_("Hide Nicotine:"));
        hide_nicotine_label.halign = Gtk.Align.END;
        hide_nicotine_label.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        var hide_nicotine_switch = new Gtk.Switch ();
        hide_nicotine_switch.halign = Gtk.Align.START;
        hide_nicotine_switch.valign = Gtk.Align.CENTER;
        hide_nicotine_switch.tooltip_text = (_("Hides the nicotine option, so you don't have to bother with it."));
        
        /*
         * Building the menu 
         */

        var menu_grid = new Gtk.Grid ();
        menu_grid.expand = true;
        menu_grid.column_spacing = 6;
        menu_grid.margin = 6;
		menu_grid.orientation = Gtk.Orientation.VERTICAL;

        menu_grid.attach (measurement_label, 0, 1, 2, 1);
        menu_grid.attach (measurement_mode, 0, 2, 2, 1);
        
        menu_grid.attach (hide_nicotine_label, 0, 3, 1, 1);
		menu_grid.attach (hide_nicotine_switch, 1, 3, 1, 1);
		menu_grid.show_all ();
        
        var settings_menu = new Gtk.MenuButton ();
		settings_menu.set_image (new Gtk.Image.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR));
        settings_menu.tooltip_text = _("Settings Menu");
        
        menu_popover = new Gtk.Popover (settings_menu);
        menu_popover.add (menu_grid);
        
        settings_menu.popover = menu_popover;
		settings_menu.valign = Gtk.Align.CENTER;

        pack_end (settings_menu);
        pack_end (mode_switch);
    }
}