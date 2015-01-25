require 'rpi_gpio'

# Run `gpio readall` to confirm BCM pin number(s)
pin_in = 18 # button

RPi::GPIO.set_numbering(:bcm)
RPi::GPIO.set_warnings(0)
RPi::GPIO.setup(pin_in, as: :input, pull: :down)

begin
  loop do
    if RPi::GPIO.high?(pin_in) # button input state is "on"
      puts 'Button pressed'
      sleep(0.2)
    end
  end
rescue Interrupt
  puts 'Done'
ensure
  RPi::GPIO.clean_up
end