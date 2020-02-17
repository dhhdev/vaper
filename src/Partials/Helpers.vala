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

namespace Vaper.Partials {
    public class TitleBar : Gtk.Grid {
        public TitleBar (string text) {
            get_style_context ().add_class ("titlebar");

            var title = new Gtk.Label (text);
            title.get_style_context ().add_class ("h4");
            title.halign = Gtk.Align.CENTER;
            title.margin = 4;
            title.hexpand = true;

            this.add (title);
        }
    }

    public class StrengthBar : Gtk.Grid {
        public StrengthBar () {
            /*
             * Styling of Gtk.Grid bar.
             */
            this.get_style_context ().add_class (Gtk.STYLE_CLASS_LINKED);

            /*
             * Strength spinbutton (ie., 100ml)
             */
            var strength_spinbutton = new Gtk.SpinButton.with_range (0, 1, 1);
            strength_spinbutton.halign = Gtk.Align.START;

            /*
             * Strength label.
             */
            var strength_label = new Gtk.Button ();
            strength_label.sensitive = false;
            strength_label.halign = Gtk.Align.START;
            strength_label.set_label (settings.measurement_mode_text);
            if (settings.measurement_mode == 1) {
                strength_spinbutton.set_range (0, 1000);
            } else {
                strength_spinbutton.set_range (0, 100);
            }

            /*
             * Setings notify on change.
             */
            settings.notify.connect (() => {
                strength_label.set_label (settings.measurement_mode_text);

                /*
                 * Range depending on type.
                 */
                if (settings.measurement_mode == 1) {
                    strength_spinbutton.set_range (0, 1000);
                } else {
                    strength_spinbutton.set_range (0, 100);
                }
            });

            /*
             * Add to Gtk.Grid
             */
            this.add (strength_spinbutton);
            this.add (strength_label);
        }
    }

    public class BatchBar : Gtk.Grid {
        public BatchBar () {
            /*
             * Styling of Gtk.Grid bar.
             */
            this.get_style_context ().add_class (Gtk.STYLE_CLASS_LINKED);

            /*
             * Batch label.
             */
            var batch_label = new Gtk.Button.with_label ("ml");
            batch_label.sensitive = false;

            /*
             * Batch spinbutton (ie., 100ml)
             */
            var batch_spinbutton = new Gtk.SpinButton.with_range (0, int64.MAX, 5);

            /*
             * Add to Gtk.Grid
             */
            this.add (batch_spinbutton);
            this.add (batch_label);
        }
    }

    public class VPGBar : Gtk.Grid {
        public VPGBar () {
            /*
             * Styling of Gtk.Grid bar.
             */
            this.get_style_context ().add_class (Gtk.STYLE_CLASS_LINKED);
            /*
             * VG and PG button labels
             */
            var vg_label = new Gtk.Button.with_label ("VG");
            vg_label.sensitive = false;
            var pg_label = new Gtk.Button.with_label ("PG");
            pg_label.sensitive = false;

            /*
             * VG and PG spinbuttons
             */
            var vg_spinbutton = new Gtk.SpinButton.with_range (0, 100, 5);
            var pg_spinbutton = new Gtk.SpinButton.with_range (0, 100, 5);

            /*
             * Default VG and PG spinbutton values
             */
            vg_spinbutton.set_value (50);
            pg_spinbutton.set_value (50);

            /*
             * VG and PG spinbuttons connections to changes
             */
            vg_spinbutton.value_changed.connect (() => {
                pg_spinbutton.set_value (100 - vg_spinbutton.get_value ());
            });
    
            pg_spinbutton.value_changed.connect (() => {
                vg_spinbutton.set_value (100 - pg_spinbutton.get_value ());
            });

            /*
             * Add to Gtk.Grid
             */
            this.add (vg_spinbutton);
            this.add (vg_label);
            this.add (pg_spinbutton);
            this.add (pg_label);
        }
    }
}