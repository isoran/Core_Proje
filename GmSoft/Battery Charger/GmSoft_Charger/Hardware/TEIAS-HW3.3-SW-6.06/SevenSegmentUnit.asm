
_ClearDisplay:

;SevenSegmentUnit.mpas,72 :: 		begin
;SevenSegmentUnit.mpas,74 :: 		HC_Cs_Fnc(Chip);
	CALL	_HC_Cs_Fnc
;SevenSegmentUnit.mpas,76 :: 		SPI2_Write(0x00); Delay_us(10);
	PUSH	W10
	CLR	W10
	CALL	_SPI2_Write
	MOV	#100, W7
L__ClearDisplay1:
	DEC	W7
	BRA NZ	L__ClearDisplay1
;SevenSegmentUnit.mpas,77 :: 		SPI2_Write(0x00); Delay_us(10);
	CLR	W10
	CALL	_SPI2_Write
	MOV	#100, W7
L__ClearDisplay3:
	DEC	W7
	BRA NZ	L__ClearDisplay3
;SevenSegmentUnit.mpas,78 :: 		SPI2_Write(0x00); Delay_us(10);
	CLR	W10
	CALL	_SPI2_Write
	MOV	#100, W7
L__ClearDisplay5:
	DEC	W7
	BRA NZ	L__ClearDisplay5
;SevenSegmentUnit.mpas,79 :: 		SPI2_Write(0x00); Delay_us(10);
	CLR	W10
	CALL	_SPI2_Write
	POP	W10
	MOV	#100, W7
L__ClearDisplay7:
	DEC	W7
	BRA NZ	L__ClearDisplay7
;SevenSegmentUnit.mpas,81 :: 		HC_Cs_Fnc(Chip);
	CALL	_HC_Cs_Fnc
;SevenSegmentUnit.mpas,85 :: 		end;
L_end_ClearDisplay:
	RETURN
; end of _ClearDisplay

_SPI2_Initialize:

;SevenSegmentUnit.mpas,88 :: 		begin
;SevenSegmentUnit.mpas,99 :: 		_SPI_IDLE_2_ACTIVE   // 04.07.2019 --> eskiden _SPI_ACTIVE_2_IDLE --> þimdi _SPI_IDLE_2_ACTIVE
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#1, W13
	MOV	#28, W12
	CLR	W11
	MOV	#32, W10
	MOV	#256, W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
;SevenSegmentUnit.mpas,100 :: 		);
	CALL	_SPI2_Init_Advanced
	SUB	#8, W15
;SevenSegmentUnit.mpas,106 :: 		end;
L_end_SPI2_Initialize:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _SPI2_Initialize

_HC_Cs_Fnc:

;SevenSegmentUnit.mpas,109 :: 		begin
;SevenSegmentUnit.mpas,112 :: 		1: begin  // volt
	CP.B	W10, #1
	BRA Z	L__HC_Cs_Fnc48
	GOTO	L__HC_Cs_Fnc14
L__HC_Cs_Fnc48:
;SevenSegmentUnit.mpas,113 :: 		Dsp_CS1_Pin := 0;
	BCLR	RB4_bit, BitPos(RB4_bit+0)
;SevenSegmentUnit.mpas,114 :: 		asm nop end;
	NOP
;SevenSegmentUnit.mpas,115 :: 		asm nop end;
	NOP
;SevenSegmentUnit.mpas,116 :: 		asm nop end;
	NOP
;SevenSegmentUnit.mpas,117 :: 		Dsp_CS1_Pin := 1;
	BSET	RB4_bit, BitPos(RB4_bit+0)
;SevenSegmentUnit.mpas,118 :: 		end;
	GOTO	L__HC_Cs_Fnc11
L__HC_Cs_Fnc14:
;SevenSegmentUnit.mpas,119 :: 		2: begin // akým
	CP.B	W10, #2
	BRA Z	L__HC_Cs_Fnc49
	GOTO	L__HC_Cs_Fnc17
