// application.js
//
// adapted from workbench (@sonnyp)

import Adw from "gi://Adw";
import Gio from "gi://Gio";

// import Window from "./window.js";
// import Actions from "./actions.js";
import { settings, data_dir, ensureDir, readDemoFile } from "./util.js";
// import { overrides } from "./overrides.js";
// import Library from "./Library/Library.js";
import DocumentationViewer from "./DocumentationViewer.js";
import { createSessionFromDemo, getSessions } from "./sessions.js";

ensureDir(data_dir);

const application = new Adw.Application({
  application_id: pkg.name,
  flags: Gio.ApplicationFlags.NON_UNIQUE,
    resource_base_path: "/io/outlawd/exo",
});

application.connect("startup", () => {
  Library({
    application,
  });

  DocumentationViewer({
    application,
  });

  restoreSessions();
});

application.connect("activate", () => {
  if (application.is_remote) {
    newWindow();
  }
});

application.set_option_context_description("<URL>");

Actions({ application });

overrides();

const style_manager = Adw.StyleManager.get_default();
function setColorScheme() {
  const color_scheme = settings.get_int("color-scheme");
  style_manager.set_color_scheme(color_scheme);
}
setColorScheme();
settings.connect("changed::color-scheme", setColorScheme);

// We are not using async otherwise the app segfaults
// does not like opening a window in a promise
// TODO: make a reproducer and file a GJS bug
function restoreSessions() {
  const sessions = getSessions();

  if (sessions.length < 1) {
    newWindow();
  } else {
    sessions.forEach((session) => {
      const { load } = Window({
        application,
        session,
      });
      load({ run: false }).catch(logError);
    });
  }
}

function newWindow() {
  const demo = JSON.parse(readDemoFile("Welcome", "demo.json"));
  const session = createSessionFromDemo(demo);
  const { load } = Window({
    application,
    session,
  });
  load({ run: false }).catch(logError);
}

export default application;
