
_LogBit_Config:

;LogUnit.mpas,146 :: 		begin
;LogUnit.mpas,148 :: 		Log_Array              := EEPROM_Read(EE_LogListArrayEeAddr);
	PUSH	W10
	PUSH	W11
	MOV	#61566, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	W0, [W1]
;LogUnit.mpas,149 :: 		Pause_ms(50);
	MOV	#50, W10
	CALL	_Pause_Ms
;LogUnit.mpas,151 :: 		clrwdt;
	CLRWDT
;LogUnit.mpas,154 :: 		LogBit_AcHigh          := 0;
	MOV	#lo_addr(_LogBit_AcHigh), W0
	BCLR	[W0], BitPos(_LogBit_AcHigh+0)
;LogUnit.mpas,155 :: 		LogBit_AcLow           := 0;
	MOV	#lo_addr(_LogBit_AcLow), W0
	BCLR	[W0], BitPos(_LogBit_AcLow+0)
;LogUnit.mpas,156 :: 		LogBit_DcHigh          := 0;
	MOV	#lo_addr(_LogBit_DcHigh), W0
	BCLR	[W0], BitPos(_LogBit_DcHigh+0)
;LogUnit.mpas,157 :: 		LogBit_DcLow           := 0;
	MOV	#lo_addr(_LogBit_DcLow), W0
	BCLR	[W0], BitPos(_LogBit_DcLow+0)
;LogUnit.mpas,158 :: 		LogBit_Pleak           := 0;
	MOV	#lo_addr(_LogBit_Pleak), W0
	BCLR	[W0], BitPos(_LogBit_Pleak+0)
;LogUnit.mpas,159 :: 		LogBit_Nleak           := 0;
	MOV	#lo_addr(_LogBit_Nleak), W0
	BCLR	[W0], BitPos(_LogBit_Nleak+0)
;LogUnit.mpas,160 :: 		LogBit_Rlimit          := 0;
	MOV	#lo_addr(_LogBit_Rlimit), W0
	BCLR	[W0], BitPos(_LogBit_Rlimit+0)
;LogUnit.mpas,161 :: 		LogBit_Blimit          := 0;
	MOV	#lo_addr(_LogBit_Blimit), W0
	BCLR	[W0], BitPos(_LogBit_Blimit+0)
;LogUnit.mpas,162 :: 		LogBit_FanFault        := 0;
	MOV	#lo_addr(_LogBit_FanFault), W0
	BCLR	[W0], BitPos(_LogBit_FanFault+0)
;LogUnit.mpas,163 :: 		LogBit_AcMCB           := 0;
	MOV	#lo_addr(_LogBit_AcMCB), W0
	BCLR	[W0], BitPos(_LogBit_AcMCB+0)
;LogUnit.mpas,164 :: 		LogBit_LoadMCB         := 0;
	MOV	#lo_addr(_LogBit_LoadMCB), W0
	BCLR	[W0], BitPos(_LogBit_LoadMCB+0)
;LogUnit.mpas,165 :: 		LogBit_BatMCB          := 0;
	MOV	#lo_addr(_LogBit_BatMCB), W0
	BCLR	[W0], BitPos(_LogBit_BatMCB+0)
;LogUnit.mpas,166 :: 		LogBit_HighTemp        := 0;
	MOV	#lo_addr(_LogBit_HighTemp), W0
	BCLR	[W0], BitPos(_LogBit_HighTemp+0)
;LogUnit.mpas,167 :: 		LogBit_RedFault        := 0;
	MOV	#lo_addr(_LogBit_RedFault), W0
	BCLR	[W0], BitPos(_LogBit_RedFault+0)
;LogUnit.mpas,168 :: 		LogBit_DdschFault      := 0;
	MOV	#lo_addr(_LogBit_DdschFault), W0
	BCLR	[W0], BitPos(_LogBit_DdschFault+0)
;LogUnit.mpas,169 :: 		LogBit_RedHighTemp     := 0;
	MOV	#lo_addr(_LogBit_RedHighTemp), W0
	BCLR	[W0], BitPos(_LogBit_RedHighTemp+0)
;LogUnit.mpas,170 :: 		LogBit_RlyCommFault    := 0;
	MOV	#lo_addr(_LogBit_RlyCommFault), W0
	BCLR	[W0], BitPos(_LogBit_RlyCommFault+0)
;LogUnit.mpas,172 :: 		LogBit_GTTCommFault    := 0;
	MOV	#lo_addr(_LogBit_GTTCommFault), W0
	BCLR	[W0], BitPos(_LogBit_GTTCommFault+0)
;LogUnit.mpas,173 :: 		Log_Clock              := 0;
	CLR	W0
	MOV	W0, _Log_Clock
;LogUnit.mpas,174 :: 		Log_Date               := 0;
	CLR	W0
	MOV	W0, _Log_Date
;LogUnit.mpas,175 :: 		Hour_Text              := '      ';
	MOV	#lo_addr(_Hour_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;LogUnit.mpas,176 :: 		Day_Text               := '           ';
	MOV	#lo_addr(_Day_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;LogUnit.mpas,177 :: 		Event_Text             := '     ';
	MOV	#lo_addr(_Event_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;LogUnit.mpas,179 :: 		end;
L_end_LogBit_Config:
	POP	W11
	POP	W10
	RETURN
; end of _LogBit_Config

LogUnit_LogData_Write:
	LNK	#0

;LogUnit.mpas,183 :: 		begin
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	[W14-8], W0
	MOV.B	W0, [W14-8]
; Log_Event start address is: 6 (W3)
	MOV.B	[W14-10], W3
	MOV.B	[W14-12], W0
	MOV.B	W0, [W14-12]
;LogUnit.mpas,186 :: 		EEPROM_Write(EeAddr_Log_Event[LogArray],Log_Event);   // olayý kaydet
	SUB	W14, #12, W0
	ZE	[W0], W0
	DEC	W0
	SL	W0, #2, W1
	MOV	#lo_addr(_EeAddr_Log_Event), W0
	ADD	W0, W1, W2
	MOV	#higher_addr(_EeAddr_Log_Event), W0
	MOV	WREG, 52
	MOV.D	[W2], W0
	PUSH	W12
; Log_Event end address is: 6 (W3)
	PUSH.D	W10
	ZE	W3, W12
	MOV.D	W0, W10
	CALL	_EEPROM_Write
	POP.D	W10
	POP	W12
;LogUnit.mpas,187 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_LogData_Write3:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_LogData_Write3
;LogUnit.mpas,189 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,191 :: 		Pause_ms(10);
	PUSH.D	W12
	PUSH.D	W10
	MOV	#10, W10
	CALL	_Pause_Ms
	POP.D	W10
	POP.D	W12
;LogUnit.mpas,196 :: 		Log_Clock := Log_Hour;
	ZE	W10, W0
	MOV	W0, _Log_Clock
;LogUnit.mpas,197 :: 		Temp_Word := Log_Clock * 100;
	MOV	#100, W1
	MOV	#lo_addr(_Log_Clock), W0
	MUL.UU	W1, [W0], W2
;LogUnit.mpas,198 :: 		Log_Clock := Temp_Word + Log_Minute;  // saat ve dakikayý birleþtirdik yani 15:19' u 1519 olarak yazdýk
	ZE	W11, W0
	ADD	W2, W0, W4
	MOV	W4, _Log_Clock
;LogUnit.mpas,200 :: 		Log_Date  := Log_Day;
	ZE	W12, W0
	MOV	W0, _Log_Date
;LogUnit.mpas,201 :: 		Temp_Word := Log_Date * 100;
	MOV	#100, W1
	MOV	#lo_addr(_Log_Date), W0
	MUL.UU	W1, [W0], W2
;LogUnit.mpas,202 :: 		Log_Date  := Temp_Word + Log_Month;  // gün ve ayý birleþtirdik yani 02.03' ü 0203 olarak yazdýk
	ZE	W13, W1
	MOV	#lo_addr(_Log_Date), W0
	ADD	W2, W1, [W0]
;LogUnit.mpas,204 :: 		EEPROM_Write(EeAddr_Log_Clock[LogArray],Log_Clock); // olay saatini kaydet
	SUB	W14, #12, W0
	ZE	[W0], W0
	DEC	W0
	SL	W0, #2, W1
	MOV	#lo_addr(_EeAddr_Log_Clock), W0
	ADD	W0, W1, W2
	MOV	#higher_addr(_EeAddr_Log_Clock), W0
	MOV	WREG, 52
	MOV.D	[W2], W0
	MOV	W4, W12
	MOV.D	W0, W10
	CALL	_EEPROM_Write
;LogUnit.mpas,205 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_LogData_Write8:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_LogData_Write8
;LogUnit.mpas,207 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,209 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,211 :: 		EEPROM_Write(EeAddr_Log_DateHi[LogArray],Log_Date);  // olay tarihini gün ve ay olarak kaydet
	SUB	W14, #12, W0
	ZE	[W0], W0
	DEC	W0
	SL	W0, #2, W1
	MOV	#lo_addr(_EeAddr_Log_DateHi), W0
	ADD	W0, W1, W2
	MOV	#higher_addr(_EeAddr_Log_DateHi), W0
	MOV	WREG, 52
	MOV.D	[W2], W0
	MOV	_Log_Date, W12
	MOV.D	W0, W10
	CALL	_EEPROM_Write
