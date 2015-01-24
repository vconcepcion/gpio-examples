// Example taken from https://github.com/fivdi/onoff
var Gpio = require('onoff').Gpio,
    led = new Gpio(17, 'out');  // Run `gpio readall` to confirm BCM pin number(s)

(function blink(count) {
    if (count <= 0) {           // Countdown completed
        led.write(0);
        return led.unexport();  // Cleanup
    }

    // Read the current LED state
    led.read(function(err, currentState) {
        if (err) throw err;
        // Toggle the LED state
        led.write(currentState === 0 ? 1 : 0, function(err) {
            if (err) throw err;
        });
    });

    setTimeout(function() {
        blink(count - 1);   // Recursively countdown number of blinks
    }, 500);                // 500ms delay between blinks
})(5);  // Number of times to blink