require 'pi_piper'
include PiPiper

pin_in = 18

after :pin => pin_in, :goes => :high do
  puts "Button pressed"
end

PiPiper.wait