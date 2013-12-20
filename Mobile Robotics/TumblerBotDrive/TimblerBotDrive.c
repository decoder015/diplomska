/*
 * Project name:
     Led_Blinking (The simplest simple example)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
     20121120:
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

enum SteppMotorDirection  {FORWARD = 0, BACKWARD =1};
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

//sbit PA1 at ODR1_GPIOA_ODR_bit;
void Wait() {
  Delay_ms(10);
}

 //move motor 1
void Motor1Move(int speed, int direction)
{
     switch(direction)
     {
        case FORWARD:
             //drive motor 1 fwd
            // M1Step();
             m1State++;
             if(m1State > 4)
             {
                m1State = 1;
                //VDelay_ms(speed);
             }
             M1Step();
        break;
      case BACKWARD:
           //drive motor 1 fwd

             m1State--;
             if(m1State < 1)
             {
                 m1State = 4;
                // VDelay_ms(speed);
             }
              M1Step();
      break;
     }
}

// Move Motor 2
void Motor2Move(int speed, int direction)
{
     switch(direction)
     {
        case FORWARD:
             //drive motor 2 fwd
             // M1Step();
             m2State++;
             if(m2State > 4)
             {
                m1State = 1;
                //VDelay_ms(speed);
             }
             M2Step();
        break;
      case BACKWARD:
           //drive motor 1 fwd

             m2State--;
             if(m2State < 1)
             {
                 m2State= 4;
                 //VDelay_ms(speed);
             }
              M2Step();
     break;
     }
}

void main() {

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
  
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_9  |
                                   _GPIO_PINMASK_11 |
                                   _GPIO_PINMASK_10  ); // Set PORTC as digital output

  // GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_1);
  // GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0);

  STAT = 1;                                  // turn OFF the STAT LED
  DATA = 1;                                  // turn OFF the DATA LED

  //GPIOB_ODR = 0;

  while (1) 
  {

    // Toggle STAT LED
    STAT = ~STAT;
    
    //Toggle DATA LED
    //DATA = ~DATA;
    

    Motor1Move(5, FORWARD);
    Motor2Move(5, BACKWARD);

    // 500ms pause
    Wait();

 }
}