;LogUnit.mpas,212 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_LogData_Write13:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_LogData_Write13
;LogUnit.mpas,214 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,216 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,218 :: 		EEPROM_Write(EeAddr_Log_DateLo[LogArray],Log_Year);   // olay tarihinin yýlýný kaydet
	SUB	W14, #12, W0
	ZE	[W0], W0
	DEC	W0
	SL	W0, #2, W1
	MOV	#lo_addr(_EeAddr_Log_DateLo), W0
	ADD	W0, W1, W3
	MOV	#higher_addr(_EeAddr_Log_DateLo), W0
	MOV	WREG, 52
	MOV	[W3++], W1
	MOV	[W3--], W2
	SUB	W14, #8, W0
	ZE	[W0], W12
	MOV	W1, W10
	MOV	W2, W11
	CALL	_EEPROM_Write
;LogUnit.mpas,219 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_LogData_Write18:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_LogData_Write18
;LogUnit.mpas,221 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,223 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,225 :: 		EEPROM_Write(EE_LogListArrayEeAddr,Log_Array);
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W12
	MOV	#61566, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;LogUnit.mpas,226 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_LogData_Write23:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_LogData_Write23
;LogUnit.mpas,228 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,230 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,236 :: 		end;
L_end_LogData_Write:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of LogUnit_LogData_Write

_Log_Saved:

;LogUnit.mpas,239 :: 		begin
;LogUnit.mpas,241 :: 		if (Log_Array < 1) then Log_Array := 1;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LTU	L__Log_Saved460
	GOTO	L__Log_Saved29
L__Log_Saved460:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved29:
;LogUnit.mpas,243 :: 		if (LogBit_AcHigh = 0) then   // ac yüksek için log
	MOV	#lo_addr(_LogBit_AcHigh), W0
	BTSC	[W0], BitPos(_LogBit_AcHigh+0)
	GOTO	L__Log_Saved32
;LogUnit.mpas,245 :: 		if (AcHighFaultBit = 1) then
	MOV	#lo_addr(_AcHighFaultBit), W0
	BTSS	[W0], BitPos(_AcHighFaultBit+0)
	GOTO	L__Log_Saved35
;LogUnit.mpas,247 :: 		LogBit_AcHigh := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_AcHigh), W0
	BSET	[W0], BitPos(_LogBit_AcHigh+0)
;LogUnit.mpas,248 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_AcHigh,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#10, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,249 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,250 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved461
	GOTO	L__Log_Saved38
L__Log_Saved461:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved38:
;LogUnit.mpas,252 :: 		end;
L__Log_Saved35:
;LogUnit.mpas,254 :: 		end;
L__Log_Saved32:
;LogUnit.mpas,256 :: 		if (LogBit_AcLow = 0) then   // ac düþük için log
	MOV	#lo_addr(_LogBit_AcLow), W0
	BTSC	[W0], BitPos(_LogBit_AcLow+0)
	GOTO	L__Log_Saved41
;LogUnit.mpas,259 :: 		if (AcLowFaultBit = 1) then
	MOV	#lo_addr(_AcLowFaultBit), W0
	BTSS	[W0], BitPos(_AcLowFaultBit+0)
	GOTO	L__Log_Saved44
;LogUnit.mpas,261 :: 		LogBit_AcLow := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_AcLow), W0
	BSET	[W0], BitPos(_LogBit_AcLow+0)
;LogUnit.mpas,262 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_AcLow,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#11, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,263 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,264 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved462
	GOTO	L__Log_Saved47
L__Log_Saved462:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved47:
;LogUnit.mpas,266 :: 		end;
L__Log_Saved44:
;LogUnit.mpas,268 :: 		end;
L__Log_Saved41:
;LogUnit.mpas,270 :: 		if (LogBit_DcHigh = 0) then   // dc Yüksek için log
	MOV	#lo_addr(_LogBit_DcHigh), W0
	BTSC	[W0], BitPos(_LogBit_DcHigh+0)
	GOTO	L__Log_Saved50
;LogUnit.mpas,273 :: 		if (DcHighBit = 1) then
	MOV	#lo_addr(_DcHighBit), W0
	BTSS	[W0], BitPos(_DcHighBit+0)
	GOTO	L__Log_Saved53
;LogUnit.mpas,275 :: 		LogBit_DcHigh := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_DcHigh), W0
	BSET	[W0], BitPos(_LogBit_DcHigh+0)
;LogUnit.mpas,276 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_DcHigh,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#12, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,277 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,278 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved463
	GOTO	L__Log_Saved56
L__Log_Saved463:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved56:
;LogUnit.mpas,280 :: 		end;
L__Log_Saved53:
;LogUnit.mpas,282 :: 		end;
L__Log_Saved50:
;LogUnit.mpas,285 :: 		if (LogBit_DcLow = 0) then   // dc düþük için log
	MOV	#lo_addr(_LogBit_DcLow), W0
	BTSC	[W0], BitPos(_LogBit_DcLow+0)
	GOTO	L__Log_Saved59
;LogUnit.mpas,288 :: 		if (DcLowBit = 1) then
	MOV	#lo_addr(_DcLowBit), W0
	BTSS	[W0], BitPos(_DcLowBit+0)
	GOTO	L__Log_Saved62
;LogUnit.mpas,290 :: 		LogBit_DcLow := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_DcLow), W0
	BSET	[W0], BitPos(_LogBit_DcLow+0)
;LogUnit.mpas,291 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_DcLow,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#13, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,292 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,293 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved464
	GOTO	L__Log_Saved65
L__Log_Saved464:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved65:
;LogUnit.mpas,295 :: 		end;
L__Log_Saved62:
;LogUnit.mpas,297 :: 		end;
L__Log_Saved59:
;LogUnit.mpas,299 :: 		if (LogBit_Pleak = 0) then   // +kacak için log
	MOV	#lo_addr(_LogBit_Pleak), W0
	BTSC	[W0], BitPos(_LogBit_Pleak+0)
	GOTO	L__Log_Saved68
;LogUnit.mpas,302 :: 		if (P_LeakBit = 1) then
	MOV	#lo_addr(_P_LeakBit), W0
	BTSS	[W0], BitPos(_P_LeakBit+0)
	GOTO	L__Log_Saved71
;LogUnit.mpas,304 :: 		LogBit_Pleak := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_Pleak), W0
	BSET	[W0], BitPos(_LogBit_Pleak+0)
;LogUnit.mpas,305 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_Pleak,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#14, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,306 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,307 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved465
	GOTO	L__Log_Saved74
L__Log_Saved465:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved74:
;LogUnit.mpas,309 :: 		end;
L__Log_Saved71:
;LogUnit.mpas,311 :: 		end;
L__Log_Saved68:
;LogUnit.mpas,313 :: 		if (LogBit_Nleak = 0) then   // -kacak için log
	MOV	#lo_addr(_LogBit_Nleak), W0
	BTSC	[W0], BitPos(_LogBit_Nleak+0)
	GOTO	L__Log_Saved77
;LogUnit.mpas,316 :: 		if (N_LeakBit = 1) then
	MOV	#lo_addr(_N_LeakBit), W0
	BTSS	[W0], BitPos(_N_LeakBit+0)
	GOTO	L__Log_Saved80
;LogUnit.mpas,318 :: 		LogBit_Nleak := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_Nleak), W0
	BSET	[W0], BitPos(_LogBit_Nleak+0)
;LogUnit.mpas,319 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_Nleak,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#15, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,320 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,321 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved466
	GOTO	L__Log_Saved83
L__Log_Saved466:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved83:
;LogUnit.mpas,323 :: 		end;
L__Log_Saved80:
;LogUnit.mpas,325 :: 		end;
L__Log_Saved77:
;LogUnit.mpas,327 :: 		if (LogBit_Blimit = 0) then   // akü limit için log
	MOV	#lo_addr(_LogBit_Blimit), W0
	BTSC	[W0], BitPos(_LogBit_Blimit+0)
	GOTO	L__Log_Saved86
;LogUnit.mpas,330 :: 		if (BattAmpsLimitBit = 1) then
	MOV	#lo_addr(_BattAmpsLimitBit), W0
	BTSS	[W0], BitPos(_BattAmpsLimitBit+0)
	GOTO	L__Log_Saved89
;LogUnit.mpas,332 :: 		LogBit_Blimit := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_Blimit), W0
	BSET	[W0], BitPos(_LogBit_Blimit+0)
;LogUnit.mpas,333 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_Blimit,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#16, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,334 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,335 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved467
	GOTO	L__Log_Saved92
L__Log_Saved467:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved92:
;LogUnit.mpas,337 :: 		end;
L__Log_Saved89:
;LogUnit.mpas,339 :: 		end;
L__Log_Saved86:
;LogUnit.mpas,341 :: 		if (LogBit_Rlimit = 0) then   // redresör limit için log
	MOV	#lo_addr(_LogBit_Rlimit), W0
	BTSC	[W0], BitPos(_LogBit_Rlimit+0)
	GOTO	L__Log_Saved95
;LogUnit.mpas,344 :: 		if (RedAmpsLimitBit = 1) then
	MOV	#lo_addr(_RedAmpsLimitBit), W0
	BTSS	[W0], BitPos(_RedAmpsLimitBit+0)
	GOTO	L__Log_Saved98
