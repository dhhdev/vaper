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

public class Vaper.Layouts.Paned : Gtk.Paned {
    public unowned Vaper.Layouts.Main window { get; construct; }

    public Gtk.StackSidebar stack_sidebar;
    public Gtk.Stack main_stack;

    public Vaper.Views.About about_view;
    public Vaper.Views.Welcome welcome_view;
    public Vaper.Views.Recipi recipi_view;
    
    public Paned (Vaper.Layouts.Main main_window) {
        Object (
            orientation: Gtk.Orientation.HORIZONTAL,
            window: main_window
        );
    }
    
    construct {
        position = 150;

        var titlebar = new Vaper.Partials.TitleBar (_("SAVED RECIPES"));

        main_stack = new Gtk.Stack ();
        recipi_view = new Vaper.Views.Recipi (window);
        welcome_view = new Vaper.Views.Welcome (window);

        main_stack.add_titled (recipi_view, "recipi_view", "CREATE RECIPI");

        main_stack.add_named (welcome_view, "welcome_view");

        stack_sidebar = new Gtk.StackSidebar ();
        stack_sidebar.stack = main_stack;

        build_sidebar ();
		build_main ();
    }

    public void build_sidebar () {
		pack1 (stack_sidebar, false, false);
	}

	public void build_main () {
        pack2 (main_stack, true, false);
        main_stack.set_visible_child_name ("welcome_view");
	} 
}