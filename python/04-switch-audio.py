import RPi.GPIO as GPIO
import sys
import time
import argparse
import pygame.mixer

# Run `gpio readall` to confirm pin number(s)
pinIn = 18  # button
pinOut = 17 # LED

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pinIn, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)
GPIO.setup(pinOut, GPIO.OUT)

# Audio setup:
# frequency (48 KHz), size (unsigned 16-bit), channels (2=stereo), buffer size (1024)
pygame.mixer.init(48000, -16, 2, 1024)

parser = argparse.ArgumentParser()
parser.add_argument('filename', help='path to audio file')
args = parser.parse_args()

# Get filename from command line arguments
filename = args.filename
pygame.mixer.music.load(filename)

print("Ready")

def play(channel):
  print("Button pressed")
  pygame.mixer.music.play()

# Call play when button state rises from "0" to "1"
GPIO.add_event_detect(pinIn, GPIO.RISING, callback=play, bouncetime=300)

try:
  while True:
    time.sleep(1)
except KeyboardInterrupt:
  print("\nDone")
finally:
  GPIO.cleanup()