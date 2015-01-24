var Gpio     = require('onoff').Gpio,
    fs       = require('fs'),
    lame     = require('lame'),
    Speaker  = require('speaker'),
    button   = new Gpio(18, 'in', 'both'),	// Run `gpio readall` to confirm BCM pin number(s)
    filename = process.argv[2];				// Get filename from command line arguments

if (!filename) {
	console.log('Incorrect number of arguments. Usage: node 04-switch-audio.rb song.mp3');
	exit();
}

// Watch for button state to change from "0" to "1"
button.watch(function(err, value) {
	if (err) exit();
	if (value == 1) {
		console.log('Button pressed');
		// Play audio file
		fs.createReadStream(filename)
			.pipe(new lame.Decoder())
			.on('format', function (format) {
				this.pipe(new Speaker(format));
			});
	}
});

function exit() {
	// Cleanup
	button.unexport();
	process.exit();
}

// Exit on kill signal (Ctrl+C)
process.on('SIGINT', exit);