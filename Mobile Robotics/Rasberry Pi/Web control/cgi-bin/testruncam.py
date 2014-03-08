import cgi
import sys
import subprocess
import shlex
import getpass
import time 
import os

sudoPassword = "h";
command = "python camcontrol.py -Y " + str(180); 
p = os.system('echo %s|sudo -S %s' % (sudoPassword, command));