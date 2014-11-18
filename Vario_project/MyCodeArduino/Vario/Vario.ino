 
/*  
  6-13-2011  
   Spark Fun Electronics 2011  
   Nathan Seidle  
    
   This version modified by www.hobbytronics.co.uk as a countdown timer  
   Ideal as a simple egg timer or other timer. Easily add a buzzer  
     
   This code is public domain but you buy me a beer if you use this   
   and we meet someday (Beerware license).  
     
   4 digit 7 segment display:  
   http://www.sparkfun.com/products/9483  
   Datasheet:   
   http://www.sparkfun.com/datasheets/Components/LED/7-Segment/YSD-439AR6B-35.pdf  
    
   This is an example of how to drive a 7 segment LED display from an ATmega   
   without the use of current limiting resistors.  
   This technique is very common but requires some knowledge of electronics   
   - you do run the risk of dumping too much current through the segments   
   and burning out parts of the display. If you use the stock code you should   
   be ok, but be careful editing the brightness values.  
     
   This code should work with all colors (red, blue, yellow, green) but the   
   brightness will vary from one color to the next because the forward voltage   
   drop of each color is different. This code was written and calibrated for the  
   red color.  
    
   This code will work with most Arduino's but you may want to re-route some of  
   the pins.  
    
   7 segments  
   4 digits  
   1 colon  
   =  
   12 pins required for full control   
     
   */  
  
  #define DIGIT_ON   LOW
  #define DIGIT_OFF HIGH  
  
  int digits[3] ;
  int divider = 10;
  
//  int digit1 = 9; //PWM Display pin 1  
 // int digit2 = 10; //PWM Display pin 2  
 // int digit3 = 11; //PWM Display pin 6  
  
  int digitPins[] = {10,9,11};
  //int digit4 = 6; //PWM Display pin 8  
    
  //Pin mapping from Arduino to the ATmega DIP28 if you need it  
  //http://www.arduino.cc/en/Hacking/PinMapping  
  int segA = 2; //Display pin 14  
  int segB = 3; //Display pin 16  
  int segC = 4; //Display pin 13  
  int segD = 5; //Display pin 3  
  int segE = 6; //Display pin 5  
  int segF = 7; //Display pin 11  
  int segG = 8; //Display pin 15  
  
  int t = 345;  
  int start_num=999; // Number to countdown from  
  unsigned long time;  
    
  void setup() {          
   pinMode(segA, OUTPUT);  
   pinMode(segB, OUTPUT);  
   pinMode(segC, OUTPUT);  
   pinMode(segD, OUTPUT);  
   pinMode(segE, OUTPUT);  
   pinMode(segF, OUTPUT);  
   pinMode(segG, OUTPUT);  
    
   pinMode(digitPins[0], OUTPUT);  
   pinMode(digitPins[1], OUTPUT);  
   pinMode(digitPins[2], OUTPUT);  
   //pinMode(digit4, OUTPUT);  
     
   pinMode(13, OUTPUT);  
 }  
    
 void loop() {  
   
  int time = 100;
  
 while(time > 0)  
 {
   displayThreeDigitNumber(t);
   delay(10);
   time -=10; 
 }
   
   if(t>999)
     t =0;
   t++; 
   //delay(1000);
   
   
    
    //Turn off all segments  
    //lightNumber(10);   
   
  }  
   
   
   
   //start_num--;
  
   //lightNumber(0);
   //elay(1000);
   //long startTime = millis();  
   //if((millis()/1000) < start_num)
   //{  
   // displayNumber(start_num -(millis()/1000));  
   //}  
   //else 
   //{  
    // reached zero, flash the display  
   // time=millis();  
    //while(millis() < time+200) 
    //{  
     //displayNumber(0); // display 0 for 0.2 second  
    //}
    
   // time=millis();
    
   // while(millis() < time+200) 
    //{  
     //lightNumber(10); // Turn display off for 0.2 second  
   //  
   //  
   //while( (millis() - startTime) < 2000) {  
   //displayNumber(1217);  
   //}  
   //delay(1000);   
 // }  
    
  //Given a number, we display 10:22  
  //After running through the 4 numbers, the display is left turned off  
    
  //Display brightness  
  //Each digit is on for a certain amount of microseconds  
  //Then it is off until we have reached a total of 20ms for the function call  
  //Let's assume each digit is on for 1000us  
  //If each digit is on for 1ms, there are 4 digits, so the display  
  //is off for 16ms.  
  //That's a ratio of 1ms to 16ms or 6.25% on time (PWM).  
  //Let's define a variable called brightness that varies from:  
  //5000 blindingly bright (15.7mA current draw per digit)  
  //2000 shockingly bright (11.4mA current draw per digit)  
  //1000 pretty bright (5.9mA)  
  //500 normal (3mA)  
  //200 dim but readable (1.4mA)  
  //50 dim but readable (0.56mA)  
  //5 dim but readable (0.31mA)  
  //1 dim but readable in dark (0.28mA)  
    
 void displayThreeDigitNumber(int number) {  
 #define DISPLAY_BRIGHTNESS 500  
    
  #define DIGIT_ON   LOW
  #define DIGIT_OFF HIGH  
    
  int  numDigits[3] ;  
  int divider = 10;
  int shift   = 1;
  int i;  
  
  //Turn off all segments  
  lightNumber(10);   
    
  for(i = 0 ; i<3; i++)
  {
    numDigits[i] = (number % divider) / shift;
    shift   *= 10;
    divider *=10;
    number -=  numDigits[i];	
   }       
    
    for(i = 0; i< 3; i++)
    {
       digitalWrite(digitPins[i], DIGIT_ON);
       lightNumber(10);        
       lightNumber(numDigits[i]);     
       delay(2);
       lightNumber(10); 
       digitalWrite(digitPins[i], DIGIT_OFF);
    }
    
   //Turn off all segments  
   lightNumber(10);   
  }  
    
