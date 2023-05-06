
_DateCalculator:
	LNK	#48

;Battery_Meintenance.mpas,73 :: 		begin
;Battery_Meintenance.mpas,75 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;Battery_Meintenance.mpas,77 :: 		BakimControlBit  := 0;
	MOV	#lo_addr(_BakimControlBit), W0
	BCLR	[W0], BitPos(_BakimControlBit+0)
;Battery_Meintenance.mpas,78 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year);
	MOV	#lo_addr(_Day), W13
	MOV	#lo_addr(_Seconds), W12
	MOV	#lo_addr(_Minutes), W11
	MOV	#lo_addr(_Hours), W10
	MOV	#lo_addr(_Year), W0
	PUSH	W0
	MOV	#lo_addr(_Month), W0
	PUSH	W0
	MOV	#lo_addr(_Week), W0
	PUSH	W0
	CALL	_Read_Time
	SUB	#6, W15
;Battery_Meintenance.mpas,79 :: 		Seconds  :=  Bcd2Dec16(seconds);
	MOV	#lo_addr(_Seconds), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Seconds), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,80 :: 		minutes  :=  Bcd2Dec16(minutes);
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Minutes), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,81 :: 		hours    :=  Bcd2Dec16(hours);
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Hours), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,82 :: 		week     :=  Bcd2Dec16(Week);
	MOV	#lo_addr(_Week), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Week), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,83 :: 		day      :=  Bcd2Dec16(Day);
	MOV	#lo_addr(_Day), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Day), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,84 :: 		month    :=  Bcd2Dec16(Month);
	MOV	#lo_addr(_Month), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Month), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,85 :: 		year     :=  Bcd2Dec16(Year);
	MOV	#lo_addr(_Year), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Year), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,87 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);
	MOV	#lo_addr(_NewFont5x7), W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	W1, W10
	MOV	W0, W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;Battery_Meintenance.mpas,88 :: 		DateFullText:= '               ';
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
;Battery_Meintenance.mpas,93 :: 		FarkAy := ((360 div ServiceCycle) div 30); // ayda kaç adet olduðu hesaplanýr
	MOV	#lo_addr(_ServiceCycle), W0
	ZE	[W0], W2
	MOV	#360, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#30, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, _FarkAy
;Battery_Meintenance.mpas,95 :: 		DayCalc := 15;// her ayýn 15. günü
	MOV	#lo_addr(_DayCalc), W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,97 :: 		ByteToStr(DayCalc, DayText);
	ADD	W14, #8, W0
	MOV	W0, W11
	MOV.B	#15, W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,98 :: 		ltrim(DayText);
	ADD	W14, #8, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,100 :: 		if (BakimSelect = 1) then
	MOV	#lo_addr(_BakimSelect), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__DateCalculator374
	GOTO	L__DateCalculator2
L__DateCalculator374:
;Battery_Meintenance.mpas,102 :: 		TempAy := FarkAy + Month;
	MOV	#lo_addr(_Month), W0
	SE	[W0], W1
	MOV	#lo_addr(_FarkAy), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	W1, [W0]
;Battery_Meintenance.mpas,104 :: 		if (TempAy > 12) then
	CP.B	W1, #12
	BRA GTU	L__DateCalculator375
	GOTO	L__DateCalculator5
L__DateCalculator375:
;Battery_Meintenance.mpas,106 :: 		TempAy   := TempAy - 12;
	MOV.B	#12, W1
	MOV	#lo_addr(_TempAy), W0
	SUBR.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,107 :: 		Year_1   := Year + 1;
	MOV	#lo_addr(_Year), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_Year_1), W0
	ADD.B	W1, #1, [W0]
;Battery_Meintenance.mpas,108 :: 		Month_1  := TempAy;
	MOV	#lo_addr(_Month_1), W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,109 :: 		end else
	GOTO	L__DateCalculator6
L__DateCalculator5:
;Battery_Meintenance.mpas,111 :: 		Month_1 := TempAy;
	MOV	#lo_addr(_Month_1), W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,112 :: 		Year_1  := Year;
	MOV	#lo_addr(_Year_1), W1
	MOV	#lo_addr(_Year), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,113 :: 		end;
L__DateCalculator6:
;Battery_Meintenance.mpas,115 :: 		Service1_Date := 100 * Month_1;
	MOV	#100, W1
	MOV	#lo_addr(_Month_1), W0
	SE	[W0], W0
	MUL.SS	W1, W0, W2
	MOV	W2, _Service1_Date
;Battery_Meintenance.mpas,116 :: 		Service1_Date := Service1_Date + Year_1;
	MOV	#lo_addr(_Year_1), W0
	ZE	[W0], W0
	ADD	W2, W0, W0
	MOV	W0, _Service1_Date
;Battery_Meintenance.mpas,119 :: 		EEPROM_Write(EE_Service1EeAddr, Service1_Date);
	MOV	W0, W12
	MOV	#_EE_Service1EeAddr, W10
	MOV	#_EE_Service1EeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,120 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__DateCalculator8:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__DateCalculator376
	GOTO	L__DateCalculator8
L__DateCalculator376:
;Battery_Meintenance.mpas,122 :: 		if (ServiceCycle > 1) then
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA GTU	L__DateCalculator377
	GOTO	L__DateCalculator13
L__DateCalculator377:
;Battery_Meintenance.mpas,123 :: 		BakimSelect := 2 else BakimSelect := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
	GOTO	L__DateCalculator14
L__DateCalculator13:
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__DateCalculator14:
;Battery_Meintenance.mpas,125 :: 		ByteToStr(Month_1,MonthText);
	ADD	W14, #4, W1
	MOV	W1, [W14+46]
	MOV	#lo_addr(_Month_1), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,126 :: 		ByteToStr(Year_1,YilText);
	ADD	W14, #0, W1
	MOV	W1, [W14+44]
	MOV	#lo_addr(_Year_1), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,127 :: 		ltrim(MonthText);
	ADD	W14, #4, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,128 :: 		ltrim(YilText);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,130 :: 		DateFullText :=('1-->'+DayText+'.' + MonthText + '.20' + YilText);
	ADD	W14, #28, W0
	MOV.B	#49, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#62, W2
	MOV.B	W2, [W0++]
	ADD	W14, #8, W1
	CALL	___CS2S
	MOV.B	#46, W2
	MOV.B	W2, [W0++]
	MOV	[W14+46], W2
	MOV	W2, W1
	CALL	___CS2S
	MOV.B	#46, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV	[W14+44], W2
	MOV	W2, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #12, W0
	ADD	W14, #28, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;Battery_Meintenance.mpas,131 :: 		Glcd_Write_Text(DateFullText,10,2,Black);
	ADD	W14, #12, W0
	MOV.B	#_Black, W13
	MOV.B	#2, W12
	MOV.B	#10, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,133 :: 		Pause_Ms(500);
	MOV	#500, W10
	CALL	_Pause_Ms
;Battery_Meintenance.mpas,136 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,138 :: 		end;
L__DateCalculator2:
;Battery_Meintenance.mpas,140 :: 		if (BakimSelect = 2) then
	MOV	#lo_addr(_BakimSelect), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__DateCalculator378
	GOTO	L__DateCalculator16
L__DateCalculator378:
;Battery_Meintenance.mpas,142 :: 		TempAy := FarkAy + Month_1;
	MOV	#lo_addr(_Month_1), W0
	SE	[W0], W1
	MOV	#lo_addr(_FarkAy), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	W1, [W0]
;Battery_Meintenance.mpas,144 :: 		if (TempAy > 12) then
	CP.B	W1, #12
	BRA GTU	L__DateCalculator379
	GOTO	L__DateCalculator19
L__DateCalculator379:
;Battery_Meintenance.mpas,146 :: 		TempAy   := TempAy - 12;
	MOV.B	#12, W1
	MOV	#lo_addr(_TempAy), W0
	SUBR.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,147 :: 		Year_2   := Year_1 + 1;
	MOV	#lo_addr(_Year_1), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_Year_2), W0
	ADD.B	W1, #1, [W0]
;Battery_Meintenance.mpas,148 :: 		Month_2  := TempAy;
	MOV	#lo_addr(_Month_2), W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,149 :: 		end else
	GOTO	L__DateCalculator20
L__DateCalculator19:
;Battery_Meintenance.mpas,151 :: 		Month_2 := TempAy;
	MOV	#lo_addr(_Month_2), W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,152 :: 		Year_2  := Year_1;
	MOV	#lo_addr(_Year_2), W1
	MOV	#lo_addr(_Year_1), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,153 :: 		end;
L__DateCalculator20:
;Battery_Meintenance.mpas,155 :: 		Service2_Date := 100 * Month_2;
	MOV	#100, W1
	MOV	#lo_addr(_Month_2), W0
	SE	[W0], W0
	MUL.SS	W1, W0, W2
	MOV	W2, _Service2_Date
;Battery_Meintenance.mpas,156 :: 		Service2_Date := Service2_Date + Year_2;
	MOV	#lo_addr(_Year_2), W0
	ZE	[W0], W0
	ADD	W2, W0, W0
	MOV	W0, _Service2_Date
