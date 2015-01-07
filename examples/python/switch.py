import RPi.GPIO as GPIO
import time

pinIn = 18

GPIO.setmode(GPIO.BCM)
GPIO.setup(pinIn, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)

while True:
	if(GPIO.input(pinIn) == 1):
		print("Button pressed")
		time.sleep(0.2)

GPIO.cleanup()