#!/usr/bin/python
import cgi
import time

print "Content-type: text/html\n\n"
print "Hello moving left \n"

try:
	# get time stamp
	timeStr = time.ctime( time.time() ) # obtains current time
	print("Time is:" + timeStr + "\n")
	
	# log actions
	text_file = open("Output.txt", "w")
	text_file.write("Hello moving left:\n")
	text_file.write("Time is:" +  timeStr + "\n")
	
	#loop over arguments and save them in to a file
	arguments = cgi.FieldStorage()
	for i in arguments.keys():		
		print arguments[i].value
		text_file.write("Arg idex" + i)	
		text_file.write("Arg passed:" + arguments[i].value + "\n")
		
	
	
	text_file.close()
except IOError:
    print "Cannot open file for writing"
	
 
print "<h1>{timeStr} <\h1>"