;LogUnit.mpas,346 :: 		LogBit_Rlimit := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_Rlimit), W0
	BSET	[W0], BitPos(_LogBit_Rlimit+0)
;LogUnit.mpas,347 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_Rlimit,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#17, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,348 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,349 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved468
	GOTO	L__Log_Saved101
L__Log_Saved468:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved101:
;LogUnit.mpas,351 :: 		end;
L__Log_Saved98:
;LogUnit.mpas,353 :: 		end;
L__Log_Saved95:
;LogUnit.mpas,355 :: 		if (LogBit_FanFault = 0) then   // Fan Hata için log
	MOV	#lo_addr(_LogBit_FanFault), W0
	BTSC	[W0], BitPos(_LogBit_FanFault+0)
	GOTO	L__Log_Saved104
;LogUnit.mpas,358 :: 		if (FanFltBit = 1) then
	MOV	#lo_addr(_FanFltBit), W0
	BTSS	[W0], BitPos(_FanFltBit+0)
	GOTO	L__Log_Saved107
;LogUnit.mpas,360 :: 		LogBit_FanFault := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_FanFault), W0
	BSET	[W0], BitPos(_LogBit_FanFault+0)
;LogUnit.mpas,361 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_FanFlt,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#18, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,362 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,363 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved469
	GOTO	L__Log_Saved110
L__Log_Saved469:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved110:
;LogUnit.mpas,365 :: 		end;
L__Log_Saved107:
;LogUnit.mpas,367 :: 		end;
L__Log_Saved104:
;LogUnit.mpas,369 :: 		if (LogBit_HighTemp = 0) then   // Aþýrý Sýcaklýk için log
	MOV	#lo_addr(_LogBit_HighTemp), W0
	BTSC	[W0], BitPos(_LogBit_HighTemp+0)
	GOTO	L__Log_Saved113
;LogUnit.mpas,372 :: 		if (HighTempBit = 1) then
	MOV	#lo_addr(_HighTempBit), W0
	BTSS	[W0], BitPos(_HighTempBit+0)
	GOTO	L__Log_Saved116
;LogUnit.mpas,374 :: 		LogBit_HighTemp := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_HighTemp), W0
	BSET	[W0], BitPos(_LogBit_HighTemp+0)
;LogUnit.mpas,375 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_HighTmp,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#19, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,376 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,377 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved470
	GOTO	L__Log_Saved119
L__Log_Saved470:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved119:
;LogUnit.mpas,379 :: 		end;
L__Log_Saved116:
;LogUnit.mpas,381 :: 		end;
L__Log_Saved113:
;LogUnit.mpas,383 :: 		if (LogBit_AcMCB = 0) then   // Ac MCB için log
	MOV	#lo_addr(_LogBit_AcMCB), W0
	BTSC	[W0], BitPos(_LogBit_AcMCB+0)
	GOTO	L__Log_Saved122
;LogUnit.mpas,386 :: 		if (Ac_MCB_Bit = 1) then
	MOV	#lo_addr(_Ac_MCB_Bit), W0
	BTSS	[W0], BitPos(_Ac_MCB_Bit+0)
	GOTO	L__Log_Saved125
;LogUnit.mpas,388 :: 		LogBit_AcMCB := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_AcMCB), W0
	BSET	[W0], BitPos(_LogBit_AcMCB+0)
;LogUnit.mpas,389 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_AcMCB,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#20, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,390 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,391 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved471
	GOTO	L__Log_Saved128
L__Log_Saved471:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved128:
;LogUnit.mpas,393 :: 		end;
L__Log_Saved125:
;LogUnit.mpas,395 :: 		end;
L__Log_Saved122:
;LogUnit.mpas,398 :: 		if (LogBit_LoadMCB = 0) then   // Load MCB için log
	MOV	#lo_addr(_LogBit_LoadMCB), W0
	BTSC	[W0], BitPos(_LogBit_LoadMCB+0)
	GOTO	L__Log_Saved131
;LogUnit.mpas,401 :: 		if (Load_MCB_Bit = 1) then
	MOV	#lo_addr(_Load_MCB_Bit), W0
	BTSS	[W0], BitPos(_Load_MCB_Bit+0)
	GOTO	L__Log_Saved134
;LogUnit.mpas,403 :: 		LogBit_LoadMCB := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_LoadMCB), W0
	BSET	[W0], BitPos(_LogBit_LoadMCB+0)
;LogUnit.mpas,404 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_LoadMCB,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#21, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,405 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,406 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved472
	GOTO	L__Log_Saved137
L__Log_Saved472:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved137:
;LogUnit.mpas,408 :: 		end;
L__Log_Saved134:
;LogUnit.mpas,410 :: 		end;
L__Log_Saved131:
;LogUnit.mpas,412 :: 		if (LogBit_BatMCB = 0) then   // Load MCB için log
	MOV	#lo_addr(_LogBit_BatMCB), W0
	BTSC	[W0], BitPos(_LogBit_BatMCB+0)
	GOTO	L__Log_Saved140
;LogUnit.mpas,415 :: 		if (Batt_MCB_Bit = 1) then
	MOV	#lo_addr(_Batt_MCB_Bit), W0
	BTSS	[W0], BitPos(_Batt_MCB_Bit+0)
	GOTO	L__Log_Saved143
;LogUnit.mpas,417 :: 		LogBit_BatMCB := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_BatMCB), W0
	BSET	[W0], BitPos(_LogBit_BatMCB+0)
;LogUnit.mpas,418 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_BattMCB,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#22, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,419 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,420 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved473
	GOTO	L__Log_Saved146
L__Log_Saved473:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved146:
;LogUnit.mpas,422 :: 		end;
L__Log_Saved143:
;LogUnit.mpas,424 :: 		end;
L__Log_Saved140:
;LogUnit.mpas,426 :: 		if (LogBit_RedFault = 0) then   // redresör hata için log
	MOV	#lo_addr(_LogBit_RedFault), W0
	BTSC	[W0], BitPos(_LogBit_RedFault+0)
	GOTO	L__Log_Saved149
;LogUnit.mpas,429 :: 		if (RedFaultBit = 1) then
	MOV	#lo_addr(_RedFaultBit), W0
	BTSS	[W0], BitPos(_RedFaultBit+0)
	GOTO	L__Log_Saved152
;LogUnit.mpas,431 :: 		LogBit_RedFault := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_RedFault), W0
	BSET	[W0], BitPos(_LogBit_RedFault+0)
;LogUnit.mpas,432 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_RedFlt,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#23, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,433 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,434 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved474
	GOTO	L__Log_Saved155
L__Log_Saved474:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved155:
;LogUnit.mpas,436 :: 		end;
L__Log_Saved152:
;LogUnit.mpas,438 :: 		end;
L__Log_Saved149:
;LogUnit.mpas,440 :: 		if (LogBit_DdschFault = 0) then   // derin deþarj hata için log
	MOV	#lo_addr(_LogBit_DdschFault), W0
	BTSC	[W0], BitPos(_LogBit_DdschFault+0)
	GOTO	L__Log_Saved158
;LogUnit.mpas,443 :: 		if (DDschargeBit = 1) then
	MOV	#lo_addr(_DDschargeBit), W0
	BTSS	[W0], BitPos(_DDschargeBit+0)
	GOTO	L__Log_Saved161
;LogUnit.mpas,445 :: 		LogBit_DdschFault := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_DdschFault), W0
	BSET	[W0], BitPos(_LogBit_DdschFault+0)
;LogUnit.mpas,446 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_DeepFlt,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#24, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,447 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,448 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved475
	GOTO	L__Log_Saved164
L__Log_Saved475:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved164:
;LogUnit.mpas,450 :: 		end;
L__Log_Saved161:
;LogUnit.mpas,452 :: 		end;
L__Log_Saved158:
;LogUnit.mpas,454 :: 		if (LogBit_RedHighTemp = 0) then   // redresör aþýrý sýcaklýk koruma için log
	MOV	#lo_addr(_LogBit_RedHighTemp), W0
	BTSC	[W0], BitPos(_LogBit_RedHighTemp+0)
	GOTO	L__Log_Saved167
;LogUnit.mpas,457 :: 		if (Red_HighTemp = 1) then
	MOV	#lo_addr(_Red_HighTemp), W0
	BTSS	[W0], BitPos(_Red_HighTemp+0)
	GOTO	L__Log_Saved170
;LogUnit.mpas,459 :: 		LogBit_RedHighTemp := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_RedHighTemp), W0
	BSET	[W0], BitPos(_LogBit_RedHighTemp+0)
;LogUnit.mpas,460 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_RedHigT,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#25, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,461 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,462 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved476
	GOTO	L__Log_Saved173
L__Log_Saved476:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved173:
;LogUnit.mpas,464 :: 		end;
L__Log_Saved170:
;LogUnit.mpas,466 :: 		end;
L__Log_Saved167:
;LogUnit.mpas,468 :: 		if (LogBit_GTTCommFault = 0) then   // GTT-I kartý hab. hata için log
	MOV	#lo_addr(_LogBit_GTTCommFault), W0
	BTSC	[W0], BitPos(_LogBit_GTTCommFault+0)
	GOTO	L__Log_Saved176
;LogUnit.mpas,471 :: 		if (ThryCommFault = 1) then
	MOV	#lo_addr(_ThryCommFault), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Log_Saved477
	GOTO	L__Log_Saved179
