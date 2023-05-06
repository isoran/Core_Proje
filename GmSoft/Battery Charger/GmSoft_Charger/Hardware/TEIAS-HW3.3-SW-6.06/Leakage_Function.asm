
_Adc_Consideration:
	LNK	#4

	MOV	_Read_LoadVolt, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, [W14+0]
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#5243, W2
	MOV	#16302, W3
	CALL	__Mul_FP
	MOV.D	W0, W2
	MOV	#8192, W0
	MOV	#17637, W1
	CALL	__Div_FP
	MOV	[W14+0], W2
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _Leakage_Status
	MOV	_Adc_Leakage, W0
	CLR	W1
	MOV	W0, _Leakage_Volt
	MOV	W1, _Leakage_Volt+2
	MOV	_Leakage_Volt, W0
	MOV	_Leakage_Volt+2, W1
	CP	W0, #0
	CPB	W1, #0
	BRA LE	L__Adc_Consideration83
	GOTO	L__Adc_Consideration2
L__Adc_Consideration83:
	CLR	W0
	CLR	W1
	MOV	W0, _Leakage_Volt
	MOV	W1, _Leakage_Volt+2
L__Adc_Consideration2:
L_end_Adc_Consideration:
	ULNK
	RETURN
; end of _Adc_Consideration

_Pos_Leakage_Calc:
	LNK	#4

	MOV	_Dig_LoadVoltLeak, W0
	CLR	W1
	MOV	_one_kohm_constant, W2
	CLR	W3
	CALL	__Multiply_32x32
	MOV	_Res_DivideValue, W2
	CLR	W3
	CLR	W4
	CALL	__Divide_32x32
	MOV	W0, _Pos_Leak_Ref
	MOV	W1, _Pos_Leak_Ref+2
	MOV	_Dig_LoadVoltLeak, W0
	CLR	W1
	MOV	_HucreSayisi, W2
	CLR	W3
	CALL	__Multiply_32x32
	MOV	#lo_addr(_Unit_Leak0), W2
	LSR	W1, [++W2]
	RRC	W0, [--W2]
	MOV	_HucreSayisi, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	CALL	__Long2Float
	MOV	#5243, W2
	MOV	#16302, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_Unit_Leak0, W0
	MOV	_Unit_Leak0+2, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _Unit_Leak1
	MOV	W1, _Unit_Leak1+2
	MOV	W0, _Unit_Leak2
	MOV	W1, _Unit_Leak2+2
	MOV	_Pos_Leak_Ref, W3
	MOV	_Pos_Leak_Ref+2, W4
	MOV	#lo_addr(_Leakage_Volt), W2
	SUB	W3, [W2++], W0
	SUBB	W4, [W2--], W1
	MOV	W0, _R_Leakage0
	MOV	W1, _R_Leakage0+2
	CP	W0, #0
	CPB	W1, #0
	BRA LE	L__Pos_Leakage_Calc85
	GOTO	L__Pos_Leakage_Calc6
L__Pos_Leakage_Calc85:
	CLR	W0
	CLR	W1
	MOV	W0, _R_Leakage0
	MOV	W1, _R_Leakage0+2
L__Pos_Leakage_Calc6:
	MOV	_R_Leakage0, W0
	MOV	_R_Leakage0+2, W1
	MOV	#100, W2
	MOV	#0, W3
	CALL	__Multiply_32x32
	MOV	W0, _R_Leakage1
	MOV	W1, _R_Leakage1+2
	MOV	_Unit_Leak2, W2
	MOV	_Unit_Leak2+2, W3
	SETM	W4
	CALL	__Divide_32x32
	MOV	W0, _R_Leakage
	MOV	#lo_addr(_diff_leak_pos), W2
	SE	[W2], W2
	SUB	W0, W2, W0
	MOV	W0, _R_Leakage
	CP	W0, #0
	BRA LE	L__Pos_Leakage_Calc86
	GOTO	L__Pos_Leakage_Calc9
L__Pos_Leakage_Calc86:
	CLR	W0
	MOV	W0, _R_Leakage
L__Pos_Leakage_Calc9:
	MOV	_R_Leakage, W0
	CP	W0, #3
	CLR	W1
	BRA LE	L__Pos_Leakage_Calc87
	COM	W1
L__Pos_Leakage_Calc87:
	CP	W0, #7
	CLR	W0
	BRA GT	L__Pos_Leakage_Calc88
	COM	W0