;Battery_Meintenance.mpas,158 :: 		EEPROM_Write(EE_Service2EeAddr, Service2_Date);
	MOV	W0, W12
	MOV	#_EE_Service2EeAddr, W10
	MOV	#_EE_Service2EeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,159 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__DateCalculator22:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__DateCalculator380
	GOTO	L__DateCalculator22
L__DateCalculator380:
;Battery_Meintenance.mpas,161 :: 		if (ServiceCycle > 2) then
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA GTU	L__DateCalculator381
	GOTO	L__DateCalculator27
L__DateCalculator381:
;Battery_Meintenance.mpas,162 :: 		BakimSelect := 3 else BakimSelect := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
	GOTO	L__DateCalculator28
L__DateCalculator27:
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__DateCalculator28:
;Battery_Meintenance.mpas,164 :: 		ByteToStr(Month_2,MonthText);
	ADD	W14, #4, W1
	MOV	W1, [W14+46]
	MOV	#lo_addr(_Month_2), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,165 :: 		ByteToStr(Year_2,YilText);
	ADD	W14, #0, W1
	MOV	W1, [W14+44]
	MOV	#lo_addr(_Year_2), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,166 :: 		ltrim(MonthText);
	ADD	W14, #4, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,167 :: 		ltrim(YilText);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,169 :: 		DateFullText :=('2-->'+DayText+'.' + MonthText + '.20' + YilText);
	ADD	W14, #28, W0
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#62, W2
	MOV.B	W2, [W0++]
	ADD	W14, #8, W1
	CALL	___CS2S
	MOV.B	#46, W2
	MOV.B	W2, [W0++]
	MOV	[W14+46], W2
	MOV	W2, W1
	CALL	___CS2S
	MOV.B	#46, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV	[W14+44], W2
	MOV	W2, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #12, W0
	ADD	W14, #28, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;Battery_Meintenance.mpas,170 :: 		Glcd_Write_Text(DateFullText,10,3,Black);
	ADD	W14, #12, W0
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#10, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,172 :: 		Pause_Ms(500);
	MOV	#500, W10
	CALL	_Pause_Ms
;Battery_Meintenance.mpas,175 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,177 :: 		end;
L__DateCalculator16:
;Battery_Meintenance.mpas,179 :: 		if (BakimSelect = 3) then
	MOV	#lo_addr(_BakimSelect), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__DateCalculator382
	GOTO	L__DateCalculator30
L__DateCalculator382:
;Battery_Meintenance.mpas,181 :: 		TempAy := FarkAy + Month_2;
	MOV	#lo_addr(_Month_2), W0
	SE	[W0], W1
	MOV	#lo_addr(_FarkAy), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	W1, [W0]
;Battery_Meintenance.mpas,183 :: 		if (TempAy > 12) then
	CP.B	W1, #12
	BRA GTU	L__DateCalculator383
	GOTO	L__DateCalculator33
L__DateCalculator383:
;Battery_Meintenance.mpas,185 :: 		TempAy   := TempAy - 12;
	MOV.B	#12, W1
	MOV	#lo_addr(_TempAy), W0
	SUBR.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,186 :: 		Year_3   := Year_2 + 1;
	MOV	#lo_addr(_Year_2), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_Year_3), W0
	ADD.B	W1, #1, [W0]
;Battery_Meintenance.mpas,187 :: 		Month_3  := TempAy;
	MOV	#lo_addr(_Month_3), W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,188 :: 		end else
	GOTO	L__DateCalculator34
L__DateCalculator33:
;Battery_Meintenance.mpas,190 :: 		Month_3 := TempAy;
	MOV	#lo_addr(_Month_3), W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,191 :: 		Year_3  := Year_2;
	MOV	#lo_addr(_Year_3), W1
	MOV	#lo_addr(_Year_2), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,192 :: 		end;
L__DateCalculator34:
;Battery_Meintenance.mpas,194 :: 		Service3_Date := 100 * Month_3;
	MOV	#100, W1
	MOV	#lo_addr(_Month_3), W0
	SE	[W0], W0
	MUL.SS	W1, W0, W2
	MOV	W2, _Service3_Date
;Battery_Meintenance.mpas,195 :: 		Service3_Date := Service3_Date + Year_3;
	MOV	#lo_addr(_Year_3), W0
	ZE	[W0], W0
	ADD	W2, W0, W0
	MOV	W0, _Service3_Date
;Battery_Meintenance.mpas,197 :: 		EEPROM_Write(EE_Service3EeAddr, Service3_Date);
	MOV	W0, W12
	MOV	#_EE_Service3EeAddr, W10
	MOV	#_EE_Service3EeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,199 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__DateCalculator36:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__DateCalculator384
	GOTO	L__DateCalculator36
L__DateCalculator384:
;Battery_Meintenance.mpas,201 :: 		if (ServiceCycle > 3) then
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA GTU	L__DateCalculator385
	GOTO	L__DateCalculator41
L__DateCalculator385:
;Battery_Meintenance.mpas,202 :: 		BakimSelect := 4 else BakimSelect := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
	GOTO	L__DateCalculator42
L__DateCalculator41:
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__DateCalculator42:
;Battery_Meintenance.mpas,204 :: 		ByteToStr(Month_3,MonthText);
	ADD	W14, #4, W1
	MOV	W1, [W14+46]
	MOV	#lo_addr(_Month_3), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,205 :: 		ByteToStr(Year_3,YilText);
	ADD	W14, #0, W1
	MOV	W1, [W14+44]
	MOV	#lo_addr(_Year_3), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,206 :: 		ltrim(MonthText);
	ADD	W14, #4, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,207 :: 		ltrim(YilText);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,209 :: 		DateFullText :=('3-->'+DayText+'.' + MonthText + '.20' + YilText);
	ADD	W14, #28, W0
	MOV.B	#51, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#62, W2
	MOV.B	W2, [W0++]
	ADD	W14, #8, W1
	CALL	___CS2S
	MOV.B	#46, W2
	MOV.B	W2, [W0++]
	MOV	[W14+46], W2
	MOV	W2, W1
	CALL	___CS2S
	MOV.B	#46, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV	[W14+44], W2
	MOV	W2, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #12, W0
	ADD	W14, #28, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;Battery_Meintenance.mpas,210 :: 		Glcd_Write_Text(DateFullText,10,4,Black);
	ADD	W14, #12, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#10, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,212 :: 		Pause_Ms(500);
	MOV	#500, W10
	CALL	_Pause_Ms
;Battery_Meintenance.mpas,215 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,217 :: 		end;
L__DateCalculator30:
;Battery_Meintenance.mpas,219 :: 		if (BakimSelect = 4) then
	MOV	#lo_addr(_BakimSelect), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__DateCalculator386
	GOTO	L__DateCalculator44
L__DateCalculator386:
;Battery_Meintenance.mpas,221 :: 		TempAy := FarkAy + Month_3;
	MOV	#lo_addr(_Month_3), W0
	SE	[W0], W1
	MOV	#lo_addr(_FarkAy), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	W1, [W0]
;Battery_Meintenance.mpas,223 :: 		if (TempAy > 12) then
	CP.B	W1, #12
	BRA GTU	L__DateCalculator387
	GOTO	L__DateCalculator47
L__DateCalculator387:
;Battery_Meintenance.mpas,225 :: 		TempAy   := TempAy - 12;
	MOV.B	#12, W1
	MOV	#lo_addr(_TempAy), W0
	SUBR.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,226 :: 		Year_4   := Year_3 + 1;
	MOV	#lo_addr(_Year_3), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_Year_4), W0
	ADD.B	W1, #1, [W0]
;Battery_Meintenance.mpas,227 :: 		Month_4  := TempAy;
	MOV	#lo_addr(_Month_4), W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,228 :: 		end else
	GOTO	L__DateCalculator48
L__DateCalculator47:
;Battery_Meintenance.mpas,230 :: 		Month_4 := TempAy;
	MOV	#lo_addr(_Month_4), W1
	MOV	#lo_addr(_TempAy), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,231 :: 		Year_4  := Year_3;
	MOV	#lo_addr(_Year_4), W1
	MOV	#lo_addr(_Year_3), W0
	MOV.B	[W0], [W1]
;Battery_Meintenance.mpas,232 :: 		end;
L__DateCalculator48:
;Battery_Meintenance.mpas,234 :: 		Service4_Date := 100 * Month_4;
	MOV	#100, W1
	MOV	#lo_addr(_Month_4), W0
	SE	[W0], W0
	MUL.SS	W1, W0, W2
	MOV	W2, _Service4_Date
;Battery_Meintenance.mpas,235 :: 		Service4_Date := Service4_Date + Year_4;
	MOV	#lo_addr(_Year_4), W0
	ZE	[W0], W0
	ADD	W2, W0, W0
	MOV	W0, _Service4_Date
;Battery_Meintenance.mpas,237 :: 		EEPROM_Write(EE_Service4EeAddr, Service4_Date);
	MOV	W0, W12
	MOV	#_EE_Service4EeAddr, W10
	MOV	#_EE_Service4EeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,238 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__DateCalculator50:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__DateCalculator388
	GOTO	L__DateCalculator50
