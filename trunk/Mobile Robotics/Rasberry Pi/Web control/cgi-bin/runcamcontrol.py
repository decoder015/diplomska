#!/usr/bin/python

import cgi
import sys
import subprocess
import shlex
import getpass
import time 
import os
#print "Now do something as 'root'..."

#main
try:
	sudoPassword = 'h'
	
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
			command = 'python camcontrol.py -X %s'  %(arguments[i].value); 
			#px = os.system('echo h|sudo -S mkdir tt1');	
			#px = os.system('echo %s|sudo -S %s' %(sudoPassword, command));			
			
			#test_file.write(str(px));
			text_file.write("%s\n" %(command));			
			text_file.write("Calling camcontrol for X axe: %s\n" %(arguments[i].value) );						
			subprocess.call(shlex.split("sudo python camcontrol.py -X " + str(arguments[i].value) ));
		elif i == "Y" :					
			command = 'python camcontrol.py -Y %s' %(arguments[i].value); 		
			#py = os.system('echo %s|sudo -S %s' %(sudoPassword, command));
			
			#test_file.write(str(py));
			text_file.write("%s\n" %(command));
			text_file.write("Calling camcontrol for Y axe: %s \n" %(arguments[i].value) );
			subprocess.call(shlex.split("sudo python camcontrol.py -Y " + str(arguments[i].value) ));
			
	#close file when finished	
	text_file.close();
	
except IOError:
    print "Cannot open file for writing"
