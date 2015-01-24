import RPi.GPIO as GPIO
import time

# Run `gpio readall` to confirm BCM pin number(s)
pinOut = 17	# LED

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pinOut, GPIO.OUT)

def blink(pin):
  GPIO.output(pin,GPIO.HIGH)
  time.sleep(0.5)
  GPIO.output(pin,GPIO.LOW)
  time.sleep(0.5)
  return

try:
  for i in range(0,5):
    blink(pinOut)
finally:
  GPIO.cleanup()
  print("\nDone")