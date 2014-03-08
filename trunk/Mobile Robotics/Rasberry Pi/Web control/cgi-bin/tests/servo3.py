#!/usr/bin/env python

from RPIO import PWM
import time

servo = PWM.Servo()

while  True :
	servo.set_servo(18, 1000)

	time.sleep(1);
	servo.set_servo(18, 1500)
	
	time.sleep(1);
	servo.set_servo(18, 2000)
	time.sleep(1);
servo.stop_servo(18)
