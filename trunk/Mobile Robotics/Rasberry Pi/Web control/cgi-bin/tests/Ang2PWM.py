#!/usr/bin/python
import cgi
import math
import time
#cgi.test()

def Ang2PWM(angle):
	pwm = 0;
	if(angle< 0 or angle > 180):
		pwm = -1;
		return pwm;

	t = 10.0/180.0;
	pwm = angle * t + 2.5;

	print "Angle :";
	print angle;	
	print "\n\n";

	print "PWM :";
	print pwm;
	print "\n\n";

	return pwm;

def SmoothMove(angle):
	dt = 0.05;
	step = 0;
	step = math.floor(angle * dt);
	noSteps = angle / step;

	print "servo step"; print step;
	print noSteps;
	time.sleep(5);
	sum = 0;
	while sum < angle :
		sum = sum + angle * dt;
		pwm =  Ang2PWM(sum);		
		time.sleep(1);
		print pwm;
	return;


angle = 90;
print "smooth move"
SmoothMove(angle);
print "End smooth move";

pwm = Ang2PWM(angle);
pwm = Ang2PWM(0);
pwm = Ang2PWM(20);
pwm = Ang2PWM(180);
pwm = Ang2PWM(220);

