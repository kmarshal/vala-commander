using Gtk;

public class ToolButtonFixed : ToolButton {

	private static const int WIDTH = 112;

	public ToolButtonFixed(string label) {
		Object (icon_widget: null, label: label);
		set_size_request(ToolButtonFixed.WIDTH, 1);
		is_important = true;
	}
}