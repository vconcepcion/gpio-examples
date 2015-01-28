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
2. Move to the desired directory (e.g., `cd ruby`)
3. Run the code
```
sudo python 01-blink.py

sudo ruby 01-blink.rb

node 01a-blink.js

node 01b-blink-async.js
```

## 02 - Switch
Read input from a button/switch

1. Build the circuit
![Switch](/img/02-switch.png?raw=true "Switch")
2. Move to the desired directory (e.g., `cd ruby`)
3. Run the code

**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
```
sudo python 02a-switch.py

sudo python 02b-switch-async.py

sudo ruby 02-switch.rb

node 02-switch.js
```

## 03 - Switch LED
Blink an LED based on input from a button/switch

1. Build the circuit
![Switch LED](/img/03-switch-led.png?raw=true "Switch LED")
2. Move to the desired directory (e.g., `cd ruby`)
3. Run the code

**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
```
sudo python 03-switch-led.py

sudo ruby 03-switch-led.rb

node 03-switch-led.js
```

## 04 - Switch audio
Play an MP3 file based on input from a button/switch

1. Build the circuit
![Switch audio](/img/04-switch-audio.png?raw=true "Switch audio")
2. Move to the desired directory (e.g., `cd ruby`)
3. Run the code

**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
```
sudo python 04-switch-audio.py ~/audio/example.mp3

sudo ruby 04-switch-audio.rb ~/audio/example.mp3

node 04-switch-audio.js ~/audio/example.mp3
```