L__Pos_Leakage_Calc88:
	AND	W1, W0, W0
	BRA NZ	L__Pos_Leakage_Calc89
	GOTO	L__Pos_Leakage_Calc12
L__Pos_Leakage_Calc89:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#39322, W2
	MOV	#16281, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Pos_Leakage_Calc12:
	MOV	_R_Leakage, W0
	CP	W0, #7
	CLR	W2
	BRA LE	L__Pos_Leakage_Calc90
	COM	W2
L__Pos_Leakage_Calc90:
	MOV	#35, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Pos_Leakage_Calc91
	COM	W0
L__Pos_Leakage_Calc91:
	AND	W2, W0, W0
	BRA NZ	L__Pos_Leakage_Calc92
	GOTO	L__Pos_Leakage_Calc15
L__Pos_Leakage_Calc92:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#26214, W2
	MOV	#16294, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Pos_Leakage_Calc15:
	MOV	#35, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W2
	BRA GE	L__Pos_Leakage_Calc93
	COM	W2
L__Pos_Leakage_Calc93:
	MOV	#45, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Pos_Leakage_Calc94
	COM	W0
L__Pos_Leakage_Calc94:
	AND	W2, W0, W0
	BRA NZ	L__Pos_Leakage_Calc95
	GOTO	L__Pos_Leakage_Calc18
L__Pos_Leakage_Calc95:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16288, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Pos_Leakage_Calc18:
	MOV	#45, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W2
	BRA GE	L__Pos_Leakage_Calc96
	COM	W2
L__Pos_Leakage_Calc96:
	MOV	#60, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Pos_Leakage_Calc97
	COM	W0
L__Pos_Leakage_Calc97:
	AND	W2, W0, W0
	BRA NZ	L__Pos_Leakage_Calc98
	GOTO	L__Pos_Leakage_Calc21
L__Pos_Leakage_Calc98:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#39322, W2
	MOV	#16281, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Pos_Leakage_Calc21:
	MOV	#60, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W2
	BRA GE	L__Pos_Leakage_Calc99
	COM	W2
L__Pos_Leakage_Calc99:
	MOV	#80, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Pos_Leakage_Calc100
	COM	W0
L__Pos_Leakage_Calc100:
	AND	W2, W0, W0
	BRA NZ	L__Pos_Leakage_Calc101
	GOTO	L__Pos_Leakage_Calc24
L__Pos_Leakage_Calc101:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#13107, W2
	MOV	#16275, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Pos_Leakage_Calc24:
	MOV	#80, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W2
	BRA GE	L__Pos_Leakage_Calc102
	COM	W2
L__Pos_Leakage_Calc102:
	MOV	#95, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Pos_Leakage_Calc103
	COM	W0
L__Pos_Leakage_Calc103:
	AND	W2, W0, W0
	BRA NZ	L__Pos_Leakage_Calc104
	GOTO	L__Pos_Leakage_Calc27
L__Pos_Leakage_Calc104:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#26214, W2
	MOV	#16262, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Pos_Leakage_Calc27:
L_end_Pos_Leakage_Calc:
	ULNK
	RETURN
; end of _Pos_Leakage_Calc

_Neg_Leakage_Calc:
	LNK	#4

	MOV	_Dig_LoadVoltLeak, W0
	CLR	W1
	MOV	_HucreSayisi, W2
	CLR	W3
	CALL	__Multiply_32x32
	MOV	#lo_addr(_Unit_Leak0), W2
	LSR	W1, [++W2]
	RRC	W0, [--W2]
	MOV	_HucreSayisi, W0
	CLR	W1
	SL	W0, W0
	RLC	W1, W1
	CALL	__Long2Float
	MOV	#5243, W2
	MOV	#16302, W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_Unit_Leak0, W0
	MOV	_Unit_Leak0+2, W1
	SETM	W2
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _Unit_Leak1
	MOV	W1, _Unit_Leak1+2
	MOV	W0, _Unit_Leak2
	MOV	W1, _Unit_Leak2+2
	MOV	_Leakage_Volt, W0
	MOV	_Leakage_Volt+2, W1
	MOV	W0, _R_Leakage0
	MOV	W1, _R_Leakage0+2
	MOV	_Leakage_Volt, W0
	MOV	_Leakage_Volt+2, W1
	CP	W0, #0
	CPB	W1, #0
	BRA LE	L__Neg_Leakage_Calc106
	GOTO	L__Neg_Leakage_Calc31
