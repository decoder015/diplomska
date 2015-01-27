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
const int sumC = 3;
const float dV = 0.5;
const float sea_press = 1013.25;

//variables
float alt = 0;
float temp = 0;
float pres = 0;
float vario = -1.5;

MS561101BA baro = MS561101BA();
int movavg_i=0;
float movavg_buff[MOVAVG_SIZE];

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
 delay(25000);  
 
 Serial.println("INIT:Serial port initialized..."); 
  
 //beeper
 pinMode(A0, OUTPUT);
 Serial.println("INIT: A0 pin set to output...");
  
 // initialize digital pin 13 as an output.
 //pinMode(13, OUTPUT);
 Serial.println("INIT: Pin 13 set to output...");
  
 // set up the LCD's number of columns and rows: 
 lcd.begin(16, 2);
 Serial.println("INIT: LCD initialized...");
 
 //move coursor to next line
 lcd.setCursor(0,1);
  
 // Suppose that the CSB pin is connected to GND.
 // You'll have to check this on your breakout schematics
 baro.init(MS561101BA_ADDR_CSB_LOW); 
 Serial.println("INIT: Baro initialized...");
 delay(100);
  
 // populate movavg_buff before starting loop
 Serial.println("INIT: Avg buff initialized...");
 for(int i=0; i<MOVAVG_SIZE; i++)
 {
    Serial.println("INIT: Get press start...");
    pres =  baro.getPressure(MS561101BA_OSR_4096);   
    movavg_buff[i] = pres;
    delay(20);
    Serial.println("INIT: Get press end...");
 }
   
}



void loop() {

  //get temperature
  Serial.println("#####################Loop: Start read temp...#####################");
  temp= baro.getTemperature(MS561101BA_OSR_4096);
  Serial.println("#####################Loop: End read temp...#####################");
  
  delay(10);
  
  // get pressure
  Serial.println("#####################Loop: Start read press...#####################");
  pres = baro.getPressure(MS561101BA_OSR_4096);
  Serial.println("#####################Loop: End read press...#####################");
  
  
  digitalWrite(13, HIGH);   // turn the LED on (HIGH is the voltage level)
  
  pushAvg(pres);  
  pres = getAvg(movavg_buff, MOVAVG_SIZE);
  Serial.println("Loop: Calc avg. press...");
  
  //get altitude
  alt  = getAltitude(pres, temp);  
  Serial.println("Loop: Calc alt...");
  delay(10); 
  
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
  lcd.print(alt);
  lcd.print("m");
  //delay(5);
  //lcd.print("|");
  //delay(5);
  //lcd.print("/");   
  //delay(5);
  //lcd.print("-");
  //delay(5);
  //lcd.print("\\");
  
  //print vario on LCD
  lcd.print(" V:");
  lcd.print(vario);  
  
  //second line
  lcd.setCursor(0,1);
  lcd.print("P:");
  lcd.print(pres);
  lcd.print("m ");
  
  //print temp
  lcd.print("T:");
  lcd.print(temp);  
  
  prevAlt = alt;  
  delay(50);
  digitalWrite(13, LOW);    // turn the LED off by making the voltage LOW 
  
  //print on serial port
  Serial.print("Actual TEMP= ");
  Serial.println(temp);
  Serial.print("Actual PRESSURE= ");
  Serial.println(pres);
  Serial.print("Actual ALT= ");
  Serial.println(alt);
  Serial.print("PREV ALT= ");
  Serial.println(prevAlt);
  Serial.print("Vario");
  Serial.println(vario); 
  Serial.println("-------------------------------------------");
  
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


//move coursor to next line
//buff[0] = '\0';
//sprintf(buff, "P:%dHpa T:%dC", (int)pres, (int)temp);  

//vario_str[0] = '\0';
//dtostrf(vario,7, 4, vario_str);
//sprintf(buff, "Alt:%dm V:%s", alt,  vario_str);  
