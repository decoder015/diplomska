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

//sensor
#include <Wire.h>
//LCD
#include <LiquidCrystal.h>

//sensor addres
#define ADDRESS 0x77 //0x76

//beeper
#define GOUP 1
#define GODOWN 0
#define beep_freq_go_up   400 //Hz
#define beep_freq_go_down 200 //Hz
#define beep_duration 500

uint32_t D1 = 0;
uint32_t D2 = 0;
int64_t dT = 0;
int32_t TEMP = 0;
int64_t OFF = 0; 
int64_t SENS = 0; 
int32_t P = 0;
uint16_t C[7];

float alt = 0;
float temp = 0;
float pres = 0;
float vario = -1.5;
const float sea_press = 1013.25;

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 1, 0);

//int beepCount = 0;

//char vario_str[4];

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
 //beeper
 pinMode(A0, OUTPUT);
  
 // set up the LCD's number of columns and rows: 
 lcd.begin(16, 2);
 
 //move coursor to next line
 lcd.setCursor(0,1);
  
 // Disable internal pullups, 10Kohms are on the breakout
 PORTD |= (1 << 2);
 PORTD |= (1 << 3);

 Wire.begin();
 //Serial.begin(9600); //9600 changed 'cos of timing?
 delay(100);
 initial(ADDRESS);
}

float prevAlt;
float avgTempSum = 0;
float avgPressSum = 0;
const int sumC = 3;
const float dV = 0.5;

void loop() {

 avgTempSum = 0;
 avgPressSum =0;
 vario = 0;
 
 //Serial.println("Get press and temp");
 for(int i =0; i<sumC; i++)
 {  
   //returnts press and temp
   ComputePressAndTemp();
   //Serial.print(".");    
   
   avgTempSum += temp;
   avgPressSum += pres;
   
   delay(5); 
  }
  //Serial.println("");
   
  temp = avgTempSum / sumC;
  pres = avgPressSum / sumC;
  alt = getAltitude(pres,temp);
  
  //compute vario  
  if(abs(prevAlt - alt) > dV)
  {   
    vario = prevAlt - alt;
    if(vario > 0)
        Beep(GOUP);
    else 
        Beep(GODOWN);
  }
  
  
  //Print a message to the LCD.  
  //first line
  lcd.setCursor(0,0);
  lcd.print("A:" );  
  lcd.print(alt);
  lcd.print("m");
  
  //print vario on LCD
  lcd.print(" V:");
  lcd.print(vario);
  
  //second line
  lcd.setCursor(0,1);
  lcd.print("P:");
  lcd.print(pres);
  lcd.print("Hpa ");
  //print temp
  lcd.print("T:");
  lcd.print(temp); 
  
  //print on serial port
  //Serial.print("Actual TEMP= ");
  //Serial.println(temp);
  //Serial.print("Actual PRESSURE= ");
  //Serial.println(pres);
  //Serial.print("Actual ALT= ");
  //Serial.println(alt);
  //Serial.print("PREV ALT= ");
  //Serial.println(prevAlt);
  //Serial.print("Vario");
  //Serial.println(vario);
  
  prevAlt = alt;
  
  delay(500);
}


//compute alt
float getAltitude(float press, float temp) {
  //return (1.0f - pow(press/101325.0f, 0.190295f)) * 4433000.0f;
  return ((pow((sea_press / press), 1/5.257) - 1.0) * (temp + 273.15)) / 0.0065;
}


//compute press and temp
void ComputePressAndTemp()
{
 D1 = getVal(ADDRESS, 0x48); // Pressure raw
 delay(5);
 
 D2 = getVal(ADDRESS, 0x58); // Temperature raw
// delay(5);
 
 dT   = D2 - ((uint32_t)C[5] << 8);
 OFF  = ((int64_t)C[2] << 16) + ((dT * C[4]) >> 7);
 SENS = ((int32_t)C[1] << 15) + ((dT * C[3]) >> 8);

 //compute temp
 TEMP = (int64_t)dT * (int64_t)C[6] / 8388608 + 2000;

 temp = (float)TEMP / 100; 

 // compute pressure 
 P  = ((int64_t)D1 * SENS / 2097152 - OFF) / 32768;
 pres = (float)P / 100;
}


