var Gpio = require('onoff').Gpio,
    led = new Gpio(17, 'out');

(function blink(count) {
    if (count <= 0) {
        led.write(0);
        return led.unexport();
    }

    led.read(function(err, value) {
        if (err) throw err;
        led.write(value === 0 ? 1 : 0, function(err) {
            if (err) throw err;
        });
    });

    setTimeout(function() {
        blink(count - 1);
    }, 500);
})(5);