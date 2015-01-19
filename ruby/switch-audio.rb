require 'omxplayer'
require 'pi_piper'
include PiPiper

pin_in_num = 18
filename = ARGV[0]

after :pin => pin_in_num, :goes => :high do
	Omxplayer.instance.open(filename)
end

PiPiper.wait