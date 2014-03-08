#!/usr/bin/python

#imports
from RPIO import PWM
import cgi
import time
import struct
import argparse
import math
import re

servo1Pin = 18;
servo2Pin = 15;
pwmServo = PWM.Servo()

prvX = 0;
prvY = 0;
C_INT_DELAY = 0.04;

C_INT_PWM_ZERO_POS = 1000;
C_INT_PWM_MAX_POS  = 2600;

C_PWM_COEF = (C_INT_PWM_MAX_POS - C_INT_PWM_ZERO_POS)/180.0;
#read last servos state
def ReadServosState ():
	try:
		servosState=[0,0];
		f = open('ServosState.txt');
		lines = f.readlines()
		for line in lines:
			#print line;
			mX = re.match( r'^X\s*=\s*(\d+)', line);
			mY = re.match( r'^Y\s*=\s*(\d+)', line);
			if(mX):
				#print "X : ", mX.groups()[0];
				servosState[0] = float(mX.groups()[0]);
			if(mY):
				#print "Y : ", mY.groups()[0];
				servosState[1] = float(mY.groups()[0]);		
		f.close();
	
		return servosState;
	except IOError:
		print "Cannot open file"

def WriteServoState():
	try :
		servoStateFile = open("ServosState.txt", "w");
		servoStateFile.write("X=%d\n" %(prvX));
		servoStateFile.write("Y=%d\n" %(prvY));			
	except IOError:
		print "IO error";
	return;
		
# Smooth motion for servos
def SmoothMove(angle, prevAngle, servoPin):

	try :
		if (angle - prevAngle) == 0:
			return;
		
		if( math.fabs(angle - prevAngle) == 1 ):
			dt = 1.0;
		elif( math.fabs(angle - prevAngle) < 90 ):
			dt = 0.15;
		else:
			dt = 0.1;
			
		#step = 0.;
		angleTmp = math.fabs(angle - prevAngle);
		#angle = angleTmp;
		step = math.floor(angle * dt);
		#noSteps = angle / step;
	
		print "dt:%f" %(dt);
		print "servo step"; print step;
		#print noSteps;
	
		sum = prevAngle;
		
		if(prevAngle < angle):
			print "Move servo from %d to %d" %(prevAngle, angle);
			while sum < angle :	
				sum = sum + angleTmp * dt;
				pwm = Ang2PWM(sum);
				
				print "PWM:" 	+ str(pwm) + "\n";
				print "Angle:" 	+ str(sum) + "\n";
				
				pwmServo.set_servo(servoPin, pwm);
				time.sleep(C_INT_DELAY);
				
				
		else:
			print "Move servo from %d to %d" %(angle, prevAngle);
			while sum > angle :
				# calc step angle
				sum = sum - angleTmp * dt;
				pwm = Ang2PWM(sum);
				
				#display vals	
				print "PWM:" 	+ str(pwm) + "\n";
				print "Angle" 	+ str(sum) + "\n";
				
				#send PWM to servo
				pwmServo.set_servo(servoPin, pwm);
				time.sleep(C_INT_DELAY);			
						
	except IOError:
		print "IO error";
		pwmServo.stop_servo(servoPin);		
		
	pwmServo.stop_servo(servoPin);
	return;

# Convert angle to PWM
def Ang2PWM(angle):

	pwm = -10.0;
	if( angle < 0):		
		return C_INT_PWM_ZERO_POS;
	elif (angle > 180 ):		
		return C_INT_PWM_MAX_POS;
		
	pwm = math.floor(angle * C_PWM_COEF + C_INT_PWM_ZERO_POS);
	
	# 10us sec increment in PWM
	if( pwm % 10 > 0):
		pwm = pwm + (10 - pwm % 10);
	
	#return the largest integer value less than or equal to x.
	return pwm;

# Move Servo 1 - X axe
def MoveServo1AxeX(angle, prevAngleX, logFile):		
	
	# position servo 1 for given angle
	SmoothMove(angle, prevAngleX, servo1Pin);	
	
	#log last position
	logFile.write("Servo 1 X axe :" + str(angle) + "\n");
	
	#pwPr = struct.pack('d', pwVal);	
	#logFile.write("PWM val:" + pwPr + "\n");
	return 1;

# Move Servo 2 - Y axe	
def MoveServo2AxeY(angle, prevAngleY, logFile):
	
	# position servo 2 for given angle
	SmoothMove(angle, prevAngleY, servo2Pin);	
	
	#log last position
	logFile.write("Servo 2 Y axe :" + str(angle) + "\n");
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
	
	#read last known servo states
	servoStates= ReadServosState();
	prvX = servoStates[0];
	prvY = servoStates[1];
	
	print "PrevX:" + str(prvX) +"\n";
	print "PrevY:" + str(prvY) +"\n";
	
	X = -99999;
	Y = -99999;	
	
	if(namespace.X is not None):
		X = namespace.X;
	elif (namespace.Y is not None):
		Y = namespace.Y;		
	
	#print namespace.filename;
	text_file.write("X:" + str(X) + "\n");
	text_file.write("Y:" + str(Y) + "\n");	
	print "X :" + str(X);
	print "Y :" + str(Y);

	print ( X >= 0  ) ;
	print ( X < 180 );
	if( X >= 0 and X <= 180):
		#print "Move along x\n";
		MoveServo1AxeX(X, prvX, text_file);
		prvX = X;
	elif( Y >= 0 and Y <= 180):
		MoveServo2AxeY(Y, prvY, text_file);
		prvY = Y;
		
	#write servos state	
	WriteServoState();

except IOError:
    print "Cannot open file for writing";