L__Log_Saved477:
;LogUnit.mpas,473 :: 		LogBit_GTTCommFault := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_GTTCommFault), W0
	BSET	[W0], BitPos(_LogBit_GTTCommFault+0)
;LogUnit.mpas,474 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_GTTFlt,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#26, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,475 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,476 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved478
	GOTO	L__Log_Saved182
L__Log_Saved478:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved182:
;LogUnit.mpas,478 :: 		end;
L__Log_Saved179:
;LogUnit.mpas,480 :: 		end;
L__Log_Saved176:
;LogUnit.mpas,496 :: 		if (LogBit_RlyCommFault = 0) then   // Röle kartý hab. hata için log
	MOV	#lo_addr(_LogBit_RlyCommFault), W0
	BTSC	[W0], BitPos(_LogBit_RlyCommFault+0)
	GOTO	L__Log_Saved185
;LogUnit.mpas,499 :: 		if (RlyCommFault = 1) then
	MOV	#lo_addr(_RlyCommFault), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Log_Saved479
	GOTO	L__Log_Saved188
L__Log_Saved479:
;LogUnit.mpas,501 :: 		LogBit_RlyCommFault := 1; // alarm yeniden gelene kadar burayý yapma
	MOV	#lo_addr(_LogBit_RlyCommFault), W0
	BSET	[W0], BitPos(_LogBit_RlyCommFault+0)
;LogUnit.mpas,502 :: 		LogData_Write(Hours,Minutes,Day,Month,Year,Event_RLYFlt,Log_Array);
	MOV	#lo_addr(_Month), W3
	MOV	#lo_addr(_Day), W2
	MOV	#lo_addr(_Minutes), W1
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W3], W13
	MOV.B	[W2], W12
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	MOV	#lo_addr(_Log_Array), W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#28, W0
	PUSH	W0
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	PUSH	W0
	CALL	LogUnit_LogData_Write
	SUB	#6, W15
;LogUnit.mpas,503 :: 		Log_Array := Log_Array + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_Log_Array), W0
	ADD.B	W1, [W0], [W0]
;LogUnit.mpas,504 :: 		if (Log_Array > 128) then Log_Array := 1;
	MOV	#lo_addr(_Log_Array), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA GTU	L__Log_Saved480
	GOTO	L__Log_Saved191
L__Log_Saved480:
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Log_Saved191:
;LogUnit.mpas,506 :: 		end;
L__Log_Saved188:
;LogUnit.mpas,508 :: 		end;
L__Log_Saved185:
;LogUnit.mpas,512 :: 		end;
L_end_Log_Saved:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Log_Saved

LogUnit_Log_Partition:
	LNK	#24

;LogUnit.mpas,518 :: 		begin
;LogUnit.mpas,521 :: 		Temp_Text1 := '     ';
	PUSH	W10
	PUSH	W11
	ADD	W14, #0, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;LogUnit.mpas,522 :: 		Temp_Text2 := '     ';
	ADD	W14, #6, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;LogUnit.mpas,523 :: 		Temp_Text3 := '     ';
	ADD	W14, #12, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;LogUnit.mpas,524 :: 		Temp_Text4 := '     ';
	ADD	W14, #18, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;LogUnit.mpas,526 :: 		WordToStr(LogPart_Hour,Temp_Text1);
	ADD	W14, #0, W0
	PUSH	W11
	MOV	W0, W11
	CALL	_WordToStr
	POP	W11
;LogUnit.mpas,527 :: 		WordToStr(LogPart_DayMonth,Temp_Text2);
	ADD	W14, #6, W0
	MOV	W11, W10
	MOV	W0, W11
	CALL	_WordToStr
;LogUnit.mpas,528 :: 		WordToStr(LogPart_Year,Temp_Text3);
	ADD	W14, #12, W0
	MOV	W0, W11
	MOV	W12, W10
	CALL	_WordToStr
;LogUnit.mpas,529 :: 		WordToStr(LogPart_Event,Temp_Text4);
	ADD	W14, #18, W0
	MOV	W0, W11
	MOV	W13, W10
	CALL	_WordToStr
;LogUnit.mpas,531 :: 		if (LogPart_Event <> 0xFFFF) then   // olay olmuþsa yaz, yoksa yazma
	MOV	#65535, W0
	CP	W13, W0
	BRA NZ	L_LogUnit_Log_Partition482
	GOTO	L_LogUnit_Log_Partition195
L_LogUnit_Log_Partition482:
;LogUnit.mpas,533 :: 		Hour_Text[1]  := Temp_Text1[1];
	MOV	#lo_addr(_Hour_Text), W1
	MOV.B	[W14+1], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,534 :: 		Hour_Text[2]  := Temp_Text1[2];
	MOV	#lo_addr(_Hour_Text+1), W1
	MOV.B	[W14+2], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,535 :: 		Hour_Text[3]  := ':';
	MOV	#lo_addr(_Hour_Text+2), W1
	MOV.B	#58, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,536 :: 		Hour_Text[4]  := Temp_Text1[3];
	MOV	#lo_addr(_Hour_Text+3), W1
	MOV.B	[W14+3], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,537 :: 		Hour_Text[5]  := Temp_Text1[4];
	MOV	#lo_addr(_Hour_Text+4), W1
	MOV.B	[W14+4], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,538 :: 		Hour_Text[6]  := '-';
	MOV	#lo_addr(_Hour_Text+5), W1
	MOV.B	#45, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,539 :: 		Day_Text[1]   := Temp_Text2[1];
	MOV	#lo_addr(_Day_Text), W1
	MOV.B	[W14+7], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,540 :: 		Day_Text[2]   := Temp_Text2[2];
	MOV	#lo_addr(_Day_Text+1), W1
	MOV.B	[W14+8], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,541 :: 		Day_Text[3]   := '.';
	MOV	#lo_addr(_Day_Text+2), W1
	MOV.B	#46, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,542 :: 		Day_Text[4]   := Temp_Text2[3];
	MOV	#lo_addr(_Day_Text+3), W1
	MOV.B	[W14+9], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,543 :: 		Day_Text[5]   := Temp_Text2[4];
	MOV	#lo_addr(_Day_Text+4), W1
	MOV.B	[W14+10], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,544 :: 		Day_Text[6]   := '.';
	MOV	#lo_addr(_Day_Text+5), W1
	MOV.B	#46, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,545 :: 		Day_Text[7]   := '2';
	MOV	#lo_addr(_Day_Text+6), W1
	MOV.B	#50, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,546 :: 		Day_Text[8]   := '0';
	MOV	#lo_addr(_Day_Text+7), W1
	MOV.B	#48, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,547 :: 		Day_Text[9]   := Temp_Text3[3];
	MOV	#lo_addr(_Day_Text+8), W1
	MOV.B	[W14+15], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,548 :: 		Day_Text[10]  := Temp_Text3[4];
	MOV	#lo_addr(_Day_Text+9), W1
	MOV.B	[W14+16], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,549 :: 		Day_Text[11]  := '=';
	MOV	#lo_addr(_Day_Text+10), W1
	MOV.B	#61, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,550 :: 		event_Text[1]  := '0';
	MOV	#lo_addr(_Event_Text), W1
	MOV.B	#48, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,551 :: 		event_Text[2]  := 'x';
	MOV	#lo_addr(_Event_Text+1), W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,552 :: 		event_Text[3]  := Temp_Text4[3];
	MOV	#lo_addr(_Event_Text+2), W1
	MOV.B	[W14+21], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,553 :: 		event_Text[4]  := Temp_Text4[4];
	MOV	#lo_addr(_Event_Text+3), W1
	MOV.B	[W14+22], W0
	MOV.B	W0, [W1]
;LogUnit.mpas,554 :: 		end else
	GOTO	L_LogUnit_Log_Partition196
L_LogUnit_Log_Partition195:
;LogUnit.mpas,556 :: 		Hour_Text[1]   := ' ';
	MOV	#lo_addr(_Hour_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,557 :: 		Hour_Text[2]   := ' ';
	MOV	#lo_addr(_Hour_Text+1), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,558 :: 		Hour_Text[3]   := ' ';
	MOV	#lo_addr(_Hour_Text+2), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,559 :: 		Hour_Text[4]   := ' ';
	MOV	#lo_addr(_Hour_Text+3), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,560 :: 		Hour_Text[5]   := ' ';
	MOV	#lo_addr(_Hour_Text+4), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,561 :: 		Hour_Text[6]   := ' ';
	MOV	#lo_addr(_Hour_Text+5), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,562 :: 		Day_Text[1]    := ' ';
	MOV	#lo_addr(_Day_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,563 :: 		Day_Text[2]    := ' ';
	MOV	#lo_addr(_Day_Text+1), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,564 :: 		Day_Text[3]    := ' ';
	MOV	#lo_addr(_Day_Text+2), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,565 :: 		Day_Text[4]    := ' ';
	MOV	#lo_addr(_Day_Text+3), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,566 :: 		Day_Text[5]    := ' ';
	MOV	#lo_addr(_Day_Text+4), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,567 :: 		Day_Text[6]    := ' ';
	MOV	#lo_addr(_Day_Text+5), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,568 :: 		Day_Text[7]    := ' ';
	MOV	#lo_addr(_Day_Text+6), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,569 :: 		Day_Text[8]    := ' ';
	MOV	#lo_addr(_Day_Text+7), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,570 :: 		Day_Text[9]    := ' ';
	MOV	#lo_addr(_Day_Text+8), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,571 :: 		Day_Text[10]   := ' ';
	MOV	#lo_addr(_Day_Text+9), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,572 :: 		Day_Text[11]   := ' ';
	MOV	#lo_addr(_Day_Text+10), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,573 :: 		event_Text[1]  := ' ';
	MOV	#lo_addr(_Event_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,574 :: 		event_Text[2]  := ' ';
	MOV	#lo_addr(_Event_Text+1), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,575 :: 		event_Text[3]  := ' ';
	MOV	#lo_addr(_Event_Text+2), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,576 :: 		event_Text[4]  := ' ';
	MOV	#lo_addr(_Event_Text+3), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,577 :: 		end;
