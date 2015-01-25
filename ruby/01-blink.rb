require 'rpi_gpio'

# Run `gpio readall` to confirm BCM pin number(s)
pin_out = 17	# LED

RPi::GPIO.set_numbering(:bcm)
RPi::GPIO.set_warnings(0)
RPi::GPIO.setup(pin_out, as: :output)

def blink(pin)
	RPi::GPIO.set_high(pin)
	sleep(0.5)
	RPi::GPIO.set_low(pin)
	sleep(0.5)
end

5.times { blink(pin_out) }

RPi::GPIO.clean_up