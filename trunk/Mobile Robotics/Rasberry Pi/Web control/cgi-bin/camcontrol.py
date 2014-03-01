#!/usr/bin/python

#imports
import cgi
import time
import struct
import argparse
import math
import RPi.GPIO as GPIO

servo1Pin = 13;
servo2Pin = 11;

# set pin numbering mode
# Board : use pin numbers
GPIO.setmode(GPIO.BOARD)

GPIO.setup(servo1Pin, GPIO.OUT)
GPIO.setup(servo2Pin, GPIO.OUT)

# Set PWM freq. to 50 Hz
pwmServo1 = GPIO.PWM(servo1Pin, 50)
pwmServo2 = GPIO.PWM(servo2Pin, 50)

# Smooth motion for servos
def SmoothMove(angle, servo):
	dt = 0.05;
	#step = 0.;
	step = math.floor(angle * dt);
	#noSteps = angle / step;

	print "servo step"; print step;
	#print noSteps;
	
	sum = 0;
	time.sleep(0.2);
	servo.start(0);	
	while sum < angle :
		sum = sum + angle * dt;
		pwm =  Ang2PWM(sum);		
		servo.ChangeDutyCycle(pwm); 
		time.sleep(0.2);
		print pwm;
	return;

# Convert angle to PWM
def Ang2PWM(angle):
	pwm = -10.0;
	if( angle < 0 or angle > 180 ):
		pwm = -1;
		return pwm;
		
	c = 10.0/180.0;
	pwm = angle * c + 2.5;
	return pwm;

# Move Servo 1 - X axe
def MoveServo1AxeX(angle, logFile):	
	
	# position servo 1 for given angle
	SmoothMove(angle, pwmServo1);	
	
	#log last position
	logFile.write("Servo 1 X axe :" + str(angle) + "\n");
	
	#pwPr = struct.pack('d', pwVal);	
	#logFile.write("PWM val:" + pwPr + "\n");
	return 1;

# Move Servo 2 - Y axe	
def MoveServo2AxeY(angle, logFile):
	
	# position servo 2 for given angle
	SmoothMove(angle, pwmServo2);	
	
	#log last position
	logFile.write("Servo 1 X axe :" + str(angle) + "\n");
	return 1;

# main
try :
	text_file = open("camcontrol.txt", "w");	
	text_file.write("***********Cam control***************\n");
	text_file.write("Hello moving cam!\n");	
	
	#parse arguments
	parser = argparse.ArgumentParser();	
	parser.add_argument('-X', '--X', action='store', help='file!', type=int);
	parser.add_argument('-Y', '--Y', action='store', help='file!', type=int);
	namespace = parser.parse_args();
		
	X = -99999;
	Y = -99999;
	
	print "Parse args \n";
	if(namespace.X is not None):
		X = namespace.X;
	elif (namespace.Y is not None):
		Y = namespace.Y;		
	
	#print namespace.filename;
	text_file.write("X:" + str(X) + "\n");
	text_file.write("Y:" + str(Y) + "\n");	
	print "X"; print X;
	print "Y"; print Y;

	print ( X >= 0  ) ;
	print ( X < 180 );
	if( X >= 0 and X <= 180):
		print "Move along x\n";
		MoveServo1AxeX(X, text_file);
	elif( Y >= 0 and Y <= 180):
		MoveServo2AxeY(Y, text_file);

except IOError:
    print "Cannot open file for writing";
