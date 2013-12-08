_M1Step:
;TimblerBotDrive.c,62 :: 		void M1Step()
;TimblerBotDrive.c,64 :: 		switch(m1State)
IT	AL
BAL	L_M1Step0
;TimblerBotDrive.c,66 :: 		case 0:
L_M1Step2:
;TimblerBotDrive.c,67 :: 		m1s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,68 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,69 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,70 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,71 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,72 :: 		case 1:
L_M1Step3:
;TimblerBotDrive.c,73 :: 		m1s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,74 :: 		m1s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,75 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,76 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,77 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,78 :: 		case 2:
L_M1Step4:
;TimblerBotDrive.c,79 :: 		m1s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,80 :: 		m1s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,81 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,82 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,83 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,84 :: 		case 3:
L_M1Step5:
;TimblerBotDrive.c,85 :: 		m1s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,86 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,87 :: 		m1s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,88 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,89 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,90 :: 		case 4:
L_M1Step6:
;TimblerBotDrive.c,91 :: 		m1s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,92 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,93 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,94 :: 		m1s4 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,95 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,97 :: 		}
L_M1Step0:
MOVW	R0, #lo_addr(_m1State+0)
MOVT	R0, #hi_addr(_m1State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_M1Step2
MOVW	R0, #lo_addr(_m1State+0)
MOVT	R0, #hi_addr(_m1State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_M1Step3
MOVW	R0, #lo_addr(_m1State+0)
MOVT	R0, #hi_addr(_m1State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_M1Step4
MOVW	R0, #lo_addr(_m1State+0)
MOVT	R0, #hi_addr(_m1State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_M1Step5
MOVW	R0, #lo_addr(_m1State+0)
MOVT	R0, #hi_addr(_m1State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_M1Step6
L_M1Step1:
;TimblerBotDrive.c,98 :: 		}
L_end_M1Step:
BX	LR
; end of _M1Step
_M2Step:
;TimblerBotDrive.c,101 :: 		void M2Step()
;TimblerBotDrive.c,103 :: 		switch(m2State)
IT	AL
BAL	L_M2Step7
;TimblerBotDrive.c,105 :: 		case 0:
L_M2Step9:
;TimblerBotDrive.c,106 :: 		m2s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,107 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,108 :: 		m2s3 = 0;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,109 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,110 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,111 :: 		case 1:
L_M2Step10:
;TimblerBotDrive.c,112 :: 		m2s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,113 :: 		m2s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,114 :: 		m2s3 = 0;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,115 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,116 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,117 :: 		case 2:
L_M2Step11:
;TimblerBotDrive.c,118 :: 		m2s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,119 :: 		m2s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,120 :: 		m2s3 = 0;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,121 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,122 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,123 :: 		case 3:
L_M2Step12:
;TimblerBotDrive.c,124 :: 		m2s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,125 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,126 :: 		m2s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,127 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,128 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,129 :: 		case 4:
L_M2Step13:
;TimblerBotDrive.c,130 :: 		m2s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,131 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,132 :: 		m2s3 = 0;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,133 :: 		m2s4 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,134 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,136 :: 		}
L_M2Step7:
MOVW	R0, #lo_addr(_m2State+0)
MOVT	R0, #hi_addr(_m2State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_M2Step9
MOVW	R0, #lo_addr(_m2State+0)
MOVT	R0, #hi_addr(_m2State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_M2Step10
MOVW	R0, #lo_addr(_m2State+0)
MOVT	R0, #hi_addr(_m2State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_M2Step11
MOVW	R0, #lo_addr(_m2State+0)
MOVT	R0, #hi_addr(_m2State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_M2Step12
MOVW	R0, #lo_addr(_m2State+0)
MOVT	R0, #hi_addr(_m2State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_M2Step13
L_M2Step8:
;TimblerBotDrive.c,137 :: 		}
L_end_M2Step:
BX	LR
; end of _M2Step
_M3Step:
;TimblerBotDrive.c,140 :: 		void M3Step()
;TimblerBotDrive.c,142 :: 		switch(m3State)
IT	AL
BAL	L_M3Step14
;TimblerBotDrive.c,144 :: 		case 0:
L_M3Step16:
;TimblerBotDrive.c,145 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,146 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,147 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,148 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,149 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,150 :: 		case 1:
L_M3Step17:
;TimblerBotDrive.c,151 :: 		m3s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,152 :: 		m3s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,153 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,154 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,155 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,156 :: 		case 2:
L_M3Step18:
;TimblerBotDrive.c,157 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,158 :: 		m3s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,159 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,160 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,161 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,162 :: 		case 3:
L_M3Step19:
;TimblerBotDrive.c,163 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,164 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,165 :: 		m3s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,166 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,167 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,168 :: 		case 4:
L_M3Step20:
;TimblerBotDrive.c,169 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,170 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,171 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,172 :: 		m3s4 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,173 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,174 :: 		}
L_M3Step14:
MOVW	R0, #lo_addr(_m3State+0)
MOVT	R0, #hi_addr(_m3State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_M3Step16
MOVW	R0, #lo_addr(_m3State+0)
MOVT	R0, #hi_addr(_m3State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_M3Step17
MOVW	R0, #lo_addr(_m3State+0)
MOVT	R0, #hi_addr(_m3State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_M3Step18
MOVW	R0, #lo_addr(_m3State+0)
MOVT	R0, #hi_addr(_m3State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_M3Step19
MOVW	R0, #lo_addr(_m3State+0)
MOVT	R0, #hi_addr(_m3State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_M3Step20
L_M3Step15:
;TimblerBotDrive.c,175 :: 		}
L_end_M3Step:
BX	LR
; end of _M3Step
_M4Step:
;TimblerBotDrive.c,178 :: 		void M4Step()
;TimblerBotDrive.c,180 :: 		switch(m4State)
IT	AL
BAL	L_M4Step21
;TimblerBotDrive.c,182 :: 		case 0:
L_M4Step23:
;TimblerBotDrive.c,183 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,184 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,185 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,186 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,187 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,188 :: 		case 1:
L_M4Step24:
;TimblerBotDrive.c,189 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,190 :: 		m4s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,191 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,192 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,193 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,194 :: 		case 2:
L_M4Step25:
;TimblerBotDrive.c,195 :: 		m4s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,196 :: 		m4s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,197 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,198 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,199 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,200 :: 		case 3:
L_M4Step26:
;TimblerBotDrive.c,201 :: 		m4s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,202 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,203 :: 		m4s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,204 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,205 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,206 :: 		case 4:
L_M4Step27:
;TimblerBotDrive.c,207 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,208 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,209 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,210 :: 		m4s4 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,211 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,212 :: 		}
L_M4Step21:
MOVW	R0, #lo_addr(_m4State+0)
MOVT	R0, #hi_addr(_m4State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_M4Step23
MOVW	R0, #lo_addr(_m4State+0)
MOVT	R0, #hi_addr(_m4State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_M4Step24
MOVW	R0, #lo_addr(_m4State+0)
MOVT	R0, #hi_addr(_m4State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_M4Step25
MOVW	R0, #lo_addr(_m4State+0)
MOVT	R0, #hi_addr(_m4State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_M4Step26
MOVW	R0, #lo_addr(_m4State+0)
MOVT	R0, #hi_addr(_m4State+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_M4Step27
L_M4Step22:
;TimblerBotDrive.c,213 :: 		}
L_end_M4Step:
BX	LR
; end of _M4Step
_Wait:
;TimblerBotDrive.c,216 :: 		void Wait() {
;TimblerBotDrive.c,217 :: 		Delay_ms(10);
MOVW	R7, #6782
MOVT	R7, #6
NOP
NOP
L_Wait28:
SUBS	R7, R7, #1
BNE	L_Wait28
NOP
NOP
NOP
;TimblerBotDrive.c,218 :: 		}
L_end_Wait:
BX	LR
; end of _Wait
_Motor1Move:
;TimblerBotDrive.c,220 :: 		void Motor1Move(int speed, int direction)
; direction start address is: 4 (R1)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R4, R0
; direction end address is: 4 (R1)
; speed start address is: 16 (R4)
; direction start address is: 4 (R1)
;TimblerBotDrive.c,222 :: 		switch(direction)
IT	AL
BAL	L_Motor1Move30
; direction end address is: 4 (R1)
;TimblerBotDrive.c,224 :: 		case FORWARD:
L_Motor1Move32:
;TimblerBotDrive.c,226 :: 		M1Step();
BL	_M1Step+0
;TimblerBotDrive.c,227 :: 		m1State++;
MOVW	R3, #lo_addr(_m1State+0)
MOVT	R3, #hi_addr(_m1State+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,228 :: 		if(m1State > 4) m1State =0;
CMP	R2, #4
IT	LE
BLE	L_Motor1Move33
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
STRH	R3, [R2, #0]
L_Motor1Move33:
;TimblerBotDrive.c,229 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TimblerBotDrive.c,230 :: 		case BACKWARD:
L_Motor1Move34:
;TimblerBotDrive.c,232 :: 		M1Step();
BL	_M1Step+0
;TimblerBotDrive.c,233 :: 		m1State--;
MOVW	R3, #lo_addr(_m1State+0)
MOVT	R3, #hi_addr(_m1State+0)
LDRSH	R2, [R3, #0]
SUBS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,234 :: 		if(m1State > 4) m1State =0;
CMP	R2, #4
IT	LE
BLE	L_Motor1Move35
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
STRH	R3, [R2, #0]
L_Motor1Move35:
;TimblerBotDrive.c,235 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TimblerBotDrive.c,236 :: 		}
L_Motor1Move30:
; direction start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_Motor1Move32
CMP	R1, #1
IT	EQ
BEQ	L_Motor1Move34
; direction end address is: 4 (R1)
L_Motor1Move31:
;TimblerBotDrive.c,237 :: 		Vdelay_ms(speed);
SXTH	R0, R4
; speed end address is: 16 (R4)
BL	_VDelay_ms+0
;TimblerBotDrive.c,238 :: 		}
L_end_Motor1Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Motor1Move
_main:
;TimblerBotDrive.c,240 :: 		void main() {
;TimblerBotDrive.c,243 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12 | _GPIO_PINMASK_13);
MOVW	R1, #12288
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,246 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,261 :: 		_GPIO_PINMASK_6  );
MOVW	R1, #61427
;TimblerBotDrive.c,249 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5  |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;TimblerBotDrive.c,261 :: 		_GPIO_PINMASK_6  );
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,265 :: 		_GPIO_PINMASK_10  ); // Set PORTC as digital output
MOVW	R1, #3584
;TimblerBotDrive.c,263 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_9  |
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;TimblerBotDrive.c,265 :: 		_GPIO_PINMASK_10  ); // Set PORTC as digital output
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,270 :: 		STAT = 0;                                  // turn OFF the STAT LED
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,271 :: 		DATA = 1;                                  // turn OFF the DATA LED
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,275 :: 		while (1) {
L_main36:
;TimblerBotDrive.c,278 :: 		STAT = ~STAT;
MOVW	R1, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R1, #hi_addr(ODR13_GPIOC_ODR_bit+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;TimblerBotDrive.c,283 :: 		Motor1Move(5, FORWARD);
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_Motor1Move+0
;TimblerBotDrive.c,298 :: 		Wait();
BL	_Wait+0
;TimblerBotDrive.c,299 :: 		}
IT	AL
BAL	L_main36
;TimblerBotDrive.c,300 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
