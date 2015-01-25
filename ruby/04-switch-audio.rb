require 'rpi_gpio'

# Get filename from command line arguments
filename = ARGV[0]
raise "Incorrect number of arguments. Usage: ruby 04-switch-audio.rb song.mp3" unless filename

# Run `gpio readall` to confirm BCM pin number(s)
pin_in = 18   # button

RPi::GPIO.set_numbering(:bcm)
RPi::GPIO.set_warnings(0)
RPi::GPIO.setup(pin_in, as: :input, pull: :down)

def play(filename)
  # Use commandline omxplayer to play file:
  # http://www.raspberrypi.org/documentation/usage/audio/
  system("omxplayer '#{filename}'")
end

begin
  loop do
    if RPi::GPIO.high?(pin_in) # button input state is "on"
      play(filename)
      sleep(0.2)
    end
  end
rescue Interrupt
  puts 'Done'
ensure
  RPi::GPIO.clean_up
end