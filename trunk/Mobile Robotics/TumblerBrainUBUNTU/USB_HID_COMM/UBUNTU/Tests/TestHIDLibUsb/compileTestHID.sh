#!/bin/bash
# file.sh: a sample shell script to demonstrate the concept of Bash shell functions
# define usage function
#sudo apt-get install libusb-dev
# 'pkg-config --libs --cflags libusb-1.0'
gcc -o testHID3 testHID3.c  -lusb-1.0
