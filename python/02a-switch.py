import RPi.GPIO as GPIO
import time

# Run `gpio readall` to confirm pin number(s)
pinIn = 18	# button

GPIO.setmode(GPIO.BCM)
GPIO.setup(pinIn, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)

try:
  while True:
    if(GPIO.input(pinIn) == 1):	# button input state is "on"
      print("Button pressed")
      time.sleep(0.2)
except KeyboardInterrupt:
  print("\nDone")
finally:
  GPIO.cleanup()