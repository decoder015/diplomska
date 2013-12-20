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
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
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
;TimblerBotDrive.c,76 :: 		m1s4 = 1;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,77 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,78 :: 		case 2:
L_M1Step4:
;TimblerBotDrive.c,79 :: 		m1s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,80 :: 		m1s2 = 1;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,81 :: 		m1s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,82 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
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
;TimblerBotDrive.c,86 :: 		m1s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,87 :: 		m1s3 = 1;
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
;TimblerBotDrive.c,93 :: 		m1s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,94 :: 		m1s4 = 1;
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
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
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
;TimblerBotDrive.c,115 :: 		m2s4 = 1;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,116 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,117 :: 		case 2:
L_M2Step11:
;TimblerBotDrive.c,118 :: 		m2s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,119 :: 		m2s2 = 1;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,120 :: 		m2s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,121 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
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
;TimblerBotDrive.c,125 :: 		m2s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,126 :: 		m2s3 = 1;
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
;TimblerBotDrive.c,132 :: 		m2s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,133 :: 		m2s4 = 1;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,134 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,135 :: 		}
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
;TimblerBotDrive.c,136 :: 		}
L_end_M2Step:
BX	LR
; end of _M2Step
_M3Step:
;TimblerBotDrive.c,139 :: 		void M3Step()
;TimblerBotDrive.c,141 :: 		switch(m3State)
IT	AL
BAL	L_M3Step14
;TimblerBotDrive.c,143 :: 		case 0:
L_M3Step16:
;TimblerBotDrive.c,144 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,145 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,146 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,147 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,148 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,149 :: 		case 1:
L_M3Step17:
;TimblerBotDrive.c,150 :: 		m3s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,151 :: 		m3s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,152 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,153 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,154 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,155 :: 		case 2:
L_M3Step18:
;TimblerBotDrive.c,156 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,157 :: 		m3s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,158 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,159 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,160 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,161 :: 		case 3:
L_M3Step19:
;TimblerBotDrive.c,162 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,163 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,164 :: 		m3s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,165 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,166 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,167 :: 		case 4:
L_M3Step20:
;TimblerBotDrive.c,168 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,169 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,170 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,171 :: 		m3s4 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,172 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,173 :: 		}
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
;TimblerBotDrive.c,174 :: 		}
L_end_M3Step:
BX	LR
; end of _M3Step
_M4Step:
;TimblerBotDrive.c,177 :: 		void M4Step()
;TimblerBotDrive.c,179 :: 		switch(m4State)
IT	AL
BAL	L_M4Step21
;TimblerBotDrive.c,181 :: 		case 0:
L_M4Step23:
;TimblerBotDrive.c,182 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,183 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,184 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,185 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,186 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,187 :: 		case 1:
L_M4Step24:
;TimblerBotDrive.c,188 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,189 :: 		m4s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,190 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,191 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,192 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,193 :: 		case 2:
L_M4Step25:
;TimblerBotDrive.c,194 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,195 :: 		m4s2 = 1;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,196 :: 		m4s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,197 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,198 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,199 :: 		case 3:
L_M4Step26:
;TimblerBotDrive.c,200 :: 		m4s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,201 :: 		m4s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,202 :: 		m4s3 = 1;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,203 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,204 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,205 :: 		case 4:
L_M4Step27:
;TimblerBotDrive.c,206 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,207 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,208 :: 		m4s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,209 :: 		m4s4 = 1;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,210 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,211 :: 		}
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
;TimblerBotDrive.c,212 :: 		}
L_end_M4Step:
BX	LR
; end of _M4Step
_Wait:
;TimblerBotDrive.c,215 :: 		void Wait() {
;TimblerBotDrive.c,216 :: 		Delay_ms(10);
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
;TimblerBotDrive.c,217 :: 		}
L_end_Wait:
BX	LR
; end of _Wait
_Motor1Move:
;TimblerBotDrive.c,220 :: 		void Motor1Move(int speed, int direction)
; direction start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; direction end address is: 4 (R1)
; direction start address is: 4 (R1)
;TimblerBotDrive.c,222 :: 		switch(direction)
IT	AL
BAL	L_Motor1Move30
; direction end address is: 4 (R1)
;TimblerBotDrive.c,224 :: 		case FORWARD:
L_Motor1Move32:
;TimblerBotDrive.c,227 :: 		m1State++;
MOVW	R3, #lo_addr(_m1State+0)
MOVT	R3, #hi_addr(_m1State+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,228 :: 		if(m1State > 4)
CMP	R2, #4
IT	LE
BLE	L_Motor1Move33
;TimblerBotDrive.c,230 :: 		m1State = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
STRH	R3, [R2, #0]
;TimblerBotDrive.c,232 :: 		}
L_Motor1Move33:
;TimblerBotDrive.c,233 :: 		M1Step();
BL	_M1Step+0
;TimblerBotDrive.c,234 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TimblerBotDrive.c,235 :: 		case BACKWARD:
L_Motor1Move34:
;TimblerBotDrive.c,238 :: 		m1State--;
MOVW	R3, #lo_addr(_m1State+0)
MOVT	R3, #hi_addr(_m1State+0)
LDRSH	R2, [R3, #0]
SUBS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,239 :: 		if(m1State < 1)
CMP	R2, #1
IT	GE
BGE	L_Motor1Move35
;TimblerBotDrive.c,241 :: 		m1State = 4;
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
STRH	R3, [R2, #0]
;TimblerBotDrive.c,243 :: 		}
L_Motor1Move35:
;TimblerBotDrive.c,244 :: 		M1Step();
BL	_M1Step+0
;TimblerBotDrive.c,245 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TimblerBotDrive.c,246 :: 		}
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
;TimblerBotDrive.c,247 :: 		}
L_end_Motor1Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Motor1Move
_Motor2Move:
;TimblerBotDrive.c,250 :: 		void Motor2Move(int speed, int direction)
; direction start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; direction end address is: 4 (R1)
; direction start address is: 4 (R1)
;TimblerBotDrive.c,252 :: 		switch(direction)
IT	AL
BAL	L_Motor2Move36
; direction end address is: 4 (R1)
;TimblerBotDrive.c,254 :: 		case FORWARD:
L_Motor2Move38:
;TimblerBotDrive.c,257 :: 		m2State++;
MOVW	R3, #lo_addr(_m2State+0)
MOVT	R3, #hi_addr(_m2State+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,258 :: 		if(m2State > 4)
CMP	R2, #4
IT	LE
BLE	L_Motor2Move39
;TimblerBotDrive.c,260 :: 		m1State = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
STRH	R3, [R2, #0]
;TimblerBotDrive.c,262 :: 		}
L_Motor2Move39:
;TimblerBotDrive.c,263 :: 		M2Step();
BL	_M2Step+0
;TimblerBotDrive.c,264 :: 		break;
IT	AL
BAL	L_Motor2Move37
;TimblerBotDrive.c,265 :: 		case BACKWARD:
L_Motor2Move40:
;TimblerBotDrive.c,268 :: 		m2State--;
MOVW	R3, #lo_addr(_m2State+0)
MOVT	R3, #hi_addr(_m2State+0)
LDRSH	R2, [R3, #0]
SUBS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,269 :: 		if(m2State < 1)
CMP	R2, #1
IT	GE
BGE	L_Motor2Move41
;TimblerBotDrive.c,271 :: 		m2State= 4;
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_m2State+0)
MOVT	R2, #hi_addr(_m2State+0)
STRH	R3, [R2, #0]
;TimblerBotDrive.c,273 :: 		}
L_Motor2Move41:
;TimblerBotDrive.c,274 :: 		M2Step();
BL	_M2Step+0
;TimblerBotDrive.c,275 :: 		break;
IT	AL
BAL	L_Motor2Move37
;TimblerBotDrive.c,276 :: 		}
L_Motor2Move36:
; direction start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_Motor2Move38
CMP	R1, #1
IT	EQ
BEQ	L_Motor2Move40
; direction end address is: 4 (R1)
L_Motor2Move37:
;TimblerBotDrive.c,277 :: 		}
L_end_Motor2Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Motor2Move
_main:
;TimblerBotDrive.c,279 :: 		void main() {
;TimblerBotDrive.c,282 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12 | _GPIO_PINMASK_13);
MOVW	R1, #12288
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,285 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,300 :: 		_GPIO_PINMASK_6  );
MOVW	R1, #61427
;TimblerBotDrive.c,288 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5  |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;TimblerBotDrive.c,300 :: 		_GPIO_PINMASK_6  );
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,304 :: 		_GPIO_PINMASK_10  ); // Set PORTC as digital output
MOVW	R1, #3584
;TimblerBotDrive.c,302 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_9  |
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;TimblerBotDrive.c,304 :: 		_GPIO_PINMASK_10  ); // Set PORTC as digital output
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,309 :: 		STAT = 1;                                  // turn OFF the STAT LED
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,310 :: 		DATA = 1;                                  // turn OFF the DATA LED
MOVW	R0, #lo_addr(ODR12_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,314 :: 		while (1)
L_main42:
;TimblerBotDrive.c,318 :: 		STAT = ~STAT;
MOVW	R1, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R1, #hi_addr(ODR13_GPIOC_ODR_bit+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;TimblerBotDrive.c,324 :: 		Motor1Move(5, FORWARD);
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_Motor1Move+0
;TimblerBotDrive.c,325 :: 		Motor2Move(5, BACKWARD);
MOVS	R1, #1
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_Motor2Move+0
;TimblerBotDrive.c,328 :: 		Wait();
BL	_Wait+0
;TimblerBotDrive.c,330 :: 		}
IT	AL
BAL	L_main42
;TimblerBotDrive.c,331 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
