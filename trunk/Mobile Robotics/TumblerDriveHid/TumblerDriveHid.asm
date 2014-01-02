_M1Step:
;TumblerDriveHid.c,86 :: 		void M1Step()
;TumblerDriveHid.c,88 :: 		switch(m1State)
IT	AL
BAL	L_M1Step0
;TumblerDriveHid.c,90 :: 		case 0:
L_M1Step2:
;TumblerDriveHid.c,91 :: 		m1s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,92 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,93 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,94 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,95 :: 		break;
IT	AL
BAL	L_M1Step1
;TumblerDriveHid.c,96 :: 		case 1:
L_M1Step3:
;TumblerDriveHid.c,97 :: 		m1s1 = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,98 :: 		m1s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,99 :: 		m1s3 = 0;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,100 :: 		m1s4 = 1;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,101 :: 		break;
IT	AL
BAL	L_M1Step1
;TumblerDriveHid.c,102 :: 		case 2:
L_M1Step4:
;TumblerDriveHid.c,103 :: 		m1s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,104 :: 		m1s2 = 1;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,105 :: 		m1s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,106 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,107 :: 		break;
IT	AL
BAL	L_M1Step1
;TumblerDriveHid.c,108 :: 		case 3:
L_M1Step5:
;TumblerDriveHid.c,109 :: 		m1s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,110 :: 		m1s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,111 :: 		m1s3 = 1;
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,112 :: 		m1s4 = 0;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,113 :: 		break;
IT	AL
BAL	L_M1Step1
;TumblerDriveHid.c,114 :: 		case 4:
L_M1Step6:
;TumblerDriveHid.c,115 :: 		m1s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR5_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR5_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,116 :: 		m1s2 = 0;
MOVW	R0, #lo_addr(ODR13_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,117 :: 		m1s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR0_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR0_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,118 :: 		m1s4 = 1;
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,119 :: 		break;
IT	AL
BAL	L_M1Step1
;TumblerDriveHid.c,121 :: 		}
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
;TumblerDriveHid.c,122 :: 		}
L_end_M1Step:
BX	LR
; end of _M1Step
_M2Step:
;TumblerDriveHid.c,125 :: 		void M2Step()
;TumblerDriveHid.c,127 :: 		switch(m2State)
IT	AL
BAL	L_M2Step7
;TumblerDriveHid.c,129 :: 		case 0:
L_M2Step9:
;TumblerDriveHid.c,130 :: 		m2s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,131 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,132 :: 		m2s3 = 0;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,133 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,134 :: 		break;
IT	AL
BAL	L_M2Step8
;TumblerDriveHid.c,135 :: 		case 1:
L_M2Step10:
;TumblerDriveHid.c,136 :: 		m2s1 = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,137 :: 		m2s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,138 :: 		m2s4 = 1;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,139 :: 		break;
IT	AL
BAL	L_M2Step8
;TumblerDriveHid.c,140 :: 		case 2:
L_M2Step11:
;TumblerDriveHid.c,141 :: 		m2s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,142 :: 		m2s2 = 1;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,143 :: 		m2s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,144 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,145 :: 		break;
IT	AL
BAL	L_M2Step8
;TumblerDriveHid.c,146 :: 		case 3:
L_M2Step12:
;TumblerDriveHid.c,147 :: 		m2s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,148 :: 		m2s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,149 :: 		m2s3 = 1;
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,150 :: 		m2s4 = 0;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,151 :: 		break;
IT	AL
BAL	L_M2Step8
;TumblerDriveHid.c,152 :: 		case 4:
L_M2Step13:
;TumblerDriveHid.c,153 :: 		m2s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,154 :: 		m2s2 = 0;
MOVW	R0, #lo_addr(ODR8_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR8_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,155 :: 		m2s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR9_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR9_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,156 :: 		m2s4 = 1;
MOVW	R0, #lo_addr(ODR4_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR4_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,157 :: 		break;
IT	AL
BAL	L_M2Step8
;TumblerDriveHid.c,158 :: 		}
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
;TumblerDriveHid.c,159 :: 		}
L_end_M2Step:
BX	LR
; end of _M2Step
_M3Step:
;TumblerDriveHid.c,162 :: 		void M3Step()
;TumblerDriveHid.c,164 :: 		switch(m3State)
IT	AL
BAL	L_M3Step14
;TumblerDriveHid.c,166 :: 		case 0:
L_M3Step16:
;TumblerDriveHid.c,167 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,168 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,169 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,170 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,171 :: 		break;
IT	AL
BAL	L_M3Step15
;TumblerDriveHid.c,172 :: 		case 1:
L_M3Step17:
;TumblerDriveHid.c,173 :: 		m3s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,174 :: 		m3s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,175 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,176 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,177 :: 		break;
IT	AL
BAL	L_M3Step15
;TumblerDriveHid.c,178 :: 		case 2:
L_M3Step18:
;TumblerDriveHid.c,179 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,180 :: 		m3s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,181 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,182 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,183 :: 		break;
IT	AL
BAL	L_M3Step15
;TumblerDriveHid.c,184 :: 		case 3:
L_M3Step19:
;TumblerDriveHid.c,185 :: 		m3s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,186 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,187 :: 		m3s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,188 :: 		m3s4 = 0;
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,189 :: 		break;
IT	AL
BAL	L_M3Step15
;TumblerDriveHid.c,190 :: 		case 4:
L_M3Step20:
;TumblerDriveHid.c,191 :: 		m3s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,192 :: 		m3s2 = 0;
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,193 :: 		m3s3 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,194 :: 		m3s4 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,195 :: 		break;
IT	AL
BAL	L_M3Step15
;TumblerDriveHid.c,196 :: 		}
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
;TumblerDriveHid.c,197 :: 		}
L_end_M3Step:
BX	LR
; end of _M3Step
_M4Step:
;TumblerDriveHid.c,200 :: 		void M4Step()
;TumblerDriveHid.c,202 :: 		switch(m4State)
IT	AL
BAL	L_M4Step21
;TumblerDriveHid.c,204 :: 		case 0:
L_M4Step23:
;TumblerDriveHid.c,205 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,206 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,207 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,208 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,209 :: 		break;
IT	AL
BAL	L_M4Step22
;TumblerDriveHid.c,210 :: 		case 1:
L_M4Step24:
;TumblerDriveHid.c,211 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,212 :: 		m4s2 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,213 :: 		m4s3 = 0;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,214 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,215 :: 		break;
IT	AL
BAL	L_M4Step22
;TumblerDriveHid.c,216 :: 		case 2:
L_M4Step25:
;TumblerDriveHid.c,217 :: 		m4s1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,218 :: 		m4s2 = 1;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,219 :: 		m4s3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,220 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,221 :: 		break;
IT	AL
BAL	L_M4Step22
;TumblerDriveHid.c,222 :: 		case 3:
L_M4Step26:
;TumblerDriveHid.c,223 :: 		m4s1 = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,224 :: 		m4s2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,225 :: 		m4s3 = 1;
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,226 :: 		m4s4 = 0;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R2, [R0, #0]
;TumblerDriveHid.c,227 :: 		break;
IT	AL
BAL	L_M4Step22
;TumblerDriveHid.c,228 :: 		case 4:
L_M4Step27:
;TumblerDriveHid.c,229 :: 		m4s1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,230 :: 		m4s2 = 0;
MOVW	R0, #lo_addr(ODR11_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,231 :: 		m4s3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,232 :: 		m4s4 = 1;
MOVW	R0, #lo_addr(ODR6_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,233 :: 		break;
IT	AL
BAL	L_M4Step22
;TumblerDriveHid.c,234 :: 		}
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
;TumblerDriveHid.c,235 :: 		}
L_end_M4Step:
BX	LR
; end of _M4Step
_Wait:
;TumblerDriveHid.c,238 :: 		void Wait() {
;TumblerDriveHid.c,239 :: 		Delay_ms(C_INT_STEP_DELAY);
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_Wait28:
SUBS	R7, R7, #1
BNE	L_Wait28
NOP
NOP
NOP
;TumblerDriveHid.c,240 :: 		}
L_end_Wait:
BX	LR
; end of _Wait
_Motor1Move:
;TumblerDriveHid.c,243 :: 		void Motor1Move(int direction)
; direction start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; direction end address is: 0 (R0)
; direction start address is: 0 (R0)
;TumblerDriveHid.c,245 :: 		switch(direction)
IT	AL
BAL	L_Motor1Move30
; direction end address is: 0 (R0)
;TumblerDriveHid.c,248 :: 		case FORWARD:
L_Motor1Move32:
;TumblerDriveHid.c,249 :: 		m1State++;
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;TumblerDriveHid.c,250 :: 		if(m1State > 4)  m1State = 1;
CMP	R1, #4
IT	LE
BLE	L_Motor1Move33
MOVS	R2, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_m1State+0)
MOVT	R1, #hi_addr(_m1State+0)
STRH	R2, [R1, #0]
L_Motor1Move33:
;TumblerDriveHid.c,252 :: 		M1Step();
BL	_M1Step+0
;TumblerDriveHid.c,253 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TumblerDriveHid.c,255 :: 		case BACKWARD:
L_Motor1Move34:
;TumblerDriveHid.c,256 :: 		m1State--;
MOVW	R2, #lo_addr(_m1State+0)
MOVT	R2, #hi_addr(_m1State+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;TumblerDriveHid.c,257 :: 		if(m1State < 1)  m1State = 4;
CMP	R1, #1
IT	GE
BGE	L_Motor1Move35
MOVS	R2, #4
SXTH	R2, R2
MOVW	R1, #lo_addr(_m1State+0)
MOVT	R1, #hi_addr(_m1State+0)
STRH	R2, [R1, #0]
L_Motor1Move35:
;TumblerDriveHid.c,259 :: 		M1Step();
BL	_M1Step+0
;TumblerDriveHid.c,260 :: 		break;
IT	AL
BAL	L_Motor1Move31
;TumblerDriveHid.c,261 :: 		}
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
;TumblerDriveHid.c,262 :: 		}
L_end_Motor1Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Motor1Move
_Motor2Move:
;TumblerDriveHid.c,265 :: 		void Motor2Move(int direction)
; direction start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; direction end address is: 0 (R0)
; direction start address is: 0 (R0)
;TumblerDriveHid.c,267 :: 		switch(direction)
IT	AL
BAL	L_Motor2Move36
; direction end address is: 0 (R0)
;TumblerDriveHid.c,270 :: 		case FORWARD:
L_Motor2Move38:
;TumblerDriveHid.c,271 :: 		m2State++;
MOVW	R2, #lo_addr(_m2State+0)
MOVT	R2, #hi_addr(_m2State+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;TumblerDriveHid.c,272 :: 		if(m2State > 4) m2State = 1;
CMP	R1, #4
IT	LE
BLE	L_Motor2Move39
MOVS	R2, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_m2State+0)
MOVT	R1, #hi_addr(_m2State+0)
STRH	R2, [R1, #0]
L_Motor2Move39:
;TumblerDriveHid.c,274 :: 		M2Step();
BL	_M2Step+0
;TumblerDriveHid.c,275 :: 		break;
IT	AL
BAL	L_Motor2Move37
;TumblerDriveHid.c,278 :: 		case BACKWARD:
L_Motor2Move40:
;TumblerDriveHid.c,279 :: 		m2State--;
MOVW	R2, #lo_addr(_m2State+0)
MOVT	R2, #hi_addr(_m2State+0)
LDRSH	R1, [R2, #0]
SUBS	R1, R1, #1
SXTH	R1, R1
STRH	R1, [R2, #0]
;TumblerDriveHid.c,280 :: 		if(m2State < 1) m2State= 4;
CMP	R1, #1
IT	GE
BGE	L_Motor2Move41
MOVS	R2, #4
SXTH	R2, R2
MOVW	R1, #lo_addr(_m2State+0)
MOVT	R1, #hi_addr(_m2State+0)
STRH	R2, [R1, #0]
L_Motor2Move41:
;TumblerDriveHid.c,282 :: 		M2Step();
BL	_M2Step+0
;TumblerDriveHid.c,283 :: 		break;
IT	AL
BAL	L_Motor2Move37
;TumblerDriveHid.c,284 :: 		}
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
;TumblerDriveHid.c,285 :: 		}
L_end_Motor2Move:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Motor2Move
_DriveTumblerForward:
;TumblerDriveHid.c,287 :: 		void DriveTumblerForward(int steps)
; steps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; steps end address is: 0 (R0)
; steps start address is: 0 (R0)
;TumblerDriveHid.c,289 :: 		for(i=0; i<steps; i++)
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
STRH	R2, [R1, #0]
; steps end address is: 0 (R0)
SXTH	R3, R0
L_DriveTumblerForward42:
; steps start address is: 12 (R3)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R1, [R1, #0]
CMP	R1, R3
IT	GE
BGE	L_DriveTumblerForward43
;TumblerDriveHid.c,291 :: 		Motor1Move(FORWARD);
MOVS	R0, #0
SXTH	R0, R0
BL	_Motor1Move+0
;TumblerDriveHid.c,292 :: 		Motor2Move(BACKWARD);
MOVS	R0, #1
SXTH	R0, R0
BL	_Motor2Move+0
;TumblerDriveHid.c,293 :: 		Wait();
BL	_Wait+0
;TumblerDriveHid.c,289 :: 		for(i=0; i<steps; i++)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;TumblerDriveHid.c,294 :: 		}
; steps end address is: 12 (R3)
IT	AL
BAL	L_DriveTumblerForward42
L_DriveTumblerForward43:
;TumblerDriveHid.c,297 :: 		m1State=0;
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_m1State+0)
MOVT	R1, #hi_addr(_m1State+0)
STRH	R2, [R1, #0]
;TumblerDriveHid.c,298 :: 		m2State=0;
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_m2State+0)
MOVT	R1, #hi_addr(_m2State+0)
STRH	R2, [R1, #0]
;TumblerDriveHid.c,299 :: 		M1Step();
BL	_M1Step+0
;TumblerDriveHid.c,300 :: 		M2Step();
BL	_M2Step+0
;TumblerDriveHid.c,301 :: 		}
L_end_DriveTumblerForward:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DriveTumblerForward
_DriveTumblerBackward:
;TumblerDriveHid.c,303 :: 		void DriveTumblerBackward(int steps)
;TumblerDriveHid.c,306 :: 		}
L_end_DriveTumblerBackward:
BX	LR
; end of _DriveTumblerBackward
_DriveTumblerLeft:
;TumblerDriveHid.c,308 :: 		void DriveTumblerLeft(int steps)
; steps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; steps end address is: 0 (R0)
; steps start address is: 0 (R0)
;TumblerDriveHid.c,310 :: 		for(i=0; i<steps; i++)
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
STRH	R2, [R1, #0]
; steps end address is: 0 (R0)
SXTH	R3, R0
L_DriveTumblerLeft45:
; steps start address is: 12 (R3)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R1, [R1, #0]
CMP	R1, R3
IT	GE
BGE	L_DriveTumblerLeft46
;TumblerDriveHid.c,312 :: 		Motor1Move(FORWARD);
MOVS	R0, #0
SXTH	R0, R0
BL	_Motor1Move+0
;TumblerDriveHid.c,313 :: 		Motor2Move(FORWARD);
MOVS	R0, #0
SXTH	R0, R0
BL	_Motor2Move+0
;TumblerDriveHid.c,314 :: 		Wait();
BL	_Wait+0
;TumblerDriveHid.c,310 :: 		for(i=0; i<steps; i++)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;TumblerDriveHid.c,315 :: 		}
; steps end address is: 12 (R3)
IT	AL
BAL	L_DriveTumblerLeft45
L_DriveTumblerLeft46:
;TumblerDriveHid.c,318 :: 		m1State=0;
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_m1State+0)
MOVT	R1, #hi_addr(_m1State+0)
STRH	R2, [R1, #0]
;TumblerDriveHid.c,319 :: 		m2State=0;
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_m2State+0)
MOVT	R1, #hi_addr(_m2State+0)
STRH	R2, [R1, #0]
;TumblerDriveHid.c,320 :: 		M1Step();
BL	_M1Step+0
;TumblerDriveHid.c,321 :: 		M2Step();
BL	_M2Step+0
;TumblerDriveHid.c,322 :: 		}
L_end_DriveTumblerLeft:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DriveTumblerLeft
_DriveTumblerRight:
;TumblerDriveHid.c,324 :: 		void DriveTumblerRight(int steps)
; steps start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; steps end address is: 0 (R0)
; steps start address is: 0 (R0)
;TumblerDriveHid.c,326 :: 		for(i=0; i<steps; i++)
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
STRH	R2, [R1, #0]
; steps end address is: 0 (R0)
SXTH	R3, R0
L_DriveTumblerRight48:
; steps start address is: 12 (R3)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R1, [R1, #0]
CMP	R1, R3
IT	GE
BGE	L_DriveTumblerRight49
;TumblerDriveHid.c,328 :: 		Motor1Move(BACKWARD);
MOVS	R0, #1
SXTH	R0, R0
BL	_Motor1Move+0
;TumblerDriveHid.c,329 :: 		Motor2Move(BACKWARD);
MOVS	R0, #1
SXTH	R0, R0
BL	_Motor2Move+0
;TumblerDriveHid.c,330 :: 		Wait();
BL	_Wait+0
;TumblerDriveHid.c,326 :: 		for(i=0; i<steps; i++)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;TumblerDriveHid.c,331 :: 		}
; steps end address is: 12 (R3)
IT	AL
BAL	L_DriveTumblerRight48
L_DriveTumblerRight49:
;TumblerDriveHid.c,334 :: 		m1State=0;
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_m1State+0)
MOVT	R1, #hi_addr(_m1State+0)
STRH	R2, [R1, #0]
;TumblerDriveHid.c,335 :: 		m2State=0;
MOVS	R2, #0
SXTH	R2, R2
MOVW	R1, #lo_addr(_m2State+0)
MOVT	R1, #hi_addr(_m2State+0)
STRH	R2, [R1, #0]
;TumblerDriveHid.c,336 :: 		M1Step();
BL	_M1Step+0
;TumblerDriveHid.c,337 :: 		M2Step();
BL	_M2Step+0
;TumblerDriveHid.c,338 :: 		}
L_end_DriveTumblerRight:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DriveTumblerRight
_GetDirection:
;TumblerDriveHid.c,340 :: 		int GetDirection(char *command)
; command start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R7, R0
; command end address is: 0 (R0)
; command start address is: 28 (R7)
;TumblerDriveHid.c,342 :: 		if(strstr(command, stepForward) != 0)
MOVW	R1, #lo_addr(_stepForward+0)
MOVT	R1, #hi_addr(_stepForward+0)
MOV	R0, R7
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_GetDirection51
; command end address is: 28 (R7)
;TumblerDriveHid.c,344 :: 		return FORWARD;
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_GetDirection
;TumblerDriveHid.c,345 :: 		}
L_GetDirection51:
;TumblerDriveHid.c,346 :: 		else if(strstr(command, stepBackward) != 0)
; command start address is: 28 (R7)
MOVW	R1, #lo_addr(_stepBackward+0)
MOVT	R1, #hi_addr(_stepBackward+0)
MOV	R0, R7
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_GetDirection53
; command end address is: 28 (R7)
;TumblerDriveHid.c,348 :: 		return BACKWARD;
MOVS	R0, #1
SXTH	R0, R0
IT	AL
BAL	L_end_GetDirection
;TumblerDriveHid.c,349 :: 		}
L_GetDirection53:
;TumblerDriveHid.c,350 :: 		else if(strstr(command, stepLeft) != 0)
; command start address is: 28 (R7)
MOVW	R1, #lo_addr(_stepLeft+0)
MOVT	R1, #hi_addr(_stepLeft+0)
MOV	R0, R7
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_GetDirection55
; command end address is: 28 (R7)
;TumblerDriveHid.c,352 :: 		return LEFT;
MOVS	R0, #2
SXTH	R0, R0
IT	AL
BAL	L_end_GetDirection
;TumblerDriveHid.c,353 :: 		}
L_GetDirection55:
;TumblerDriveHid.c,354 :: 		else if(strstr(command, stepRight) != 0)
; command start address is: 28 (R7)
MOVW	R1, #lo_addr(_stepRight+0)
MOVT	R1, #hi_addr(_stepRight+0)
MOV	R0, R7
; command end address is: 28 (R7)
BL	_strstr+0
CMP	R0, #0
IT	EQ
BEQ	L_GetDirection57
;TumblerDriveHid.c,356 :: 		return RIGHT;
MOVS	R0, #3
SXTH	R0, R0
IT	AL
BAL	L_end_GetDirection
;TumblerDriveHid.c,357 :: 		}
L_GetDirection57:
;TumblerDriveHid.c,360 :: 		return -1;
MOVW	R0, #65535
SXTH	R0, R0
;TumblerDriveHid.c,362 :: 		}
L_end_GetDirection:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GetDirection
_GetSteps:
;TumblerDriveHid.c,364 :: 		int GetSteps(char *command)
; command start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; command end address is: 0 (R0)
; command start address is: 0 (R0)
;TumblerDriveHid.c,366 :: 		steps = -1;
MOVW	R2, #65535
SXTH	R2, R2
MOVW	R1, #lo_addr(_steps+0)
MOVT	R1, #hi_addr(_steps+0)
STRH	R2, [R1, #0]
;TumblerDriveHid.c,368 :: 		stepVal = strrchr(command, ',');
MOVS	R1, #44
; command end address is: 0 (R0)
BL	_strrchr+0
MOVW	R1, #lo_addr(_stepVal+0)
MOVT	R1, #hi_addr(_stepVal+0)
STR	R0, [R1, #0]
;TumblerDriveHid.c,369 :: 		if(stepVal != 0)
CMP	R0, #0
IT	EQ
BEQ	L_GetSteps59
;TumblerDriveHid.c,372 :: 		stepVal++;
MOVW	R2, #lo_addr(_stepVal+0)
MOVT	R2, #hi_addr(_stepVal+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, #1
STR	R1, [R2, #0]
;TumblerDriveHid.c,373 :: 		steps = atoi(stepVal);
MOV	R0, R1
BL	_atoi+0
MOVW	R1, #lo_addr(_steps+0)
MOVT	R1, #hi_addr(_steps+0)
STRH	R0, [R1, #0]
;TumblerDriveHid.c,374 :: 		}
L_GetSteps59:
;TumblerDriveHid.c,375 :: 		return steps;
MOVW	R1, #lo_addr(_steps+0)
MOVT	R1, #hi_addr(_steps+0)
LDRSH	R0, [R1, #0]
;TumblerDriveHid.c,376 :: 		}
L_end_GetSteps:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _GetSteps
_DriveTumbler:
;TumblerDriveHid.c,378 :: 		int DriveTumbler(char *command)
; command start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOV	R8, R0
; command end address is: 0 (R0)
; command start address is: 32 (R8)
;TumblerDriveHid.c,380 :: 		direction = GetDirection(command);
MOV	R0, R8
BL	_GetDirection+0
MOVW	R1, #lo_addr(_direction+0)
MOVT	R1, #hi_addr(_direction+0)
STRH	R0, [R1, #0]
;TumblerDriveHid.c,381 :: 		steps = GetSteps(command);
MOV	R0, R8
; command end address is: 32 (R8)
BL	_GetSteps+0
MOVW	R1, #lo_addr(_steps+0)
MOVT	R1, #hi_addr(_steps+0)
STRH	R0, [R1, #0]
;TumblerDriveHid.c,383 :: 		switch(direction)
IT	AL
BAL	L_DriveTumbler60
;TumblerDriveHid.c,385 :: 		case FORWARD:
L_DriveTumbler62:
;TumblerDriveHid.c,386 :: 		DriveTumblerForward(steps);
MOVW	R1, #lo_addr(_steps+0)
MOVT	R1, #hi_addr(_steps+0)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
BL	_DriveTumblerForward+0
;TumblerDriveHid.c,387 :: 		return 0;
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_DriveTumbler
;TumblerDriveHid.c,388 :: 		case BACKWARD:
L_DriveTumbler63:
;TumblerDriveHid.c,389 :: 		DriveTumblerBackward(steps);
MOVW	R1, #lo_addr(_steps+0)
MOVT	R1, #hi_addr(_steps+0)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
BL	_DriveTumblerBackward+0
;TumblerDriveHid.c,390 :: 		return 0;
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_DriveTumbler
;TumblerDriveHid.c,391 :: 		case LEFT:
L_DriveTumbler64:
;TumblerDriveHid.c,392 :: 		DriveTumblerLeft(steps);
MOVW	R1, #lo_addr(_steps+0)
MOVT	R1, #hi_addr(_steps+0)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
BL	_DriveTumblerLeft+0
;TumblerDriveHid.c,393 :: 		return 0;
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_DriveTumbler
;TumblerDriveHid.c,394 :: 		case RIGHT:
L_DriveTumbler65:
;TumblerDriveHid.c,395 :: 		DriveTumblerRight(steps);
MOVW	R1, #lo_addr(_steps+0)
MOVT	R1, #hi_addr(_steps+0)
LDRSH	R1, [R1, #0]
SXTH	R0, R1
BL	_DriveTumblerRight+0
;TumblerDriveHid.c,396 :: 		return 0;
MOVS	R0, #0
SXTH	R0, R0
IT	AL
BAL	L_end_DriveTumbler
;TumblerDriveHid.c,397 :: 		default:
L_DriveTumbler66:
;TumblerDriveHid.c,398 :: 		return -1;
MOVW	R0, #65535
SXTH	R0, R0
IT	AL
BAL	L_end_DriveTumbler
;TumblerDriveHid.c,399 :: 		}
L_DriveTumbler60:
MOVW	R1, #lo_addr(_direction+0)
MOVT	R1, #hi_addr(_direction+0)
LDRSH	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DriveTumbler62
MOVW	R1, #lo_addr(_direction+0)
MOVT	R1, #hi_addr(_direction+0)
LDRSH	R1, [R1, #0]
CMP	R1, #1
IT	EQ
BEQ	L_DriveTumbler63
MOVW	R1, #lo_addr(_direction+0)
MOVT	R1, #hi_addr(_direction+0)
LDRSH	R1, [R1, #0]
CMP	R1, #2
IT	EQ
BEQ	L_DriveTumbler64
MOVW	R1, #lo_addr(_direction+0)
MOVT	R1, #hi_addr(_direction+0)
LDRSH	R1, [R1, #0]
CMP	R1, #3
IT	EQ
BEQ	L_DriveTumbler65
IT	AL
BAL	L_DriveTumbler66
;TumblerDriveHid.c,400 :: 		}
L_end_DriveTumbler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DriveTumbler
_InitPorts:
;TumblerDriveHid.c,403 :: 		void InitPorts()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TumblerDriveHid.c,406 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12 | _GPIO_PINMASK_13);
MOVW	R1, #12288
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;TumblerDriveHid.c,409 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;TumblerDriveHid.c,424 :: 		_GPIO_PINMASK_6  );
MOVW	R1, #61427
;TumblerDriveHid.c,412 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5  |
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
;TumblerDriveHid.c,424 :: 		_GPIO_PINMASK_6  );
BL	_GPIO_Digital_Output+0
;TumblerDriveHid.c,429 :: 		_GPIO_PINMASK_10  );
MOVW	R1, #3584
;TumblerDriveHid.c,427 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_9  |
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
;TumblerDriveHid.c,429 :: 		_GPIO_PINMASK_10  );
BL	_GPIO_Digital_Output+0
;TumblerDriveHid.c,435 :: 		STAT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR13_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,438 :: 		DATA = 1;
MOVW	R0, #lo_addr(ODR12_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,439 :: 		}
L_end_InitPorts:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitPorts
_InitUSB:
;TumblerDriveHid.c,442 :: 		void InitUSB()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TumblerDriveHid.c,445 :: 		HID_Enable(&readbuff, &writebuff);
MOVW	R1, #lo_addr(_writebuff+0)
MOVT	R1, #hi_addr(_writebuff+0)
MOVW	R0, #lo_addr(_readbuff+0)
MOVT	R0, #hi_addr(_readbuff+0)
BL	_HID_Enable+0
;TumblerDriveHid.c,446 :: 		}
L_end_InitUSB:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitUSB
_USB0Interrupt:
;TumblerDriveHid.c,449 :: 		void USB0Interrupt() iv IVT_INT_OTG_FS {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;TumblerDriveHid.c,450 :: 		USB_Interrupt_Proc();
BL	_USB_Interrupt_Proc+0
;TumblerDriveHid.c,451 :: 		}
L_end_USB0Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _USB0Interrupt
_main:
;TumblerDriveHid.c,456 :: 		void main() {
;TumblerDriveHid.c,458 :: 		InitUSB();
BL	_InitUSB+0
;TumblerDriveHid.c,459 :: 		InitPorts();
BL	_InitPorts+0
;TumblerDriveHid.c,462 :: 		STAT = ~STAT;
MOVW	R1, #lo_addr(ODR13_GPIOC_ODR_bit+0)
MOVT	R1, #hi_addr(ODR13_GPIOC_ODR_bit+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;TumblerDriveHid.c,464 :: 		while (1)
L_main67:
;TumblerDriveHid.c,466 :: 		DATA = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR12_GPIOC_ODR_bit+0)
MOVT	R0, #hi_addr(ODR12_GPIOC_ODR_bit+0)
STR	R1, [R0, #0]
;TumblerDriveHid.c,467 :: 		while(!HID_Read());
L_main69:
BL	_HID_Read+0
CMP	R0, #0
IT	NE
BNE	L_main70
IT	AL
BAL	L_main69
L_main70:
;TumblerDriveHid.c,470 :: 		if(DriveTumbler(readbuff) ==0)
MOVW	R0, #lo_addr(_readbuff+0)
MOVT	R0, #hi_addr(_readbuff+0)
BL	_DriveTumbler+0
CMP	R0, #0
IT	NE
BNE	L_main71
;TumblerDriveHid.c,472 :: 		strcpy(writebuff,C_STR_OK);
MOVW	R1, #lo_addr(_C_STR_OK+0)
MOVT	R1, #hi_addr(_C_STR_OK+0)
MOVW	R0, #lo_addr(_writebuff+0)
MOVT	R0, #hi_addr(_writebuff+0)
BL	_strcpy+0
;TumblerDriveHid.c,473 :: 		}
IT	AL
BAL	L_main72
L_main71:
;TumblerDriveHid.c,476 :: 		cmdPtr = strcat(C_STR_SYNTAX_ERROR, readbuff);
MOVW	R1, #lo_addr(_readbuff+0)
MOVT	R1, #hi_addr(_readbuff+0)
MOVW	R0, #lo_addr(_C_STR_SYNTAX_ERROR+0)
MOVT	R0, #hi_addr(_C_STR_SYNTAX_ERROR+0)
BL	_strcat+0
MOVW	R1, #lo_addr(_cmdPtr+0)
MOVT	R1, #hi_addr(_cmdPtr+0)
STR	R0, [R1, #0]
;TumblerDriveHid.c,477 :: 		strcpy(writebuff, cmdPtr);
MOV	R1, R0
MOVW	R0, #lo_addr(_writebuff+0)
MOVT	R0, #hi_addr(_writebuff+0)
BL	_strcpy+0
;TumblerDriveHid.c,478 :: 		}
L_main72:
;TumblerDriveHid.c,486 :: 		while(!HID_Write(&writebuff,64));
L_main73:
MOVS	R1, #64
MOVW	R0, #lo_addr(_writebuff+0)
MOVT	R0, #hi_addr(_writebuff+0)
BL	_HID_Write+0
CMP	R0, #0
IT	NE
BNE	L_main74
IT	AL
BAL	L_main73
L_main74:
;TumblerDriveHid.c,487 :: 		}
IT	AL
BAL	L_main67
;TumblerDriveHid.c,488 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
