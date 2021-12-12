/* application.vala
 *
 * Copyright 2021 concept10
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

namespace Exoscada {
	public class Application : Gtk.Application {
		private ActionEntry[] APP_ACTIONS = {
			{ "about", on_about_action },
			{ "preferences", on_preferences_action },
			{ "quit", quit }
		};


		public Application () {
			Object (application_id: "com.scada.exo", flags: ApplicationFlags.FLAGS_NONE);

			this.add_action_entries(this.APP_ACTIONS, this);
			this.set_accels_for_action("app.quit", {"<primary>q"});
		}

		public override void activate () {
			base.activate();
			var win = this.active_window;
			if (win == null) {
				win = new Exoscada.Window (this);
			}
			win.present ();
		}

		private void on_about_action () {
			string[] authors = {"concept10"};
			Gtk.show_about_dialog(this.active_window,
				                  "program-name", "exoscada",
				                  "authors", authors,
				                  "version", "0.1.0");
		}

		private void on_preferences_action () {
			message("app.preferences action activated");
		}
	}
}
