#define DIGIT_ON   LOW
#define DIGIT_OFF HIGH  
  
  int digits[3] ;
  int divider = 10;
  
//  int digit1 = 9; //PWM Display pin 1  
// int digit2 = 10; //PWM Display pin 2  
// int digit3 = 11; //PWM Display pin 6  
  
//int digitPins[] = {10,9,11};
//int digit4 = 6; //PWM Display pin 8  
    
//Pin mapping from Arduino to the ATmega DIP28 if you need it  
//http://www.arduino.cc/en/Hacking/PinMapping  
int segA = 0; //Display pin 14  
int segB = 1; //Display pin 16  
int segC = 2; //Display pin 13  
int segD = 3; //Display pin 3  
int segE = 4; //Display pin 5  
int segF = 5; //Display pin 11  
int segG = 6; //Display pin 15  


int addr[] = {8, 9, 11, 10};
int letch = 12;
int  i =0;
int beepCount = 0;

#define beep_freq_go_up  500   //Hz
#define beep_freq_go_down 200 //Hz
#define beep_duration = 500


void setup()
{
  //Segment pins
  pinMode(segA, OUTPUT);  
  pinMode(segB, OUTPUT);  
  pinMode(segC, OUTPUT);  
  pinMode(segD, OUTPUT);  
  pinMode(segE, OUTPUT);  
  pinMode(segF, OUTPUT);  
  pinMode(segG, OUTPUT);  
  
  //address pins input to
  //4 to 16 demultiplex
  pinMode(addr[0], OUTPUT);
  pinMode(addr[1], OUTPUT);
  pinMode(addr[2], OUTPUT);
  pinMode(addr[3], OUTPUT);
  
  //letch pin of demultiplexer
  pinMode(letch, OUTPUT);  
  
  //beeper
  pinMode(A0, OUTPUT);
};


void Beep()
{
   //beeper  
  if(beepCount == 50)  
  {
     tone(A0, beep_freq_go_up, 500) ;
     beepCount = 0;
  }
  else
   beepCount++ ;
}

int alt = 0;

void loop()
{
  //write to port  
  //WriteDigitAtPositon(i);
  
  //light the number
  
  for(int k=0; k<40; k++)
  {
    Display1(alt);
    Display2(alt);
    delay(1);
  }
  
  //set lech to hifh
  if(i> 7)
    i =0;
  else
    i++; 
  
   alt++;
    
  //beep on alt change
  Beep();
};

//Writes Number to display
void WriteDigitAtPositon(int numb)
{ 
  digitalWrite(letch, HIGH); 
  
  switch(numb)
  {
    case  0 :
      digitalWrite(addr[0] , LOW);
      digitalWrite(addr[1] , LOW);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , LOW);
      break;
    case 1 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , LOW);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , LOW);
      break;      
    case 2 :
      digitalWrite(addr[0] , LOW);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , LOW);
    break;
    case 3 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , LOW);
    break;
     case 4 :
      digitalWrite(addr[0] , LOW);
      digitalWrite(addr[1] , LOW);
      digitalWrite(addr[2] , HIGH);
      digitalWrite(addr[3] , LOW);
    break;
      case 5 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , LOW);
      digitalWrite(addr[2] , HIGH);
      digitalWrite(addr[3] , LOW);
    break;
      case 6 :
      digitalWrite(addr[0] , LOW);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , HIGH);
      digitalWrite(addr[3] , LOW);
    break;   
      case 7 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , HIGH);
      digitalWrite(addr[3] , LOW);
    break;
   case 8 :
      digitalWrite(addr[0] , LOW);
      digitalWrite(addr[1] , LOW);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , HIGH);
    break;
    case 9 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , LOW);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , HIGH);
   case 10 :
      digitalWrite(addr[0] , LOW);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , HIGH);
   case 11 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , HIGH);
    break;
  }
  
  
  //digitalWrite(addr[0] , LOW);
  //digitalWrite(addr[1] , LOW);
  //digitalWrite(addr[2] , LOW);
  //digitalWrite(addr[3] , LOW);
  //delay(1);
  digitalWrite(letch, LOW);    
};

void Display2(int number) {  
 #define DISPLAY_BRIGHTNESS 500  
    
  #define DIGIT_ON   LOW
  #define DIGIT_OFF HIGH  
    
  int  numDigits[4] ;  
  int divider = 10;
  int shift   = 1;
  int i;  
  
  //Turn off all segments  
  lightNumber(10);   
    
  for(i = 0 ; i<4; i++)
  {
    numDigits[i] = (number % divider) / shift;
    shift   *= 10;
    divider *= 10;
    number -=  numDigits[i];	
   }       
    
    int digitPos = 0;
    for(i = 7 ; i>=4; i--)
    {
       WriteDigitAtPositon(i);    
       lightNumber(numDigits[digitPos]);
       delay(2);
       
       //clear all segments
       lightNumber(10);      
       for(int k = 3; k>=0; k--)       
         WriteDigitAtPositon(k);     
              
       digitPos++;       
    }
    
   //Turn off all segments  
   lightNumber(10);   
  } 

void Display1(int number) {  
 #define DISPLAY_BRIGHTNESS 500  
    
  #define DIGIT_ON   LOW
  #define DIGIT_OFF HIGH  
    
  int  numDigits[4] ;  
  int divider = 10;
  int shift   = 1;
  int i;  
  
  //Turn off all segments  
  lightNumber(10);   
    
  for(i = 0 ; i<4; i++)
  {
    numDigits[i] = (number % divider) / shift;
    shift   *= 10;
    divider *= 10;
    number -=  numDigits[i];	
   }       
    
    int digitPos = 0;
    for(i = 3 ; i>=0; i--)
    {
       WriteDigitAtPositon(i);    
       lightNumber(numDigits[digitPos]);
       delay(2);
       
       //clear all segments
       lightNumber(10);      
       for(int k = 3; k>=0; k--)       
         WriteDigitAtPositon(k);     
              
       digitPos++;       
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
  };