L__Neg_Leakage_Calc106:
	CLR	W0
	CLR	W1
	MOV	W0, _R_Leakage0
	MOV	W1, _R_Leakage0+2
L__Neg_Leakage_Calc31:
	MOV	_R_Leakage0, W0
	MOV	_R_Leakage0+2, W1
	MOV	#100, W2
	MOV	#0, W3
	CALL	__Multiply_32x32
	MOV	_Unit_Leak2, W2
	MOV	_Unit_Leak2+2, W3
	SETM	W4
	CALL	__Divide_32x32
	MOV	W0, _R_Leakage
	MOV	#lo_addr(_diff_leak_neg), W2
	SE	[W2], W2
	SUB	W0, W2, W0
	MOV	W0, _R_Leakage
	CP	W0, #0
	BRA LE	L__Neg_Leakage_Calc107
	GOTO	L__Neg_Leakage_Calc34
L__Neg_Leakage_Calc107:
	CLR	W0
	MOV	W0, _R_Leakage
L__Neg_Leakage_Calc34:
	MOV	_R_Leakage, W0
	CP	W0, #1
	CLR	W1
	BRA LT	L__Neg_Leakage_Calc108
	COM	W1
L__Neg_Leakage_Calc108:
	CP	W0, #7
	CLR	W0
	BRA GT	L__Neg_Leakage_Calc109
	COM	W0
L__Neg_Leakage_Calc109:
	AND	W1, W0, W0
	BRA NZ	L__Neg_Leakage_Calc110
	GOTO	L__Neg_Leakage_Calc37
L__Neg_Leakage_Calc110:
L__Neg_Leakage_Calc37:
	MOV	_R_Leakage, W0
	CP	W0, #7
	CLR	W2
	BRA LE	L__Neg_Leakage_Calc111
	COM	W2
L__Neg_Leakage_Calc111:
	MOV	#35, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Neg_Leakage_Calc112
	COM	W0
L__Neg_Leakage_Calc112:
	AND	W2, W0, W0
	BRA NZ	L__Neg_Leakage_Calc113
	GOTO	L__Neg_Leakage_Calc40
L__Neg_Leakage_Calc113:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#26214, W2
	MOV	#16294, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Neg_Leakage_Calc40:
	MOV	#35, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W2
	BRA GE	L__Neg_Leakage_Calc114
	COM	W2
L__Neg_Leakage_Calc114:
	MOV	#45, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Neg_Leakage_Calc115
	COM	W0
L__Neg_Leakage_Calc115:
	AND	W2, W0, W0
	BRA NZ	L__Neg_Leakage_Calc116
	GOTO	L__Neg_Leakage_Calc43
L__Neg_Leakage_Calc116:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16288, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Neg_Leakage_Calc43:
	MOV	#45, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W2
	BRA GE	L__Neg_Leakage_Calc117
	COM	W2
L__Neg_Leakage_Calc117:
	MOV	#60, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Neg_Leakage_Calc118
	COM	W0
L__Neg_Leakage_Calc118:
	AND	W2, W0, W0
	BRA NZ	L__Neg_Leakage_Calc119
	GOTO	L__Neg_Leakage_Calc46
L__Neg_Leakage_Calc119:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#26214, W2
	MOV	#16294, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Neg_Leakage_Calc46:
	MOV	#60, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W2
	BRA GE	L__Neg_Leakage_Calc120
	COM	W2
L__Neg_Leakage_Calc120:
	MOV	#80, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Neg_Leakage_Calc121
	COM	W0
L__Neg_Leakage_Calc121:
	AND	W2, W0, W0
	BRA NZ	L__Neg_Leakage_Calc122
	GOTO	L__Neg_Leakage_Calc49
L__Neg_Leakage_Calc122:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#60293, W2
	MOV	#16273, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Neg_Leakage_Calc49:
	MOV	#80, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W2
	BRA GE	L__Neg_Leakage_Calc123
	COM	W2
L__Neg_Leakage_Calc123:
	MOV	#95, W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	CLR	W0
	BRA LT	L__Neg_Leakage_Calc124
	COM	W0
L__Neg_Leakage_Calc124:
	AND	W2, W0, W0
	BRA NZ	L__Neg_Leakage_Calc125
	GOTO	L__Neg_Leakage_Calc52
L__Neg_Leakage_Calc125:
	MOV	_R_Leakage, W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#62915, W2
	MOV	#16264, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	W0, _R_Leakage
L__Neg_Leakage_Calc52:
L_end_Neg_Leakage_Calc:
	ULNK
	RETURN
