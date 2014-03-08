#!/usr/bin/python

import cgi
import sys
#import subprocess
import shlex
import getpass
import time 
import os
import re



def ReadServo1State ():
	try:
		servosState=[0,0];
		f = open('ServosState.txt');
		lines = f.readlines()
		for line in lines:
			#print line;
			mX = re.match( r'^X\s*=\s*(\d+)', line);
			mY = re.match( r'^Y\s*=\s*(\d+)', line);
			if(mX):
				print "X : ", mX.groups()[0];
				servosState[0] = mX.groups()[0];
			if(mY):
				print "Y : ", mY.groups()[0];
				servosState[1] = mY.groups()[0];		
		f.close();
	
		return servosState;
	except IOError:
		print "Cannot open file"


states = ReadServo1State();

print states;
print "X ="
print states[0];