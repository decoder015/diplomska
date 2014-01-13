#line 1 "C:/Users/Administrator/Desktop/The_Source Robotics/Robotics/Mobile Robotics/m4/mikroC PRO for ARM/USB HID/HID_Read_Write_Polling/HID_Read_Write_Polling.c"
#line 27 "C:/Users/Administrator/Desktop/The_Source Robotics/Robotics/Mobile Robotics/m4/mikroC PRO for ARM/USB HID/HID_Read_Write_Polling/HID_Read_Write_Polling.c"
char cnt;
char kk;
char readbuff[64];
char writebuff[64];

unsigned long int i;

void main(void){

 HID_Enable(&readbuff,&writebuff);

 i = 0;

 while(1){
 USB_Polling_Proc();
 kk = HID_Read();
 if(kk != 0){
 for(cnt=0;cnt<64;cnt++)
 writebuff[cnt]=readbuff[cnt];
 HID_Write(&writebuff,64);
 }
 }
}
