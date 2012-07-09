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
using Ui;

public class App : Gtk.Window {

	private Box mainLayout;
	private Toolbar toolbar;

	private App() {
		this.set_title ("Vala Commander");
		this.border_width = 10;
		this.set_default_size (600, 400);
		this.window_position = WindowPosition.CENTER;
		
		this.layout ();

		this.destroy.connect(Gtk.main_quit);
		this.show_all();
	}

	private void layout() {
		mainLayout = new Box(Gtk.Orientation.VERTICAL, 0);
		mainLayout.set_homogeneous (true);

		init_menu();
		init_toolbar();
		init_panels();
		init_buttons_bar();
		
		this.add(mainLayout);
	}

	private void init_menu() {
		mainLayout.pack_start (new Ui.Menu(), false, true, 0);
	}

	private void init_toolbar() {
		toolbar = new Toolbar();
		toolbar.get_style_context ().add_class (STYLE_CLASS_TOOLBAR);

		var open_button = new ToolButton.from_stock (Stock.OPEN);
		open_button.is_important = true;
		toolbar.add(open_button);
		
		mainLayout.pack_start (toolbar, false, true, 0);
	}

	private void init_panels() {
		Box panelBox = new Box (Orientation.HORIZONTAL, 0);
		ScrolledWindow leftPanel = new ScrolledWindow(null, null);
		leftPanel.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
		ScrolledWindow rightPanel = new ScrolledWindow(null, null);
		leftPanel.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);

		panelBox.pack_start (leftPanel, false, true, 0);
		panelBox.pack_start (rightPanel, false, true, 0);
		mainLayout.pack_start (panelBox, false, true, 0);
	}

	private void init_buttons_bar() {

	}

	static int main (string[] args) {
		Gtk.init (ref args);
		var app = new App ();
		app.show_all ();
		Gtk.main ();
		return 0;
	}
}