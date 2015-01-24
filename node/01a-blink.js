// Example taken from https://github.com/fivdi/onoff
var Gpio = require('onoff').Gpio,
    pinOut = 17,  // Run `gpio readall` to confirm BCM pin number(s)
    led = new Gpio(pinOut, 'out'),
    iv;

// Toggle the LED state at 500ms intervals
iv = setInterval(function() {
    led.writeSync(led.readSync() === 0 ? 1 : 0);
}, 500);

// Stop blinking after 5s
setTimeout(function() {
    // Cleanup
    clearInterval(iv);
    led.writeSync(0);
    led.unexport();
}, 5000);