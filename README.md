gpio-examples
=============
A collection of examples in Python, Ruby, and Node, introducing the use of the Raspberry Pi GPIO interface.
Slides and more information at: http://bit.ly/1wTL57E.

## Requirements
* [Raspbian OS](http://www.raspberrypi.org/downloads/)
* [Wiring Pi](http://wiringpi.com/)
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/#apt)
* [NodeJS](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)

## 01 - Blink
Make an LED blink 5 times

* Build the circuit
![Blink](/img/01-blink.png?raw=true "Blink")
* Run one of the following code samples
```
sudo python python/01-blink.py

sudo ruby ruby/01-blink.rb

node node/01a-blink.js

node node/01b-blink-async.js
```
* High five if: the LED blinked 5 times
* Can you...
  * Make it blink more times?
  * Make it blink faster/slower?

## 02 - Switch
Read input from a button/switch

* Build the circuit
![Switch](/img/02-switch.png?raw=true "Switch")
* Run one of the following code samples (hit Ctrl+C when done to stop running it)

```
sudo python python/02a-switch.py

sudo python python/02b-switch-async.py

sudo ruby ruby/02-switch.rb

gpio mode 1 down
node node/02-switch.js
```
* High five if: you see "Button pressed" in the terminal whenever you press the button
* Can you...
  * Output a count of how many times the button has been pressed?
  * Only display the text for every other button press?

## 03 - Switch LED
Blink an LED based on input from a button/switch

* Build the circuit
![Switch LED](/img/03-switch-led.png?raw=true "Switch LED")
* Run one of the following code samples (hit Ctrl+C when done to stop running it)

```
sudo python python/03-switch-led.py

sudo ruby ruby/03-switch-led.rb

gpio mode 1 down
node node/03-switch-led.js
```
* High five if: the LED blinks whenever you press the button
* Can you...
  * Keep the LED on until the button is pressed again?

## 04 - Switch audio
Play an MP3 file based on input from a button/switch

* Build the circuit
![Switch audio](/img/04-switch-audio.png?raw=true "Switch audio")
* Download a sample audio file
```
mkdir /home/pi/audio
wget http://goo.gl/MOXGX3 -O /home/pi/audio/example.mp3 --no-check-certificate
```
* Run one of the following code samples (hit Ctrl+C when done to stop running it)

```
sudo python python/04-switch-audio.py /home/pi/audio/example.mp3

sudo ruby ruby/04-switch-audio.rb /home/pi/audio/example.mp3

gpio mode 1 down
node node/04-switch-audio.js /home/pi/audio/example.mp3
```
* High five if: the MP3 plays whenever you press the button
* Can you...
  * Make it play your favorite song?
  * Setup a drum kit using multiple buttons?

## 05 - Switch stream
Stream button input to a web page (Full tutorial: https://learn.adafruit.com/node-embedded-development/why-node-dot-js)

* Build the circuit
![Switch stream](/img/05-switch-stream.png?raw=true "Switch stream")
* Find the IP address (e.g., 192.168.1.21) of your pi by running `ip addr show`
```
eth0: ...
    inet 192.168.1.21/24 ...
```
* Run the following (hit Ctrl+C when done to stop running it)

```
gpio export 18 in
node node/05-switch-stream.js
```
* Go to http://[your_ip_address]:8080/ to view button logging
* High five if: the web page is appended with a "1" whenever the button is pressed down, and a "0" when it's released
* Can you...
  * Edit the Node example "02 - Switch" to keep track of the number of button presses and publish the count to a web page? Hint: instead of streaming input with `button.pipe(res)`, write the current count as a string to the HTTP response and call `res.end()`.
  * Download/install [ngrok](https://ngrok.com) and run `./ngrok 8080` to make your page available on a public internet address.

## 06 - Room reservations
Use the Google Calendar API to pull event data and light an LED if a
room is reserved on the calendar (i.e., event is currently in progress)

* Build the circuit
![Room reservations](/img/06-room-reservations.png?raw=true "Room reservations")
* Go to https://console.developers.google.com/project to create a new project
![Create project](/img/create-project.png?raw=true "Create project")
* Enable the Calendar API
![Calendar API](/img/calendar-api.png?raw=true "Calendar API")
* Create an API access key
![Public API key](/img/public-api-key.png?raw=true "Public API key")
* Create a Google Calendar with events and find its ID under "Calendar Settings". Important: make sure that the calendar has public access.
![Calendar ID](/img/calendar-id.png?raw=true "Calendar ID")
* Update the `CALENDAR_ID` and `API_KEY` values
```
CALENDAR_ID = "__YOUR_CALENDAR_ID__"
API_KEY = "__YOUR_API_KEY__"
```
* Run the following (hit Ctrl+C when done to stop running it)

```
cd /home/pi/gpio-examples/ruby
mkdir tmp
sudo ruby 06-room-reservations.rb
```
* High five if: the LED is lit when there's an event in progress and otherwise is turned off. Note that there may be up to a 30-second delay from the time an event is updated on the calendar to the time the LED switches on or off. This prevents us from bombarding the server with too many API requests.
* Can you...
  * Only change the LED when the event is held in a particular location?
  * Add a green LED that lights up when there's no event in progress?


## Contact Information
Email me if you have any questions.<br />
Valerie Concepcion<br />
valerie.concepcion@gmail.com
