require 'rpi_gpio'

# Run `gpio readall` to confirm BCM pin number(s)
pin_in = 18   # button
pin_out = 17  # LED

RPi::GPIO.set_numbering(:bcm)
RPi::GPIO.set_warnings(0)
RPi::GPIO.setup(pin_in, as: :input, pull: :down)
RPi::GPIO.setup(pin_out, as: :output)

def blink(pin)
  puts("Button pressed")
  RPi::GPIO.set_high(pin)
  sleep(0.2)
  RPi::GPIO.set_low(pin)
end

begin
  loop do
    if RPi::GPIO.high?(pin_in) # button input state is "on"
      blink(pin_out)
      sleep(0.2)
    end
  end
rescue Interrupt
  puts 'Done'
ensure
  RPi::GPIO.clean_up
end