L__HC_Cs_Fnc49:
;SevenSegmentUnit.mpas,120 :: 		Dsp_CS2_Pin := 0;
	BCLR	RB6_bit, BitPos(RB6_bit+0)
;SevenSegmentUnit.mpas,121 :: 		asm nop end;
	NOP
;SevenSegmentUnit.mpas,122 :: 		asm nop end;
	NOP
;SevenSegmentUnit.mpas,123 :: 		asm nop end;
	NOP
;SevenSegmentUnit.mpas,124 :: 		Dsp_CS2_Pin := 1;
	BSET	RB6_bit, BitPos(RB6_bit+0)
;SevenSegmentUnit.mpas,125 :: 		end;
	GOTO	L__HC_Cs_Fnc11
L__HC_Cs_Fnc17:
L__HC_Cs_Fnc11:
;SevenSegmentUnit.mpas,129 :: 		end;
L_end_HC_Cs_Fnc:
	RETURN
; end of _HC_Cs_Fnc

_Write7SegMessage:
	LNK	#8

;SevenSegmentUnit.mpas,133 :: 		begin
;SevenSegmentUnit.mpas,135 :: 		if (Msg = ErrorMessage) then
	PUSH	W10
	CP.B	W10, #2
	BRA Z	L__Write7SegMessage51
	GOTO	L__Write7SegMessage20
L__Write7SegMessage51:
;SevenSegmentUnit.mpas,137 :: 		Dig1 := 10; // .
	MOV.B	#10, W0
	MOV.B	W0, [W14+0]
;SevenSegmentUnit.mpas,138 :: 		Dig2 := 26; // r
	MOV.B	#26, W0
	MOV.B	W0, [W14+1]
;SevenSegmentUnit.mpas,139 :: 		Dig3 := 26; // r
	MOV.B	#26, W0
	MOV.B	W0, [W14+2]
;SevenSegmentUnit.mpas,140 :: 		Dig4 := 16; // E
	MOV.B	#16, W0
	MOV.B	W0, [W14+3]
;SevenSegmentUnit.mpas,141 :: 		Dig5 := 11; // -
	MOV.B	#11, W0
	MOV.B	W0, [W14+4]
;SevenSegmentUnit.mpas,142 :: 		Dig6 := 11; // -
	MOV.B	#11, W0
	MOV.B	W0, [W14+5]
;SevenSegmentUnit.mpas,143 :: 		Dig7 := 11; // -
	MOV.B	#11, W0
	MOV.B	W0, [W14+6]
;SevenSegmentUnit.mpas,144 :: 		Dig8 := 11; // -
	MOV.B	#11, W0
	MOV.B	W0, [W14+7]
;SevenSegmentUnit.mpas,145 :: 		end else
	GOTO	L__Write7SegMessage21
L__Write7SegMessage20:
;SevenSegmentUnit.mpas,146 :: 		if (Msg = LoadMessage) then
	CP.B	W10, #1
	BRA Z	L__Write7SegMessage52
	GOTO	L__Write7SegMessage23
L__Write7SegMessage52:
;SevenSegmentUnit.mpas,148 :: 		Dig1 := 15; // d
	MOV.B	#15, W0
	MOV.B	W0, [W14+0]
;SevenSegmentUnit.mpas,149 :: 		Dig2 := 12; // a
	MOV.B	#12, W0
	MOV.B	W0, [W14+1]
;SevenSegmentUnit.mpas,150 :: 		Dig3 := 24; // o
	MOV.B	#24, W0
	MOV.B	W0, [W14+2]
;SevenSegmentUnit.mpas,151 :: 		Dig4 := 22; // L
	MOV.B	#22, W0
	MOV.B	W0, [W14+3]
;SevenSegmentUnit.mpas,152 :: 		Dig5 := 10; // .
	MOV.B	#10, W0
	MOV.B	W0, [W14+4]
;SevenSegmentUnit.mpas,153 :: 		Dig6 := 10; // .
	MOV.B	#10, W0
	MOV.B	W0, [W14+5]
