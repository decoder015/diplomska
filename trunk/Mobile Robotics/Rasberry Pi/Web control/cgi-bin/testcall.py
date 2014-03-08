#!/usr/bin/python

import cgi
import sys
import subprocess
import shlex
import getpass
import time 
import os


print "Content-type: text/html\n\n"

print "<h1>Test call</h1>";
# obtains current time
timeStr = time.ctime( time.time() );
print("Time is:" + timeStr + "\n");

#sudoPassword = "h";
#command = "python camcontrol.py -Y " + str(180); 

#p = os.system('echo test >> test.txt' );

print "<h3>This script was called by: " + getpass.getuser() + "</h3>";

p = os.system('sudo echo sudo Time is :%s >> test.txt' %(timeStr));

p = os.system('sudo python camcontrol.py -Y 90');

#print "Now do something as 'root'..."
#subprocess.call(shlex.split('echo test >> test.txt'))
#sh = Popen('echo %s >> test.txt' %(timeStr), shell=True, stdout=PIPE, stderr=PIPE);


#print sh.communicate();
print "<h3>Now switch back to the calling user: " + getpass.getuser() + "</h3>"