/*
MS5611-01BA.cpp - Interfaces a Measurement Specialities MS5611-01BA with Arduino
See http://www.meas-spec.com/downloads/MS5611-01BA01.pdf for the device datasheet

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

#include "debug.h"
#include "MS561101BA.h"
#define CONVERSION_TIME 10000l // conversion time in microseconds
/*
void printLongLong(uint64_t n, uint8_t base) {
  do {
    uint64_t m = n;
    n /= base;
    char c = m - base * n;
    c = c < 10 ? c + '0' : c + 'A' - 10;
    Serial.print(c);
  } while(n);
  DEBUG_PRINTLN();
}
*/


MS561101BA::MS561101BA() {
  ;
}

void MS561101BA::init(uint8_t address) {  
  _addr =  address;
  
  // disable internal pullups of the ATMEGA which Wire enable by default
  #if defined(__AVR_ATmega168__) || defined(__AVR_ATmega8__) || defined(__AVR_ATmega328P__)
    // deactivate internal pull-ups for twi
    // as per note from atmega8 manual pg167
    cbi(PORTC, 4);
    cbi(PORTC, 5);
	DEBUG_PRINTLN("LIB init: PORTC...");
  #else
    // deactivate internal pull-ups for twi
    // as per note from atmega128 manual pg204
    cbi(PORTD, 0);
    cbi(PORTD, 1);
	DEBUG_PRINTLN("LIB init: PORTD...");
  #endif
 
  delay(50); 
   DEBUG_PRINTLN("LIB init: Reset start...");
  reset(); 		// reset the device to populate its internal PROM registers
  DEBUG_PRINTLN("LIB init: Reset done...");
  delay(1000); 	// some safety time
  readPROM(); 	// reads the PROM into object variables for later use
  DEBUG_PRINTLN("LIB init: Read prom done...");
}

float MS561101BA::getPressure(uint8_t OSR) {

  // see datasheet page 7 for formulas  
  DEBUG_PRINTLN("LIB getPressure: **************Start read pressure...**************");  
  
  //read delta tem
  int32_t dT = getDeltaTemp(OSR);
  
  while(dT == NULL)
  {
	dT = getDeltaTemp(OSR); 
	if(dT == NULL ) delay(10);
  } 
  
  if(dT == NULL) 
  {	
    return NULL;
  } 
  
  DEBUG_PRINT("LIB getPressure: DeltaTemp:");
  DEBUG_PRINTLN(dT);
  
  //read rawPres
  uint32_t rawPress = rawPressure(OSR); 
  
  while(rawPress == NULL)
  {
	rawPress = rawPressure(OSR); 
	if(rawPress == NULL ) delay(10);
  }  
  
  if(rawPress == NULL) 
  {
	DEBUG_PRINTLN("LIB getPressure: Start read pressure. Pressure is null, return...");
    return NULL;
  }
  
  DEBUG_PRINT("LIB getPressure: Raw pressure:");
  DEBUG_PRINTLN(rawPress);
  
  int64_t off  = ((uint32_t)_C[1] <<16) + (((int64_t)dT * _C[3]) >> 7);
  int64_t sens = ((uint32_t)_C[0] <<15) + (((int64_t)dT * _C[2]) >> 8);
  
  
  DEBUG_PRINTLN("LIB getPressure: **************End read pressure...**************");
  return ((( (rawPress * sens ) >> 21) - off) >> 15) / 100.0;
}

float MS561101BA::getTemperature(uint8_t OSR) 
{
  // see datasheet page 7 for formulas
  int64_t dT = getDeltaTemp(OSR);
  
   while(dT == NULL)
   {
	 dT = getDeltaTemp(OSR); 
	 if(dT == NULL )	delay(10);
   } 
  
  if(dT != NULL)   
    return (2000 + ((dT * _C[5]) >> 23)) / 100.0;  
  else 
    return NULL;  
}

int32_t MS561101BA::getDeltaTemp(uint8_t OSR) 
{

  DEBUG_PRINTLN("LIB getDeltaTemp: ^^^^^^^^^^^^^^^^Start read deltaTemp...^^^^^^^^^^^^^^^^");
  DEBUG_PRINT("LIB getDeltaTemp: OSR:");
  DEBUG_PRINTLN(OSR);

  int32_t deltaTemp; 
		
  //get raw temperature
  uint32_t rawTemp = rawTemperature(OSR);
  
   while(rawTemp == NULL)
   {
	 rawTemp = rawTemperature(OSR); 
	 if(rawTemp == NULL )	delay(10);
   } 
  
  DEBUG_PRINT("LIB getDeltaTemp: Raw temp:");
  DEBUG_PRINTLN(rawTemp);
  
  if(rawTemp != NULL) 
  {
	deltaTemp  = (int32_t)(rawTemp - ((uint32_t)_C[4] << 8));
	
	DEBUG_PRINT("LIB getDeltaTemp: Delta temp:");
    DEBUG_PRINTLN(deltaTemp);
	
    return deltaTemp;
  }
  else   
    return NULL;  
}

