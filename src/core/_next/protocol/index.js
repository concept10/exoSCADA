

'use strict';

var Protocol = require('./protocol');

var sharedDevices = {};             // Shared Devices list
var activeDevices = {};             // Actives Devices list
var runtime;                        // Access to application resource like logger/settings
var workingStatus;                   // Current status (start/stop) to know if is working

const runtimeServerInstance = '0';
/**
 * Init by set the access to application resource
 * @param {*} _runtime 
 */
function init(_runtime) {
    runtime = _runtime;
}


function start() {
    workingStatus = 'starting';
    protocols.load();
    return new Promise(function (resolve, reject) {
        // runtime.logger.info('devices.start-all (' + Object.keys(activeDevices).length + ')', true);
        for (var id in activeProtocols) {
            activeProtocols[id].start();
        }
        resolve();
        workingStatus = null;
    });