L__DateCalculator388:
;Battery_Meintenance.mpas,240 :: 		BakimSelect := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,242 :: 		ByteToStr(Month_4,MonthText);
	ADD	W14, #4, W1
	MOV	W1, [W14+46]
	MOV	#lo_addr(_Month_4), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,243 :: 		ByteToStr(Year_4,YilText);
	ADD	W14, #0, W1
	MOV	W1, [W14+44]
	MOV	#lo_addr(_Year_4), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,244 :: 		ltrim(MonthText);
	ADD	W14, #4, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,245 :: 		ltrim(YilText);
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_ltrim
;Battery_Meintenance.mpas,247 :: 		DateFullText :=('4-->'+DayText+'.' + MonthText + '.20' + YilText);
	ADD	W14, #28, W0
	MOV.B	#52, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#62, W2
	MOV.B	W2, [W0++]
	ADD	W14, #8, W1
	CALL	___CS2S
	MOV.B	#46, W2
	MOV.B	W2, [W0++]
	MOV	[W14+46], W2
	MOV	W2, W1
	CALL	___CS2S
	MOV.B	#46, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV	[W14+44], W2
	MOV	W2, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #12, W0
	ADD	W14, #28, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;Battery_Meintenance.mpas,248 :: 		Glcd_Write_Text(DateFullText,10,5,Black);
	ADD	W14, #12, W0
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#10, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,250 :: 		Pause_Ms(500);
	MOV	#500, W10
	CALL	_Pause_Ms
;Battery_Meintenance.mpas,253 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,255 :: 		end;
L__DateCalculator44:
;Battery_Meintenance.mpas,259 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DateCalculator55
;Battery_Meintenance.mpas,261 :: 		while (Ok_Button =0) do
L__DateCalculator58:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DateCalculator59
;Battery_Meintenance.mpas,264 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,266 :: 		end;
	GOTO	L__DateCalculator58
L__DateCalculator59:
;Battery_Meintenance.mpas,268 :: 		end;
L__DateCalculator55:
;Battery_Meintenance.mpas,272 :: 		Pause_Ms(1000);
	MOV	#1000, W10
	CALL	_Pause_Ms
;Battery_Meintenance.mpas,274 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,277 :: 		Pause_Ms(1000);
	MOV	#1000, W10
	CALL	_Pause_Ms
;Battery_Meintenance.mpas,279 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,282 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;Battery_Meintenance.mpas,284 :: 		end;
L_end_DateCalculator:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _DateCalculator

_AkuTestBakim:
	LNK	#28

;Battery_Meintenance.mpas,292 :: 		begin
;Battery_Meintenance.mpas,294 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;Battery_Meintenance.mpas,297 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,300 :: 		MenuExit := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,301 :: 		Chng1         := 0;
	MOV	#lo_addr(_Chng1), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,302 :: 		Chng2         := 0;
	MOV	#lo_addr(_Chng2), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,303 :: 		Chng3         := 0;
	MOV	#lo_addr(_Chng3), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,304 :: 		Chng4         := 0;
	MOV	#lo_addr(_Chng4), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,305 :: 		Chng5         := 0;
	MOV	#lo_addr(_Chng5), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,306 :: 		Chng6         := 0;
	MOV	#lo_addr(_Chng6), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,307 :: 		BakimMenuSayac:= 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
;Battery_Meintenance.mpas,309 :: 		bytetext      := '   ';
	ADD	W14, #4, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;Battery_Meintenance.mpas,310 :: 		HourText      := '  ';
	ADD	W14, #8, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;Battery_Meintenance.mpas,311 :: 		MinText       := '  ';
	ADD	W14, #11, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;Battery_Meintenance.mpas,313 :: 		Glcd_Set_Font(@NewFont5x7,5,7,32);
	MOV	#lo_addr(_NewFont5x7), W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	W1, W10
	MOV	W0, W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;Battery_Meintenance.mpas,315 :: 		NomHucreGerilim     := EEPROM_Read(EE_NomHucreGerilimEeAddr);
	MOV	#_EE_NomHucreGerilimEeAddr, W10
	MOV	#_EE_NomHucreGerilimEeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	W0, _NomHucreGerilim
;Battery_Meintenance.mpas,316 :: 		HucreSayisi         := EEPROM_Read(EE_HucreSayisiEeAddr);
	MOV	#_EE_HucreSayisiEeAddr, W10
	MOV	#_EE_HucreSayisiEeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	W0, _HucreSayisi
;Battery_Meintenance.mpas,318 :: 		NominalGerilim := (NomHucreGerilim * HucreSayisi) div 10;
	MOV	#lo_addr(_NomHucreGerilim), W1
	MUL.UU	W0, [W1], W4
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W4, W2
	MOV	W0, [W14+2]
;Battery_Meintenance.mpas,320 :: 		ServiceCycle     := EEPROM_Read(EE_ServiceCycleEeAddr);
	MOV	#_EE_ServiceCycleEeAddr, W10
	MOV	#_EE_ServiceCycleEeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ServiceCycle), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,321 :: 		QuitVolt         := EEPROM_Read(EE_QuitVoltEeAddr);
	MOV	#_EE_QuitVoltEeAddr, W10
	MOV	#_EE_QuitVoltEeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	W0, _QuitVolt
;Battery_Meintenance.mpas,322 :: 		QuitTime         := EEPROM_Read(EE_QuitTimeEeAddr);
	MOV	#_EE_QuitTimeEeAddr, W10
	MOV	#_EE_QuitTimeEeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_QuitTime), W1
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,324 :: 		Bakim_Start_Time := EEPROM_Read(EE_BkmStartTimeEeAddr);
	MOV	#_EE_BkmStartTimeEeAddr, W10
	MOV	#_EE_BkmStartTimeEeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	W0, _Bakim_Start_Time
;Battery_Meintenance.mpas,325 :: 		Bkm_Status       := EEPROM_Read(EE_BkmStatusEeAddr);
	MOV	#_EE_BkmStatusEeAddr, W10
	MOV	#_EE_BkmStatusEeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Bkm_Status), W1
	BSET	[W1], BitPos(_Bkm_Status+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Bkm_Status+0)
;Battery_Meintenance.mpas,327 :: 		Glcd_Write_Text(Title_BattServMenu,    0, 0, Black);
	MOV.B	#_Black, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_BattServMenu), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,328 :: 		Glcd_Write_Text(Subtitle_Loop,         6, 1, Black);
	MOV.B	#_Black, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_Loop), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,329 :: 		Glcd_Write_Text(Subtitle_MaintOut,     6, 2, Black);
	MOV.B	#_Black, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_MaintOut), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,330 :: 		Glcd_Write_Text(Subtitle_OutTime,      6, 3, Black);
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_OutTime), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,332 :: 		Glcd_Write_Text(Subtitle_MaintTime,    6, 4, Black);
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_MaintTime), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,333 :: 		Glcd_Write_Text(Subtitle_Status,       6, 5, Black);
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_Status), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,334 :: 		Glcd_Write_Text(SubTitle_Back,         6, 6, Black);
	MOV.B	#_Black, W13
	MOV.B	#6, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,335 :: 		Glcd_Write_Text(app_year,             92, 1, Black);
	MOV.B	#_Black, W13
	MOV.B	#1, W12
	MOV.B	#92, W11
	MOV	#lo_addr(_App_Year), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,336 :: 		Glcd_Write_Text(App_Hour,            104, 3, Black);
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#104, W11
	MOV	#lo_addr(_App_Hour), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,338 :: 		Bkm_Min   := Bakim_Start_Time mod 100;
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, [W14+26]
	MOV	#lo_addr(_Bkm_Min), W0
	MOV.B	W1, [W0]
;Battery_Meintenance.mpas,339 :: 		Bkm_Hour  := Bakim_Start_Time div 100;
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	W1, [W14+22]
	MOV	#lo_addr(_Bkm_Hour), W0
	MOV.B	W1, [W0]
;Battery_Meintenance.mpas,342 :: 		HourText[1]  := (Bkm_Hour div 10)+48;
	SE	W1, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #8, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,343 :: 		HourText[2]  := (Bkm_Hour mod 10)+48;
	MOV	[W14+22], W0
	SE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #9, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,344 :: 		MinText[1]   := (Bkm_Min div 10)+48;
	MOV	[W14+26], W0
	SE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #11, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,345 :: 		MinText[2]   := (Bkm_Min mod 10)+48;
	MOV	[W14+26], W0
	SE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #12, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,347 :: 		Glcd_Write_Text(HourText, 92,4,Black);
	ADD	W14, #8, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#92, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,348 :: 		Glcd_Write_Text(':',104,4,black);
	ADD	W14, #14, W1
	MOV.B	#58, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #14, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#104, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,349 :: 		Glcd_Write_Text(MinText, 109,4,Black);
	ADD	W14, #11, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#109, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,351 :: 		ValueDivide(QuitVolt, 255);
	MOV.B	#255, W11
	MOV	_QuitVolt, W10
	CALL	_ValueDivide
