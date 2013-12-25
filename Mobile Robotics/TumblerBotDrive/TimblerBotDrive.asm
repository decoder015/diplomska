_M1Step:
;TimblerBotDrive.c,71 :: 		void M1Step()
;TimblerBotDrive.c,73 :: 		switch(m1State)
IT	AL
BAL	L_M1Step0
;TimblerBotDrive.c,75 :: 		case 0:
L_M1Step2:
;TimblerBotDrive.c,76 :: 		m1s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,77 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,78 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,79 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,80 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,81 :: 		case 1:
L_M1Step3:
;TimblerBotDrive.c,82 :: 		m1s1 = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,83 :: 		m1s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,84 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,85 :: 		m1s4 = 1;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,86 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,87 :: 		case 2:
L_M1Step4:
;TimblerBotDrive.c,88 :: 		m1s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,89 :: 		m1s2 = 1;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,90 :: 		m1s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,91 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,92 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,93 :: 		case 3:
L_M1Step5:
;TimblerBotDrive.c,94 :: 		m1s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,95 :: 		m1s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,96 :: 		m1s3 = 1;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,97 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,98 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,99 :: 		case 4:
L_M1Step6:
;TimblerBotDrive.c,100 :: 		m1s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,101 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,102 :: 		m1s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,103 :: 		m1s4 = 1;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,104 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,106 :: 		}
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
;TimblerBotDrive.c,107 :: 		}
L_end_M1Step:
BX	LR
; end of _M1Step
_M2Step:
;TimblerBotDrive.c,110 :: 		void M2Step()
;TimblerBotDrive.c,112 :: 		switch(m2State)
IT	AL
BAL	L_M2Step7
;TimblerBotDrive.c,114 :: 		case 0:
L_M2Step9:
;TimblerBotDrive.c,115 :: 		m2s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,116 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,117 :: 		m2s3 = 0;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,118 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,119 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,120 :: 		case 1:
L_M2Step10:
;TimblerBotDrive.c,121 :: 		m2s1 = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,122 :: 		m2s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,123 :: 		m2s3 = 0;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,124 :: 		m2s4 = 1;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,125 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,126 :: 		case 2:
L_M2Step11:
;TimblerBotDrive.c,127 :: 		m2s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,128 :: 		m2s2 = 1;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,129 :: 		m2s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,130 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,131 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,132 :: 		case 3:
L_M2Step12:
;TimblerBotDrive.c,133 :: 		m2s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,134 :: 		m2s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,135 :: 		m2s3 = 1;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,136 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,137 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,138 :: 		case 4:
L_M2Step13:
;TimblerBotDrive.c,139 :: 		m2s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,140 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,141 :: 		m2s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,142 :: 		m2s4 = 1;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,143 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,144 :: 		}
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
;TimblerBotDrive.c,145 :: 		}
L_end_M2Step:
BX	LR
; end of _M2Step
_M3Step:
;TimblerBotDrive.c,148 :: 		void M3Step()
;TimblerBotDrive.c,150 :: 		switch(m3State)
IT	AL
BAL	L_M3Step14
;TimblerBotDrive.c,152 :: 		case 0:
L_M3Step16:
;TimblerBotDrive.c,153 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,154 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,155 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,156 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,157 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,158 :: 		case 1:
L_M3Step17:
;TimblerBotDrive.c,159 :: 		m3s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,160 :: 		m3s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,161 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,162 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,163 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,164 :: 		case 2:
L_M3Step18:
;TimblerBotDrive.c,165 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,166 :: 		m3s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,167 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,168 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,169 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,170 :: 		case 3:
L_M3Step19:
;TimblerBotDrive.c,171 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,172 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,173 :: 		m3s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,174 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,175 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,176 :: 		case 4:
L_M3Step20:
;TimblerBotDrive.c,177 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,178 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,179 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,180 :: 		m3s4 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,181 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,182 :: 		}
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
;TimblerBotDrive.c,183 :: 		}
L_end_M3Step:
BX	LR
; end of _M3Step
_M4Step:
;TimblerBotDrive.c,186 :: 		void M4Step()
;TimblerBotDrive.c,188 :: 		switch(m4State)
IT	AL
BAL	L_M4Step21
;TimblerBotDrive.c,190 :: 		case 0:
L_M4Step23:
;TimblerBotDrive.c,191 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,192 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,193 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,194 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,195 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,196 :: 		case 1:
L_M4Step24:
;TimblerBotDrive.c,197 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,198 :: 		m4s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,199 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,200 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,201 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,202 :: 		case 2:
L_M4Step25:
;TimblerBotDrive.c,203 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,204 :: 		m4s2 = 1;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,205 :: 		m4s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,206 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,207 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,208 :: 		case 3:
L_M4Step26:
;TimblerBotDrive.c,209 :: 		m4s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,210 :: 		m4s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,211 :: 		m4s3 = 1;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,212 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,213 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,214 :: 		case 4:
L_M4Step27:
;TimblerBotDrive.c,215 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,216 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,217 :: 		m4s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,218 :: 		m4s4 = 1;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,219 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,220 :: 		}
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
;TimblerBotDrive.c,221 :: 		}
L_end_M4Step:
BX	LR
; end of _M4Step
_Wait:
;TimblerBotDrive.c,224 :: 		void Wait() {
;TimblerBotDrive.c,225 :: 		Delay_ms(C_INT_STEP_DELAY);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_Wait28:
SUBS	R7, R7, #1
BNE	L_Wait28
NOP
NOP
;TimblerBotDrive.c,226 :: 		}
L_end_Wait:
BX	LR
; end of _Wait
_Motor1Move:
;TimblerBotDrive.c,229 :: 		void Motor1Move(int speed, int direction)
; direction start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; direction end address is: 4 (R1)
; direction start address is: 4 (R1)
;TimblerBotDrive.c,231 :: 		switch(direction)
IT	AL
BAL	L_Motor1Move30
; direction end address is: 4 (R1)
;TimblerBotDrive.c,234 :: 		case FORWARD:
L_Motor1Move32:
;TimblerBotDrive.c,235 :: 		m1State++;
MOVW	R3, #lo_addr(_m1State+0)
MOVT	R3, #hi_addr(_m1State+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,236 :: 		if(m1State > 4)  m1State = 1;
CMP	R2, #4
IT	LE
BLE	L_Motor1Move33
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
STRH	R3, [R2, #0]
L_Motor1Move33:
;TimblerBotDrive.c,238 :: 		M1Step();
BL	_M1Step+0
;TimblerBotDrive.c,239 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TimblerBotDrive.c,241 :: 		case BACKWARD:
L_Motor1Move34:
;TimblerBotDrive.c,242 :: 		m1State--;
MOVW	R3, #lo_addr(_m1State+0)
MOVT	R3, #hi_addr(_m1State+0)
LDRSH	R2, [R3, #0]
SUBS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,243 :: 		if(m1State < 1)  m1State = 4;
CMP	R2, #1
IT	GE
BGE	L_Motor1Move35
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
STRH	R3, [R2, #0]
L_Motor1Move35:
;TimblerBotDrive.c,245 :: 		M1Step();
BL	_M1Step+0
;TimblerBotDrive.c,246 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TimblerBotDrive.c,247 :: 		}
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
;TimblerBotDrive.c,248 :: 		}
L_end_Motor1Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Motor1Move
_Motor2Move:
;TimblerBotDrive.c,251 :: 		void Motor2Move(int speed, int direction)
; direction start address is: 4 (R1)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; direction end address is: 4 (R1)
; direction start address is: 4 (R1)
;TimblerBotDrive.c,253 :: 		switch(direction)
IT	AL
BAL	L_Motor2Move36
; direction end address is: 4 (R1)
;TimblerBotDrive.c,256 :: 		case FORWARD:
L_Motor2Move38:
;TimblerBotDrive.c,257 :: 		m2State++;
MOVW	R3, #lo_addr(_m2State+0)
MOVT	R3, #hi_addr(_m2State+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,258 :: 		if(m2State > 4) m2State = 1;
CMP	R2, #4
IT	LE
BLE	L_Motor2Move39
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_m2State+0)
MOVT	R2, #hi_addr(_m2State+0)
STRH	R3, [R2, #0]
L_Motor2Move39:
;TimblerBotDrive.c,260 :: 		M2Step();
BL	_M2Step+0
;TimblerBotDrive.c,261 :: 		break;
IT	AL
BAL	L_Motor2Move37
;TimblerBotDrive.c,264 :: 		case BACKWARD:
L_Motor2Move40:
;TimblerBotDrive.c,265 :: 		m2State--;
MOVW	R3, #lo_addr(_m2State+0)
MOVT	R3, #hi_addr(_m2State+0)
LDRSH	R2, [R3, #0]
SUBS	R2, R2, #1
SXTH	R2, R2
STRH	R2, [R3, #0]
;TimblerBotDrive.c,266 :: 		if(m2State < 1) m2State= 4;
CMP	R2, #1
IT	GE
BGE	L_Motor2Move41
MOVS	R3, #4
SXTH	R3, R3
MOVW	R2, #lo_addr(_m2State+0)
MOVT	R2, #hi_addr(_m2State+0)
STRH	R3, [R2, #0]
L_Motor2Move41:
;TimblerBotDrive.c,268 :: 		M2Step();
BL	_M2Step+0
;TimblerBotDrive.c,269 :: 		break;
IT	AL
BAL	L_Motor2Move37
;TimblerBotDrive.c,270 :: 		}
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
;TimblerBotDrive.c,271 :: 		}
L_end_Motor2Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Motor2Move
_InitPorts:
;TimblerBotDrive.c,274 :: 		void InitPorts()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TimblerBotDrive.c,277 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12 | _GPIO_PINMASK_13);
MOVW	R1, #12288
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,280 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,295 :: 		_GPIO_PINMASK_6  );
MOVW	R1, #61427
;TimblerBotDrive.c,283 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5  |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;TimblerBotDrive.c,295 :: 		_GPIO_PINMASK_6  );
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,299 :: 		_GPIO_PINMASK_10  ); // Set PORTC as digital output
MOVW	R1, #3584
;TimblerBotDrive.c,297 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_9  |
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;TimblerBotDrive.c,299 :: 		_GPIO_PINMASK_10  ); // Set PORTC as digital output
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,305 :: 		STAT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,308 :: 		DATA = 1;
MOVW	R0, #lo_addr(ODR12_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,309 :: 		}
L_end_InitPorts:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitPorts
_interrupt:
;TimblerBotDrive.c,313 :: 		void interrupt()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TimblerBotDrive.c,315 :: 		USB_Interrupt_Proc();                  // USB servicing is done inside the interrupt
BL	_USB_Interrupt_Proc+0
;TimblerBotDrive.c,316 :: 		}
L_end_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interrupt
_main:
;TimblerBotDrive.c,319 :: 		void main() {
;TimblerBotDrive.c,321 :: 		InitPorts();
BL	_InitPorts+0
;TimblerBotDrive.c,324 :: 		HID_Enable(&readbuff, &writebuff);
MOVW	R1, #lo_addr(_writebuff+0)
MOVT	R1, #hi_addr(_writebuff+0)
MOVW	R0, #lo_addr(_readbuff+0)
MOVT	R0, #hi_addr(_readbuff+0)
BL	_HID_Enable+0
;TimblerBotDrive.c,326 :: 		while (1)
L_main42:
;TimblerBotDrive.c,329 :: 		STAT = ~STAT;
MOVW	R1, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R1, #hi_addr(ODR13_GPIOC_ODR_bit+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;TimblerBotDrive.c,331 :: 		Motor1Move(5, FORWARD);
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_Motor1Move+0
;TimblerBotDrive.c,332 :: 		Motor2Move(5, BACKWARD);
MOVS	R1, #1
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_Motor2Move+0
;TimblerBotDrive.c,335 :: 		Wait();
BL	_Wait+0
;TimblerBotDrive.c,337 :: 		}
IT	AL
BAL	L_main42
;TimblerBotDrive.c,338 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
