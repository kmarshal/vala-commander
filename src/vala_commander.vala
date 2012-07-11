/* -*- Mode: C; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*- */
/*
 * main.c
 * Copyright (C) 2012 marshal <marshal@laptop>
 * 
 * vala-commander is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * vala-commander is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using Gtk;
using App.Config;

int main (string[] args) {     
    Gtk.init (ref args);

    try {
        // If the UI contains custom widgets, their types must've been instantiated once
        // Type type = typeof(Foo.BarEntry);
        // assert(type != 0);
        var builder = new Builder ();
        builder.add_from_file ("src/glade/main_window.ui");
        builder.connect_signals (null);
        var window = builder.get_object ("window") as Window;
        
        var toolbar1 = builder.get_object ("bottomToolbar") as Toolbar;
//        toolbar1.get_style_context ().add_class (STYLE_CLASS_PRIMARY_TOOLBAR);
		//var open_button = new ToolButton.from_stock (Stock.OPEN);
        //open_button.is_important = true;
        //toolbar1.add (open_button);
		int min, nat;
		window.get_preferred_width (out min, out nat);
		stdout.printf ("min: %d, natural: %d\n", min, nat);
		
		var rename = new ToolButtonFixed("F2 Rename");
		toolbar1.add (rename);
		var view = new ToolButtonFixed("F3 View");
		toolbar1.add (view);
		var edit = new ToolButtonFixed("F4 Edit");
		toolbar1.add (edit);
		var copy = new ToolButtonFixed("F5 Copy");
		toolbar1.add (copy);
		var move = new ToolButtonFixed("F6 Move");
		toolbar1.add (move);
		var newF = new ToolButtonFixed("F7 New folder");
		toolbar1.add (newF);
		var del = new ToolButtonFixed("F8 Delete");
		toolbar1.add (del);
        
        
        window.show_all ();
        Gtk.main ();
    } catch (Error e) {
        stderr.printf ("Could not load UI: %s\n", e.message);
        return 1;
    } 

    return 0;
}