;Battery_Meintenance.mpas,352 :: 		Glcd_Write_Text(Value_Text,86,2,Black);
	MOV.B	#_Black, W13
	MOV.B	#2, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,353 :: 		Glcd_Write_Char('V',116,2,Black);
	MOV.B	#_Black, W13
	MOV.B	#2, W12
	MOV.B	#116, W11
	MOV.B	#86, W10
	CALL	_Glcd_Write_Char
;Battery_Meintenance.mpas,355 :: 		ByteToStr(QuitTime,bytetext);
	ADD	W14, #4, W1
	MOV	#lo_addr(_QuitTime), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,356 :: 		Glcd_Write_Text(ByteText,86,3,Black);
	ADD	W14, #4, W0
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#86, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,366 :: 		if (Bkm_Status = 0) then
	MOV	#lo_addr(_Bkm_Status), W0
	BTSC	[W0], BitPos(_Bkm_Status+0)
	GOTO	L__AkuTestBakim64
;Battery_Meintenance.mpas,367 :: 		Glcd_Write_Text(DisableText,86,5,Black) else
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__AkuTestBakim65
L__AkuTestBakim64:
;Battery_Meintenance.mpas,368 :: 		if (Bkm_Status = 1) then
	MOV	#lo_addr(_Bkm_Status), W0
	BTSS	[W0], BitPos(_Bkm_Status+0)
	GOTO	L__AkuTestBakim67
;Battery_Meintenance.mpas,369 :: 		Glcd_Write_Text(EnableText,86,5,Black);
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
L__AkuTestBakim67:
L__AkuTestBakim65:
;Battery_Meintenance.mpas,372 :: 		While (MenuExit = 0) do
L__AkuTestBakim70:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__AkuTestBakim390
	GOTO	L__AkuTestBakim71
L__AkuTestBakim390:
;Battery_Meintenance.mpas,376 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,379 :: 		if (Down_Button =0) then
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__AkuTestBakim75
;Battery_Meintenance.mpas,381 :: 		while (Down_Button =0) do
L__AkuTestBakim78:
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__AkuTestBakim79
;Battery_Meintenance.mpas,384 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,386 :: 		end;
	GOTO	L__AkuTestBakim78
L__AkuTestBakim79:
;Battery_Meintenance.mpas,387 :: 		Glcd_Write_Char(' ', 0, BakimMenuSayac, Black);
	MOV.B	#_Black, W13
	MOV.B	[W14+0], W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;Battery_Meintenance.mpas,388 :: 		Inc(BakimMenuSayac);
	ADD	W14, #0, W0
	ZE	[W0], W0
	INC	W0
	MOV.B	W0, [W14+0]
;Battery_Meintenance.mpas,389 :: 		if (BakimMenuSayac > 6) then BakimMenuSayac := 1;
	CP.B	W0, #6
	BRA GTU	L__AkuTestBakim391
	GOTO	L__AkuTestBakim83
L__AkuTestBakim391:
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
L__AkuTestBakim83:
;Battery_Meintenance.mpas,390 :: 		end else
	GOTO	L__AkuTestBakim76
L__AkuTestBakim75:
;Battery_Meintenance.mpas,391 :: 		if (Up_Button =0) then
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__AkuTestBakim86
;Battery_Meintenance.mpas,393 :: 		while (Up_Button =0) do
L__AkuTestBakim89:
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__AkuTestBakim90
;Battery_Meintenance.mpas,396 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,398 :: 		end;
	GOTO	L__AkuTestBakim89
L__AkuTestBakim90:
;Battery_Meintenance.mpas,399 :: 		Glcd_Write_Char(' ', 0, BakimMenuSayac, Black);
	MOV.B	#_Black, W13
	MOV.B	[W14+0], W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;Battery_Meintenance.mpas,400 :: 		Dec(BakimMenuSayac);
	ADD	W14, #0, W0
	ZE	[W0], W0
	DEC	W0
	MOV.B	W0, [W14+0]
;Battery_Meintenance.mpas,401 :: 		if (BakimMenuSayac < 1) then BakimMenuSayac := 6;
	CP.B	W0, #1
	BRA LTU	L__AkuTestBakim392
	GOTO	L__AkuTestBakim94
L__AkuTestBakim392:
	MOV.B	#6, W0
	MOV.B	W0, [W14+0]
L__AkuTestBakim94:
;Battery_Meintenance.mpas,402 :: 		end;
L__AkuTestBakim86:
L__AkuTestBakim76:
;Battery_Meintenance.mpas,404 :: 		Glcd_Write_Char('>', 0, BakimMenuSayac, Black);
	MOV.B	#_Black, W13
	MOV.B	[W14+0], W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;Battery_Meintenance.mpas,406 :: 		Glcd_Set_Font(@NewFont5x7,5,7,32);
	MOV	#lo_addr(_NewFont5x7), W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	W1, W10
	MOV	W0, W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;Battery_Meintenance.mpas,409 :: 		1: begin  // bakým döngüsü
	MOV.B	[W14+0], W0
	CP.B	W0, #1
	BRA Z	L__AkuTestBakim393
	GOTO	L__AkuTestBakim99
L__AkuTestBakim393:
;Battery_Meintenance.mpas,411 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,413 :: 		ByteToStr(ServiceCycle, CycleText);
	MOV	#lo_addr(_ServiceCycle), W0
	MOV	#lo_addr(_CycleText), W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,414 :: 		ltrim(CycleText);
	MOV	#lo_addr(_CycleText), W10
	CALL	_ltrim
;Battery_Meintenance.mpas,415 :: 		Glcd_Write_Text(CycleText,86,1,Black);
	MOV.B	#_Black, W13
	MOV.B	#1, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_CycleText), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,417 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim101
;Battery_Meintenance.mpas,419 :: 		while (Ok_Button =0) do
L__AkuTestBakim104:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim105
;Battery_Meintenance.mpas,422 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,424 :: 		end;
	GOTO	L__AkuTestBakim104
L__AkuTestBakim105:
;Battery_Meintenance.mpas,426 :: 		Chng1 := 1;
	MOV	#lo_addr(_Chng1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,427 :: 		While (Chng1 = 1) do
L__AkuTestBakim109:
	MOV	#lo_addr(_Chng1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AkuTestBakim394
	GOTO	L__AkuTestBakim110
L__AkuTestBakim394:
;Battery_Meintenance.mpas,430 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,433 :: 		if (Up_Button =0) then
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__AkuTestBakim114
;Battery_Meintenance.mpas,435 :: 		while (Up_Button =0) do
L__AkuTestBakim117:
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__AkuTestBakim118
;Battery_Meintenance.mpas,438 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,440 :: 		end;
	GOTO	L__AkuTestBakim117
L__AkuTestBakim118:
;Battery_Meintenance.mpas,441 :: 		Inc(ServiceCycle);
	MOV.B	#1, W1
	MOV	#lo_addr(_ServiceCycle), W0
	ADD.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,442 :: 		if (ServiceCycle > 4) then ServiceCycle := 4;
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA GTU	L__AkuTestBakim395
	GOTO	L__AkuTestBakim122
L__AkuTestBakim395:
	MOV	#lo_addr(_ServiceCycle), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
L__AkuTestBakim122:
;Battery_Meintenance.mpas,443 :: 		end else
	GOTO	L__AkuTestBakim115
L__AkuTestBakim114:
;Battery_Meintenance.mpas,444 :: 		if (Down_Button =0) then
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__AkuTestBakim125
;Battery_Meintenance.mpas,446 :: 		while (Down_Button =0) do
L__AkuTestBakim128:
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__AkuTestBakim129
;Battery_Meintenance.mpas,449 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,451 :: 		end;
	GOTO	L__AkuTestBakim128
L__AkuTestBakim129:
;Battery_Meintenance.mpas,452 :: 		Dec(ServiceCycle);
	MOV.B	#1, W1
	MOV	#lo_addr(_ServiceCycle), W0
	SUBR.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,453 :: 		if (ServiceCycle < 1) then ServiceCycle := 1;
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LTU	L__AkuTestBakim396
	GOTO	L__AkuTestBakim133
L__AkuTestBakim396:
	MOV	#lo_addr(_ServiceCycle), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__AkuTestBakim133:
;Battery_Meintenance.mpas,454 :: 		end;
L__AkuTestBakim125:
L__AkuTestBakim115:
;Battery_Meintenance.mpas,456 :: 		ByteToStr(ServiceCycle, CycleText);
	MOV	#lo_addr(_ServiceCycle), W0
	MOV	#lo_addr(_CycleText), W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,457 :: 		ltrim(CycleText);
	MOV	#lo_addr(_CycleText), W10
	CALL	_ltrim
;Battery_Meintenance.mpas,458 :: 		Glcd_Write_Text(CycleText,86,1,0);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_CycleText), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,459 :: 		Glcd_Write_Text(App_Year,92,1,0);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#92, W11
	MOV	#lo_addr(_App_Year), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,461 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim136
;Battery_Meintenance.mpas,463 :: 		while (Ok_Button =0) do
L__AkuTestBakim139:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim140
;Battery_Meintenance.mpas,466 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,468 :: 		end;
	GOTO	L__AkuTestBakim139
