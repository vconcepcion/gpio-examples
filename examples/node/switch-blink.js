var Gpio = require('onoff').Gpio,
    led = new Gpio(17, 'out'),
    button = new Gpio(18, 'in', 'both');

button.watch(function(err, value) {
    if (err) exit();
    if (value == 1) console.log('Button pressed');
    led.writeSync(value);
});

function exit() {
    led.unexport();
    button.unexport();
    process.exit();
}

process.on('SIGINT', exit);