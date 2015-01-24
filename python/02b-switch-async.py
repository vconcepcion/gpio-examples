import RPi.GPIO as GPIO
import time

# Run `gpio readall` to confirm pin number(s)
pinIn = 18	# button

GPIO.setmode(GPIO.BCM)
GPIO.setup(pinIn, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)

def printFunction(channel):
  print("Button pressed")

# Call printFunction when button state rises from "0" to "1"
GPIO.add_event_detect(pinIn, GPIO.RISING, callback=printFunction, bouncetime=300)

try:
  while True:
    time.sleep(1)
except KeyboardInterrupt:
  print("\nDone")
finally:
  GPIO.cleanup()