#line 1 "C:/Users/Administrator/Desktop/The_Source Robotics/Robotics/Mobile Robotics/TumblerBotDrive/TimblerBotDrive.c"
#line 26 "C:/Users/Administrator/Desktop/The_Source Robotics/Robotics/Mobile Robotics/TumblerBotDrive/TimblerBotDrive.c"
sbit STAT at ODR13_GPIOC_ODR_bit;
sbit DATA at ODR12_GPIOC_ODR_bit;


sbit m1s1 at ODR5_GPIOB_ODR_bit;
sbit m1s2 at ODR13_GPIOB_ODR_bit;
sbit m1s3 at ODR0_GPIOB_ODR_bit;
sbit m1s4 at ODR1_GPIOB_ODR_bit;


sbit m2s1 at ODR9_GPIOB_ODR_bit;
sbit m2s2 at ODR8_GPIOB_ODR_bit;
sbit m2s3 at ODR9_GPIOC_ODR_bit;
sbit m2s4 at ODR4_GPIOB_ODR_bit;


sbit m3s1 at ODR15_GPIOB_ODR_bit;
sbit m3s2 at ODR14_GPIOB_ODR_bit;
sbit m3s3 at ODR11_GPIOC_ODR_bit;
sbit m3s4 at ODR10_GPIOC_ODR_bit;


sbit m4s1 at ODR10_GPIOB_ODR_bit;
sbit m4s2 at ODR11_GPIOB_ODR_bit;
sbit m4s3 at ODR7_GPIOB_ODR_bit;
sbit m4s4 at ODR6_GPIOB_ODR_bit;



int m1State=0;
int m2State=0;
int m3State=0;
int m4State=0;

enum SteppMotorDirection {FORWARD = 0, BACKWARD =1};

void M1Step()
{
 switch(m1State)
 {
 case 0:
 m1s1 = 0;
 m1s2 = 0;
 m1s3 = 0;
 m1s4 = 0;
 break;
 case 1:
 m1s1 = 1;
 m1s2 = 0;
 m1s3 = 0;
 m1s4 = 1;
 break;
 case 2:
 m1s1 = 1;
 m1s2 = 1;
 m1s3 = 0;
 m1s4 = 0;
 break;
 case 3:
 m1s1 = 0;
 m1s2 = 1;
 m1s3 = 1;
 m1s4 = 0;
 break;
 case 4:
 m1s1 = 0;
 m1s2 = 0;
 m1s3 = 1;
 m1s4 = 1;
 break;

 }
}


void M2Step()
{
 switch(m2State)
 {
 case 0:
 m2s1 = 0;
 m2s2 = 0;
 m2s3 = 0;
 m2s4 = 0;
 break;
 case 1:
 m2s1 = 1;
 m2s2 = 0;
 m2s3 = 0;
 m2s4 = 1;
 break;
 case 2:
 m2s1 = 1;
 m2s2 = 1;
 m2s3 = 0;
 m2s4 = 0;
 break;
 case 3:
 m2s1 = 0;
 m2s2 = 1;
 m2s3 = 1;
 m2s4 = 0;
 break;
 case 4:
 m2s1 = 0;
 m2s2 = 0;
 m2s3 = 1;
 m2s4 = 1;
 break;
 }
}


void M3Step()
{
 switch(m3State)
 {
 case 0:
 m3s1 = 0;
 m3s2 = 0;
 m3s3 = 0;
 m3s4 = 0;
 break;
 case 1:
 m3s1 = 1;
 m3s2 = 0;
 m3s3 = 0;
 m3s4 = 0;
 break;
 case 2:
 m3s1 = 0;
 m3s2 = 1;
 m3s3 = 0;
 m3s4 = 0;
 break;
 case 3:
 m3s1 = 0;
 m3s2 = 0;
 m3s3 = 1;
 m3s4 = 0;
 break;
 case 4:
 m3s1 = 0;
 m3s2 = 0;
 m3s3 = 0;
 m3s4 = 1;
 break;
 }
}


void M4Step()
{
 switch(m4State)
 {
 case 0:
 m4s1 = 0;
 m4s2 = 0;
 m4s3 = 0;
 m4s4 = 0;
 break;
 case 1:
 m4s1 = 1;
 m4s2 = 0;
 m4s3 = 0;
 m4s4 = 0;
 break;
 case 2:
 m4s1 = 1;
 m4s2 = 1;
 m4s3 = 0;
 m4s4 = 0;
 break;
 case 3:
 m4s1 = 0;
 m4s2 = 1;
 m4s3 = 1;
 m4s4 = 0;
 break;
 case 4:
 m4s1 = 0;
 m4s2 = 0;
 m4s3 = 1;
 m4s4 = 1;
 break;
 }
}


void Wait() {
 Delay_ms(10);
}


void Motor1Move(int speed, int direction)
{
 switch(direction)
 {
 case FORWARD:


 m1State++;
 if(m1State > 4)
 {
 m1State = 1;

 }
 M1Step();
 break;
 case BACKWARD:


 m1State--;
 if(m1State < 1)
 {
 m1State = 4;

 }
 M1Step();
 break;
 }
}


void Motor2Move(int speed, int direction)
{
 switch(direction)
 {
 case FORWARD:


 m2State++;
 if(m2State > 4)
 {
 m1State = 1;

 }
 M2Step();
 break;
 case BACKWARD:


 m2State--;
 if(m2State < 1)
 {
 m2State= 4;

 }
 M2Step();
 break;
 }
}

void main() {


 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12 | _GPIO_PINMASK_13);


 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1 | _GPIO_PINMASK_2);


 GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5 |
 _GPIO_PINMASK_13 |
 _GPIO_PINMASK_0 |
 _GPIO_PINMASK_1 |
 _GPIO_PINMASK_9 |
 _GPIO_PINMASK_8 |
 _GPIO_PINMASK_4 |
 _GPIO_PINMASK_15 |
 _GPIO_PINMASK_14 |
 _GPIO_PINMASK_10 |
 _GPIO_PINMASK_11 |
 _GPIO_PINMASK_7 |
 _GPIO_PINMASK_6 );

 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_9 |
 _GPIO_PINMASK_11 |
 _GPIO_PINMASK_10 );




 STAT = 1;
 DATA = 1;



 while (1)
 {


 STAT = ~STAT;





 Motor1Move(5, FORWARD);
 Motor2Move(5, BACKWARD);


 Wait();

 }
}
