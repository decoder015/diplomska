#!/usr/bin/python
import cgi
import sys
import subprocess
import shlex
import getpass
import time 
import os


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
		
	    # send value to camcontroler
		if i == "X" :			
			command = "sudo python camcontrol.py -X %s" %(arguments[i].value);
			subprocess.call(shlex.split("sudo nice -n 90 python camcontrol.py -X %s" %(arguments[i].value) ));
			
			text_file.write("%s\n" %(command));			
			text_file.write("Calling camcontrol for X axe: %s\n" %(arguments[i].value) );						
		elif i == "Y" :					
			command = 'sudo python camcontrol.py -Y %s' %(arguments[i].value); 		
			subprocess.call(shlex.split("sudo nice -n 90 python camcontrol.py -Y " + str(arguments[i].value) ));		
			
			text_file.write("%s\n" %(command));
			text_file.write("Calling camcontrol for Y axe: %s \n" %(arguments[i].value) );
			
	#close file when finished	
	text_file.close();
	
except IOError:
    print "Cannot open file for writing"
