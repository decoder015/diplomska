_M1Step:
;TimblerBotDrive.c,74 :: 		void M1Step()
;TimblerBotDrive.c,76 :: 		switch(m1State)
IT	AL
BAL	L_M1Step0
;TimblerBotDrive.c,78 :: 		case 0:
L_M1Step2:
;TimblerBotDrive.c,79 :: 		m1s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,80 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,81 :: 		m1s3 = 0;
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
;TimblerBotDrive.c,84 :: 		case 1:
L_M1Step3:
;TimblerBotDrive.c,85 :: 		m1s1 = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,86 :: 		m1s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,87 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,88 :: 		m1s4 = 1;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,89 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,90 :: 		case 2:
L_M1Step4:
;TimblerBotDrive.c,91 :: 		m1s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,92 :: 		m1s2 = 1;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,93 :: 		m1s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,94 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,95 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,96 :: 		case 3:
L_M1Step5:
;TimblerBotDrive.c,97 :: 		m1s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,98 :: 		m1s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,99 :: 		m1s3 = 1;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,100 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,101 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,102 :: 		case 4:
L_M1Step6:
;TimblerBotDrive.c,103 :: 		m1s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,104 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,105 :: 		m1s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,106 :: 		m1s4 = 1;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,107 :: 		break;
IT	AL
BAL	L_M1Step1
;TimblerBotDrive.c,109 :: 		}
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
;TimblerBotDrive.c,110 :: 		}
L_end_M1Step:
BX	LR
; end of _M1Step
_M2Step:
;TimblerBotDrive.c,113 :: 		void M2Step()
;TimblerBotDrive.c,115 :: 		switch(m2State)
IT	AL
BAL	L_M2Step7
;TimblerBotDrive.c,117 :: 		case 0:
L_M2Step9:
;TimblerBotDrive.c,118 :: 		m2s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,119 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,120 :: 		m2s3 = 0;
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
;TimblerBotDrive.c,123 :: 		case 1:
L_M2Step10:
;TimblerBotDrive.c,124 :: 		m2s1 = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,125 :: 		m2s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,126 :: 		m2s3 = 0;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,127 :: 		m2s4 = 1;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,128 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,129 :: 		case 2:
L_M2Step11:
;TimblerBotDrive.c,130 :: 		m2s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,131 :: 		m2s2 = 1;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,132 :: 		m2s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,133 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,134 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,135 :: 		case 3:
L_M2Step12:
;TimblerBotDrive.c,136 :: 		m2s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,137 :: 		m2s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,138 :: 		m2s3 = 1;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,139 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,140 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,141 :: 		case 4:
L_M2Step13:
;TimblerBotDrive.c,142 :: 		m2s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,143 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,144 :: 		m2s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,145 :: 		m2s4 = 1;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,146 :: 		break;
IT	AL
BAL	L_M2Step8
;TimblerBotDrive.c,147 :: 		}
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
;TimblerBotDrive.c,148 :: 		}
L_end_M2Step:
BX	LR
; end of _M2Step
_M3Step:
;TimblerBotDrive.c,151 :: 		void M3Step()
;TimblerBotDrive.c,153 :: 		switch(m3State)
IT	AL
BAL	L_M3Step14
;TimblerBotDrive.c,155 :: 		case 0:
L_M3Step16:
;TimblerBotDrive.c,156 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,157 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,158 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,159 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,160 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,161 :: 		case 1:
L_M3Step17:
;TimblerBotDrive.c,162 :: 		m3s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,163 :: 		m3s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,164 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,165 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,166 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,167 :: 		case 2:
L_M3Step18:
;TimblerBotDrive.c,168 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,169 :: 		m3s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,170 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,171 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,172 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,173 :: 		case 3:
L_M3Step19:
;TimblerBotDrive.c,174 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,175 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,176 :: 		m3s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,177 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,178 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,179 :: 		case 4:
L_M3Step20:
;TimblerBotDrive.c,180 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,181 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,182 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,183 :: 		m3s4 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,184 :: 		break;
IT	AL
BAL	L_M3Step15
;TimblerBotDrive.c,185 :: 		}
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
;TimblerBotDrive.c,186 :: 		}
L_end_M3Step:
BX	LR
; end of _M3Step
_M4Step:
;TimblerBotDrive.c,189 :: 		void M4Step()
;TimblerBotDrive.c,191 :: 		switch(m4State)
IT	AL
BAL	L_M4Step21
;TimblerBotDrive.c,193 :: 		case 0:
L_M4Step23:
;TimblerBotDrive.c,194 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,195 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,196 :: 		m4s3 = 0;
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
;TimblerBotDrive.c,199 :: 		case 1:
L_M4Step24:
;TimblerBotDrive.c,200 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,201 :: 		m4s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,202 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,203 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,204 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,205 :: 		case 2:
L_M4Step25:
;TimblerBotDrive.c,206 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,207 :: 		m4s2 = 1;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,208 :: 		m4s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,209 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,210 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,211 :: 		case 3:
L_M4Step26:
;TimblerBotDrive.c,212 :: 		m4s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,213 :: 		m4s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,214 :: 		m4s3 = 1;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,215 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TimblerBotDrive.c,216 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,217 :: 		case 4:
L_M4Step27:
;TimblerBotDrive.c,218 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,219 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,220 :: 		m4s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,221 :: 		m4s4 = 1;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,222 :: 		break;
IT	AL
BAL	L_M4Step22
;TimblerBotDrive.c,223 :: 		}
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
;TimblerBotDrive.c,224 :: 		}
L_end_M4Step:
BX	LR
; end of _M4Step
_Wait:
;TimblerBotDrive.c,227 :: 		void Wait() {
;TimblerBotDrive.c,228 :: 		Delay_ms(C_INT_STEP_DELAY);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_Wait28:
SUBS	R7, R7, #1
BNE	L_Wait28
NOP
NOP
;TimblerBotDrive.c,229 :: 		}
L_end_Wait:
BX	LR
; end of _Wait
_Motor1Move:
;TimblerBotDrive.c,232 :: 		void Motor1Move(int direction)
; direction start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; direction end address is: 0 (R0)
; direction start address is: 0 (R0)
;TimblerBotDrive.c,234 :: 		switch(direction)
IT	AL
BAL	L_Motor1Move30
; direction end address is: 0 (R0)
;TimblerBotDrive.c,237 :: 		case FORWARD:
L_Motor1Move32:
;TimblerBotDrive.c,238 :: 		m1State++;
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;TimblerBotDrive.c,239 :: 		if(m1State > 4)  m1State = 1;
CMP	R1, #4
IT	LE
BLE	L_Motor1Move33
MOVS	R2, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_m1State+0)
MOVT	R1, #hi_addr(_m1State+0)
STRH	R2, [R1, #0]
L_Motor1Move33:
;TimblerBotDrive.c,241 :: 		M1Step();
BL	_M1Step+0
;TimblerBotDrive.c,242 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TimblerBotDrive.c,244 :: 		case BACKWARD:
L_Motor1Move34:
;TimblerBotDrive.c,245 :: 		m1State--;
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;TimblerBotDrive.c,246 :: 		if(m1State < 1)  m1State = 4;
CMP	R1, #1
IT	GE
BGE	L_Motor1Move35
MOVS	R2, #4
SXTH	R2, R2
MOVW	R1, #lo_addr(_m1State+0)
MOVT	R1, #hi_addr(_m1State+0)
STRH	R2, [R1, #0]
L_Motor1Move35:
;TimblerBotDrive.c,248 :: 		M1Step();
BL	_M1Step+0
;TimblerBotDrive.c,249 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TimblerBotDrive.c,250 :: 		}
L_Motor1Move30:
; direction start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_Motor1Move32
CMP	R0, #1
IT	EQ
BEQ	L_Motor1Move34
; direction end address is: 0 (R0)
L_Motor1Move31:
;TimblerBotDrive.c,251 :: 		}
L_end_Motor1Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Motor1Move
_Motor2Move:
;TimblerBotDrive.c,254 :: 		void Motor2Move(int direction)
; direction start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; direction end address is: 0 (R0)
; direction start address is: 0 (R0)
;TimblerBotDrive.c,256 :: 		switch(direction)
IT	AL
BAL	L_Motor2Move36
; direction end address is: 0 (R0)
;TimblerBotDrive.c,259 :: 		case FORWARD:
L_Motor2Move38:
;TimblerBotDrive.c,260 :: 		m2State++;
MOVW	R2, #lo_addr(_m2State+0)
MOVT	R2, #hi_addr(_m2State+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;TimblerBotDrive.c,261 :: 		if(m2State > 4) m2State = 1;
CMP	R1, #4
IT	LE
BLE	L_Motor2Move39
MOVS	R2, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_m2State+0)
MOVT	R1, #hi_addr(_m2State+0)
STRH	R2, [R1, #0]
L_Motor2Move39:
;TimblerBotDrive.c,263 :: 		M2Step();
BL	_M2Step+0
;TimblerBotDrive.c,264 :: 		break;
IT	AL
BAL	L_Motor2Move37
;TimblerBotDrive.c,267 :: 		case BACKWARD:
L_Motor2Move40:
;TimblerBotDrive.c,268 :: 		m2State--;
MOVW	R2, #lo_addr(_m2State+0)
MOVT	R2, #hi_addr(_m2State+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;TimblerBotDrive.c,269 :: 		if(m2State < 1) m2State= 4;
CMP	R1, #1
IT	GE
BGE	L_Motor2Move41
MOVS	R2, #4
SXTH	R2, R2
MOVW	R1, #lo_addr(_m2State+0)
MOVT	R1, #hi_addr(_m2State+0)
STRH	R2, [R1, #0]
L_Motor2Move41:
;TimblerBotDrive.c,271 :: 		M2Step();
BL	_M2Step+0
;TimblerBotDrive.c,272 :: 		break;
IT	AL
BAL	L_Motor2Move37
;TimblerBotDrive.c,273 :: 		}
L_Motor2Move36:
; direction start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_Motor2Move38
CMP	R0, #1
IT	EQ
BEQ	L_Motor2Move40
; direction end address is: 0 (R0)
L_Motor2Move37:
;TimblerBotDrive.c,274 :: 		}
L_end_Motor2Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Motor2Move
_InitPorts:
;TimblerBotDrive.c,277 :: 		void InitPorts()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TimblerBotDrive.c,280 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12 | _GPIO_PINMASK_13);
MOVW	R1, #12288
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,283 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,298 :: 		_GPIO_PINMASK_6  );
MOVW	R1, #61427
;TimblerBotDrive.c,286 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5  |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;TimblerBotDrive.c,298 :: 		_GPIO_PINMASK_6  );
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,303 :: 		_GPIO_PINMASK_10  );
MOVW	R1, #3584
;TimblerBotDrive.c,301 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_9  |
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;TimblerBotDrive.c,303 :: 		_GPIO_PINMASK_10  );
BL	_GPIO_Digital_Output+0
;TimblerBotDrive.c,309 :: 		STAT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,312 :: 		DATA = 1;
MOVW	R0, #lo_addr(ODR12_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TimblerBotDrive.c,313 :: 		}
L_end_InitPorts:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitPorts
_InitUSB:
;TimblerBotDrive.c,316 :: 		void InitUSB()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TimblerBotDrive.c,319 :: 		HID_Enable(&readbuff, &writebuff);
MOVW	R1, #lo_addr(_writebuff+0)
MOVT	R1, #hi_addr(_writebuff+0)
MOVW	R0, #lo_addr(_readbuff+0)
MOVT	R0, #hi_addr(_readbuff+0)
BL	_HID_Enable+0
;TimblerBotDrive.c,320 :: 		}
L_end_InitUSB:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitUSB
_interrupt:
;TimblerBotDrive.c,323 :: 		void interrupt(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TimblerBotDrive.c,325 :: 		USB_Interrupt_Proc();
BL	_USB_Interrupt_Proc+0
;TimblerBotDrive.c,326 :: 		}
L_end_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interrupt
_main:
;TimblerBotDrive.c,328 :: 		void main() {
;TimblerBotDrive.c,330 :: 		InitPorts();
BL	_InitPorts+0
;TimblerBotDrive.c,332 :: 		while (1)
L_main42:
;TimblerBotDrive.c,335 :: 		STAT = ~STAT;
MOVW	R1, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R1, #hi_addr(ODR13_GPIOC_ODR_bit+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;TimblerBotDrive.c,337 :: 		Motor1Move(FORWARD);
MOVS	R0, #0
SXTH	R0, R0
BL	_Motor1Move+0
;TimblerBotDrive.c,338 :: 		Motor2Move(BACKWARD);
MOVS	R0, #1
SXTH	R0, R0
BL	_Motor2Move+0
;TimblerBotDrive.c,339 :: 		Wait();
BL	_Wait+0
;TimblerBotDrive.c,341 :: 		}
IT	AL
BAL	L_main42
;TimblerBotDrive.c,342 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