uint32_t MS561101BA::rawPressure(uint8_t OSR) 
{  
  unsigned long now = micros();
  
  DEBUG_PRINTLN("LIB rawPressure: ~~~~~~~~~~~~~~~~~~Start read raw pressure...~~~~~~~~~~~~~~~~~~~~~");
  DEBUG_PRINT("LIB rawPressure: now:");
  DEBUG_PRINTLN(now);
  DEBUG_PRINT("LIB rawPressure: Last press conv:");
  DEBUG_PRINTLN(lastPresConv);
  
  if(lastPresConv != 0 && (now - lastPresConv) >= CONVERSION_TIME) 
  {
    lastPresConv = 0;
    pressCache = getConversion(MS561101BA_D1 + OSR);
	
	DEBUG_PRINT("LIB rawPressure: pressCache:");
    DEBUG_PRINTLN(pressCache);
	DEBUG_PRINTLN("LIB rawPressure: ~~~~~~~~~~~~~~~~~~End read raw pressure...~~~~~~~~~~~~~~~~~~~~~");
    return pressCache;
  }
  else 
  {	
    if(lastPresConv == 0 && lastTempConv == 0) 
	{	  
      startConversion(MS561101BA_D1 + OSR);
      lastPresConv = now;
    }
    else if(lastTempConv != 0) 
	{
	  DEBUG_PRINTLN("LIB rawPressure: ~~~~~~~~~~~~~~~~~~End read raw pressure...~~~~~~~~~~~~~~~~~~~~~");
      return pressCache;
    }
	
	DEBUG_PRINTLN("LIB rawPressure: return null!!!");
	DEBUG_PRINTLN("LIB rawPressure: ~~~~~~~~~~~~~~~~~~End read raw pressure...~~~~~~~~~~~~~~~~~~~~~");
    return NULL;
  }
}

uint32_t MS561101BA::rawTemperature(uint8_t OSR) 
{
  unsigned long now = micros();
  
  if(lastTempConv != 0 && (now - lastTempConv) >= CONVERSION_TIME) 
  {
    lastTempConv = 0;
    tempCache = getConversion(MS561101BA_D2 + OSR);
    return tempCache;
  }
  else 
  {
    if(lastTempConv == 0 && lastPresConv == 0) 
	{
      startConversion(MS561101BA_D2 + OSR);
      lastTempConv = now;
    }
    else if(lastPresConv != 0) 
	{ 
	  // there is a Pressure reading in process
      return tempCache;
    }
	
    return NULL;
  }
}


// see page 11 of the datasheet
void MS561101BA::startConversion(uint8_t command) 
{
  // initialize pressure conversion
  Wire.beginTransmission(_addr);
  Wire.write(command);
  Wire.endTransmission();
}

uint32_t MS561101BA::getConversion(uint8_t command) 
{
  union {uint32_t val; uint8_t raw[4]; } conversion;
  
  // start read sequence
  Wire.beginTransmission(_addr);
  Wire.write(0);
  Wire.endTransmission();
  
  Wire.beginTransmission(_addr);
  Wire.requestFrom(_addr, (uint8_t) MS561101BA_D1D2_SIZE);
  if(Wire.available()) 
  {
    conversion.raw[2] = Wire.read();
    conversion.raw[1] = Wire.read();
    conversion.raw[0] = Wire.read();
  }
  else 
    conversion.val = -1; 
  
  return conversion.val;
}


/**
 * Reads factory calibration and store it into object variables.
*/
int MS561101BA::readPROM() 
{

  for (int i=0;i<MS561101BA_PROM_REG_COUNT;i++) 
  {
    Wire.beginTransmission(_addr);
	
	DEBUG_PRINTLN("LIB: Transmission start!");
	
    Wire.write(MS561101BA_PROM_BASE_ADDR + (i * MS561101BA_PROM_REG_SIZE));
	
	DEBUG_PRINTLN("LIB: Transmission end!");
    Wire.endTransmission();    
    Wire.beginTransmission(_addr);
	
	DEBUG_PRINTLN("LIB: Transmission start!");
    Wire.requestFrom(_addr, (uint8_t) MS561101BA_PROM_REG_SIZE);
	DEBUG_PRINTLN("LIB: Request end!");
	
    if(Wire.available()) 
	{
      _C[i] = Wire.read() << 8 | Wire.read();
      
	  DEBUG_PRINT(i);
	  DEBUG_PRINTLN(". LIB: Read PROM");
	  DEBUG_PRINTLN(_C[i]);
	  
      //DEBUG_PRINT(_C[i]);
    }
    else 
	{
	  DEBUG_PRINTLN( "LIB readPROM: Error reading the PROM or communicating with the device...");
      return -1; // error reading the PROM or communicating with the device
    }
  }
  return 0;
}


/**
 * Send a reset command to the device. With the reset command the device
 * populates its internal registers with the values read from the PROM.
*/
void MS561101BA::reset() 
{
  Wire.beginTransmission(_addr);
  Wire.write(MS561101BA_RESET);
  Wire.endTransmission();
}