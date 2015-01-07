import RPi.GPIO as GPIO
import time

pinOut = 17

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pinOut, GPIO.OUT)

def blink(pin):
    GPIO.output(pin,GPIO.HIGH)
    time.sleep(0.5)
    GPIO.output(pin,GPIO.LOW)
    time.sleep(0.5)
    return

for i in range(0,5):
    blink(pinOut)

GPIO.cleanup()