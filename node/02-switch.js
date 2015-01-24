var Gpio = require('onoff').Gpio,
    button = new Gpio(18, 'in', 'both');  // Run `gpio readall` to confirm BCM pin number(s)

// Watch for button state to change from "0" to "1"
button.watch(function(err, value) {
    if (err) exit();
    if (value == 1) {
        console.log('Button pressed');
    }
});

function exit() {
    // Cleanup
    button.unexport();
    process.exit();
}

// Exit on kill signal (Ctrl+C)
process.on('SIGINT', exit);