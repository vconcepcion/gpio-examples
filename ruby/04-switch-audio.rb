require 'pi_piper'
include PiPiper

# Run `gpio readall` to confirm BCM pin number(s)
pin_in = 18

# Get filename from command line arguments
filename = ARGV[0]

# Watch for button state to change from "0" to "1"
after :pin => pin_in, :goes => :high do
	puts "Button pressed"
	# Use commandline omxplayer to play file:
	# http://www.raspberrypi.org/documentation/usage/audio/
	system("omxplayer '#{filename}'")
end

PiPiper.wait