L_LogUnit_Log_Partition196:
;LogUnit.mpas,583 :: 		end;
L_end_Log_Partition:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of LogUnit_Log_Partition

LogUnit_Log_Glcd_Write:
	LNK	#0

;LogUnit.mpas,586 :: 		begin
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV.B	[W14-8], W0
	MOV.B	W0, [W14-8]
	MOV.B	[W14-10], W0
	MOV.B	W0, [W14-10]
	MOV.B	[W14-12], W0
	MOV.B	W0, [W14-12]
	MOV.B	[W14-14], W0
	MOV.B	W0, [W14-14]
;LogUnit.mpas,587 :: 		Glcd_Write_Text(Text1,Coloumn1,Row,Colour);
	PUSH	W12
	PUSH	W11
	MOV.B	[W14-12], W12
	MOV.B	W13, W11
	MOV.B	[W14-14], W13
	CALL	_Glcd_Write_Text
	POP	W11
;LogUnit.mpas,588 :: 		Glcd_Write_Text(Text2,Coloumn2,Row,Colour);
	MOV.B	[W14-14], W13
	MOV.B	[W14-12], W12
	MOV	W11, W10
	MOV.B	[W14-8], W11
	CALL	_Glcd_Write_Text
	POP	W12
;LogUnit.mpas,589 :: 		Glcd_Write_Text(Text3,Coloumn3,Row,Colour);
	MOV.B	[W14-14], W13
	MOV.B	[W14-10], W11
	MOV	W12, W10
	MOV.B	[W14-12], W12
	CALL	_Glcd_Write_Text
;LogUnit.mpas,590 :: 		end;
L_end_Log_Glcd_Write:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of LogUnit_Log_Glcd_Write

LogUnit_Log_Erase:
	LNK	#24

;LogUnit.mpas,594 :: 		begin
;LogUnit.mpas,596 :: 		EraseMenuExit  := 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W0
	MOV.B	W0, [W14+0]
;LogUnit.mpas,598 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;LogUnit.mpas,601 :: 		Glcd_Write_Text('Olaylar Silinsin mi? ',0,Row1,Black);
	ADD	W14, #2, W1
	MOV.B	#79, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#109, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#63, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #2, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,602 :: 		Glcd_Write_Text('OK Buton   = Evet    ',0,Row2,Black);
	ADD	W14, #2, W1
	MOV.B	#79, W0
	MOV.B	W0, [W1++]
	MOV.B	#75, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#66, W0
	MOV.B	W0, [W1++]
	MOV.B	#117, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#61, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#118, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #2, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row2, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,603 :: 		Glcd_Write_Text('Down Buton = Hayýr   ',0,Row3,Black);
	ADD	W14, #2, W1
	MOV.B	#68, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#119, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#66, W0
	MOV.B	W0, [W1++]
	MOV.B	#117, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#61, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#253, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #2, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row3, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,605 :: 		while (EraseMenuExit =0) do
L_LogUnit_Log_Erase200:
	MOV.B	[W14+0], W0
	CP.B	W0, #0
	BRA Z	L_LogUnit_Log_Erase485
	GOTO	L_LogUnit_Log_Erase201
L_LogUnit_Log_Erase485:
;LogUnit.mpas,609 :: 		clrwdt;
	CLRWDT
;LogUnit.mpas,612 :: 		if (Ok_Button=0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L_LogUnit_Log_Erase205
;LogUnit.mpas,614 :: 		while (Ok_Button =0) do
L_LogUnit_Log_Erase208:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L_LogUnit_Log_Erase209
;LogUnit.mpas,617 :: 		clrwdt;
	CLRWDT
;LogUnit.mpas,619 :: 		end;
	GOTO	L_LogUnit_Log_Erase208
L_LogUnit_Log_Erase209:
;LogUnit.mpas,621 :: 		Glcd_Write_Text('Olaylar Siliniyor... ',0,Row4,Black);
	ADD	W14, #2, W1
	MOV.B	#79, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #2, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row4, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,624 :: 		for Erase_TempByte := 1 to 128 do
	MOV.B	#1, W0
	MOV.B	W0, [W14+1]
L_LogUnit_Log_Erase213:
;LogUnit.mpas,627 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,629 :: 		EEPROM_Write(EeAddr_Log_Clock[Erase_TempByte],0xFFFF); // olay saatlerini sil
	ADD	W14, #1, W0
	ZE	[W0], W0
	DEC	W0
	SL	W0, #2, W1
	MOV	#lo_addr(_EeAddr_Log_Clock), W0
	ADD	W0, W1, W2
	MOV	#higher_addr(_EeAddr_Log_Clock), W0
	MOV	WREG, 52
	MOV.D	[W2], W0
	MOV	#65535, W12
	MOV.D	W0, W10
	CALL	_EEPROM_Write
;LogUnit.mpas,630 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_Log_Erase218:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_Log_Erase218
;LogUnit.mpas,632 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,634 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,636 :: 		EEPROM_Write(EeAddr_Log_DateHi[Erase_TempByte],0xFFFF); // olay tarihini
	ADD	W14, #1, W0
	ZE	[W0], W0
	DEC	W0
	SL	W0, #2, W1
	MOV	#lo_addr(_EeAddr_Log_DateHi), W0
	ADD	W0, W1, W2
	MOV	#higher_addr(_EeAddr_Log_DateHi), W0
	MOV	WREG, 52
	MOV.D	[W2], W0
	MOV	#65535, W12
	MOV.D	W0, W10
	CALL	_EEPROM_Write
;LogUnit.mpas,637 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_Log_Erase223:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_Log_Erase223
;LogUnit.mpas,639 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,641 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,643 :: 		EEPROM_Write(EeAddr_Log_DateLo[Erase_TempByte],0xFFFF); // olay tarihini sil
	ADD	W14, #1, W0
	ZE	[W0], W0
	DEC	W0
	SL	W0, #2, W1
	MOV	#lo_addr(_EeAddr_Log_DateLo), W0
	ADD	W0, W1, W2
	MOV	#higher_addr(_EeAddr_Log_DateLo), W0
	MOV	WREG, 52
	MOV.D	[W2], W0
	MOV	#65535, W12
	MOV.D	W0, W10
	CALL	_EEPROM_Write
;LogUnit.mpas,644 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_Log_Erase228:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_Log_Erase228
;LogUnit.mpas,646 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,648 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,650 :: 		EEPROM_Write(EeAddr_Log_Event[Erase_TempByte],0xFFFF); // olaylarý sil
	ADD	W14, #1, W0
	ZE	[W0], W0
	DEC	W0
	SL	W0, #2, W1
	MOV	#lo_addr(_EeAddr_Log_Event), W0
	ADD	W0, W1, W2
	MOV	#higher_addr(_EeAddr_Log_Event), W0
	MOV	WREG, 52
	MOV.D	[W2], W0
	MOV	#65535, W12
	MOV.D	W0, W10
	CALL	_EEPROM_Write
;LogUnit.mpas,651 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_Log_Erase233:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_Log_Erase233
;LogUnit.mpas,653 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,655 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,657 :: 		EEPROM_Write(EE_LogListArrayEeAddr,0); // olaylarý listesini sil
	CLR	W12
	MOV	#61566, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;LogUnit.mpas,658 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L_LogUnit_Log_Erase238:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L_LogUnit_Log_Erase238
;LogUnit.mpas,660 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,662 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,664 :: 		end;
	MOV.B	[W14+1], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA NZ	L_LogUnit_Log_Erase486
	GOTO	L_LogUnit_Log_Erase216
L_LogUnit_Log_Erase486:
	MOV.B	[W14+1], W1
	ADD	W14, #1, W0
	ADD.B	W1, #1, [W0]
	GOTO	L_LogUnit_Log_Erase213
L_LogUnit_Log_Erase216:
;LogUnit.mpas,667 :: 		Glcd_Write_Text('Liste Temizlendi ... ',0,Row4,Black);
	ADD	W14, #2, W1
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#109, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#122, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#100, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #2, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row4, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,669 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;LogUnit.mpas,670 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,671 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;LogUnit.mpas,672 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,673 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;LogUnit.mpas,674 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,675 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;LogUnit.mpas,676 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,678 :: 		EraseMenuExit := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
;LogUnit.mpas,681 :: 		end else
	GOTO	L_LogUnit_Log_Erase206
L_LogUnit_Log_Erase205:
;LogUnit.mpas,682 :: 		if (Down_Button =0) then
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L_LogUnit_Log_Erase243
;LogUnit.mpas,684 :: 		while (Down_Button =0) do
L_LogUnit_Log_Erase246:
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L_LogUnit_Log_Erase247
;LogUnit.mpas,687 :: 		clrwdt;
	CLRWDT
;LogUnit.mpas,689 :: 		end;
	GOTO	L_LogUnit_Log_Erase246
L_LogUnit_Log_Erase247:
;LogUnit.mpas,690 :: 		EraseMenuExit := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
;LogUnit.mpas,691 :: 		Glcd_Write_Text('Ýptal Edildi...     ',0,Row4,Black);
	ADD	W14, #2, W1
	MOV.B	#221, W0
	MOV.B	W0, [W1++]
	MOV.B	#112, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#100, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#100, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #2, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row4, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,692 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;LogUnit.mpas,693 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,694 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;LogUnit.mpas,695 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,696 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;LogUnit.mpas,697 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,698 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;LogUnit.mpas,699 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,700 :: 		end;
L_LogUnit_Log_Erase243:
L_LogUnit_Log_Erase206:
;LogUnit.mpas,702 :: 		end;
	GOTO	L_LogUnit_Log_Erase200
L_LogUnit_Log_Erase201:
;LogUnit.mpas,704 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;LogUnit.mpas,707 :: 		end;
L_end_Log_Erase:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of LogUnit_Log_Erase

_Log_Settings:
	LNK	#30

;LogUnit.mpas,715 :: 		begin
;LogUnit.mpas,716 :: 		asm clrwdt; end;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLRWDT
;LogUnit.mpas,717 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;LogUnit.mpas,718 :: 		Log_Page        := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+5]
;LogUnit.mpas,719 :: 		MenuExit        := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;LogUnit.mpas,720 :: 		List_Text       := '   ';
	ADD	W14, #1, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;LogUnit.mpas,722 :: 		Glcd_Write_Text(Title_LogMenu,0,Row1,Black);
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	CLR	W11
	MOV	#lo_addr(_Title_LogMenu), W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,723 :: 		Glcd_Write_Text(SubTitle_LogRead,0,Row2,Black);
	MOV.B	#_Black, W13
	MOV.B	#_Row2, W12
	CLR	W11
	MOV	#lo_addr(_SubTitle_LogRead), W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,729 :: 		Log_Array              := EEPROM_Read(EE_LogListArrayEeAddr);
	MOV	#61566, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Log_Array), W1
	MOV.B	W0, [W1]
