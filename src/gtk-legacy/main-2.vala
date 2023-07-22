/* main.vala
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

int main (string[] args) {
	var app = new Exoscada.Application ();
	return app.runAsync (args);
}
void main(string[] args) {
    // Initialize GLib
    GLib.init(ref args);

    // Create a new MainLoop to handle asynchronous events
    var loop = new MainLoop(null, false);

    // Run your asynchronous tasks
    async_task(loop);

    // Start the MainLoop to handle asynchronous events
    loop.run();

    // Cleanup after the MainLoop finishes
    GLib.main_quit();
}

async void async_task(MainLoop loop) {
    // Perform your asynchronous operations here
    // For example, you can use GLib.Async.ready_callback() or GLib.Async.ready_callback_full() for more control

    // Simulate an asynchronous task with a timeout
    yield GLib.Async.timeout_seconds(2);

    // Once the asynchronous task is complete, stop the MainLoop
    loop.quit();
}