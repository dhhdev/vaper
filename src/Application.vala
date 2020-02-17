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

namespace Vaper {
    public Vaper.Services.Settings settings;
    public const string _APP_NAME = "Vaper";
}

public class Vaper.Application : Gtk.Application {
    public Vaper.Layouts.Main main_window;

    public Application () {
        Object (
            application_id: "com.github.dhhdev.vaper",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    construct {
        settings = new Vaper.Services.Settings ();
    }

    protected override void activate () {
        main_window = new Vaper.Layouts.Main (this);
        add_window (main_window);
    }

    public static int main (string[] args) {
        var vaper = new Application ();
        return vaper.run (args);
    }
}