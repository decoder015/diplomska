//debug 
#include <debug.h>

//togle DEBUG mode
//#define DEBUG

//sensor
#include <Wire.h>
#include <MS561101BA.h>

#define MOVAVG_SIZE 32    

//constants
const float sea_press = 1027.0;

#define dT 500
#define beep_freq_go_up  500   //Hz
#define beep_freq_go_down 200 //Hz
#define beep_duration = 500


//variables
float alt = 0;
float temp = 0;
float pres = 0;
float prev_pres = 0;
float prev_time = 0;
float vario = -1.5;
float time = 0;
float curr_time = 0;
int movavg_i=0;
float movavg_buff[MOVAVG_SIZE];

MS561101BA baro = MS561101BA();

float prevAlt = 0;
float avgTempSum = 0;
float avgPressSum = 0;

void Beep(float vario)
{
     tone(2, beep_freq_go_up+vario*100, -(250*vario-1500)/3);
}  

void setup()
{
 Wire.begin();
 //beeper
 pinMode(2, OUTPUT);
 
 Serial.begin(9600);
 
 #ifdef DEBUG    
   delay(25000);  
 #endif
 
 DEBUG_PRINTLN("INIT:Serial port initialized...");  

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
};

void loop()
{
  // turn the LED on by making the voltage HIGH
  digitalWrite(13, HIGH);
  curr_time = millis(); 
  
  //get temperature
  DEBUG_PRINTLN("#####################Loop: Start read temp...#####################");  
  DEBUG_PRINT("Loop start time:");
  DEBUG_PRINTLN(curr_time);
  
  temp = -1;
  while(temp <=0 )
  {
    temp= baro.getTemperature(MS561101BA_OSR_4096);
    DEBUG_PRINT("```````````````````````````Current temp:");
    DEBUG_PRINTLN(temp);
    delay(1);
  }
  DEBUG_PRINTLN("#####################Loop: End read temp...#####################"); 
  
  // get pressure
  DEBUG_PRINTLN("#####################Loop: Start read press...#####################");
  pres = -1;  
  while(pres <= 0)
  {
    pres = baro.getPressure(MS561101BA_OSR_4096);
    DEBUG_PRINT("```````````````````````````Current resss:");
    DEBUG_PRINTLN(pres);        
    delay(1);
  }
  Serial.println(pres);
  //DEBUG_PRINTLN("#####################Loop: End read press...#####################"); 
  
  // turn the LED off (HIGH is the voltage level)  
  //digitalWrite(13, LOW);
     
  pushAvg(pres);    
  pres = getAvg(movavg_buff, MOVAVG_SIZE);
  //DEBUG_PRINTLN("Loop: Calc avg. press...");
  
  //get altitude
  alt  = getAltitude(pres, temp);  
 /// DEBUG_PRINTLN("Loop: Calc alt...");  
  
  //compute vario 
  curr_time = millis();
  if(abs(curr_time- prev_time) >= dT)
  {
    DEBUG_PRINT("Curr time - prev time: ");
    DEBUG_PRINTLN(abs(curr_time- prev_time));
    
    DEBUG_PRINT("Prev_alt: ");
    DEBUG_PRINTLN(abs(getAltitude(prev_pres,temp)));
    
    //Serial.println("test");
    DEBUG_PRINT("Curr_alt: ");
    DEBUG_PRINTLN(abs(getAltitude(pres,temp)));
    
    float altDif = getAltitude(pres,temp) - getAltitude(prev_pres,temp);    
    if( abs(altDif) > 0.1)
    {
       vario = altDif ;
       if(altDif > 0)
         Beep(vario);
    }
    else    
      vario = 0;
     
     prev_time = curr_time; 
     prev_pres = pres;
  }  
  
  //Display(Round(alt,1));
  
  prevAlt = alt;
  
  delay(5);
  time = millis();
  
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
  DEBUG_PRINT("Loop time: "); 
  DEBUG_PRINTLN(time - curr_time ); 
  DEBUG_PRINTLN("-------------------------------------------");
};

  
float getAltitude(float press, float temp) 
 {
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
