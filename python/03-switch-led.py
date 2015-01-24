import RPi.GPIO as GPIO
import time

# Run `gpio readall` to confirm pin number(s)
pinIn = 18	# button
pinOut = 17	# LED

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pinIn, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)
GPIO.setup(pinOut, GPIO.OUT)

def blink(channel):
  print("Button pressed")
  GPIO.output(pinOut,GPIO.HIGH)
  time.sleep(0.2)
  GPIO.output(pinOut,GPIO.LOW)

# Call blink when button state rises from "0" to "1"
GPIO.add_event_detect(pinIn, GPIO.RISING, callback=blink, bouncetime=300)

try:
  while True:
    time.sleep(1)
except KeyboardInterrupt:
  print("\nDone")
finally:
  GPIO.cleanup()