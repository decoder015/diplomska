import RPi.GPIO as GPIO
import time

pin = 11
refresh_period = 2

GPIO.setmode(GPIO.BOARD)

GPIO.setup(pin, GPIO.OUT)

try:
	while True:
        	GPIO.output(pin, 1)
               	time.sleep(0.0025)
                GPIO.output(pin, 0)
                time.sleep(refresh_period)		


except KeyboardInterrupt:
	GPIO.cleanup()