;LogUnit.mpas,730 :: 		Pause_ms(50);
	MOV	#50, W10
	CALL	_Pause_Ms
;LogUnit.mpas,733 :: 		clrwdt;
	CLRWDT
;LogUnit.mpas,736 :: 		for Read_TempByte := 1 to 128 do
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
L__Log_Settings252:
;LogUnit.mpas,739 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,741 :: 		Read_LogEvent[Read_TempByte] := EEPROM_Read(EeAddr_Log_Event[Read_TempByte]); // önce olay var mý ona bak
	ADD	W14, #0, W0
	ZE	[W0], W0
	SUB	W0, #1, W2
	SL	W2, #1, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+28]
	SL	W2, #2, W1
	MOV	#lo_addr(_EeAddr_Log_Event), W0
	ADD	W0, W1, W1
	MOV	#higher_addr(_EeAddr_Log_Event), W0
	MOV	WREG, 52
	MOV.D	[W1], W10
	CALL	_EEPROM_Read
	MOV	[W14+28], W1
	MOV	W0, [W1]
;LogUnit.mpas,742 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,744 :: 		Read_LogClock[Read_TempByte] := EEPROM_Read(EeAddr_Log_Clock[Read_TempByte]);
	ADD	W14, #0, W0
	ZE	[W0], W0
	SUB	W0, #1, W2
	SL	W2, #1, W1
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+28]
	SL	W2, #2, W1
	MOV	#lo_addr(_EeAddr_Log_Clock), W0
	ADD	W0, W1, W1
	MOV	#higher_addr(_EeAddr_Log_Clock), W0
	MOV	WREG, 52
	MOV.D	[W1], W10
	CALL	_EEPROM_Read
	MOV	[W14+28], W1
	MOV	W0, [W1]
;LogUnit.mpas,745 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,747 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,749 :: 		Read_LogDateHi[Read_TempByte] := EEPROM_Read(EeAddr_Log_DateHi[Read_TempByte]);
	ADD	W14, #0, W0
	ZE	[W0], W0
	SUB	W0, #1, W2
	SL	W2, #1, W1
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+28]
	SL	W2, #2, W1
	MOV	#lo_addr(_EeAddr_Log_DateHi), W0
	ADD	W0, W1, W1
	MOV	#higher_addr(_EeAddr_Log_DateHi), W0
	MOV	WREG, 52
	MOV.D	[W1], W10
	CALL	_EEPROM_Read
	MOV	[W14+28], W1
	MOV	W0, [W1]
;LogUnit.mpas,750 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,752 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,754 :: 		Read_LogDateLo[Read_TempByte] := EEPROM_Read(EeAddr_Log_DateLo[Read_TempByte]);
	ADD	W14, #0, W0
	ZE	[W0], W0
	SUB	W0, #1, W2
	SL	W2, #1, W1
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W1, W0
	MOV	W0, [W14+28]
	SL	W2, #2, W1
	MOV	#lo_addr(_EeAddr_Log_DateLo), W0
	ADD	W0, W1, W1
	MOV	#higher_addr(_EeAddr_Log_DateLo), W0
	MOV	WREG, 52
	MOV.D	[W1], W10
	CALL	_EEPROM_Read
	MOV	[W14+28], W1
	MOV	W0, [W1]
