/*
 * Project name:
     HID_Read_Write_Polling (USB HID Read & Write Test)
 * Copyright:
     (c) Mikroelektronika, 2012.
 * Revision History:
     20121120:
       - initial release (FJ);
 * Description:
     This example establishes connection with the HID terminal that is active
     on the PC. Upon connection establishment, the HID Device Name will appear
     in the respective window. The character that user sends to ARM from the HID
     terminal will be re-sent back to user.
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

char cnt;
char kk;
char readbuff[64];
char writebuff[64];

unsigned long int i;

void main(void){

  HID_Enable(&readbuff,&writebuff);

  i = 0;
  
  while(1){
    USB_Polling_Proc();               // Call this routine periodically
    kk = HID_Read();
    if(kk != 0){
      for(cnt=0;cnt<64;cnt++)
        writebuff[cnt]=readbuff[cnt];
      HID_Write(&writebuff,64);
    }
  }
}