L__AkuTestBakim140:
;Battery_Meintenance.mpas,470 :: 		Chng1 := 0;
	MOV	#lo_addr(_Chng1), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,471 :: 		EEPROM_Write(EE_ServiceCycleEeAddr, ServiceCycle);
	MOV	#lo_addr(_ServiceCycle), W0
	ZE	[W0], W12
	MOV	#_EE_ServiceCycleEeAddr, W10
	MOV	#_EE_ServiceCycleEeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,472 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__AkuTestBakim144:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__AkuTestBakim397
	GOTO	L__AkuTestBakim144
L__AkuTestBakim397:
;Battery_Meintenance.mpas,474 :: 		BakimSelect := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,476 :: 		DateCalculator();
	CALL	_DateCalculator
;Battery_Meintenance.mpas,478 :: 		Glcd_Write_Text(Title_BattServMenu,    0, 0, Black);
	MOV.B	#_Black, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_BattServMenu), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,479 :: 		Glcd_Write_Text(Subtitle_Loop,         6, 1, Black);
	MOV.B	#_Black, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_Loop), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,480 :: 		Glcd_Write_Text(Subtitle_MaintOut,     6, 2, Black);
	MOV.B	#_Black, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_MaintOut), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,481 :: 		Glcd_Write_Text(Subtitle_OutTime,      6, 3, Black);
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_OutTime), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,483 :: 		Glcd_Write_Text(Subtitle_MaintTime,    6, 4, Black);
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_MaintTime), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,484 :: 		Glcd_Write_Text(Subtitle_Status,       6, 5, Black);
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_Status), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,485 :: 		Glcd_Write_Text(SubTitle_Back,         6, 6, Black);
	MOV.B	#_Black, W13
	MOV.B	#6, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,486 :: 		Glcd_Write_Text(app_year,             92, 1, Black);
	MOV.B	#_Black, W13
	MOV.B	#1, W12
	MOV.B	#92, W11
	MOV	#lo_addr(_App_Year), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,487 :: 		Glcd_Write_Text(App_Hour,            104, 3, Black);
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#104, W11
	MOV	#lo_addr(_App_Hour), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,489 :: 		ByteToStr(QuitTime,bytetext);
	ADD	W14, #4, W1
	MOV	#lo_addr(_QuitTime), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,490 :: 		Glcd_Write_Text(bytetext,86,3,Black);
	ADD	W14, #4, W0
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#86, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,492 :: 		Glcd_Write_Text(HourText, 92,4,Black);
	ADD	W14, #8, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#92, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,493 :: 		Glcd_Write_Text(':',104,5,black);
	ADD	W14, #14, W1
	MOV.B	#58, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #14, W0
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#104, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,494 :: 		Glcd_Write_Text(MinText, 109,4,Black);
	ADD	W14, #11, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#109, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,496 :: 		ValueDivide(QuitVolt, 255);
	MOV.B	#255, W11
	MOV	_QuitVolt, W10
	CALL	_ValueDivide
;Battery_Meintenance.mpas,497 :: 		Glcd_Write_Text(Value_Text,86,2,Black);
	MOV.B	#_Black, W13
	MOV.B	#2, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,499 :: 		if (Bkm_Status = 0) then
	MOV	#lo_addr(_Bkm_Status), W0
	BTSC	[W0], BitPos(_Bkm_Status+0)
	GOTO	L__AkuTestBakim149
;Battery_Meintenance.mpas,500 :: 		Glcd_Write_Text(DisableText,86,5,Black) else
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__AkuTestBakim150
L__AkuTestBakim149:
;Battery_Meintenance.mpas,501 :: 		if (Bkm_Status = 1) then
	MOV	#lo_addr(_Bkm_Status), W0
	BTSS	[W0], BitPos(_Bkm_Status+0)
	GOTO	L__AkuTestBakim152
;Battery_Meintenance.mpas,502 :: 		Glcd_Write_Text(EnableText,86,5,Black);
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
L__AkuTestBakim152:
L__AkuTestBakim150:
;Battery_Meintenance.mpas,514 :: 		end;
L__AkuTestBakim136:
;Battery_Meintenance.mpas,515 :: 		end;
	GOTO	L__AkuTestBakim109
L__AkuTestBakim110:
;Battery_Meintenance.mpas,516 :: 		end;
L__AkuTestBakim101:
;Battery_Meintenance.mpas,517 :: 		end;
	GOTO	L__AkuTestBakim96
L__AkuTestBakim99:
;Battery_Meintenance.mpas,519 :: 		2: begin  // bakým çýkýþ gerilimi
	MOV.B	[W14+0], W0
	CP.B	W0, #2
	BRA Z	L__AkuTestBakim398
	GOTO	L__AkuTestBakim156
L__AkuTestBakim398:
;Battery_Meintenance.mpas,521 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,523 :: 		ValueDivide(QuitVolt, 255);
	MOV.B	#255, W11
	MOV	_QuitVolt, W10
	CALL	_ValueDivide
;Battery_Meintenance.mpas,524 :: 		Glcd_Write_Text(Value_Text,86,2,Black);
	MOV.B	#_Black, W13
	MOV.B	#2, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,525 :: 		Glcd_Write_Char('V',116,2,Black);
	MOV.B	#_Black, W13
	MOV.B	#2, W12
	MOV.B	#116, W11
	MOV.B	#86, W10
	CALL	_Glcd_Write_Char
;Battery_Meintenance.mpas,527 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim158
;Battery_Meintenance.mpas,529 :: 		while (Ok_Button =0) do
L__AkuTestBakim161:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim162
;Battery_Meintenance.mpas,532 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,534 :: 		end;
	GOTO	L__AkuTestBakim161
L__AkuTestBakim162:
;Battery_Meintenance.mpas,536 :: 		Chng2 := 1;
	MOV	#lo_addr(_Chng2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,537 :: 		While (Chng2 = 1) do
L__AkuTestBakim166:
	MOV	#lo_addr(_Chng2), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AkuTestBakim399
	GOTO	L__AkuTestBakim167
L__AkuTestBakim399:
;Battery_Meintenance.mpas,540 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,543 :: 		if (Up_Button =0) then
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__AkuTestBakim171
;Battery_Meintenance.mpas,546 :: 		ClrWDT;
	CLRWDT
;Battery_Meintenance.mpas,549 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;Battery_Meintenance.mpas,550 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;Battery_Meintenance.mpas,551 :: 		while (ButonStop = 0) do
L__AkuTestBakim174:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AkuTestBakim175
;Battery_Meintenance.mpas,553 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,554 :: 		end;
	GOTO	L__AkuTestBakim174
L__AkuTestBakim175:
;Battery_Meintenance.mpas,555 :: 		Inc(QuitVolt);
	MOV	#1, W1
	MOV	#lo_addr(_QuitVolt), W0
	ADD	W1, [W0], [W0]
;Battery_Meintenance.mpas,556 :: 		if (QuitVolt > NominalGerilim) then QuitVolt := NominalGerilim;
	MOV	_QuitVolt, W1
	ADD	W14, #2, W0
	CP	W1, [W0]
	BRA GTU	L__AkuTestBakim400
	GOTO	L__AkuTestBakim179
L__AkuTestBakim400:
	MOV	[W14+2], W0
	MOV	W0, _QuitVolt
L__AkuTestBakim179:
;Battery_Meintenance.mpas,558 :: 		end else
	GOTO	L__AkuTestBakim172
L__AkuTestBakim171:
;Battery_Meintenance.mpas,559 :: 		if (Down_Button =0) then
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__AkuTestBakim182
;Battery_Meintenance.mpas,562 :: 		ClrWDT;
	CLRWDT
;Battery_Meintenance.mpas,565 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;Battery_Meintenance.mpas,566 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;Battery_Meintenance.mpas,567 :: 		while (ButonStop = 0) do
L__AkuTestBakim185:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AkuTestBakim186
;Battery_Meintenance.mpas,569 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,570 :: 		end;
	GOTO	L__AkuTestBakim185
L__AkuTestBakim186:
;Battery_Meintenance.mpas,571 :: 		Dec(QuitVolt);
	MOV	#1, W1
	MOV	#lo_addr(_QuitVolt), W0
	SUBR	W1, [W0], [W0]
;Battery_Meintenance.mpas,572 :: 		if (QuitVolt < (NominalGerilim*0.761)) then QuitVolt := (NominalGerilim*0.761);
	MOV	[W14+2], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#53477, W2
	MOV	#16194, W3
	CALL	__Mul_FP
	MOV	W0, [W14+22]
	MOV	W1, [W14+24]
	MOV	_QuitVolt, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+22], W2
	MOV	[W14+24], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR	W0
	BRA GE	L__AkuTestBakim401
	COM	W0
L__AkuTestBakim401:
	CP0	W0
	BRA NZ	L__AkuTestBakim402
	GOTO	L__AkuTestBakim190
L__AkuTestBakim402:
	MOV	[W14+2], W0
	CLR	W1
	CALL	__Long2Float
	MOV	#53477, W2
	MOV	#16194, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _QuitVolt
