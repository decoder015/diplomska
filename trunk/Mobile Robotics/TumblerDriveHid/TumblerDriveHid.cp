#line 1 "C:/Users/Administrator/Desktop/The_Source Robotics/Robotics/Mobile Robotics/m4/mikroC PRO for ARM/USB HID/TumblerDriveHid/TumblerDriveHid.c"
#line 25 "C:/Users/Administrator/Desktop/The_Source Robotics/Robotics/Mobile Robotics/m4/mikroC PRO for ARM/USB HID/TumblerDriveHid/TumblerDriveHid.c"
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


const int C_INT_STEP_DELAY = 50;


enum SteppMotorDirection {FORWARD = 0, BACKWARD =1, LEFT=2, RIGHT=3};

int i;
int result;
int steps;
int direction;
char stepForward[] = "FORWARD";
char stepBackward[] = "BACKWARD";
char stepLeft[] = "LEFT";
char stepRight[]= "RIGHT";
char *cmdPtr;
char *stepVal;
char *stepValPtr;
char tmpBuff[] ="FORWARD,200";



char cnt;
char hidStatus;

unsigned char readbuff[64];
unsigned char writebuff[64];


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
 Delay_ms(C_INT_STEP_DELAY);
}


void Motor1Move(int direction)
{
 switch(direction)
 {

 case FORWARD:
 m1State++;
 if(m1State > 4) m1State = 1;

 M1Step();
 break;

 case BACKWARD:
 m1State--;
 if(m1State < 1) m1State = 4;

 M1Step();
 break;
 }
}


void Motor2Move(int direction)
{
 switch(direction)
 {

 case FORWARD:
 m2State++;
 if(m2State > 4) m2State = 1;

 M2Step();
 break;


 case BACKWARD:
 m2State--;
 if(m2State < 1) m2State= 4;

 M2Step();
 break;
 }
}

void DriveTumblerForward(int steps)
{
 for(i=0; i<steps; i++)
 {
 Motor1Move(FORWARD);
 Motor2Move(BACKWARD);
 Wait();
 }


 m1State=0;
 m2State=0;
 M1Step();
 M2Step();
}

void DriveTumblerBackward(int steps)
{

}

void DriveTumblerLeft(int steps)
{
 for(i=0; i<steps; i++)
 {
 Motor1Move(FORWARD);
 Motor2Move(FORWARD);
 Wait();
 }


 m1State=0;
 m2State=0;
 M1Step();
 M2Step();
}

void DriveTumblerRight(int steps)
{
 for(i=0; i<steps; i++)
 {
 Motor1Move(BACKWARD);
 Motor2Move(BACKWARD);
 Wait();
 }


 m1State=0;
 m2State=0;
 M1Step();
 M2Step();
}

int GetDirection(char *command)
{
 if(strstr(command, stepForward) != 0)
 {
 return FORWARD;
 }
 else if(strstr(command, stepBackward) != 0)
 {
 return BACKWARD;
 }
 else if(strstr(command, stepLeft) != 0)
 {
 return LEFT;
 }
 else if(strstr(command, stepRight) != 0)
 {
 return RIGHT;
 }
 else
 {
 return -1;
 }
}

int GetSteps(char *command)
{
 steps = -1;

 stepVal = strrchr(command, ',');
 if(stepVal != 0)
 {

 stepVal++;
 steps = atoi(stepVal);
 }
 return steps;
}

int DriveTumbler(char *command)
{
 direction = GetDirection(command);
 steps = GetSteps(command);

 switch(direction)
 {
 case FORWARD:
 DriveTumblerForward(steps);
 return 0;
 case BACKWARD:
 DriveTumblerBackward(steps);
 return 0;
 case LEFT:
 DriveTumblerLeft(steps);
 return 0;
 case RIGHT:
 DriveTumblerRight(steps);
 return 0;
 default:
 return -1;
 }
}


void InitPorts()
{

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
}


void InitUSB()
{

 HID_Enable(&readbuff, &writebuff);
}


void USB0Interrupt() iv IVT_INT_OTG_FS {
 USB_Interrupt_Proc();
}

const char C_STR_OK[] = "OK";
const char C_STR_SYNTAX_ERROR[] = "Syntax Error :";

void main() {

 InitUSB();
 InitPorts();


 STAT = ~STAT;

 while (1)
 {
 DATA = 0;
 while(!HID_Read());


 if(DriveTumbler(readbuff) ==0)
 {
 strcpy(writebuff,C_STR_OK);
 }
 else
 {
 cmdPtr = strcat(C_STR_SYNTAX_ERROR, readbuff);
 strcpy(writebuff, cmdPtr);
 }







 while(!HID_Write(&writebuff,64));
 }
}