;SevenSegmentUnit.mpas,154 :: 		Dig7 := 10; // .
	MOV.B	#10, W0
	MOV.B	W0, [W14+6]
;SevenSegmentUnit.mpas,155 :: 		Dig8 := 10; // .
	MOV.B	#10, W0
	MOV.B	W0, [W14+7]
;SevenSegmentUnit.mpas,156 :: 		end;
L__Write7SegMessage23:
L__Write7SegMessage21:
;SevenSegmentUnit.mpas,159 :: 		HC_Cs_Fnc(1);
	MOV.B	#1, W10
	CALL	_HC_Cs_Fnc
;SevenSegmentUnit.mpas,161 :: 		SPI2_Write(NumberTable[Dig1]);
	ADD	W14, #0, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,162 :: 		SPI2_Write(NumberTable[Dig2]);
	ADD	W14, #1, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,163 :: 		SPI2_Write(NumberTable[Dig3]);
	ADD	W14, #2, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,164 :: 		SPI2_Write(NumberTable[Dig4]);
	ADD	W14, #3, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,166 :: 		HC_Cs_Fnc(1);
	MOV.B	#1, W10
	CALL	_HC_Cs_Fnc
;SevenSegmentUnit.mpas,169 :: 		ClrWDT;
	CLRWDT
;SevenSegmentUnit.mpas,172 :: 		HC_Cs_Fnc(2);
	MOV.B	#2, W10
	CALL	_HC_Cs_Fnc
;SevenSegmentUnit.mpas,174 :: 		SPI2_Write(NumberTable[Dig5]);
	ADD	W14, #4, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,175 :: 		SPI2_Write(NumberTable[Dig6]);
	ADD	W14, #5, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,176 :: 		SPI2_Write(NumberTable[Dig7]);
	ADD	W14, #6, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,177 :: 		SPI2_Write(NumberTable[Dig8]);
	ADD	W14, #7, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,179 :: 		HC_Cs_Fnc(2);
	MOV.B	#2, W10
	CALL	_HC_Cs_Fnc
;SevenSegmentUnit.mpas,181 :: 		end;
L_end_Write7SegMessage:
	POP	W10
	ULNK
	RETURN
; end of _Write7SegMessage

_Write7SegDigit:
	LNK	#4

;SevenSegmentUnit.mpas,185 :: 		begin
;SevenSegmentUnit.mpas,188 :: 		Dig1      := 0;
	PUSH	W10
	PUSH	W11
; Dig1 start address is: 2 (W1)
	CLR	W1
;SevenSegmentUnit.mpas,189 :: 		Dig2      := 0;
	CLR	W0
	MOV.B	W0, [W14+0]
;SevenSegmentUnit.mpas,190 :: 		Dig3      := 0;
	CLR	W0
	MOV.B	W0, [W14+1]
;SevenSegmentUnit.mpas,191 :: 		Dig4      := 0;
	CLR	W0
	MOV.B	W0, [W14+2]
;SevenSegmentUnit.mpas,193 :: 		asm clrwdt; end;
	CLRWDT
;SevenSegmentUnit.mpas,195 :: 		if (Status =0) then
	CP.B	W13, #0
	BRA Z	L__Write7SegDigit54
	GOTO	L__Write7SegDigit27
L__Write7SegDigit54:
; Dig1 end address is: 2 (W1)
;SevenSegmentUnit.mpas,197 :: 		Dig4      := _Data div 1000;
	PUSH.D	W12
	PUSH.D	W10
	MOV	#1000, W2
	MOV	#0, W3
	MOV.D	W10, W0
	SETM	W4
	CALL	__Divide_32x32
	POP.D	W10
	POP.D	W12
	MOV.B	W0, [W14+2]
;SevenSegmentUnit.mpas,198 :: 		if Dig4 < 1 then Dig4 := 32; // boþ karakter
	CP.B	W0, #1
	BRA LTU	L__Write7SegDigit55
	GOTO	L__Write7SegDigit30
L__Write7SegDigit55:
	MOV.B	#32, W0
	MOV.B	W0, [W14+2]