;LogUnit.mpas,755 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;LogUnit.mpas,757 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,760 :: 		end;
	MOV.B	[W14+0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA NZ	L__Log_Settings488
	GOTO	L__Log_Settings255
L__Log_Settings488:
	MOV.B	[W14+0], W1
	ADD	W14, #0, W0
	ADD.B	W1, #1, [W0]
	GOTO	L__Log_Settings252
L__Log_Settings255:
;LogUnit.mpas,763 :: 		ByteToStr(Log_Array, List_Text);
	ADD	W14, #1, W1
	MOV	#lo_addr(_Log_Array), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;LogUnit.mpas,764 :: 		Glcd_Write_Text(List_Text,0,Row4,Black);
	ADD	W14, #1, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row4, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,765 :: 		Glcd_Write_Text('/128-List',20,Row4,Black);
	ADD	W14, #6, W1
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	MOV.B	#56, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row4, W12
	MOV.B	#20, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,768 :: 		for i:= 1 to 10 do
; i start address is: 0 (W0)
	MOV.B	#1, W0
; i end address is: 0 (W0)
L__Log_Settings257:
;LogUnit.mpas,770 :: 		Pause_ms(100);
; i start address is: 0 (W0)
	PUSH	W0
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W0
;LogUnit.mpas,772 :: 		clrwdt;
	CLRWDT
;LogUnit.mpas,774 :: 		end;
	CP.B	W0, #10
	BRA NZ	L__Log_Settings489
	GOTO	L__Log_Settings260
L__Log_Settings489:
; i start address is: 2 (W1)
	ADD.B	W0, #1, W1
; i end address is: 0 (W0)
	MOV.B	W1, W0
; i end address is: 2 (W1)
	GOTO	L__Log_Settings257
L__Log_Settings260:
;LogUnit.mpas,776 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;LogUnit.mpas,780 :: 		while (MenuExit = 0) do // ok butonuna basýlýrsa menüden çýkacak
L__Log_Settings262:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Log_Settings490
	GOTO	L__Log_Settings263
L__Log_Settings490:
;LogUnit.mpas,783 :: 		if (Hidden_Button =0) then
	BTSC	Hidden_Button, BitPos(Hidden_Button+0)
	GOTO	L__Log_Settings267
;LogUnit.mpas,785 :: 		while (Hidden_Button =0) do
L__Log_Settings270:
	BTSC	Hidden_Button, BitPos(Hidden_Button+0)
	GOTO	L__Log_Settings271
;LogUnit.mpas,788 :: 		clrwdt;
	CLRWDT
;LogUnit.mpas,790 :: 		end;
	GOTO	L__Log_Settings270
L__Log_Settings271:
;LogUnit.mpas,791 :: 		Log_Erase();
	CALL	LogUnit_Log_Erase
;LogUnit.mpas,792 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,793 :: 		end;
L__Log_Settings267:
;LogUnit.mpas,795 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Log_Settings275
;LogUnit.mpas,797 :: 		while (Ok_Button =0) do
L__Log_Settings278:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Log_Settings279
;LogUnit.mpas,799 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,800 :: 		end;
	GOTO	L__Log_Settings278
L__Log_Settings279:
;LogUnit.mpas,802 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;LogUnit.mpas,804 :: 		end;
L__Log_Settings275:
;LogUnit.mpas,806 :: 		if (Down_Button =0) then
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__Log_Settings283
;LogUnit.mpas,808 :: 		while (Down_Button =0) do
L__Log_Settings286:
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__Log_Settings287
;LogUnit.mpas,810 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,811 :: 		end;
	GOTO	L__Log_Settings286
L__Log_Settings287:
;LogUnit.mpas,812 :: 		Log_Page := Log_Page + 1;
	ADD	W14, #5, W0
	SE	[W0], W0
	INC	W0
	MOV.B	W0, [W14+5]
;LogUnit.mpas,813 :: 		if (Log_Page > 19) then Log_Page := 1;
	CP.B	W0, #19
	BRA GT	L__Log_Settings491
	GOTO	L__Log_Settings291
L__Log_Settings491:
	MOV.B	#1, W0
	MOV.B	W0, [W14+5]
L__Log_Settings291:
;LogUnit.mpas,814 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;LogUnit.mpas,815 :: 		end else
	GOTO	L__Log_Settings284
L__Log_Settings283:
;LogUnit.mpas,816 :: 		if (Up_Button =0) then
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__Log_Settings294
;LogUnit.mpas,818 :: 		while (Up_Button =0) do
L__Log_Settings297:
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__Log_Settings298
;LogUnit.mpas,820 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,821 :: 		end;
	GOTO	L__Log_Settings297
L__Log_Settings298:
;LogUnit.mpas,822 :: 		Log_Page := Log_Page - 1;
	ADD	W14, #5, W0
	SE	[W0], W0
	DEC	W0
	MOV.B	W0, [W14+5]
;LogUnit.mpas,823 :: 		if (Log_Page < 1) then Log_Page := 19;
	CP.B	W0, #1
	BRA LT	L__Log_Settings492
	GOTO	L__Log_Settings302
L__Log_Settings492:
	MOV.B	#19, W0
	MOV.B	W0, [W14+5]
L__Log_Settings302:
;LogUnit.mpas,824 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;LogUnit.mpas,825 :: 		end;
L__Log_Settings294:
L__Log_Settings284:
;LogUnit.mpas,827 :: 		asm clrwdt; end;
	CLRWDT
;LogUnit.mpas,831 :: 		1: begin  // log menüsü 1/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #1
	BRA Z	L__Log_Settings493
	GOTO	L__Log_Settings307
L__Log_Settings493:
;LogUnit.mpas,832 :: 		Glcd_Write_Text('SAYFA / PAGE - 1/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,833 :: 		for i:= 1 to 7 do
; i start address is: 26 (W13)
	MOV.B	#1, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings309:
;LogUnit.mpas,835 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,836 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i,Black);
	PUSH	W12
	MOV	#_Black, W0
	PUSH	W0
	ZE	W12, W0
	PUSH	W0
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,837 :: 		end;
	CP.B	W12, #7
	BRA NZ	L__Log_Settings494
	GOTO	L__Log_Settings312
L__Log_Settings494:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings309
L__Log_Settings312:
;LogUnit.mpas,839 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings307:
;LogUnit.mpas,840 :: 		2: begin  // log menüsü 2/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #2
	BRA Z	L__Log_Settings495
	GOTO	L__Log_Settings315
L__Log_Settings495:
;LogUnit.mpas,841 :: 		Glcd_Write_Text('SAYFA / PAGE - 2/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,843 :: 		for i:= 8 to 14 do
; i start address is: 26 (W13)
	MOV.B	#8, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings317:
;LogUnit.mpas,845 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,846 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-7,Black);
	ZE	W12, W0
	SUB	W0, #7, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,847 :: 		end;
	CP.B	W12, #14
	BRA NZ	L__Log_Settings496
	GOTO	L__Log_Settings320
L__Log_Settings496:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings317
L__Log_Settings320:
;LogUnit.mpas,848 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings315:
;LogUnit.mpas,850 :: 		3: begin  // log menüsü 3/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #3
	BRA Z	L__Log_Settings497
	GOTO	L__Log_Settings323
L__Log_Settings497:
;LogUnit.mpas,851 :: 		Glcd_Write_Text('SAYFA / PAGE - 3/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#51, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,853 :: 		for i:= 15 to 21 do
; i start address is: 26 (W13)
	MOV.B	#15, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings325:
;LogUnit.mpas,855 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,856 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-14,Black);
	ZE	W12, W0
	SUB	W0, #14, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,857 :: 		end;
	CP.B	W12, #21
	BRA NZ	L__Log_Settings498
	GOTO	L__Log_Settings328
L__Log_Settings498:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings325
L__Log_Settings328:
;LogUnit.mpas,858 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings323:
;LogUnit.mpas,860 :: 		4: begin  // log menüsü 4/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #4
	BRA Z	L__Log_Settings499
	GOTO	L__Log_Settings331
L__Log_Settings499:
;LogUnit.mpas,861 :: 		Glcd_Write_Text('SAYFA / PAGE - 4/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#52, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,863 :: 		for i:= 22 to 28 do
; i start address is: 26 (W13)
	MOV.B	#22, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings333:
;LogUnit.mpas,865 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,866 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-21,Black);
	ZE	W12, W0
	SUB	W0, #21, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,867 :: 		end;
	CP.B	W12, #28
	BRA NZ	L__Log_Settings500
	GOTO	L__Log_Settings336
L__Log_Settings500:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings333
L__Log_Settings336:
;LogUnit.mpas,868 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings331:
;LogUnit.mpas,870 :: 		5: begin  // log menüsü 5/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #5
	BRA Z	L__Log_Settings501
	GOTO	L__Log_Settings339
L__Log_Settings501:
;LogUnit.mpas,871 :: 		Glcd_Write_Text('SAYFA / PAGE - 5/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#53, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,873 :: 		for i:= 29 to 35 do
; i start address is: 26 (W13)
	MOV.B	#29, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings341:
;LogUnit.mpas,875 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,876 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-28,Black);
	ZE	W12, W0
	SUB	W0, #28, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,877 :: 		end;
	MOV.B	#35, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings502
	GOTO	L__Log_Settings344
L__Log_Settings502:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings341
L__Log_Settings344:
;LogUnit.mpas,878 :: 		end;  //-----------------------
	GOTO	L__Log_Settings304
L__Log_Settings339:
;LogUnit.mpas,880 :: 		6: begin  // log menüsü 6/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #6
	BRA Z	L__Log_Settings503
	GOTO	L__Log_Settings347
L__Log_Settings503:
;LogUnit.mpas,881 :: 		Glcd_Write_Text('SAYFA / PAGE - 6/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,883 :: 		for i:= 36 to 42 do
; i start address is: 26 (W13)
	MOV.B	#36, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings349:
;LogUnit.mpas,885 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,886 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-35,Black);
	ZE	W12, W1
	MOV	#35, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,887 :: 		end;
	MOV.B	#42, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings504
	GOTO	L__Log_Settings352
L__Log_Settings504:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings349
L__Log_Settings352:
;LogUnit.mpas,888 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings347:
;LogUnit.mpas,890 :: 		7: begin  // log menüsü 7/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #7
	BRA Z	L__Log_Settings505
	GOTO	L__Log_Settings355
L__Log_Settings505:
;LogUnit.mpas,891 :: 		Glcd_Write_Text('SAYFA / PAGE - 7/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#55, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,893 :: 		for i:= 43 to 49 do
; i start address is: 26 (W13)
	MOV.B	#43, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings357:
;LogUnit.mpas,895 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,896 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-42,Black);
	ZE	W12, W1
	MOV	#42, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,897 :: 		end;
	MOV.B	#49, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings506
	GOTO	L__Log_Settings360
L__Log_Settings506:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings357
L__Log_Settings360:
;LogUnit.mpas,898 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings355:
;LogUnit.mpas,900 :: 		8: begin  // log menüsü 8/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #8
	BRA Z	L__Log_Settings507
	GOTO	L__Log_Settings363
L__Log_Settings507:
;LogUnit.mpas,901 :: 		Glcd_Write_Text('SAYFA / PAGE - 8/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#56, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,903 :: 		for i:= 50 to 56 do
; i start address is: 26 (W13)
	MOV.B	#50, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings365:
;LogUnit.mpas,905 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,906 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-49,Black);
	ZE	W12, W1
	MOV	#49, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,907 :: 		end;
	MOV.B	#56, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings508
	GOTO	L__Log_Settings368
L__Log_Settings508:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings365
L__Log_Settings368:
;LogUnit.mpas,908 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings363:
;LogUnit.mpas,910 :: 		9: begin  // log menüsü 9/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #9
	BRA Z	L__Log_Settings509
	GOTO	L__Log_Settings371
L__Log_Settings509:
;LogUnit.mpas,911 :: 		Glcd_Write_Text('SAYFA / PAGE - 9/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,913 :: 		for i:= 57 to 63 do
; i start address is: 26 (W13)
	MOV.B	#57, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings373:
;LogUnit.mpas,915 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,916 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-56,Black);
	ZE	W12, W1
	MOV	#56, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,917 :: 		end;
	MOV.B	#63, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings510
	GOTO	L__Log_Settings376
L__Log_Settings510:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings373
L__Log_Settings376:
;LogUnit.mpas,918 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings371:
;LogUnit.mpas,920 :: 		10: begin  // log menüsü 10/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #10
	BRA Z	L__Log_Settings511
	GOTO	L__Log_Settings379
L__Log_Settings511:
;LogUnit.mpas,921 :: 		Glcd_Write_Text('SAYFA / PAGE -10/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,923 :: 		for i:= 64 to 70 do
; i start address is: 26 (W13)
	MOV.B	#64, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings381:
;LogUnit.mpas,925 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,926 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-63,Black);
	ZE	W12, W1
	MOV	#63, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,927 :: 		end;
	MOV.B	#70, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings512
	GOTO	L__Log_Settings384
L__Log_Settings512:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings381
L__Log_Settings384:
;LogUnit.mpas,928 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings379:
;LogUnit.mpas,930 :: 		11: begin  // log menüsü 11/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #11
	BRA Z	L__Log_Settings513
	GOTO	L__Log_Settings387
L__Log_Settings513:
;LogUnit.mpas,931 :: 		Glcd_Write_Text('SAYFA / PAGE -11/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,933 :: 		for i:= 71 to 77 do
; i start address is: 26 (W13)
	MOV.B	#71, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings389:
;LogUnit.mpas,935 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,936 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-70,Black);
	ZE	W12, W1
	MOV	#70, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,937 :: 		end;
	MOV.B	#77, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings514
	GOTO	L__Log_Settings392
L__Log_Settings514:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings389
L__Log_Settings392:
;LogUnit.mpas,938 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings387:
;LogUnit.mpas,940 :: 		12: begin  // log menüsü 12/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #12
	BRA Z	L__Log_Settings515
	GOTO	L__Log_Settings395
L__Log_Settings515:
;LogUnit.mpas,941 :: 		Glcd_Write_Text('SAYFA / PAGE -12/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,943 :: 		for i:= 78 to 84 do
; i start address is: 26 (W13)
	MOV.B	#78, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings397:
;LogUnit.mpas,945 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,946 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-77,Black);
	ZE	W12, W1
	MOV	#77, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,947 :: 		end;
	MOV.B	#84, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings516
	GOTO	L__Log_Settings400
L__Log_Settings516:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings397
L__Log_Settings400:
;LogUnit.mpas,948 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings395:
;LogUnit.mpas,950 :: 		13: begin  // log menüsü 13/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #13
	BRA Z	L__Log_Settings517
	GOTO	L__Log_Settings403
L__Log_Settings517:
;LogUnit.mpas,951 :: 		Glcd_Write_Text('SAYFA / PAGE -13/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#51, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,953 :: 		for i:= 85 to 91 do
; i start address is: 26 (W13)
	MOV.B	#85, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings405:
;LogUnit.mpas,955 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,956 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-84,Black);
	ZE	W12, W1
	MOV	#84, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,957 :: 		end;
	MOV.B	#91, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings518
	GOTO	L__Log_Settings408
L__Log_Settings518:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings405
L__Log_Settings408:
;LogUnit.mpas,958 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings403:
;LogUnit.mpas,960 :: 		14: begin  // log menüsü 14/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #14
	BRA Z	L__Log_Settings519
	GOTO	L__Log_Settings411
L__Log_Settings519:
;LogUnit.mpas,961 :: 		Glcd_Write_Text('SAYFA / PAGE -14/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#52, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,963 :: 		for i:= 92 to 98 do
; i start address is: 26 (W13)
	MOV.B	#92, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings413:
;LogUnit.mpas,965 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,966 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-91,Black);
	ZE	W12, W1
	MOV	#91, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,967 :: 		end;
	MOV.B	#98, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings520
	GOTO	L__Log_Settings416
L__Log_Settings520:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings413
L__Log_Settings416:
;LogUnit.mpas,968 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings411:
;LogUnit.mpas,970 :: 		15: begin  // log menüsü 15/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #15
	BRA Z	L__Log_Settings521
	GOTO	L__Log_Settings419
L__Log_Settings521:
;LogUnit.mpas,971 :: 		Glcd_Write_Text('SAYFA / PAGE -15/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#53, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,973 :: 		for i:= 99 to 105 do
; i start address is: 26 (W13)
	MOV.B	#99, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings421:
;LogUnit.mpas,975 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,976 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-98,Black);
	ZE	W12, W1
	MOV	#98, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,977 :: 		end;
	MOV.B	#105, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings522
	GOTO	L__Log_Settings424
L__Log_Settings522:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings421
L__Log_Settings424:
;LogUnit.mpas,978 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings419:
;LogUnit.mpas,980 :: 		16: begin  // log menüsü 16/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #16
	BRA Z	L__Log_Settings523
	GOTO	L__Log_Settings427
L__Log_Settings523:
;LogUnit.mpas,981 :: 		Glcd_Write_Text('SAYFA / PAGE -16/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,983 :: 		for i:= 106 to 112 do
; i start address is: 26 (W13)
	MOV.B	#106, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings429:
;LogUnit.mpas,985 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,986 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-105,Black);
	ZE	W12, W1
	MOV	#105, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,987 :: 		end;
	MOV.B	#112, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings524
	GOTO	L__Log_Settings432
L__Log_Settings524:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings429
L__Log_Settings432:
;LogUnit.mpas,988 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings427:
;LogUnit.mpas,990 :: 		17: begin  // log menüsü 17/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #17
	BRA Z	L__Log_Settings525
	GOTO	L__Log_Settings435
L__Log_Settings525:
;LogUnit.mpas,991 :: 		Glcd_Write_Text('SAYFA / PAGE -17/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#55, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,993 :: 		for i:= 113 to 119 do
; i start address is: 26 (W13)
	MOV.B	#113, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings437:
;LogUnit.mpas,995 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,996 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-112,Black);
	ZE	W12, W1
	MOV	#112, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,997 :: 		end;
	MOV.B	#119, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings526
	GOTO	L__Log_Settings440
L__Log_Settings526:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings437
L__Log_Settings440:
;LogUnit.mpas,998 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings435:
;LogUnit.mpas,1000 :: 		18: begin  // log menüsü 18/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #18
	BRA Z	L__Log_Settings527
	GOTO	L__Log_Settings443
L__Log_Settings527:
;LogUnit.mpas,1001 :: 		Glcd_Write_Text('SAYFA / PAGE -18/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#56, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,1003 :: 		for i:= 120 to 126 do
; i start address is: 26 (W13)
	MOV.B	#120, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings445:
;LogUnit.mpas,1005 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,1006 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-119,Black);
	ZE	W12, W1
	MOV	#119, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,1007 :: 		end;
	MOV.B	#126, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings528
	GOTO	L__Log_Settings448
L__Log_Settings528:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings445
L__Log_Settings448:
;LogUnit.mpas,1008 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings443:
;LogUnit.mpas,1010 :: 		19: begin  // log menüsü 19/19 sayfasý en fazla 7 olay görüntüleniyor
	MOV.B	[W14+5], W0
	CP.B	W0, #19
	BRA Z	L__Log_Settings529
	GOTO	L__Log_Settings451
L__Log_Settings529:
;LogUnit.mpas,1011 :: 		Glcd_Write_Text('SAYFA / PAGE -19/19',22,Row1,Black);
	ADD	W14, #6, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	MOV.B	#47, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #6, W0
	MOV.B	#_Black, W13
	MOV.B	#_Row1, W12
	MOV.B	#22, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;LogUnit.mpas,1013 :: 		for i:= 127 to 128 do
; i start address is: 26 (W13)
	MOV.B	#127, W13
; i end address is: 26 (W13)
	MOV.B	W13, W12
L__Log_Settings453:
;LogUnit.mpas,1015 :: 		Log_Partition(Read_LogClock[i],Read_LogDateHi[i],Read_LogDateLo[i],Read_LogEvent[i]);
; i start address is: 24 (W12)
	ZE	W12, W0
	DEC	W0
	SL	W0, #1, W4
	MOV	#lo_addr(_Read_LogClock), W0
	ADD	W0, W4, W3
	MOV	#lo_addr(_Read_LogDateHi), W0
	ADD	W0, W4, W2
	MOV	#lo_addr(_Read_LogDateLo), W0
	ADD	W0, W4, W1
	MOV	#lo_addr(_Read_LogEvent), W0
	ADD	W0, W4, W0
	PUSH	W12
	MOV	[W0], W13
	MOV	[W1], W12
	MOV	[W2], W11
	MOV	[W3], W10
	CALL	LogUnit_Log_Partition
	POP	W12
;LogUnit.mpas,1016 :: 		Log_Glcd_Write(Hour_Text,Day_Text,Event_Text,0,35,105,i-126,Black);
	ZE	W12, W1
	MOV	#126, W0
	SUB	W1, W0, W1
	PUSH	W12
	CLR	W13
	MOV	#lo_addr(_Event_Text), W12
	MOV	#lo_addr(_Day_Text), W11
	MOV	#lo_addr(_Hour_Text), W10
	MOV	#_Black, W0
	PUSH	W0
	PUSH	W1
	MOV	#105, W0
	PUSH	W0
	MOV	#35, W0
	PUSH	W0
	CALL	LogUnit_Log_Glcd_Write
	SUB	#8, W15
	POP	W12
;LogUnit.mpas,1017 :: 		end;
	MOV.B	#128, W0
	CP.B	W12, W0
	BRA NZ	L__Log_Settings530
	GOTO	L__Log_Settings456
L__Log_Settings530:
; i start address is: 0 (W0)
	ADD.B	W12, #1, W0
; i end address is: 24 (W12)
	MOV.B	W0, W12
; i end address is: 0 (W0)
	GOTO	L__Log_Settings453
L__Log_Settings456:
;LogUnit.mpas,1018 :: 		end;
	GOTO	L__Log_Settings304
L__Log_Settings451:
L__Log_Settings304:
;LogUnit.mpas,1024 :: 		end;
	GOTO	L__Log_Settings262
L__Log_Settings263:
;LogUnit.mpas,1026 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;LogUnit.mpas,1028 :: 		end;
L_end_Log_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Log_Settings
