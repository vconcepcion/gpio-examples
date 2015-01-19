import RPi.GPIO as GPIO
import sys
import time
import pygame.mixer

pinIn = 18
pinOut = 17

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pinIn, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)
GPIO.setup(pinOut, GPIO.OUT)

pygame.mixer.init(48000, -16, 2, 1024)

filename = sys.argv[1]
pygame.mixer.music.load(filename)

def play(channel):
	print("Button pressed")
	pygame.mixer.music.play()

GPIO.add_event_detect(pinIn, GPIO.RISING, callback=play, bouncetime=300)

while True:
	try:
		time.sleep(1)
	except KeyboardInterrupt:
		sys.exit()