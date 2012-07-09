using Gtk;

namespace Ui {
	public class Menu : Gtk.MenuBar {

		public Menu() {
			initItems();
		}

		private void initItems() {
			Gtk.Menu fileMenu = new Gtk.Menu();
			Gtk.MenuItem fileItem = new Gtk.MenuItem.with_mnemonic ("_File");

			Gtk.MenuItem openItem = new Gtk.MenuItem.with_mnemonic ("_Open");
			openItem.activate.connect(on_open);
			
			Gtk.MenuItem quitItem = new Gtk.MenuItem.with_mnemonic ("_Quit");
			quitItem.activate.connect(Gtk.main_quit);

			fileMenu.append(openItem);
			fileMenu.append(quitItem);
			fileItem.set_submenu(fileMenu);

			
			Gtk.MenuItem editMenu = new Gtk.MenuItem.with_mnemonic ("_Edit");
			//fileMenu.set_label("_Edycja");
			
			this.append(fileItem);
			this.append(editMenu);
		}

		private void on_open() {
			stdout.printf("on_open\n");
		}

	}
}