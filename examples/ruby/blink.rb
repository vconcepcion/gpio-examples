require 'pi_piper'

pin_out = 17
pin = PiPiper::Pin.new(:pin => pin_out, :direction => :out)

def blink(pin)
	pin.on
	sleep(0.5)
	pin.off
	sleep(0.5)
end

5.times { blink(pin) }