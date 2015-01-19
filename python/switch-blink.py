import RPi.GPIO as GPIO
import time

pinIn = 18
pinOut = 17

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pinIn, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)
GPIO.setup(pinOut, GPIO.OUT)

def blink(channel):
	print("Button pressed")
	GPIO.output(pinOut,GPIO.HIGH)
	time.sleep(0.2)
	GPIO.output(pinOut,GPIO.LOW)

GPIO.add_event_detect(pinIn, GPIO.RISING, callback=blink, bouncetime=300)

while True:
	time.sleep(1)

GPIO.cleanup()