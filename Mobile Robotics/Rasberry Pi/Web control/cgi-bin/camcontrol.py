#!/usr/bin/python

#imports
import cgi
import time
import struct
import argparse
#import RPi.GPIO as GPIO

#servo1Pin = 11;
#servo1Pin = 12;

# set pin numbering mode
# Board : use pin numbers
#GPIO.setmode(GPIO.BOARD)

#GPIO.setup(servo1Pin, GPIO.OUT)
#GPIO.setup(servo2Pin, GPIO.OUT)

# Set PWM freq. to 50 Hz
#pwmServo1 = GPIO.PWM(servo1Pin, 50)
#pwmServo2 = GPIO.PWM(servo2Pin, 50)

# Smooth motion for servos
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
	dt = 0.05;
	step = 0;
	
	#calculate number of steps and step val
	step = math.floor(angle * dt);
	noSteps = angle / step;
	
	time.sleep(5);
	sum = 0;
	while sum < angle :	
		#integrate angle value to get smooth motion
		sum = sum + angle * dt;
		
		#convert angle to PW modulation
		pwm =  Ang2PWM(sum);
		
		#TODO move servo
		try:
			#pwmServo1.ChangeDutyCycle(pwm); 
			time.sleep(1)
		except IOError:
			logFile.write("Error moving servo!\n");
			
		#set delay	
		#time.sleep(1);	
	
	
	#write to log
	#print "servo step"; print step;
	#print noSteps;
	logFile.write("Servo 1 X axe :" + angle + "\n");
	#pwPr = struct.pack('d', pwVal);	
	#logFile.write("PWM val:" + pwPr + "\n");
	return 1;

# Move Servo 2 - Y axe	
def MoveServo2AxeY(angle, logFile):
	dt = 0.05;
	step = 0;
	
	#calculate number of steps and step val
	step = math.floor(angle * dt);
	noSteps = angle / step;
	
	time.sleep(5);
	sum = 0;
	while sum < angle :	
		#integrate angle value to get smooth motion
		sum = sum + angle * dt;
		
		#convert angle to PW modulation
		pwm =  Ang2PWM(sum);
		
		#TODO move servo
		
		#set delay	
		time.sleep(1);	
	
	logFile.write("Servo 2, Y axe :" + servoValue + "\n");
	pwPr = struct.pack('d', pwVal);	
	logFile.write("PWM val:" + pwPr + "\n");
	return 1;	

# main
try :
	text_file = open("camcontrol.txt", "w");	
	text_file.write("***********Cam control***************\n");
	text_file.write("Hello moving cam!\n");	
	
	#parse arguments
	parser = argparse.ArgumentParser();	
	parser.add_argument('-X', '--X', action='store', help='file!');
	parser.add_argument('-Y', '--Y', action='store', help='file!');
	namespace = parser.parse_args();
		
	X = -99999;
	Y = -99999;
	
	if(namespace.X is not None):
		X = namespace.X;
	elif (namespace.Y is not None):
		Y = namespace.Y;		
	
	#print namespace.filename;
	text_file.write("X:" + str(X) + "\n");
	text_file.write("Y:" + str(Y) + "\n");	

	if ( X >= 0 and X <= 180):
		MoveServo1AxeX(X, text_file);
	elif Y >= 0 and Y <= 180:
		MoveServo2AxeX(Y, text_file);

except IOError:
    print "Cannot open file for writing";