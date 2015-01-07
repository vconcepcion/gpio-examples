import RPi.GPIO as GPIO
import time

pinIn = 18

GPIO.setmode(GPIO.BCM)
GPIO.setup(pinIn, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)

def printFunction(channel):
	print("Button pressed")

GPIO.add_event_detect(pinIn, GPIO.RISING, callback=printFunction, bouncetime=300)

while True:
	time.sleep(1)

GPIO.cleanup()