gpio-examples
=============

## Requirements
* [Raspbian OS](http://www.raspberrypi.org/downloads/)
* [Wiring Pi](http://wiringpi.com/)
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/#apt)
* [NodeJS](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)

## 01 - Blink
![Blink](/img/01-blink.png?raw=true "Blink")
```
sudo python 01-blink.py
sudo ruby 01-blink.rb
node 01a-blink.js
node 01b-blink-async.js
```

## 02 - Switch
**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
![Switch](/img/02-switch.png?raw=true "Switch")
```
sudo python 02a-switch.py
sudo python 02b-switch-async.py
sudo ruby 02-switch.rb
node 02-switch.js
```

## 03 - Switch LED
**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
![Switch LED](/img/03-switch-led.png?raw=true "Switch LED")
```
sudo python 03-switch-led.py
sudo ruby 03-switch-led.rb
node 03-switch-led.js
```

## 04 - Switch audio
**NOTE**: If using NodeJS, first run: `gpio mode 1 down`
![Switch audio](/img/04-switch-audio.png?raw=true "Switch audio")
```
sudo python 04-switch-audio.py ~/audio/example.mp3
sudo ruby 04-switch-audio.rb ~/audio/example.mp3
node 04-switch-audio.js ~/audio/example.mp3
```
