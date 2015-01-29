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

//debug 
#include <debug.h>

//togle DEBUG mode
//#define DEBUG


//LCD
#include <LiquidCrystal.h>

//sensor
#include <Wire.h>
#include <MS561101BA.h>

//beeper
#define GOUP 1
#define GODOWN 0
#define beep_freq_go_up   400 //Hz
#define beep_freq_go_down 200 //Hz
#define beep_duration 500

#define MOVAVG_SIZE 32

//constants
const float sea_press = 1013.25;

//variables
float alt = 0;
float temp = 0;
float pres = 0;
float vario = -1.5;

int movavg_i=0;
float movavg_buff[MOVAVG_SIZE];

MS561101BA baro = MS561101BA();

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 1, 0);

float prevAlt = 0;
float avgTempSum = 0;
float avgPressSum = 0;


void Beep(int updown)
{
   //beeper  
  if(updown == GOUP)
     tone(A0, beep_freq_go_up, 400);    
  else
     tone(A0, beep_freq_go_down, 200);
}

void setup() 
{
 
 Wire.begin();
 Serial.begin(9600); 
 
 #ifdef DEBUG
   delay(25000);  
 #endif
 
 DEBUG_PRINTLN("INIT:Serial port initialized..."); 
  
 //beeper
 pinMode(A0, OUTPUT);
 DEBUG_PRINTLN("INIT: A0 pin set to output...");
  
 // initialize digital pin 13 as an output.
 //pinMode(13, OUTPUT);
 DEBUG_PRINTLN("INIT: Pin 13 set to output...");
  
 // set up the LCD's number of columns and rows: 
 lcd.begin(16, 2);
 DEBUG_PRINTLN("INIT: LCD initialized...");
 
 //move coursor to next line
 lcd.setCursor(0,1);
  
 // Suppose that the CSB pin is connected to GND.
 // You'll have to check this on your breakout schematics
 baro.init(MS561101BA_ADDR_CSB_LOW); 
 DEBUG_PRINTLN("INIT: Baro initialized...");
 
 delay(10);
  
 // populate movavg_buff before starting loop
 DEBUG_PRINTLN("INIT: Avg buff initialized...");
 for(int i=0; i<MOVAVG_SIZE; i++)
 {
    DEBUG_PRINTLN("INIT: Get press start...");
    
    pres =  baro.getPressure(MS561101BA_OSR_4096);   
    movavg_buff[i] = pres;
    
    DEBUG_PRINTLN("INIT: Get press end...");
 }
   
}

void loop() {

  // turn the LED on by making the voltage HIGH
  digitalWrite(13, HIGH);
  
  //get temperature
  DEBUG_PRINTLN("#####################Loop: Start read temp...#####################");
  temp = -1;
  while(temp <=0 )
  {
    temp= baro.getTemperature(MS561101BA_OSR_4096);
    DEBUG_PRINT("```````````````````````````Current temp:");
    DEBUG_PRINTLN(temp);
  }
  DEBUG_PRINTLN("#####################Loop: End read temp...#####################");
  
  delay(10);
  
  // get pressure
  DEBUG_PRINTLN("#####################Loop: Start read press...#####################");
  pres = -1;  
  while(pres <= 0)
  {
    pres = baro.getPressure(MS561101BA_OSR_4096);
    DEBUG_PRINT("```````````````````````````Current resss:");
    DEBUG_PRINTLN(pres);    
  }
  DEBUG_PRINTLN("#####################Loop: End read press...#####################"); 
  
  // turn the LED off (HIGH is the voltage level)  
  digitalWrite(13, LOW);
     
  pushAvg(pres);    
  pres = getAvg(movavg_buff, MOVAVG_SIZE);
  DEBUG_PRINTLN("Loop: Calc avg. press...");
  
  //get altitude
  alt  = getAltitude(pres, temp);  
  DEBUG_PRINTLN("Loop: Calc alt...");
  
  
  //compute vario  
  //if(abs(prevAlt - alt) > dV)
  //{   
    //vario = prevAlt - alt;
    //if(vario > 0)
    //    Beep(GOUP);
    //else 
     //   Beep(GODOWN);
 // }
  //else
  //vario = 0;
  
  
  //Print a message to the LCD.  
  //first line
  lcd.setCursor(0,0);
  lcd.print("A:" );  
  lcd.print(Round(alt,1), 1);
  lcd.print("m");  
  
  //print vario on LCD
  lcd.print(" V:");
  lcd.print(vario);  
  
  //second line
  lcd.setCursor(0,1);
  lcd.print("P:");
  lcd.print(Round(pres,2), 2);
  lcd.print("m ");
  
  //print temp
  lcd.print("T:");
  lcd.print(Round(temp, 1), 1);  
  
  prevAlt = alt;
  
  delay(20);
  
  //print on serial port
  DEBUG_PRINT("Actual TEMP= ");
  DEBUG_PRINTLN(temp);
  DEBUG_PRINT("Actual PRESSURE= ");
  DEBUG_PRINTLN(pres);
  DEBUG_PRINT("Actual ALT= ");
  DEBUG_PRINTLN(alt);
  DEBUG_PRINT("PREV ALT= ");
  DEBUG_PRINTLN(prevAlt);
  DEBUG_PRINT("Vario");
  DEBUG_PRINTLN(vario); 
  DEBUG_PRINTLN("-------------------------------------------");
}

float getAltitude(float press, float temp) {
  //return (1.0f - pow(press/101325.0f, 0.190295f)) * 4433000.0f;
  return ((pow((sea_press / press), 1/5.257) - 1.0) * (temp + 273.15)) / 0.0065;
}

void pushAvg(float val) {
  movavg_buff[movavg_i] = val;
  movavg_i = (movavg_i + 1) % MOVAVG_SIZE;
}

float getAvg(float * buff, int size) {
  float sum = 0.0;
  for(int i=0; i<size; i++) {
    sum += buff[i];
  }
  return sum / size;
}


//round float 
float Round(float n, int places)
{
    int digitPlace = 1;       
    float d;
    int   i;
  
    for(i=1; i<=places; i++)
      digitPlace *= 10;
      
    /* rescale 123.45678 to 12345.678 */ 
    d = n * digitPlace;
    
    /* round off: 12345.678 + 0.5 = 12346.178 -> 12346 */ 
    i = d + 0.5;
    
    /* restore to its original scale: 12346 -> 123.46 */
    d = (float)i / digitPlace;

    return d;
}
