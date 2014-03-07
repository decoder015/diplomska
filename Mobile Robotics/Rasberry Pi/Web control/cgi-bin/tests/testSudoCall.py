#!/usr/bin/python

import subprocess
import shlex
import getpass
import RPi.GPIO as GPIO

print "This script was called by: " + getpass.getuser()

print "Now do something as 'root'..."
subprocess.call(shlex.split('sudo python servo2.py'))

print "Now switch back to the calling user: " + getpass.getuser()