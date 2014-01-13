#!/bin/bash
# file.sh: a sample shell script to demonstrate the concept of Bash shell functions
# define usage function
#sudo apt-get install libusb-de
gcc  -o testHIDAPI testHIDAPI.c hid-libusb.c `pkg-config --libs --cflags libusb-1.0`

