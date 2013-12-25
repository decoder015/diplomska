/*
 * Project name:
     TumblerDrive
 * Copyright:
     (c) Kristijan, 2013.
 * Revision History:
       - initial release (FJ);
 * Description:
     Simple "Hello world" example for the world of ARM MCUs;
     Toggles DATA and STAT LEDs every 500ms;
 * Test configuration:
     MCU:             STM32F415RG
                      http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/DM00035129.pdf
     Dev.Board:       MINI-M4 STM32 Board
                      http://www.mikroe.com/mini/stm32/
     Oscillator:      HSI-PLL, 120.000MHz
     Ext. Modules:    None.
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 * NOTES:
     - None.
 */
 
//leds
//sbit PA1 at ODR1_GPIOA_ODR_bit;
sbit STAT at ODR13_GPIOC_ODR_bit;
sbit DATA at ODR12_GPIOC_ODR_bit;

//MOTOR1 control pins
sbit m1s1 at ODR5_GPIOB_ODR_bit;
sbit m1s2 at ODR13_GPIOB_ODR_bit;
sbit m1s3 at ODR0_GPIOB_ODR_bit;
sbit m1s4 at ODR1_GPIOB_ODR_bit;

//MOTOR2 control pins
sbit m2s1 at ODR9_GPIOB_ODR_bit;
sbit m2s2 at ODR8_GPIOB_ODR_bit;
sbit m2s3 at ODR9_GPIOC_ODR_bit;
sbit m2s4 at ODR4_GPIOB_ODR_bit;

//MOTOR3 control pins
sbit m3s1 at ODR15_GPIOB_ODR_bit;
sbit m3s2 at ODR14_GPIOB_ODR_bit;
sbit m3s3 at ODR11_GPIOC_ODR_bit;
sbit m3s4 at ODR10_GPIOC_ODR_bit;

//MOTOR4 control pins
sbit m4s1 at ODR10_GPIOB_ODR_bit;
sbit m4s2 at ODR11_GPIOB_ODR_bit;
sbit m4s3 at ODR7_GPIOB_ODR_bit;
sbit m4s4 at ODR6_GPIOB_ODR_bit;

// step motor states
int m1State=0;
int m2State=0;
int m3State=0;
int m4State=0;

//in ms
const int C_INT_STEP_DELAY = 50;

//step motor direction
enum SteppMotorDirection  {FORWARD = 0, BACKWARD =1};

// USB DATA
char cnt;

// Buffers should be in USB RAM, please consult datasheet
unsigned char readbuff[64];
unsigned char writebuff[64];

//move Motor 1 by one step
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

//move Motor 2 by one step
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

//move Motor 3 by one step
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

//move Motor 4 by one step
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

//delay between steps
void Wait() {
  Delay_ms(C_INT_STEP_DELAY);
}

 //move motor 1
void Motor1Move(int direction)
{
     switch(direction)
     {
        //step motor 1 fwd
        case FORWARD:
              m1State++;
              if(m1State > 4)  m1State = 1;

             M1Step();
        break;

        case BACKWARD:
            m1State--;
            if(m1State < 1)  m1State = 4;
            
            M1Step();
      break;
     }
}

// Move Motor 2
void Motor2Move(int direction)
{
     switch(direction)
     {
         //step motor 2 forward
        case FORWARD:
             m2State++;
             if(m2State > 4) m2State = 1;

             M2Step();
        break;
     
      //step motor 2 backward
      case BACKWARD:
             m2State--;
             if(m2State < 1) m2State= 4;
             
             M2Step();
     break;
     }
}

//Initialize ports and status LEDS
void InitPorts()
{
     // configure DATA and STAT pins as output
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12 | _GPIO_PINMASK_13);

  // Set GPIO_PORTE poins 0 and 1 as digital input
  GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1 | _GPIO_PINMASK_2);

  //Set PortB output pins. Set PORTB as digital output
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5  |
                                   _GPIO_PINMASK_13 |
                                   _GPIO_PINMASK_0  |
                                   _GPIO_PINMASK_1  |
                                   _GPIO_PINMASK_9  |
                                   _GPIO_PINMASK_8  |
                                   _GPIO_PINMASK_4  |
                                   _GPIO_PINMASK_15 |
                                   _GPIO_PINMASK_14 |
                                   _GPIO_PINMASK_10 |
                                   _GPIO_PINMASK_11 |
                                   _GPIO_PINMASK_7  |
                                   _GPIO_PINMASK_6  );

 // Set PORTC as digital output
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_9  |
                                   _GPIO_PINMASK_11 |
                                   _GPIO_PINMASK_10  );

  // GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_1);
  // GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0);

  // turn ON the STAT LED
  STAT = 1;

  // turn ON the DATA LED
  DATA = 1;
}

//Initialize USB communication
void InitUSB()
{
   // Initialize HID communication and specify our read and write buffers
   HID_Enable(&readbuff, &writebuff);
}

//enable interrupts
void Interrupt(){
   // USB servicing is done inside the interrupt
   USB_Interrupt_Proc();
}

void main() {

  InitPorts();

  while (1) 
  {
    // Toggle STAT LED
    STAT = ~STAT;

    Motor1Move(FORWARD);
    Motor2Move(BACKWARD);
    Wait();
 }
}