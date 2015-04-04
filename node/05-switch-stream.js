/* See full tutorial at:
   https://learn.adafruit.com/node-embedded-development

   Before running this, run the following commands:
     $ gpio export 18 in
*/
var GpioStream = require('gpio-stream'),
    http = require('http'),
    button = GpioStream.readable(18);

http.createServer(function (req, res) {
  res.setHeader('Content-Type', 'text/html');
  res.write('<pre>logging button presses:\n');
  button.pipe(res);
}).listen(8080);
