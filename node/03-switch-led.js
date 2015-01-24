var Gpio = require('onoff').Gpio,
    led = new Gpio(17, 'out'),	// Run `gpio readall` to confirm BCM pin number(s)
    button = new Gpio(18, 'in', 'both');

// Watch for button state to change from "0" to "1"
button.watch(function(err, value) {
    if (err) exit();
    if (value == 1) {
    	console.log('Button pressed');
    }
    led.writeSync(value);
});

function exit() {
	// Cleanup
    led.unexport();
    button.unexport();
    process.exit();
}

// Exit on kill signal (Ctrl+C)
process.on('SIGINT', exit);