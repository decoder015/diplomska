import RPi.GPIO as GPIO
import time

pin = 11
pins = 13
refresh_period = 2

GPIO.setmode(GPIO.BOARD)
GPIO.setup(pin, GPIO.OUT)

p = GPIO.PWM(pin, 50)
p.start(2.5)
try:
#	while True:
        	p.ChangeDutyCycle(2.5) #move to 0
               	time.sleep(1)
                p.ChangeDutyCycle(7.5) #move to 90
                time.sleep(1)
		p.ChangeDutyCycle(12.5)	#move to 180	
        	time.sleep(1)


except KeyboardInterrupt:
	p.stop()
	GPIO.cleanup()
