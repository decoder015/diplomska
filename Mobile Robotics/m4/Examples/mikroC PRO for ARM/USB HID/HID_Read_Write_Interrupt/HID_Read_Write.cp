#line 1 "C:/Users/Administrator/Desktop/The_Source Robotics/Robotics/Mobile Robotics/m4/mikroC PRO for ARM/USB HID/HID_Read_Write_Interrupt/HID_Read_Write.c"
#line 27 "C:/Users/Administrator/Desktop/The_Source Robotics/Robotics/Mobile Robotics/m4/mikroC PRO for ARM/USB HID/HID_Read_Write_Interrupt/HID_Read_Write.c"
char readbuff[64];
char writebuff[64];
char cnt;

void USB0Interrupt() iv IVT_INT_OTG_FS {
 USB_Interrupt_Proc();
}

void main() {
 HID_Enable(&readbuff,&writebuff);

 while(1) {
 while(!HID_Read());

 for(cnt=0;cnt<64;cnt++)
 writebuff[cnt]=readbuff[cnt];

 while(!HID_Write(&writebuff,64)) ;
 }
}
