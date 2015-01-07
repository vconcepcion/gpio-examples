var Gpio = require('onoff').Gpio,
    button = new Gpio(18, 'in', 'both');

button.watch(function(err, value) {
    if (err) exit();
    if (value == 1) console.log('Button pressed');
});

function exit() {
    button.unexport();
    process.exit();
}

process.on('SIGINT', exit);