L__AkuTestBakim190:
;Battery_Meintenance.mpas,573 :: 		end;
L__AkuTestBakim182:
L__AkuTestBakim172:
;Battery_Meintenance.mpas,575 :: 		ValueDivide(QuitVolt, 255);
	MOV.B	#255, W11
	MOV	_QuitVolt, W10
	CALL	_ValueDivide
;Battery_Meintenance.mpas,576 :: 		Glcd_Write_Text(Value_Text,86,2,0);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,577 :: 		Glcd_Write_Char('V',116,2,0);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#116, W11
	MOV.B	#86, W10
	CALL	_Glcd_Write_Char
;Battery_Meintenance.mpas,580 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim193
;Battery_Meintenance.mpas,582 :: 		while (Ok_Button =0) do
L__AkuTestBakim196:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim197
;Battery_Meintenance.mpas,585 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,587 :: 		end;
	GOTO	L__AkuTestBakim196
L__AkuTestBakim197:
;Battery_Meintenance.mpas,589 :: 		Chng2 := 0;
	MOV	#lo_addr(_Chng2), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,590 :: 		EEPROM_Write(EE_QuitVoltEeAddr, QuitVolt);
	MOV	_QuitVolt, W12
	MOV	#_EE_QuitVoltEeAddr, W10
	MOV	#_EE_QuitVoltEeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,591 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__AkuTestBakim201:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__AkuTestBakim403
	GOTO	L__AkuTestBakim201
L__AkuTestBakim403:
;Battery_Meintenance.mpas,594 :: 		end;
L__AkuTestBakim193:
;Battery_Meintenance.mpas,595 :: 		end;
	GOTO	L__AkuTestBakim166
L__AkuTestBakim167:
;Battery_Meintenance.mpas,596 :: 		end;
L__AkuTestBakim158:
;Battery_Meintenance.mpas,601 :: 		end;
	GOTO	L__AkuTestBakim96
L__AkuTestBakim156:
;Battery_Meintenance.mpas,603 :: 		3: begin // bakým çýkýþ saati
	MOV.B	[W14+0], W0
	CP.B	W0, #3
	BRA Z	L__AkuTestBakim404
	GOTO	L__AkuTestBakim207
L__AkuTestBakim404:
;Battery_Meintenance.mpas,605 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,607 :: 		Glcd_Write_Text(App_Hour,104,3,Black);
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#104, W11
	MOV	#lo_addr(_App_Hour), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,608 :: 		ByteToStr(QuitTime,bytetext);
	ADD	W14, #4, W1
	MOV	#lo_addr(_QuitTime), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,609 :: 		Glcd_Write_Text(bytetext,86,3,Black);
	ADD	W14, #4, W0
	MOV.B	#_Black, W13
	MOV.B	#3, W12
	MOV.B	#86, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,611 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim209
;Battery_Meintenance.mpas,614 :: 		while (Ok_Button =0) do
L__AkuTestBakim212:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim213
;Battery_Meintenance.mpas,617 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,619 :: 		end;
	GOTO	L__AkuTestBakim212
L__AkuTestBakim213:
;Battery_Meintenance.mpas,621 :: 		Chng3 := 1;
	MOV	#lo_addr(_Chng3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,622 :: 		While (Chng3 = 1) do
L__AkuTestBakim217:
	MOV	#lo_addr(_Chng3), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AkuTestBakim405
	GOTO	L__AkuTestBakim218
L__AkuTestBakim405:
;Battery_Meintenance.mpas,625 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,628 :: 		if (Up_Button =0) then
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__AkuTestBakim222
;Battery_Meintenance.mpas,631 :: 		ClrWDT;
	CLRWDT
;Battery_Meintenance.mpas,634 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;Battery_Meintenance.mpas,635 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;Battery_Meintenance.mpas,636 :: 		while (ButonStop = 0) do
L__AkuTestBakim225:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AkuTestBakim226
;Battery_Meintenance.mpas,638 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,639 :: 		end;
	GOTO	L__AkuTestBakim225
L__AkuTestBakim226:
;Battery_Meintenance.mpas,640 :: 		Inc(QuitTime);
	MOV.B	#1, W1
	MOV	#lo_addr(_QuitTime), W0
	ADD.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,641 :: 		if (QuitTime > 24) then QuitTime := 24;
	MOV	#lo_addr(_QuitTime), W0
	MOV.B	[W0], W0
	CP.B	W0, #24
	BRA GTU	L__AkuTestBakim406
	GOTO	L__AkuTestBakim230
L__AkuTestBakim406:
	MOV	#lo_addr(_QuitTime), W1
	MOV.B	#24, W0
	MOV.B	W0, [W1]
L__AkuTestBakim230:
;Battery_Meintenance.mpas,643 :: 		end else
	GOTO	L__AkuTestBakim223
L__AkuTestBakim222:
;Battery_Meintenance.mpas,644 :: 		if (Down_Button =0) then
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__AkuTestBakim233
;Battery_Meintenance.mpas,647 :: 		ClrWDT;
	CLRWDT
;Battery_Meintenance.mpas,650 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;Battery_Meintenance.mpas,651 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;Battery_Meintenance.mpas,652 :: 		while (ButonStop = 0) do
L__AkuTestBakim236:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AkuTestBakim237
;Battery_Meintenance.mpas,654 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,655 :: 		end;
	GOTO	L__AkuTestBakim236
L__AkuTestBakim237:
;Battery_Meintenance.mpas,656 :: 		Dec(QuitTime);
	MOV.B	#1, W1
	MOV	#lo_addr(_QuitTime), W0
	SUBR.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,657 :: 		if (QuitTime < 1) then QuitTime := 1;
	MOV	#lo_addr(_QuitTime), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LTU	L__AkuTestBakim407
	GOTO	L__AkuTestBakim241
L__AkuTestBakim407:
	MOV	#lo_addr(_QuitTime), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__AkuTestBakim241:
;Battery_Meintenance.mpas,658 :: 		end;
L__AkuTestBakim233:
L__AkuTestBakim223:
;Battery_Meintenance.mpas,660 :: 		ByteToStr(QuitTime,bytetext);
	ADD	W14, #4, W1
	MOV	#lo_addr(_QuitTime), W0
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;Battery_Meintenance.mpas,661 :: 		Glcd_Write_Text(bytetext,86,3,0);
	ADD	W14, #4, W0
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#86, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,662 :: 		Glcd_Write_Text(App_Hour,104,3,0);
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#104, W11
	MOV	#lo_addr(_App_Hour), W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,665 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim244
;Battery_Meintenance.mpas,667 :: 		while (Ok_Button =0) do
L__AkuTestBakim247:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim248
;Battery_Meintenance.mpas,670 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,672 :: 		end;
	GOTO	L__AkuTestBakim247
L__AkuTestBakim248:
;Battery_Meintenance.mpas,674 :: 		Chng3 := 0;
	MOV	#lo_addr(_Chng3), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,675 :: 		EEPROM_Write(EE_QuitTimeEeAddr, QuitTime);
	MOV	#lo_addr(_QuitTime), W0
	ZE	[W0], W12
	MOV	#_EE_QuitTimeEeAddr, W10
	MOV	#_EE_QuitTimeEeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,676 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__AkuTestBakim252:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__AkuTestBakim408
	GOTO	L__AkuTestBakim252
L__AkuTestBakim408:
;Battery_Meintenance.mpas,679 :: 		end;
L__AkuTestBakim244:
;Battery_Meintenance.mpas,680 :: 		end;
	GOTO	L__AkuTestBakim217
L__AkuTestBakim218:
;Battery_Meintenance.mpas,681 :: 		end;
L__AkuTestBakim209:
;Battery_Meintenance.mpas,685 :: 		end;
	GOTO	L__AkuTestBakim96
L__AkuTestBakim207:
;Battery_Meintenance.mpas,773 :: 		4: begin  // bakým giriþ saati
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA Z	L__AkuTestBakim409
	GOTO	L__AkuTestBakim258
L__AkuTestBakim409:
;Battery_Meintenance.mpas,775 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,777 :: 		HourText[1]  := (Bkm_Hour div 10)+48;
	MOV	#lo_addr(_Bkm_Hour), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #8, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,778 :: 		HourText[2]  := (Bkm_Hour mod 10)+48;
	MOV	#lo_addr(_Bkm_Hour), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #9, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,779 :: 		MinText[1]   := (Bkm_Min div 10)+48;
	MOV	#lo_addr(_Bkm_Min), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #11, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,780 :: 		MinText[2]   := (Bkm_Min mod 10)+48;
	MOV	#lo_addr(_Bkm_Min), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #12, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,782 :: 		Glcd_Write_Text(HourText, 92,4,Black);
	ADD	W14, #8, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#92, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,783 :: 		Glcd_Write_Text(':',104,4,black);
	ADD	W14, #14, W1
	MOV.B	#58, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #14, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#104, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,784 :: 		Glcd_Write_Text(MinText, 109,4,Black);
	ADD	W14, #11, W0
	MOV.B	#_Black, W13
	MOV.B	#4, W12
	MOV.B	#109, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,786 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim260
;Battery_Meintenance.mpas,789 :: 		while (Ok_Button =0) do
L__AkuTestBakim263:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim264
;Battery_Meintenance.mpas,792 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,794 :: 		end;
	GOTO	L__AkuTestBakim263
