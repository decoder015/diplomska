#!/bin/bash
# file.sh: a sample shell script to demonstrate the concept of Bash shell functions
# define usage function
#sudo apt-get install libusb-de
echo "Must run with sudo!\n";


gcc  -o ./bin/tumblerDriveHidTerminal ./src/TumblerDriveHidTerminal.c ./src/hid-libusb.c `pkg-config --libs --cflags libusb-1.0`

