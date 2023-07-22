// about.js


import Gtk from "gi://Gtk";
// import { gettext as _ } from "gettext";
import GLib from "gi://GLib";
import Adw from "gi://Adw";

import {
  getGIRepositoryVersion,
  getGjsVersion,
  getGLibVersion,
} from "../troll/src/util.js";
import { getFlatpakInfo } from "./util.js";  TODO: Who is this troll utils?

export default function About({ application }) {
  const flatpak_info = getFlatpakInfo();

  const debug_info = `
${pkg.name} ${pkg.version}
${GLib.get_os_info("ID")} ${GLib.get_os_info("VERSION_ID")}

GJS ${getGjsVersion()}
Adw ${getGIRepositoryVersion(Adw)}
GTK ${getGIRepositoryVersion(Gtk)}
GLib ${getGLibVersion()}
Flatpak ${flatpak_info.get_string("Instance", "flatpak-version")}
${getValaVersion()}
${getBlueprintVersion()}
`.trim();

  const dialog = new Adw.AboutWindow({
    transient_for: application.get_active_window(),
    application_name: "exo",
    developer_name: "Tracey Ledbetter",
    copyright: "© 2020 - 2023 Tracey Ledbetter",
    license_type: Gtk.License.GPL_3_0_ONLY,
    version: pkg.version,
    website: "https://github.com/concept10",
    application_icon: pkg.name,
    issue_url: "https://github.com/concept10/exoscada/issues",
    // TRANSLATORS: eg. 'Translator Name <your.email@domain.com>' or 'Translator Name https://website.example'
    translator_credits: _("translator-credits"),
    debug_info,
    developers: [
    // Add yourself as
    // "John Doe",
    // or
    // "John Doe <john@example.com>",
    // or
    // "John Doe https://john.com",
      "Tracey Ledbetter",
      ,
    ],
    designers: [
     "Tracey Ledbetter",
    ],
    artists: [
    // Add yourself as
    // "John Doe",
    // or
    // "John Doe <john@example.com>",
    // or
    // "John Doe https://john.com",
      "",
    ],
  });

  dialog.add_credit_section(_("Contributors"), [
    
    // Add yourself as
    // "John Doe",
    // or
    // "John Doe <john@example.com>",
    // or
    // "John Doe https://john.com",
  ]);
  dialog.present();

  return { dialog };
}

function getValaVersion() {
  const [, data] = GLib.spawn_command_line_sync("valac --version");
  return new TextDecoder().decode(data).trim();
}

function getBlueprintVersion() {
  return "Blueprint 0.8.1";  // TODO: I mean they say what ver is blueprint on now, what's rhe conflict here?  daaang?!
}