L__AkuTestBakim264:
;Battery_Meintenance.mpas,796 :: 		Chng5 := 1;
	MOV	#lo_addr(_Chng5), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,797 :: 		While (Chng5 = 1) do
L__AkuTestBakim268:
	MOV	#lo_addr(_Chng5), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AkuTestBakim410
	GOTO	L__AkuTestBakim269
L__AkuTestBakim410:
;Battery_Meintenance.mpas,800 :: 		ClrWDT;
	CLRWDT
;Battery_Meintenance.mpas,803 :: 		if (Up_Button =0) then
	BTSC	Up_Button, BitPos(Up_Button+0)
	GOTO	L__AkuTestBakim273
;Battery_Meintenance.mpas,806 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;Battery_Meintenance.mpas,807 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;Battery_Meintenance.mpas,808 :: 		while (ButonStop = 0) do
L__AkuTestBakim276:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AkuTestBakim277
;Battery_Meintenance.mpas,810 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,811 :: 		end;
	GOTO	L__AkuTestBakim276
L__AkuTestBakim277:
;Battery_Meintenance.mpas,813 :: 		Bkm_Min := Bkm_Min + 15; // 15 dk bir artýr
	MOV	#lo_addr(_Bkm_Min), W0
	SE	[W0], W0
	ADD	W0, #15, W1
	MOV	#lo_addr(_Bkm_Min), W0
	MOV.B	W1, [W0]
;Battery_Meintenance.mpas,814 :: 		if (Bkm_Min > 55) then
	MOV.B	#55, W0
	CP.B	W1, W0
	BRA GT	L__AkuTestBakim411
	GOTO	L__AkuTestBakim281
L__AkuTestBakim411:
;Battery_Meintenance.mpas,816 :: 		Bkm_Min := 0;
	MOV	#lo_addr(_Bkm_Min), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,817 :: 		Inc(Bkm_Hour);
	MOV.B	#1, W1
	MOV	#lo_addr(_Bkm_Hour), W0
	ADD.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,818 :: 		if (Bkm_Hour > 23) then Bkm_Hour := 0;
	MOV	#lo_addr(_Bkm_Hour), W0
	MOV.B	[W0], W0
	CP.B	W0, #23
	BRA GT	L__AkuTestBakim412
	GOTO	L__AkuTestBakim284
L__AkuTestBakim412:
	MOV	#lo_addr(_Bkm_Hour), W1
	CLR	W0
	MOV.B	W0, [W1]
L__AkuTestBakim284:
;Battery_Meintenance.mpas,819 :: 		end;
L__AkuTestBakim281:
;Battery_Meintenance.mpas,821 :: 		end else
	GOTO	L__AkuTestBakim274
L__AkuTestBakim273:
;Battery_Meintenance.mpas,822 :: 		if (Down_Button =0) then
	BTSC	Down_Button, BitPos(Down_Button+0)
	GOTO	L__AkuTestBakim287
;Battery_Meintenance.mpas,825 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;Battery_Meintenance.mpas,826 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;Battery_Meintenance.mpas,827 :: 		while (ButonStop = 0) do
L__AkuTestBakim290:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AkuTestBakim291
;Battery_Meintenance.mpas,829 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,830 :: 		end;
	GOTO	L__AkuTestBakim290
L__AkuTestBakim291:
;Battery_Meintenance.mpas,831 :: 		Bkm_Min := Bkm_Min - 15; // 15 dk bir azalt
	MOV	#lo_addr(_Bkm_Min), W0
	SE	[W0], W0
	SUB	W0, #15, W1
	MOV	#lo_addr(_Bkm_Min), W0
	MOV.B	W1, [W0]
;Battery_Meintenance.mpas,832 :: 		if (Bkm_Min < 5) then
	CP.B	W1, #5
	BRA LT	L__AkuTestBakim413
	GOTO	L__AkuTestBakim295
L__AkuTestBakim413:
;Battery_Meintenance.mpas,834 :: 		Bkm_Min := 55;
	MOV	#lo_addr(_Bkm_Min), W1
	MOV.B	#55, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,835 :: 		Dec(Bkm_Hour);
	MOV.B	#1, W1
	MOV	#lo_addr(_Bkm_Hour), W0
	SUBR.B	W1, [W0], [W0]
;Battery_Meintenance.mpas,836 :: 		if (Bkm_Hour < 1) then Bkm_Hour := 23;
	MOV	#lo_addr(_Bkm_Hour), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__AkuTestBakim414
	GOTO	L__AkuTestBakim298
L__AkuTestBakim414:
	MOV	#lo_addr(_Bkm_Hour), W1
	MOV.B	#23, W0
	MOV.B	W0, [W1]
L__AkuTestBakim298:
;Battery_Meintenance.mpas,837 :: 		end;
L__AkuTestBakim295:
;Battery_Meintenance.mpas,838 :: 		end;
L__AkuTestBakim287:
L__AkuTestBakim274:
;Battery_Meintenance.mpas,840 :: 		HourText[1]  := (Bkm_Hour div 10)+48;
	MOV	#lo_addr(_Bkm_Hour), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #8, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,841 :: 		HourText[2]  := (Bkm_Hour mod 10)+48;
	MOV	#lo_addr(_Bkm_Hour), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #9, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,842 :: 		MinText[1]   := (Bkm_Min div 10)+48;
	MOV	#lo_addr(_Bkm_Min), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #11, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,843 :: 		MinText[2]   := (Bkm_Min mod 10)+48;
	MOV	#lo_addr(_Bkm_Min), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #12, W0
	ADD.B	W2, W1, [W0]
;Battery_Meintenance.mpas,845 :: 		Glcd_Write_Text(HourText, 92,4,0);
	ADD	W14, #8, W0
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#92, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,846 :: 		Glcd_Write_Text(':',104,4,0);
	ADD	W14, #14, W1
	MOV.B	#58, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #14, W0
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#104, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,847 :: 		Glcd_Write_Text(MinText, 109,4,0);
	ADD	W14, #11, W0
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#109, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;Battery_Meintenance.mpas,849 :: 		Bakim_Start_Time := Bkm_Hour * 100;
	MOV	#lo_addr(_Bkm_Hour), W0
	SE	[W0], W1
	MOV	#100, W0
	MUL.SS	W1, W0, W2
	MOV	W2, _Bakim_Start_Time
;Battery_Meintenance.mpas,850 :: 		Bakim_Start_Time := Bakim_Start_Time + Bkm_Min;
	MOV	#lo_addr(_Bkm_Min), W0
	SE	[W0], W1
	MOV	#lo_addr(_Bakim_Start_Time), W0
	ADD	W2, W1, [W0]
;Battery_Meintenance.mpas,854 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim301
;Battery_Meintenance.mpas,857 :: 		while (Ok_Button =0) do
L__AkuTestBakim304:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim305
;Battery_Meintenance.mpas,860 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,862 :: 		end;
	GOTO	L__AkuTestBakim304
L__AkuTestBakim305:
;Battery_Meintenance.mpas,864 :: 		Chng5 := 0;
	MOV	#lo_addr(_Chng5), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,865 :: 		EEPROM_Write(EE_BkmStartTimeEeAddr, Bakim_Start_Time);
	MOV	_Bakim_Start_Time, W12
	MOV	#_EE_BkmStartTimeEeAddr, W10
	MOV	#_EE_BkmStartTimeEeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,866 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__AkuTestBakim309:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__AkuTestBakim415
	GOTO	L__AkuTestBakim309
L__AkuTestBakim415:
;Battery_Meintenance.mpas,868 :: 		end;
L__AkuTestBakim301:
;Battery_Meintenance.mpas,869 :: 		end;
	GOTO	L__AkuTestBakim268
L__AkuTestBakim269:
;Battery_Meintenance.mpas,870 :: 		end;
L__AkuTestBakim260:
;Battery_Meintenance.mpas,876 :: 		end;
	GOTO	L__AkuTestBakim96
L__AkuTestBakim258:
;Battery_Meintenance.mpas,878 :: 		5: begin // baþlat/bitir
	MOV.B	[W14+0], W0
	CP.B	W0, #5
	BRA Z	L__AkuTestBakim416
	GOTO	L__AkuTestBakim315
L__AkuTestBakim416:
;Battery_Meintenance.mpas,880 :: 		asm clrwdt; end;
	CLRWDT
;Battery_Meintenance.mpas,882 :: 		if (Bkm_Status = 0) then
	MOV	#lo_addr(_Bkm_Status), W0
	BTSC	[W0], BitPos(_Bkm_Status+0)
	GOTO	L__AkuTestBakim317
;Battery_Meintenance.mpas,883 :: 		Glcd_Write_Text(DisableText,86,5,Black) else
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__AkuTestBakim318
L__AkuTestBakim317:
;Battery_Meintenance.mpas,884 :: 		if (Bkm_Status = 1) then
	MOV	#lo_addr(_Bkm_Status), W0
	BTSS	[W0], BitPos(_Bkm_Status+0)
	GOTO	L__AkuTestBakim320
