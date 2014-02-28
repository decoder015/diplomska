#!/usr/bin/python

import cgi
import sys
import subprocess
import shlex
import getpass
import time 

#print "Now do something as 'root'..."



#main
try:
	print "Content-type: text/html\n\n"
	# obtains current time
	timeStr = time.ctime( time.time() );
	print("Time is:" + timeStr + "\n");
	
	# log actions
	text_file = open("runcamlog.txt", "w");
	text_file.write("***********Cam control***************\n");
	text_file.write("Hello moving cam!\n");
	text_file.write("Time is :" + timeStr + "\n");
	
	#loop over arguments and save them in to a file
	arguments = cgi.FieldStorage();
	
	for i in arguments.keys():	
		#log args
		text_file.write("Arg id :" + i + "\n");
		text_file.write("Arg value :" + arguments[i].value + "\n");		
		#move servos
		if i == "X":
			text_file.write("Calling camcontrol for X axe:" +  arguments[i].value + "\n");			
			
			subprocess.call(shlex.split("python camcontrol.py -X " + str(arguments[i].value) ));
		elif i == "Y" :
			text_file.write("Calling camcontrol for Y axe:" +  arguments[i].value + "\n");
			
			subprocess.call(shlex.split("python camcontrol.py -Y " + str(arguments[i].value) ));
			
	#close file when finished	
	text_file.close();
	
except IOError:
    print "Cannot open file for writing"

#print "Now switch back to the calling user: " + getpass.getuser()