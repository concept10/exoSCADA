// main.js
//
//

import "./init.js";
import "./logger.js";

import application from "./application.js";

// import jsapi from "./jsapi";

// pkg.initGettext();

// import "./language-specs/blueprint.lang";
// import "./style.css";

export function main(argv) {
  return application.run(argv);
}