; end of _Neg_Leakage_Calc

_Leakage_Function:

	MOV	#100, W1
	MOV	#lo_addr(_Leakage_Status), W0
	ADD	W1, [W0], W0
	MOV	W0, W1
	CLR	W2
	MOV	#lo_addr(_Leakage_Volt), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA LT	L__Leakage_Function127
	GOTO	L__Leakage_Function56
L__Leakage_Function127:
	CALL	_Pos_Leakage_Calc
	MOV	#lo_addr(_leakage_show_bit), W0
	BSET	[W0], BitPos(_leakage_show_bit+0)
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GT	L__Leakage_Function128
	GOTO	L__Leakage_Function59
L__Leakage_Function128:
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	SE	[W0], W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	BRA GT	L__Leakage_Function129
	GOTO	L__Leakage_Function62
L__Leakage_Function129:
	MOV	#lo_addr(_posleakbit), W0
	BSET	[W0], BitPos(_posleakbit+0)
	GOTO	L__Leakage_Function63
L__Leakage_Function62:
	MOV	#lo_addr(_posleakbit), W0
	BCLR	[W0], BitPos(_posleakbit+0)
L__Leakage_Function63:
	GOTO	L__Leakage_Function60
L__Leakage_Function59:
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Function130
	GOTO	L__Leakage_Function65
L__Leakage_Function130:
	MOV	#lo_addr(_posleakbit), W0
	BCLR	[W0], BitPos(_posleakbit+0)
L__Leakage_Function65:
L__Leakage_Function60:
L__Leakage_Function56:
	MOV	#100, W1
	MOV	#lo_addr(_Leakage_Status), W0
	SUBR	W1, [W0], W0
	MOV	W0, W1
	CLR	W2
	MOV	#lo_addr(_Leakage_Volt), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA GT	L__Leakage_Function131
	GOTO	L__Leakage_Function68
L__Leakage_Function131:
	CALL	_Neg_Leakage_Calc
	MOV	#lo_addr(_leakage_show_bit), W0
	BSET	[W0], BitPos(_leakage_show_bit+0)
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GT	L__Leakage_Function132
	GOTO	L__Leakage_Function71
L__Leakage_Function132:
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	SE	[W0], W1
	MOV	#lo_addr(_R_Leakage), W0
	CP	W1, [W0]
	BRA GT	L__Leakage_Function133
	GOTO	L__Leakage_Function74
L__Leakage_Function133:
	MOV	#lo_addr(_negleakbit), W0
	BSET	[W0], BitPos(_negleakbit+0)
	GOTO	L__Leakage_Function75
L__Leakage_Function74:
L__Leakage_Function75:
	GOTO	L__Leakage_Function72
L__Leakage_Function71:
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Function134
	GOTO	L__Leakage_Function77
L__Leakage_Function134:
	MOV	#lo_addr(_negleakbit), W0
	BCLR	[W0], BitPos(_negleakbit+0)
L__Leakage_Function77:
L__Leakage_Function72:
L__Leakage_Function68:
	MOV	#100, W1
	MOV	#lo_addr(_Leakage_Status), W0
	SUBR	W1, [W0], W0
	MOV	W0, W1
	CLR	W2
	MOV	#lo_addr(_Leakage_Volt), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	CLR	W4
	BRA GE	L__Leakage_Function135
	COM	W4
L__Leakage_Function135:
	MOV	#100, W1
	MOV	#lo_addr(_Leakage_Status), W0
	ADD	W1, [W0], W0
	MOV	W0, W2
	CLR	W3
	MOV	#lo_addr(_Leakage_Volt), W1
	CP	W2, [W1++]
	CPB	W3, [W1--]
	CLR	W0
	BRA LE	L__Leakage_Function136
	COM	W0
L__Leakage_Function136:
	AND	W4, W0, W0
	BRA NZ	L__Leakage_Function137
	GOTO	L__Leakage_Function80
L__Leakage_Function137:
	MOV	#lo_addr(_leakage_show_bit), W0
	BCLR	[W0], BitPos(_leakage_show_bit+0)
	MOV	#lo_addr(_posleakbit), W0
	BCLR	[W0], BitPos(_posleakbit+0)
	MOV	#lo_addr(_negleakbit), W0
	BCLR	[W0], BitPos(_negleakbit+0)
L__Leakage_Function80:
L_end_Leakage_Function:
	RETURN
; end of _Leakage_Function
