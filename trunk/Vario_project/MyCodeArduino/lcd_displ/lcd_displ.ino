/*
  LiquidCrystal Library - display() and noDisplay()
 
 Demonstrates the use a 16x2 LCD display.  The LiquidCrystal
 library works with all LCD displays that are compatible with the 
 Hitachi HD44780 driver. There are many of them out there, and you
 can usually tell them by the 16-pin interface.
 
 This sketch prints "Hello World!" to the LCD and uses the 
 display() and noDisplay() functions to turn on and off
 the display.
 
 The circuit:
 * LCD RS pin to digital pin 12
 * LCD Enable pin to digital pin 11
 * LCD D4 pin to digital pin 5
 * LCD D5 pin to digital pin 4
 * LCD D6 pin to digital pin 3
 * LCD D7 pin to digital pin 2
 * LCD R/W pin to ground
 * 10K resistor:
 * ends to +5V and ground
 * wiper to LCD VO pin (pin 3)
 
 Library originally added 18 Apr 2008
 by David A. Mellis
 library modified 5 Jul 2009
 by Limor Fried (http://www.ladyada.net)
 example added 9 Jul 2009
 by Tom Igoe 
 modified 22 Nov 2010
 by Tom Igoe

 This example code is in the public domain.

 http://arduino.cc/en/Tutorial/LiquidCrystalDisplay

 */

// include the library code:
#include <LiquidCrystal.h>

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

char buff[16];
int temp = 25;
int alt=2000;
int p = 2600;
float vario = -1.5;
char vario_str[4];

void setup() {
  // set up the LCD's number of columns and rows: 
  lcd.begin(16, 2);
  
  // Print a message to the LCD.
  //lcd.print("Alt:2345 V:-1.7");
  
  //move coursor to next line
  lcd.setCursor(0,1);
//  lcd.print("P:2056Hpa T:25C");
}



void loop() {
  // Turn off the display:
  //lcd.noDisplay();
  delay(500);
  
  vario_str[0] = '\0';
  dtostrf(vario,7, 4, vario_str);
  sprintf(buff, "Alt:%dm V:%s", alt,  vario_str);  
  
  // Print a message to the LCD.
  lcd.setCursor(0,0);
  lcd.print(buff);
  
  //move coursor to next line
  buff[0] = '\0';
  sprintf(buff, "P:%dHpa T:%dC", p, temp);  
  
  // Print a message to the LCD.
  lcd.setCursor(0,1);
  lcd.print(buff);
  
  temp++;
  alt++;
  vario += 0.1;
  
   // Turn on the display:
  //lcd.display();
  delay(1500);
}