;Battery_Meintenance.mpas,885 :: 		Glcd_Write_Text(EnableText,86,5,Black);
	MOV.B	#_Black, W13
	MOV.B	#5, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
L__AkuTestBakim320:
L__AkuTestBakim318:
;Battery_Meintenance.mpas,888 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,891 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim323
;Battery_Meintenance.mpas,896 :: 		while (Ok_Button =0) do
L__AkuTestBakim326:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim327
;Battery_Meintenance.mpas,899 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,901 :: 		end;
	GOTO	L__AkuTestBakim326
L__AkuTestBakim327:
;Battery_Meintenance.mpas,903 :: 		Chng6 := 1;
	MOV	#lo_addr(_Chng6), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,905 :: 		While (Chng6 = 1) do
L__AkuTestBakim331:
	MOV	#lo_addr(_Chng6), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AkuTestBakim417
	GOTO	L__AkuTestBakim332
L__AkuTestBakim417:
;Battery_Meintenance.mpas,908 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,910 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W7, #0
	BTSS	Up_Button, BitPos(Up_Button+0)
	BSET	W7, #0
	BTSS	Down_Button, BitPos(Down_Button+0)
	BSET	66, #0
	BTSC	Down_Button, BitPos(Down_Button+0)
	BCLR	66, #0
	BTSS	W7, #0
	BTSC	66, #0
	BRA	L__AkuTestBakim418
	BCLR	W7, #0
	BRA	L__AkuTestBakim421
L__AkuTestBakim418:
	BSET	W7, #0
L__AkuTestBakim421:
	BTSS	W7, #0
	GOTO	L__AkuTestBakim336
;Battery_Meintenance.mpas,912 :: 		while ((Up_Button =0)or(Down_Button =0)) do
L__AkuTestBakim339:
	BCLR	W7, #0
	BTSS	Up_Button, BitPos(Up_Button+0)
	BSET	W7, #0
	BTSS	Down_Button, BitPos(Down_Button+0)
	BSET	66, #0
	BTSC	Down_Button, BitPos(Down_Button+0)
	BCLR	66, #0
	BTSS	W7, #0
	BTSC	66, #0
	BRA	L__AkuTestBakim422
	BCLR	W7, #0
	BRA	L__AkuTestBakim425
L__AkuTestBakim422:
	BSET	W7, #0
L__AkuTestBakim425:
	BTSS	W7, #0
	GOTO	L__AkuTestBakim340
;Battery_Meintenance.mpas,915 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,917 :: 		end;
	GOTO	L__AkuTestBakim339
L__AkuTestBakim340:
;Battery_Meintenance.mpas,919 :: 		Bkm_Status := not Bkm_Status ;
	MOV	#lo_addr(_Bkm_Status), W1
	MOV	#lo_addr(_Bkm_Status), W0
	BTG	[W0], BitPos(_Bkm_Status+0)
;Battery_Meintenance.mpas,921 :: 		end;
L__AkuTestBakim336:
;Battery_Meintenance.mpas,924 :: 		if (Bkm_Status = 0) then
	MOV	#lo_addr(_Bkm_Status), W0
	BTSC	[W0], BitPos(_Bkm_Status+0)
	GOTO	L__AkuTestBakim344
;Battery_Meintenance.mpas,925 :: 		Glcd_Write_Text(DisableText,86,5,0) else
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__AkuTestBakim345
L__AkuTestBakim344:
;Battery_Meintenance.mpas,926 :: 		if (Bkm_Status = 1) then
	MOV	#lo_addr(_Bkm_Status), W0
	BTSS	[W0], BitPos(_Bkm_Status+0)
	GOTO	L__AkuTestBakim347
;Battery_Meintenance.mpas,927 :: 		Glcd_Write_Text(EnableText,86,5,0);
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#86, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
L__AkuTestBakim347:
L__AkuTestBakim345:
;Battery_Meintenance.mpas,929 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim350
;Battery_Meintenance.mpas,934 :: 		while (Ok_Button=0) do
L__AkuTestBakim353:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim354
;Battery_Meintenance.mpas,937 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,939 :: 		end;
	GOTO	L__AkuTestBakim353
L__AkuTestBakim354:
;Battery_Meintenance.mpas,941 :: 		Chng6 := 0;
	MOV	#lo_addr(_Chng6), W1
	CLR	W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,942 :: 		EEPROM_Write(EE_BkmStatusEeAddr,Bkm_Status);
	MOV	#lo_addr(_Bkm_Status), W0
	CLR	W12
	BTSC	[W0], BitPos(_Bkm_Status+0)
	INC	W12
	MOV	#_EE_BkmStatusEeAddr, W10
	MOV	#_EE_BkmStatusEeAddr+2, W11
	CALL	_EEPROM_Write
;Battery_Meintenance.mpas,943 :: 		while (NVMCON = 1) do begin end; // write/erase cycle waiting
L__AkuTestBakim358:
	MOV	NVMCON, WREG
	CP	W0, #1
	BRA NZ	L__AkuTestBakim426
	GOTO	L__AkuTestBakim358
L__AkuTestBakim426:
;Battery_Meintenance.mpas,945 :: 		end;
L__AkuTestBakim350:
;Battery_Meintenance.mpas,947 :: 		end;
	GOTO	L__AkuTestBakim331
L__AkuTestBakim332:
;Battery_Meintenance.mpas,949 :: 		end;
L__AkuTestBakim323:
;Battery_Meintenance.mpas,953 :: 		end;
	GOTO	L__AkuTestBakim96
L__AkuTestBakim315:
;Battery_Meintenance.mpas,955 :: 		6: begin // geri
	MOV.B	[W14+0], W0
	CP.B	W0, #6
	BRA Z	L__AkuTestBakim427
	GOTO	L__AkuTestBakim364
L__AkuTestBakim427:
;Battery_Meintenance.mpas,958 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,961 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim366
;Battery_Meintenance.mpas,965 :: 		while (Ok_Button =0) do
L__AkuTestBakim369:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AkuTestBakim370
;Battery_Meintenance.mpas,968 :: 		clrwdt;
	CLRWDT
;Battery_Meintenance.mpas,970 :: 		end;
	GOTO	L__AkuTestBakim369
L__AkuTestBakim370:
;Battery_Meintenance.mpas,972 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;Battery_Meintenance.mpas,974 :: 		end;
L__AkuTestBakim366:
;Battery_Meintenance.mpas,975 :: 		end;
	GOTO	L__AkuTestBakim96
L__AkuTestBakim364:
L__AkuTestBakim96:
;Battery_Meintenance.mpas,979 :: 		end;
	GOTO	L__AkuTestBakim70
L__AkuTestBakim71:
;Battery_Meintenance.mpas,981 :: 		Service1_Date    := EEPROM_Read(EE_Service1EeAddr);
	MOV	#_EE_Service1EeAddr, W10
	MOV	#_EE_Service1EeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	W0, _Service1_Date
;Battery_Meintenance.mpas,982 :: 		Pause_Ms(50); asm clrwdt; end;
	MOV	#50, W10
	CALL	_Pause_Ms
	CLRWDT
;Battery_Meintenance.mpas,983 :: 		Service2_Date    := EEPROM_Read(EE_Service2EeAddr);
	MOV	#_EE_Service2EeAddr, W10
	MOV	#_EE_Service2EeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	W0, _Service2_Date
;Battery_Meintenance.mpas,984 :: 		Pause_Ms(50); asm clrwdt; end;
	MOV	#50, W10
	CALL	_Pause_Ms
	CLRWDT
;Battery_Meintenance.mpas,985 :: 		Service3_Date    := EEPROM_Read(EE_Service3EeAddr);
	MOV	#_EE_Service3EeAddr, W10
	MOV	#_EE_Service3EeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	W0, _Service3_Date
;Battery_Meintenance.mpas,986 :: 		Pause_Ms(50); asm clrwdt; end;
	MOV	#50, W10
	CALL	_Pause_Ms
	CLRWDT
;Battery_Meintenance.mpas,987 :: 		Service4_Date    := EEPROM_Read(EE_Service4EeAddr);
	MOV	#_EE_Service4EeAddr, W10
	MOV	#_EE_Service4EeAddr+2, W11
	CALL	_EEPROM_Read
	MOV	W0, _Service4_Date
;Battery_Meintenance.mpas,988 :: 		Pause_Ms(50); asm clrwdt; end;
	MOV	#50, W10
	CALL	_Pause_Ms
	CLRWDT
;Battery_Meintenance.mpas,990 :: 		QuitTime_Sec := (QuitTime * 3600000);// çýkýþ zamaný saat olarak // 1ms timer için 1 sýfýr daha atýldý, GAR24-L' de 10ms timer da 1 sýfýr eksik
	MOV	#lo_addr(_QuitTime), W2
	MOV	#61056, W0
	MOV	#54, W1
	ZE	[W2], W2
	CLR	W3
	CALL	__Multiply_32x32
	MOV	W0, _QuitTime_Sec
	MOV	W1, _QuitTime_Sec+2
;Battery_Meintenance.mpas,992 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;Battery_Meintenance.mpas,994 :: 		end;
L_end_AkuTestBakim:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _AkuTestBakim
