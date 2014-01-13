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

sbit STAT at ODR13_GPIOC_ODR_bit;
sbit DATA at ODR12_GPIOC_ODR_bit;

void Wait() {
  Delay_ms(500);
}

void main() {
  // configure DATA and STAT pins as output
  GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12 | _GPIO_PINMASK_13);

  STAT = 0;                                  // turn OFF the STAT LED
  DATA = 0;                                  // turn OFF the DATA LED

  while (1) {
    STAT = ~STAT;                            // Toggle STAT LED
    Wait();                                  // 500ms pause
    DATA = ~DATA;                            // Toggle DATA LED
    Wait();                                  // 500ms pause
  }
}