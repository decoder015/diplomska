_main:
;HID_Read_Write_Polling.c,34 :: 		void main(void){
;HID_Read_Write_Polling.c,36 :: 		HID_Enable(&readbuff,&writebuff);
MOVW	R1, #lo_addr(_writebuff+0)
MOVT	R1, #hi_addr(_writebuff+0)
MOVW	R0, #lo_addr(_readbuff+0)
MOVT	R0, #hi_addr(_readbuff+0)
BL	_HID_Enable+0
;HID_Read_Write_Polling.c,38 :: 		i = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STR	R1, [R0, #0]
;HID_Read_Write_Polling.c,40 :: 		while(1){
L_main0:
;HID_Read_Write_Polling.c,41 :: 		USB_Polling_Proc();               // Call this routine periodically
BL	_USB_Polling_Proc+0
;HID_Read_Write_Polling.c,42 :: 		kk = HID_Read();
BL	_HID_Read+0
MOVW	R1, #lo_addr(_kk+0)
MOVT	R1, #hi_addr(_kk+0)
STRB	R0, [R1, #0]
;HID_Read_Write_Polling.c,43 :: 		if(kk != 0){
CMP	R0, #0
IT	EQ
BEQ	L_main2
;HID_Read_Write_Polling.c,44 :: 		for(cnt=0;cnt<64;cnt++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
STRB	R1, [R0, #0]
L_main3:
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRB	R0, [R0, #0]
CMP	R0, #64
IT	CS
BCS	L_main4
;HID_Read_Write_Polling.c,45 :: 		writebuff[cnt]=readbuff[cnt];
MOVW	R3, #lo_addr(_cnt+0)
MOVT	R3, #hi_addr(_cnt+0)
LDRB	R1, [R3, #0]
MOVW	R0, #lo_addr(_writebuff+0)
MOVT	R0, #hi_addr(_writebuff+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_readbuff+0)
MOVT	R0, #hi_addr(_readbuff+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
STRB	R0, [R2, #0]
;HID_Read_Write_Polling.c,44 :: 		for(cnt=0;cnt<64;cnt++)
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;HID_Read_Write_Polling.c,45 :: 		writebuff[cnt]=readbuff[cnt];
IT	AL
BAL	L_main3
L_main4:
;HID_Read_Write_Polling.c,46 :: 		HID_Write(&writebuff,64);
MOVS	R1, #64
MOVW	R0, #lo_addr(_writebuff+0)
MOVT	R0, #hi_addr(_writebuff+0)
BL	_HID_Write+0
;HID_Read_Write_Polling.c,47 :: 		}
L_main2:
;HID_Read_Write_Polling.c,48 :: 		}
IT	AL
BAL	L_main0
;HID_Read_Write_Polling.c,49 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