//Given a number, turns on those segments  
//If number == 10, then turn off number  
  void lightNumber(int numberToDisplay) {  
    
  #define SEGMENT_ON  HIGH 
  #define SEGMENT_OFF LOW   
    
   switch (numberToDisplay){  
    
   case 0:  
    digitalWrite(segA, SEGMENT_ON);  
    digitalWrite(segB, SEGMENT_ON);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_ON);  
    digitalWrite(segE, SEGMENT_ON);  
    digitalWrite(segF, SEGMENT_ON);  
    digitalWrite(segG, SEGMENT_OFF);  
    break;  
    
   case 1:  
    digitalWrite(segA, SEGMENT_OFF);  
    digitalWrite(segB, SEGMENT_ON);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_OFF);  
    digitalWrite(segE, SEGMENT_OFF);  
    digitalWrite(segF, SEGMENT_OFF);  
    digitalWrite(segG, SEGMENT_OFF);  
    break;  
    
   case 2:  
    digitalWrite(segA, SEGMENT_ON);  
    digitalWrite(segB, SEGMENT_ON);  
    digitalWrite(segC, SEGMENT_OFF);  
    digitalWrite(segD, SEGMENT_ON);  
    digitalWrite(segE, SEGMENT_ON);  
    digitalWrite(segF, SEGMENT_OFF);  
    digitalWrite(segG, SEGMENT_ON);  
    break;  
    
   case 3:  
    digitalWrite(segA, SEGMENT_ON);  
    digitalWrite(segB, SEGMENT_ON);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_ON);  
    digitalWrite(segE, SEGMENT_OFF);  
    digitalWrite(segF, SEGMENT_OFF);  
    digitalWrite(segG, SEGMENT_ON);  
    break;  
    
   case 4:  
    digitalWrite(segA, SEGMENT_OFF);  
    digitalWrite(segB, SEGMENT_ON);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_OFF);  
    digitalWrite(segE, SEGMENT_OFF);  
    digitalWrite(segF, SEGMENT_ON);  
    digitalWrite(segG, SEGMENT_ON);  
    break;  
    
   case 5:  
    digitalWrite(segA, SEGMENT_ON);  
    digitalWrite(segB, SEGMENT_OFF);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_ON);  
    digitalWrite(segE, SEGMENT_OFF);  
    digitalWrite(segF, SEGMENT_ON);  
    digitalWrite(segG, SEGMENT_ON);  
    break;  
    
   case 6:  
    digitalWrite(segA, SEGMENT_ON);  
    digitalWrite(segB, SEGMENT_OFF);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_ON);  
    digitalWrite(segE, SEGMENT_ON);  
    digitalWrite(segF, SEGMENT_ON);  
    digitalWrite(segG, SEGMENT_ON);  
   break;  
    
   case 7:  
    digitalWrite(segA, SEGMENT_ON);  
    digitalWrite(segB, SEGMENT_ON);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_OFF);  
    digitalWrite(segE, SEGMENT_OFF);  
    digitalWrite(segF, SEGMENT_OFF);  
    digitalWrite(segG, SEGMENT_OFF);  
    break;  
    
   case 8:  
    digitalWrite(segA, SEGMENT_ON);  
    digitalWrite(segB, SEGMENT_ON);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_ON);  
    digitalWrite(segE, SEGMENT_ON);  
    digitalWrite(segF, SEGMENT_ON);  
    digitalWrite(segG, SEGMENT_ON);  
    break;  
    
   case 9:  
    digitalWrite(segA, SEGMENT_ON);  
    digitalWrite(segB, SEGMENT_ON);  
    digitalWrite(segC, SEGMENT_ON);  
    digitalWrite(segD, SEGMENT_ON);  
    digitalWrite(segE, SEGMENT_OFF);  
    digitalWrite(segF, SEGMENT_ON);  
    digitalWrite(segG, SEGMENT_ON);  
    break;  
    
   case 10:  
    digitalWrite(segA, SEGMENT_OFF);  
    digitalWrite(segB, SEGMENT_OFF);  
    digitalWrite(segC, SEGMENT_OFF);  
    digitalWrite(segD, SEGMENT_OFF);  
    digitalWrite(segE, SEGMENT_OFF);  
    digitalWrite(segF, SEGMENT_OFF);  
    digitalWrite(segG, SEGMENT_OFF);  
    break;  
   }  
  }  
