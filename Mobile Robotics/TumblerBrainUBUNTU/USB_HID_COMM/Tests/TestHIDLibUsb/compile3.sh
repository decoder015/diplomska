#!/bin/bash
# file.sh: a sample shell script to demonstrate the concept of Bash shell functions
# define usage function
#sudo apt-get install libusb-dev

gcc -o testUSB3 testUSB3.c -lusb `pkg-config --libs --cflags libusb-1.0`
