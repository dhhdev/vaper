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

public class Vaper.Views.Recipi : Gtk.Grid {
    public weak Vaper.Layouts.Main window { get; construct; }

    public Recipi (Vaper.Layouts.Main main_window) {
        Object (
            orientation: Gtk.Orientation.VERTICAL,
            window: main_window,
            column_spacing: 10,
            row_spacing: 10,
            column_homogeneous: false
        );

        get_style_context ().add_class ("create-recipi-root");
        get_style_context ().add_class ("view");
    }

    construct {
        /*
         * Batch Card Title
         */
        var header_batch_title_label = new Gtk.Label (_("Batch"));
        header_batch_title_label.halign = Gtk.Align.START;
        header_batch_title_label.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);

        /*
         * Batch Card Subtitle
         */
        var header_batch_subtitle_label = new Gtk.Label (_("How much do you want to make?"));
        header_batch_subtitle_label.halign = Gtk.Align.START;
        header_batch_subtitle_label.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);
        
        /*
         * Batch Card Header Separator
         */
        var batch_header_separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);

        /*
         * Batch Card Grid (Gtk.Grid)
         */
        var batch_card = new Gtk.Grid ();
        batch_card.halign = Gtk.Align.START;
        batch_card.orientation = Gtk.Orientation.VERTICAL;
        batch_card.get_style_context ().add_class (Granite.STYLE_CLASS_CARD);
        batch_card.attach (header_batch_title_label, 0, 0, 1, 1);
        batch_card.attach (header_batch_subtitle_label, 0, 1, 1, 1);
        batch_card.attach (batch_header_separator, 0, 2, 1, 1);

        /*
         * Nicotine Card Title
         */
        var header_nicotine_label = new Gtk.Label (_("Nicotine"));
        header_nicotine_label.halign = Gtk.Align.START;
        header_nicotine_label.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);

        /*
         * Nicotine Card Subtitle
         */
        var header_nicotine_subtitle_label = new Gtk.Label (_("What's on the bootle?"));
        header_nicotine_subtitle_label.halign = Gtk.Align.START;
        header_nicotine_subtitle_label.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        /*
         * Nicotine Card Header Separator
         */
        var nicotine_header_separator = new Gtk.Separator (Gtk.Orientation.HORIZONTAL);

        /*
         * Nicotine Strength Label
         */
        var nicotine_strength_label = new Gtk.Label (_("Strength of nicotine base"));
        nicotine_strength_label.halign = Gtk.Align.START;
        nicotine_strength_label.margin = 10;
        nicotine_strength_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);

        /*
         * Nicotine Strength Bar
         */
        var strength_bar = new Vaper.Partials.StrengthBar ();

        /*
         * Nicotine VPG ratio label
         */
        var vpg_ratio_label = new Gtk.Label (_("VPG Ratio"));
        vpg_ratio_label.halign = Gtk.Align.START;
        vpg_ratio_label.margin = 10;
        vpg_ratio_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);

        /*
         * Nicotine VPG ratio bar
         */
        var vpg_bar = new Vaper.Partials.VPGBar ();

        /*
         * Nicotine Card Grid (Gtk.Grid)
         */
        var nicotine_card = new Gtk.Grid ();
        nicotine_card.halign = Gtk.Align.START;
        nicotine_card.orientation = Gtk.Orientation.VERTICAL;
        nicotine_card.get_style_context ().add_class (Granite.STYLE_CLASS_CARD);
        nicotine_card.attach (header_nicotine_label, 0, 0, 1, 1);
        nicotine_card.attach (header_nicotine_subtitle_label, 0, 1, 1, 1);
        nicotine_card.attach (nicotine_header_separator, 0, 2, 1, 1);
        nicotine_card.attach (nicotine_strength_label, 0, 3, 1, 1);
        nicotine_card.attach (strength_bar, 0, 4, 1, 1);
        nicotine_card.attach (vpg_ratio_label, 0, 5, 1, 1);
        nicotine_card.attach (vpg_bar, 0, 6, 1, 1);

        attach (batch_card, 0, 0, 1, 1);
        attach (nicotine_card, 1, 0, 1, 1);

        show ();
    }
}