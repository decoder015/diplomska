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
#define ADDRESS 0x77 //0x76

uint32_t D1 = 0;
uint32_t D2 = 0;
int64_t dT = 0;
int32_t TEMP = 0;
int64_t OFF = 0; 
int64_t SENS = 0; 
int32_t P = 0;
uint16_t C[7];

float alt;
float temp;
float pres;
const float sea_press = 1013.25;

//LCD
// include the library code:
#include <LiquidCrystal.h>

#define beep_freq_go_up  300   //Hz
#define beep_freq_go_down 200 //Hz
#define beep_duration 500


// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 1, 0);

char buff[16];


//int beepCount = 0;
float vario = -1.5;
char vario_str[4];

void Beep()
{
   //beeper  
  //if(beepCount == 5)  
  //{
     tone(A0, beep_freq_go_up, 200) ;
   //  beepCount = 0;
  //}
  //else
 
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
 PORTC |= (1 << 4);
 PORTC |= (1 << 5);

 Wire.begin();
 Serial.begin(9600); //9600 changed 'cos of timing?
 delay(100);
 initial(ADDRESS);
}

void loop() {
  
  
  //Turn off the display:
  //lcd.noDisplay();
  delay(500);
  
  ComputePressAndTemp();  
  alt = getAltitude(pres,temp);
  
  //vario_str[0] = '\0';
  //dtostrf(vario,7, 4, vario_str);
  //sprintf(buff, "Alt:%dm V:%s", alt,  vario_str);  
  
  // Print a message to the LCD.
  //lcd.clear ();
  //print alt on LCD
  lcd.setCursor(0,0);
  lcd.print("A:" );  
  lcd.print(alt);
  lcd.print("m");
  
  //print vario on LCD
  lcd.print(" V:");
  lcd.print(vario);
  
  //move coursor to next line
  //buff[0] = '\0';
  //sprintf(buff, "P:%dHpa T:%dC", (int)pres, (int)temp);  
  
  // Print a message to the LCD.
  lcd.setCursor(0,1);
  lcd.print("P:");
  lcd.print(pres);
  lcd.print("Hpa ");
  lcd.print("T:");
  lcd.print(temp);
  
  
  //alt++;
  vario += 0.1;
  
  if((int)alt % 5 == 0)
  {
    for(int i=0 ;i<3; i++)
    {
      Beep();
      delay(250);
    }
  }  
  Serial.print("Actual TEMP= ");
  Serial.println(temp);
  Serial.print("Actual PRESSURE= ");
  Serial.println(pres);
  
  delay(1500);
}

float getAltitude(float press, float temp) {
  //return (1.0f - pow(press/101325.0f, 0.190295f)) * 4433000.0f;
  return ((pow((sea_press / press), 1/5.257) - 1.0) * (temp + 273.15)) / 0.0065;
}

void ComputePressAndTemp()
{
 D1 = getVal(ADDRESS, 0x48); // Pressure raw
 D2 = getVal(ADDRESS, 0x58); // Temperature raw
  
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
 delay(10);
 
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

   Serial.println();
   Serial.println("PROM COEFFICIENTS ivan");

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
     else 
     {
       Serial.println("Error reading PROM 1"); // error reading the PROM or communicating with the device
     }
     Serial.println(C[i+1]);
 }
 Serial.println();
}
