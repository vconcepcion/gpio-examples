require 'pi_piper'
include PiPiper

# Run `gpio readall` to confirm BCM pin number(s)
pin_in = 18	# button

# Watch for button state to change from "0" to "1"
after :pin => pin_in, :goes => :high do
  puts "Button pressed"
end

PiPiper.wait