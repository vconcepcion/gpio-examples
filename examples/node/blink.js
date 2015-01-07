var Gpio = require('onoff').Gpio,
	pinOut = 17,
    led = new Gpio(pinOut, 'out'),
    iv;

iv = setInterval(function() {
    led.writeSync(led.readSync() === 0 ? 1 : 0);
}, 500);

setTimeout(function() {
    clearInterval(iv);
    led.writeSync(0);
    led.unexport();
}, 5000);