L__Write7SegDigit30:
;SevenSegmentUnit.mpas,199 :: 		Temp_Byte := _Data div 100;
	PUSH.D	W12
	PUSH.D	W10
	MOV	#100, W2
	MOV	#0, W3
	MOV.D	W10, W0
	SETM	W4
	CALL	__Divide_32x32
	POP.D	W10
;SevenSegmentUnit.mpas,200 :: 		Dig3      := Temp_Byte mod 10;
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W0
	MOV.B	W0, [W14+1]
;SevenSegmentUnit.mpas,201 :: 		Temp_Byte := _Data mod 100;
	PUSH.D	W10
	MOV	#100, W2
	MOV	#0, W3
	MOV.D	W10, W0
	SETM	W4
	CALL	__Modulus_32x32
	POP.D	W10
;SevenSegmentUnit.mpas,202 :: 		Dig2      := Temp_Byte div 10;
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV.B	W0, [W14+0]
;SevenSegmentUnit.mpas,203 :: 		Dig1      := _Data mod 10;
	MOV	#10, W2
	MOV	#0, W3
	MOV.D	W10, W0
	SETM	W4
	CALL	__Modulus_32x32
	POP.D	W12
; Dig1 start address is: 0 (W0)
;SevenSegmentUnit.mpas,204 :: 		end else
; Dig1 end address is: 0 (W0)
	GOTO	L__Write7SegDigit28
L__Write7SegDigit27:
;SevenSegmentUnit.mpas,205 :: 		if (Status = 10) then
; Dig1 start address is: 2 (W1)
	CP.B	W13, #10
	BRA Z	L__Write7SegDigit56
	GOTO	L__Write7SegDigit44
L__Write7SegDigit56:
; Dig1 end address is: 2 (W1)
;SevenSegmentUnit.mpas,207 :: 		Dig1 := _Data;
; Dig1 start address is: 0 (W0)
	MOV.B	W10, W0
;SevenSegmentUnit.mpas,208 :: 		Dig2 := _Data;
	MOV.B	W10, [W14+0]
;SevenSegmentUnit.mpas,209 :: 		Dig3 := _Data;
	MOV.B	W10, [W14+1]
;SevenSegmentUnit.mpas,210 :: 		Dig4 := _Data;
	MOV.B	W10, [W14+2]
; Dig1 end address is: 0 (W0)
;SevenSegmentUnit.mpas,211 :: 		end;
	GOTO	L__Write7SegDigit33
L__Write7SegDigit44:
;SevenSegmentUnit.mpas,205 :: 		if (Status = 10) then
	MOV.B	W1, W0
;SevenSegmentUnit.mpas,211 :: 		end;
L__Write7SegDigit33:
; Dig1 start address is: 0 (W0)
; Dig1 end address is: 0 (W0)
L__Write7SegDigit28:
;SevenSegmentUnit.mpas,214 :: 		HC_Cs_Fnc(Chip);
; Dig1 start address is: 0 (W0)
	MOV.B	W12, W10
	CALL	_HC_Cs_Fnc
;SevenSegmentUnit.mpas,216 :: 		asm clrwdt; end;
	CLRWDT
;SevenSegmentUnit.mpas,218 :: 		SPI2_Write(NumberTable[Dig1]);
	ZE	W0, W1
; Dig1 end address is: 0 (W0)
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,220 :: 		asm clrwdt; end;
	CLRWDT
;SevenSegmentUnit.mpas,222 :: 		if (Status = 10) then
	CP.B	W13, #10
	BRA Z	L__Write7SegDigit57
	GOTO	L__Write7SegDigit36
L__Write7SegDigit57:
;SevenSegmentUnit.mpas,223 :: 		SPI2_Write(NumberTable[Dig2])
	ADD	W14, #0, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
	GOTO	L__Write7SegDigit37
;SevenSegmentUnit.mpas,224 :: 		else SPI2_Write(NumberTable[Dig2] or NumberTable[10]);
L__Write7SegDigit36:
	ADD	W14, #0, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W0
	ZE	W0, W1
	MOV	#8, W0
	IOR	W1, W0, W0
	MOV	W0, W10
	CALL	_SPI2_Write
