var GpioStream = require('gpio-stream'),
    http = require('http'),
    button = GpioStream.readable(18),
    led = GpioStream.writable(17);

var stream = button.pipe(led);

http.createServer(function (req, res) {
  res.setHeader('Content-Type', 'text/html');
  res.write('<pre>logging button presses:\n');
  stream.pipe(res);
}).listen(8080);