#!/bin/bash
# file.sh: a sample shell script to demonstrate the concept of Bash shell functions
# define usage function

gcc -o testUSB2 testUSB2.c  `pkg-config --libs --cflags libusb-1.0`
