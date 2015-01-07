require 'pi_piper'
include PiPiper

pin_in_num = 18
pin_out = PiPiper::Pin.new(:pin => 17, :direction => :out)

def blink(pin)
	puts "Button pressed"
	pin.on
	sleep(0.2)
	pin.off
end

after :pin => pin_in_num, :goes => :high do
	blink(pin_out)
end

PiPiper.wait