L__Write7SegDigit37:
;SevenSegmentUnit.mpas,226 :: 		SPI2_Write(NumberTable[Dig3]);
	ADD	W14, #1, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,227 :: 		SPI2_Write(NumberTable[Dig4]);
	ADD	W14, #2, W0
	ZE	[W0], W1
	MOV	#lo_addr(_NumberTable), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	ZE	[W1], W10
	CALL	_SPI2_Write
;SevenSegmentUnit.mpas,229 :: 		HC_Cs_Fnc(Chip);
	MOV.B	W12, W10
	CALL	_HC_Cs_Fnc
;SevenSegmentUnit.mpas,231 :: 		asm clrwdt; end;
	CLRWDT
;SevenSegmentUnit.mpas,237 :: 		end;
L_end_Write7SegDigit:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Write7SegDigit

_Start_Screen_7Seg:
	LNK	#2

;SevenSegmentUnit.mpas,241 :: 		begin
;SevenSegmentUnit.mpas,244 :: 		Dsp_NegativePin := 1;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	BSET	RC4_bit, BitPos(RC4_bit+0)
;SevenSegmentUnit.mpas,247 :: 		For Test_Counter := 0 to 9 do
	CLR	W0
	MOV.B	W0, [W14+0]
L__Start_Screen_7Seg40:
;SevenSegmentUnit.mpas,250 :: 		asm clrwdt; end;
	CLRWDT
;SevenSegmentUnit.mpas,252 :: 		Write7SegDigit(Test_Counter,1,10);
	ADD	W14, #0, W0
	MOV.B	#10, W13
	MOV.B	#1, W12
	ZE	[W0], W10
	CLR	W11
	CALL	_Write7SegDigit
;SevenSegmentUnit.mpas,253 :: 		Write7SegDigit(Test_Counter,2,10);
	ADD	W14, #0, W0
	MOV.B	#10, W13
	MOV.B	#2, W12
	ZE	[W0], W10
	CLR	W11
	CALL	_Write7SegDigit
;SevenSegmentUnit.mpas,255 :: 		Pause_ms(175);
	MOV	#175, W10
	CALL	_Pause_Ms
;SevenSegmentUnit.mpas,257 :: 		end;
	MOV.B	[W14+0], W0
	CP.B	W0, #9
	BRA NZ	L__Start_Screen_7Seg59
	GOTO	L__Start_Screen_7Seg43
L__Start_Screen_7Seg59:
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
	GOTO	L__Start_Screen_7Seg40
L__Start_Screen_7Seg43:
;SevenSegmentUnit.mpas,259 :: 		Write7SegDigit(8,1,10);
	MOV.B	#10, W13
	MOV.B	#1, W12
	MOV	#8, W10
	MOV	#0, W11
	CALL	_Write7SegDigit
;SevenSegmentUnit.mpas,260 :: 		Write7SegDigit(8,2,10);
	MOV.B	#10, W13
	MOV.B	#2, W12
	MOV	#8, W10
	MOV	#0, W11
	CALL	_Write7SegDigit
;SevenSegmentUnit.mpas,262 :: 		Pause_ms(500);
	MOV	#500, W10
	CALL	_Pause_Ms
;SevenSegmentUnit.mpas,264 :: 		asm clrwdt; end;
	CLRWDT
;SevenSegmentUnit.mpas,266 :: 		ClearDisplay(1);
	MOV.B	#1, W10
	CALL	_ClearDisplay
;SevenSegmentUnit.mpas,267 :: 		ClearDisplay(2);
	MOV.B	#2, W10
	CALL	_ClearDisplay
;SevenSegmentUnit.mpas,269 :: 		Dsp_NegativePin := 0;
	BCLR	RC4_bit, BitPos(RC4_bit+0)
;SevenSegmentUnit.mpas,271 :: 		end;
L_end_Start_Screen_7Seg:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Start_Screen_7Seg
