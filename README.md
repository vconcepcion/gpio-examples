gpio-examples
=============

## Requirements
* [Raspbian OS](http://www.raspberrypi.org/downloads/)
* [Wiring Pi](http://wiringpi.com/)
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/#apt)
* [NodeJS](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)

## 01 - Blink
Make an LED blink 5 times

1. Build the circuit
![Blink](/img/01-blink.png?raw=true "Blink")
2. Run one of the following code samples
```
sudo python python/01-blink.py

sudo ruby ruby/01-blink.rb

node node/01a-blink.js

node node/01b-blink-async.js
```

## 02 - Switch
Read input from a button/switch

1. Build the circuit
![Switch](/img/02-switch.png?raw=true "Switch")
2. Run one of the following code samples

**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
```
sudo python python/02a-switch.py

sudo python python/02b-switch-async.py

sudo ruby ruby/02-switch.rb

node node/02-switch.js
```

## 03 - Switch LED
Blink an LED based on input from a button/switch

1. Build the circuit
![Switch LED](/img/03-switch-led.png?raw=true "Switch LED")
2. Run one of the following code samples

**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
```
sudo python python/03-switch-led.py

sudo ruby ruby/03-switch-led.rb

node node/03-switch-led.js
```

## 04 - Switch audio
Play an MP3 file based on input from a button/switch

1. Build the circuit
![Switch audio](/img/04-switch-audio.png?raw=true "Switch audio")
2. Download a sample audio file
```
mkdir ~/audio
wget http://goo.gl/MOXGX3 -O ~/audio/example.mp3 --no-check-certificate
```
3. Run one of the following code samples

**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
```
sudo python python/04-switch-audio.py ~/audio/example.mp3

sudo ruby ruby/04-switch-audio.rb ~/audio/example.mp3

node ruby/04-switch-audio.js ~/audio/example.mp3
```