long getVal(int address, byte code)
{
 unsigned long ret = 0;
 Wire.beginTransmission(address);
 Wire.write(code);
 Wire.endTransmission();
 delay(20);
 
 // start read sequence
 Wire.beginTransmission(address);
 Wire.write((byte) 0x00);
 Wire.endTransmission();
 Wire.beginTransmission(address);
 Wire.requestFrom(address, (int)3);
 if (Wire.available() >= 3)
 {
   ret = Wire.read() * (unsigned long)65536 + Wire.read() * (unsigned long)256 + Wire.read();
 }
 else 
 {
   ret = -1;
 }
 Wire.endTransmission();
 return ret;
}

void initial(uint8_t address)
{

   //Serial.println();
   //Serial.println("PROM COEFFICIENTS ivan");

   Wire.beginTransmission(address);
   Wire.write(0x1E); // reset
   Wire.endTransmission();
   delay(10);

   for (int i=0; i<6  ; i++) 
   {
     Wire.beginTransmission(address);
     Wire.write(0xA2 + (i * 2));
     Wire.endTransmission();

     Wire.beginTransmission(address);
     Wire.requestFrom(address, (uint8_t) 6);
     delay(1);
     if(Wire.available())
     {
      C[i+1] = Wire.read() << 8 | Wire.read();
     }
    // else 
     //{
     //  Serial.println("Error reading PROM 1"); // error reading the PROM or communicating with the device
    // }
   //  Serial.println(C[i+1]);
 }
// Serial.println();
}


/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
MS561101BA_altitude.pde - Computes altitude from sea level using pressure readings from the sensor.
The algorithm uses the Hypsometric formula as explained in http://keisan.casio.com/has10/SpecExec.cgi?path=06000000.Science%2F02100100.Earth%20science%2F12000300.Altitude%20from%20atmospheric%20pressure%2Fdefault.xml&charset=utf-8

Copyright (C) 2011 Fabio Varesano <fvaresano@yahoo.it>

Development of this code has been supported by the Department of Computer Science,
Universita' degli Studi di Torino, Italy within the Piemonte Project
http://www.piemonte.di.unito.it/


This program is free software: you can redistribute it and/or modify
it under the terms of the version 3 GNU General Public License as
published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/


//#define DEBUG_V

#include <Wire.h>
//#include <DebugUtils.h>
#include <MS561101BA.h>


#define MOVAVG_SIZE 32

MS561101BA baro = MS561101BA();

float movavg_buff[MOVAVG_SIZE];
int movavg_i=0;

const float sea_press = 1013.25;
float press, temperature;

void setup() {
  Wire.begin();
  Serial.begin(115200);
  delay(1000);

  // Suppose that the CSB pin is connected to GND.
  // You'll have to check this on your breakout schematics
  baro.init(MS561101BA_ADDR_CSB_LOW); 
  delay(100);
  
  // populate movavg_buff before starting loop
  for(int i=0; i<MOVAVG_SIZE; i++) {
    movavg_buff[i] = baro.getPressure(MS561101BA_OSR_4096);
  }
}

void loop() {
  Serial.print(" temp: ");
  temperature = baro.getTemperature(MS561101BA_OSR_4096);
  Serial.print(temperature);
  Serial.print(" degC pres: ");
  
  press = baro.getPressure(MS561101BA_OSR_4096);
  pushAvg(press);
  press = getAvg(movavg_buff, MOVAVG_SIZE);
  Serial.print(press);
  Serial.print(" mbar altitude: ");
  Serial.print(getAltitude(press, temperature));
  Serial.println(" m");
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