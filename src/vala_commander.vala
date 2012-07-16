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

class ValaCommander {

	private void read_dir(string dir) {

	}

	public static void setup_treeview(ScrolledWindow w, string dir) {
		var view = new TreeView();
		var listmodel = new ListStore(4, typeof (string), typeof (string), typeof (string), typeof (string));
		view.set_model (listmodel);
		view.insert_column_with_attributes (-1, "Name", new CellRendererText(), "text", 0);
		view.insert_column_with_attributes (-1, "Type", new CellRendererText(), "text", 1);
		view.insert_column_with_attributes (-1, "Size", new CellRendererText(), "text", 2);
		view.insert_column_with_attributes (-1, "Target", new CellRendererText(), "text", 3);

		TreeIter iter;
		try {
			var directory = File.new_for_path(dir);
			var enumerate = directory.enumerate_children ("standard::*", FileQueryInfoFlags.NONE);
			FileInfo file_info;
			while ((file_info = enumerate.next_file()) != null) {

				// omit hidden
				if (file_info.get_attribute_boolean (FileAttribute.STANDARD_IS_HIDDEN)) {
					continue;
				}

				// size in kb
				double size = file_info.get_size() / 1024;
				
				listmodel.append (out iter);
				listmodel.set (iter,
				               0, file_info.get_name(),
				               1, file_info.get_content_type (),
				               2, size.to_string() + " kb" ,
				               3, file_info.get_attribute_as_string (FileAttribute.STANDARD_SYMLINK_TARGET) );
			}
		} catch (Error e) {
			stdout.printf("Error: %s\n", e.message);
	    }
		
		w.add(view);
	}
	
	public static int main (string[] args) {     
		Gtk.init (ref args);

		try {
		    // If the UI contains custom widgets, their types must've been instantiated once
		    // Type type = typeof(Foo.BarEntry);
		    // assert(type != 0);
		    var builder = new Builder ();
		    builder.add_from_file (App.Config.UI_FILE);
		    builder.connect_signals (null);
		    var window = builder.get_object (App.Config.UI_MAIN_WINDOW) as Window;

			//TreeView leftView = ValaCommander.setup_treeview (Environment.get_home_dir ());
			var leftScrolled = builder.get_object(App.Config.UI_SCROLLED_LEFT) as ScrolledWindow;
			var rightScrolled = builder.get_object(App.Config.UI_SCROLLED_RIGHT) as ScrolledWindow;

			var labelCmd = builder.get_object ("label_cmd") as Label;
			labelCmd.set_text (Environment.get_user_name () + ":" + Environment.get_home_dir () + " $");

			//leftScrolled.set_policy (PolicyType.AUTOMATIC, PolicyType.NEVER);
			ValaCommander.setup_treeview(leftScrolled, Environment.get_home_dir ());
			ValaCommander.setup_treeview(rightScrolled, Environment.get_tmp_dir ());
		    
		    window.show_all ();
		    Gtk.main ();
		} catch (Error e) {
		    stderr.printf ("Could not load UI: %s\n", e.message);
		    return 1;
		} 

		return 0;
	}
}