require 'pi_piper'
include PiPiper

# Run `gpio readall` to confirm BCM pin number(s)
pin_in = 18		# button
pin_out = 17	# LED

led = PiPiper::Pin.new(:pin => pin_out, :direction => :out)

# Watch for button state to change from "0" to "1"
after :pin => pin_in, :goes => :high do
	puts "Button pressed"
	led.on
end

# Watch for button state to change from "1" to "0"
after :pin => pin_in, :goes => :low do
	led.off
end

PiPiper.wait