_USB0Interrupt:
;HID_Read_Write.c,31 :: 		void USB0Interrupt() iv IVT_INT_OTG_FS {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;HID_Read_Write.c,32 :: 		USB_Interrupt_Proc();
BL	_USB_Interrupt_Proc+0
;HID_Read_Write.c,33 :: 		}
L_end_USB0Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USB0Interrupt
_main:
;HID_Read_Write.c,35 :: 		void main() {
;HID_Read_Write.c,36 :: 		HID_Enable(&readbuff,&writebuff);
MOVW	R1, #lo_addr(_writebuff+0)
MOVT	R1, #hi_addr(_writebuff+0)
MOVW	R0, #lo_addr(_readbuff+0)
MOVT	R0, #hi_addr(_readbuff+0)
BL	_HID_Enable+0
;HID_Read_Write.c,38 :: 		while(1) {
L_main0:
;HID_Read_Write.c,39 :: 		while(!HID_Read());
L_main2:
BL	_HID_Read+0
CMP	R0, #0
IT	NE
BNE	L_main3
IT	AL
BAL	L_main2
L_main3:
;HID_Read_Write.c,41 :: 		for(cnt=0;cnt<64;cnt++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
STRB	R1, [R0, #0]
L_main4:
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRB	R0, [R0, #0]
CMP	R0, #64
IT	CS
BCS	L_main5
;HID_Read_Write.c,42 :: 		writebuff[cnt]=readbuff[cnt];
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
;HID_Read_Write.c,41 :: 		for(cnt=0;cnt<64;cnt++)
MOV	R0, R3
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
STRB	R0, [R3, #0]
;HID_Read_Write.c,42 :: 		writebuff[cnt]=readbuff[cnt];
IT	AL
BAL	L_main4
L_main5:
;HID_Read_Write.c,44 :: 		while(!HID_Write(&writebuff,64))  ;
L_main7:
MOVS	R1, #64
MOVW	R0, #lo_addr(_writebuff+0)
MOVT	R0, #hi_addr(_writebuff+0)
BL	_HID_Write+0
CMP	R0, #0
IT	NE
BNE	L_main8
IT	AL
BAL	L_main7
L_main8:
;HID_Read_Write.c,45 :: 		}
IT	AL
BAL	L_main0
;HID_Read_Write.c,46 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
