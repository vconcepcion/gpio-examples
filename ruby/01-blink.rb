require 'pi_piper'

# Run `gpio readall` to confirm BCM pin number(s)
pin_out = 17	# LED

led = PiPiper::Pin.new(:pin => pin_out, :direction => :out)

def blink(pin)
	led.on
	sleep(0.5)
	led.off
	sleep(0.5)
end

5.times { blink(led) }