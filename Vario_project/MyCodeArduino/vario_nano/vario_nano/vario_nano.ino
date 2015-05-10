#define DIGIT_ON   LOW
#define DIGIT_OFF HIGH  
  
  int digits[3] ;
  int divider = 10; 

    
//Pin mapping from Arduino to the ATmega DIP28 if you need it  
//http://www.arduino.cc/en/Hacking/PinMapping  
int segA = 2; //Display pin 14  
int segB = 6; //Display pin 16  
int segC = 9; //Display pin 13  
int segD = 11; //Display pin 3  
int segE = 12; //Display pin 5  
int segF = 3; //Display pin 11  
int segG = 8; //Display pin 15 
int dot = 10;

//int addr[] = {7,5,4,0};
int addr[] = {0,4,5,7};
int  i =0;


#define beep_freq_go_up  500   //Hz
#define beep_freq_go_down 200 //Hz
#define beep_duration = 500


void Beep(float vario)
{
   //beeper  
  //if(updown == GOUP)
  //   tone(A0, beep_freq_go_up, 250);    
  //else
  //   tone(A0, beep_freq_go_down, 250);
     
     tone(13, beep_freq_go_up+vario*100, -(250*vario-1500)/3);
}

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
  
  //address pins 
  pinMode(addr[0], OUTPUT);
  pinMode(addr[1], OUTPUT);
  pinMode(addr[2], OUTPUT);
  pinMode(addr[3], OUTPUT); 
 
};

void loop()
{
  for(int k=0; k<40; k++)
  {
    Display(i);    
    delay(1);
  }
 Beep(i);
// if(i>3)
//  i =0;
i++;
// digitalWrite(segA, HIGH);
// digitalWrite(segB, HIGH);
 //digitalWrite(segC, HIGH);
 //digitalWrite(segD, HIGH);
 //digitalWrite(segE, HIGH);
 //digitalWrite(segF, HIGH);
 //digitalWrite(segG, HIGH); 
 //digitalWrite(addr[0], HIGH);
 //digitalWrite(addr[1], HIGH);
 //digitalWrite(addr[2], HIGH);
 //digitalWrite(addr[3], LOW);
 //digitalWrite(13, LOW);
 //delay(10);

};

//Writes Number to display
void WriteDigitAtPositon(int numb)
{  
  switch(numb)
  {
    case  0 :
      digitalWrite(addr[0] , LOW);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , HIGH);
      digitalWrite(addr[3] , HIGH);
      break;
    case 1 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , LOW);
      digitalWrite(addr[2] , HIGH);
      digitalWrite(addr[3] , HIGH);
      break;      
    case 2 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , LOW);
      digitalWrite(addr[3] , HIGH);
    break;
    case 3 :
      digitalWrite(addr[0] , HIGH);
      digitalWrite(addr[1] , HIGH);
      digitalWrite(addr[2] , HIGH);
      digitalWrite(addr[3] , LOW);
    break;    
  } 
  
  //digitalWrite(addr[0] , LOW);
  //digitalWrite(addr[1] , LOW);
  //digitalWrite(addr[2] , LOW);
  //digitalWrite(addr[3] , LOW);
  //delay(1); 
};

void Display(int number) 
{  
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
