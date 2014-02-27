#!/usr/bin/python

#imports
import cgi
import time
import struct

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
		
		#set delay	
		time.sleep(1);	
	
	
	#write to log
	#print "servo step"; print step;
	#print noSteps;
	logFile.write("Servo 1 X axe :" + servoValue + "\n");
	pwPr = struct.pack('d', pwVal);	
	logFile.write("PWM val:" + pwPr + "\n");
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

#html header
print "Content-type: text/html\n\n"

#main
try:
	# obtains current time
	timeStr = time.ctime( time.time() ); 
	print("Time is:" + timeStr + "\n");
	
	# log actions
	text_file = open("Camlog.txt", "w");
	text_file.write("***********Cam control***************\n");
	text_file.write("Hello moving cam!\n");
	text_file.write("Time is :" + timeStr + "\n");
	
	#loop over arguments and save them in to a file
	arguments = cgi.FieldStorage();
	for i in arguments.keys():		
		 #log args
		text_file.write("Arg id :" + i + "\n")	
		text_file.write("Arg value :" + arguments[i].value + "\n")
		
		#move servos
		if i == "X":
			MoveServo1AxeX(arguments[i].value, text_file);
		elif i == "Y" :
			MoveServo2AxeY(arguments[i].value, text_file);
			
	#close file when finished	
	text_file.close()
except IOError:
    print "Cannot open file for writing"

 

