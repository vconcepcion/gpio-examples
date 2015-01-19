var Gpio     = require('onoff').Gpio,
    button   = new Gpio(18, 'in', 'both'),
    fs       = require('fs'),
    lame     = require('lame'),
    Speaker  = require('speaker'),
    filename = process.argv[2];

button.watch(function(err, value) {
	if (err) exit();
	if (value == 1) {
		console.log('Button pressed');
	  fs.createReadStream(filename)
			.pipe(new lame.Decoder())
			.on('format', function (format) {
				this.pipe(new Speaker(format));
			});
	}
});

function exit() {
  button.unexport();
  process.exit();
}

process.on('SIGINT', exit);