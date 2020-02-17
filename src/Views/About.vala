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

public class Vaper.Views.About : Granite.Widgets.Welcome {
    public unowned Vaper.Layouts.Main window { get; construct; }

    public About (Vaper.Layouts.Main main_window) {
        Object (
            window: main_window,
            title: _("About Vaper"),
			subtitle: _("History behind Vaper and much more.")
        );
    }

    construct {
        valign = Gtk.Align.FILL;
        halign = Gtk.Align.FILL;
        vexpand = true;
    }
}