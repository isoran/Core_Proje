
_Modbus_Reset_Rx_Data:

;Modbus.mpas,233 :: 		begin
;Modbus.mpas,235 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,238 :: 		for Temp_Byte_1 := 1 to const_Modbus_RxBufSize do
	MOV	#lo_addr(_temp_byte_1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Modbus_Reset_Rx_Data2:
;Modbus.mpas,239 :: 		Modbus_Rx_Data[Temp_Byte_1] := 0;
	MOV	#lo_addr(_temp_byte_1), W0
	ZE	[W0], W0
	SUB	W0, #1, W1
	MOV	#lo_addr(_Modbus_Rx_data), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_temp_byte_1), W0
	MOV.B	[W0], W0
	CP.B	W0, #16
	BRA NZ	L__Modbus_Reset_Rx_Data84
	GOTO	L__Modbus_Reset_Rx_Data5
L__Modbus_Reset_Rx_Data84:
	MOV.B	#1, W1
	MOV	#lo_addr(_temp_byte_1), W0
	ADD.B	W1, [W0], [W0]
	GOTO	L__Modbus_Reset_Rx_Data2
L__Modbus_Reset_Rx_Data5:
;Modbus.mpas,241 :: 		Modbus_Rx_data_Index := 0; // init Modbus_Rx_data_index back to first position in array
	MOV	#lo_addr(_Modbus_Rx_data_index), W1
	CLR	W0
	MOV.B	W0, [W1]
;Modbus.mpas,243 :: 		end;
L_end_Modbus_Reset_Rx_Data:
	RETURN
; end of _Modbus_Reset_Rx_Data

_Modbus_Reset_Tx_Data:

;Modbus.mpas,246 :: 		begin
;Modbus.mpas,248 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,250 :: 		for Temp_Byte_1:= 1 to const_Modbus_TxBufSize do
	MOV	#lo_addr(_temp_byte_1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Modbus_Reset_Tx_Data8:
;Modbus.mpas,251 :: 		Modbus_Tx_data[temp_byte_1] := 0;
	MOV	#lo_addr(_temp_byte_1), W0
	ZE	[W0], W0
	SUB	W0, #1, W1
	MOV	#lo_addr(_Modbus_Tx_data), W0
	ADD	W0, W1, W1
	CLR	W0
	MOV.B	W0, [W1]
	MOV	#lo_addr(_temp_byte_1), W0
	MOV.B	[W0], W1
	MOV.B	#128, W0
	CP.B	W1, W0
	BRA NZ	L__Modbus_Reset_Tx_Data86
	GOTO	L__Modbus_Reset_Tx_Data11
L__Modbus_Reset_Tx_Data86:
	MOV.B	#1, W1
	MOV	#lo_addr(_temp_byte_1), W0
	ADD.B	W1, [W0], [W0]
	GOTO	L__Modbus_Reset_Tx_Data8
L__Modbus_Reset_Tx_Data11:
;Modbus.mpas,253 :: 		end;
L_end_Modbus_Reset_Tx_Data:
	RETURN
; end of _Modbus_Reset_Tx_Data

_Start_Modbus_Init:

;Modbus.mpas,256 :: 		begin
;Modbus.mpas,258 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,260 :: 		Modbus_Reset_Rx_Data;
	CALL	_Modbus_Reset_Rx_Data
;Modbus.mpas,262 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,264 :: 		Modbus_Reset_Tx_Data;
	CALL	_Modbus_Reset_Tx_Data
;Modbus.mpas,266 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,269 :: 		end;
L_end_Start_Modbus_Init:
	RETURN
; end of _Start_Modbus_Init

_Modbus_Rx_CRC_Calculate:

;Modbus.mpas,272 :: 		begin
;Modbus.mpas,274 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,276 :: 		CRC_Rx_uchCRCHi := 0xFF;
	MOV	#lo_addr(_CRC_Rx_uchCRCHi), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;Modbus.mpas,277 :: 		CRC_Rx_uchCRCLo := 0xFF;
	MOV	#lo_addr(_CRC_Rx_uchCRCLo), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;Modbus.mpas,279 :: 		for CRC_Rx_i := 1 to 6 do //Modbus_Rx_data_index-2 do               // dont incl checksum bits in check (obviously!)
	MOV	#lo_addr(_CRC_Rx_i), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Modbus_Rx_CRC_Calculate15:
;Modbus.mpas,281 :: 		CRC_Rx_uIndex   := CRC_Rx_uchCRCLo XOR word(Modbus_Rx_data[CRC_Rx_i]);
	MOV	#lo_addr(_CRC_Rx_i), W0
	ZE	[W0], W0
	SUB	W0, #1, W1
	MOV	#lo_addr(_Modbus_Rx_data), W0
	ADD	W0, W1, W0
	ZE	[W0], W1
	MOV	#lo_addr(_CRC_Rx_uchCRCLo), W0
	ZE	[W0], W0
	XOR	W0, W1, W3
	MOV	#lo_addr(_CRC_Rx_uIndex), W0
	MOV.B	W3, [W0]
;Modbus.mpas,282 :: 		CRC_Rx_uchCRCLo := CRC_Rx_uchCRCHi XOR auchCRCHi[CRC_Rx_uIndex];
	ZE	W3, W1
	MOV	#lo_addr(_AuchCRCHi), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W2
	MOV	#lo_addr(_CRC_Rx_uchCRCHi), W1
	MOV	#lo_addr(_CRC_Rx_uchCRCLo), W0
	XOR.B	W2, [W1], [W0]
;Modbus.mpas,283 :: 		CRC_Rx_uchCRCHi := auchCRCLo[CRC_Rx_uIndex];
	ZE	W3, W1
	MOV	#lo_addr(_AuchCRCLo), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W1
	MOV	#lo_addr(_CRC_Rx_uchCRCHi), W0
	MOV.B	W1, [W0]
;Modbus.mpas,284 :: 		end;
	MOV	#lo_addr(_CRC_Rx_i), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__Modbus_Rx_CRC_Calculate89
	GOTO	L__Modbus_Rx_CRC_Calculate18
L__Modbus_Rx_CRC_Calculate89:
	MOV.B	#1, W1
	MOV	#lo_addr(_CRC_Rx_i), W0
	ADD.B	W1, [W0], [W0]
	GOTO	L__Modbus_Rx_CRC_Calculate15
L__Modbus_Rx_CRC_Calculate18:
;Modbus.mpas,286 :: 		Modbus_Rx_CRC_hi := CRC_Rx_uchCRCHi;
	MOV	#lo_addr(_Modbus_Rx_CRC_hi), W1
	MOV	#lo_addr(_CRC_Rx_uchCRCHi), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,287 :: 		Modbus_Rx_CRC_lo := CRC_Rx_uchCRCLo;
	MOV	#lo_addr(_Modbus_Rx_CRC_lo), W1
	MOV	#lo_addr(_CRC_Rx_uchCRCLo), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,289 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,291 :: 		end;
L_end_Modbus_Rx_CRC_Calculate:
	RETURN
; end of _Modbus_Rx_CRC_Calculate

_Modbus_Tx_CRC_Calculate:

;Modbus.mpas,294 :: 		begin
;Modbus.mpas,296 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,298 :: 		CRC_Tx_uchCRCHi := 0xFF;
	MOV	#lo_addr(_CRC_Tx_uchCRCHi), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;Modbus.mpas,299 :: 		CRC_Tx_uchCRCLo := 0xFF;
	MOV	#lo_addr(_CRC_Tx_uchCRCLo), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;Modbus.mpas,301 :: 		for CRC_Tx_i := 1 to CRC_Tx_length do //Modbus_Rx_data_index-2 do               // dont incl checksum bits in check (obviously!)
	MOV	#lo_addr(_CRC_Tx_i), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Modbus_Tx_CRC_Calculate20:
	MOV	#lo_addr(_CRC_Tx_i), W0
	CP.B	W10, [W0]
	BRA GEU	L__Modbus_Tx_CRC_Calculate91
	GOTO	L__Modbus_Tx_CRC_Calculate24
L__Modbus_Tx_CRC_Calculate91:
;Modbus.mpas,303 :: 		CRC_Tx_uIndex   := CRC_Tx_uchCRCLo XOR word(Modbus_Tx_data[CRC_Tx_i]);
	MOV	#lo_addr(_CRC_Tx_i), W0
	ZE	[W0], W0
	SUB	W0, #1, W1
	MOV	#lo_addr(_Modbus_Tx_data), W0
	ADD	W0, W1, W0
	ZE	[W0], W1
	MOV	#lo_addr(_CRC_Tx_uchCRCLo), W0
	ZE	[W0], W0
	XOR	W0, W1, W3
	MOV	#lo_addr(_CRC_Tx_uIndex), W0
	MOV.B	W3, [W0]
;Modbus.mpas,304 :: 		CRC_Tx_uchCRCLo := CRC_Tx_uchCRCHi XOR auchCRCHi[CRC_Tx_uIndex];
	ZE	W3, W1
	MOV	#lo_addr(_AuchCRCHi), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W2
	MOV	#lo_addr(_CRC_Tx_uchCRCHi), W1
	MOV	#lo_addr(_CRC_Tx_uchCRCLo), W0
	XOR.B	W2, [W1], [W0]
;Modbus.mpas,305 :: 		CRC_Tx_uchCRCHi := auchCRCLo[CRC_Tx_uIndex];
	ZE	W3, W1
	MOV	#lo_addr(_AuchCRCLo), W0
	ADD	W0, W1, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	WREG, 52
	MOV.B	[W1], W1
	MOV	#lo_addr(_CRC_Tx_uchCRCHi), W0
	MOV.B	W1, [W0]
;Modbus.mpas,306 :: 		end;
	MOV	#lo_addr(_CRC_Tx_i), W0
	CP.B	W10, [W0]
	BRA NZ	L__Modbus_Tx_CRC_Calculate92
	GOTO	L__Modbus_Tx_CRC_Calculate24
L__Modbus_Tx_CRC_Calculate92:
	MOV.B	#1, W1
	MOV	#lo_addr(_CRC_Tx_i), W0
	ADD.B	W1, [W0], [W0]
	GOTO	L__Modbus_Tx_CRC_Calculate20
L__Modbus_Tx_CRC_Calculate24:
;Modbus.mpas,308 :: 		Modbus_Tx_CRC_hi := CRC_Tx_uchCRCHi;
	MOV	#lo_addr(_Modbus_Tx_CRC_hi), W1
	MOV	#lo_addr(_CRC_Tx_uchCRCHi), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,309 :: 		Modbus_Tx_CRC_lo := CRC_Tx_uchCRCLo;
	MOV	#lo_addr(_Modbus_Tx_CRC_lo), W1
	MOV	#lo_addr(_CRC_Tx_uchCRCLo), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,311 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,313 :: 		end;
L_end_Modbus_Tx_CRC_Calculate:
	RETURN
; end of _Modbus_Tx_CRC_Calculate

_Modbus_Send:

;Modbus.mpas,316 :: 		begin
;Modbus.mpas,318 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,320 :: 		if Modbus_Adress <> 0 then
	MOV	#lo_addr(_Modbus_Adress), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Modbus_Send94
	GOTO	L__Modbus_Send27
L__Modbus_Send94:
;Modbus.mpas,322 :: 		Modbus_RxTx_Pin := 1;
	BSET	RG13_bit, BitPos(RG13_bit+0)
;Modbus.mpas,323 :: 		Delay_1uS;
	CALL	_Delay_1uS
;Modbus.mpas,325 :: 		for mb_temp_byte_1:=1 to send_count do
	MOV	#lo_addr(_mb_temp_byte_1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Modbus_Send29:
	MOV	#lo_addr(_mb_temp_byte_1), W0
	CP.B	W10, [W0]
	BRA GEU	L__Modbus_Send95
	GOTO	L__Modbus_Send33
L__Modbus_Send95:
;Modbus.mpas,326 :: 		Uart1_Write(Modbus_Tx_data[mb_temp_byte_1]);
	MOV	#lo_addr(_mb_temp_byte_1), W0
	ZE	[W0], W0
	SUB	W0, #1, W1
	MOV	#lo_addr(_Modbus_Tx_data), W0
	ADD	W0, W1, W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
	MOV	#lo_addr(_mb_temp_byte_1), W0
	CP.B	W10, [W0]
	BRA NZ	L__Modbus_Send96
	GOTO	L__Modbus_Send33
L__Modbus_Send96:
	MOV.B	#1, W1
	MOV	#lo_addr(_mb_temp_byte_1), W0
	ADD.B	W1, [W0], [W0]
	GOTO	L__Modbus_Send29
L__Modbus_Send33:
;Modbus.mpas,329 :: 		if ModBus_Baud=9600 then
	MOV	_ModBus_Baud, W1
	MOV	#9600, W0
	CP	W1, W0
	BRA Z	L__Modbus_Send97
	GOTO	L__Modbus_Send35
L__Modbus_Send97:
;Modbus.mpas,331 :: 		Delay_us(1250);
	MOV	#12500, W7
L__Modbus_Send37:
	DEC	W7
	BRA NZ	L__Modbus_Send37
;Modbus.mpas,332 :: 		end
	GOTO	L__Modbus_Send36
;Modbus.mpas,333 :: 		else if ModBus_Baud=19200 then
L__Modbus_Send35:
	MOV	_ModBus_Baud, W1
	MOV	#19200, W0
	CP	W1, W0
	BRA Z	L__Modbus_Send98
	GOTO	L__Modbus_Send40
L__Modbus_Send98:
;Modbus.mpas,335 :: 		Delay_us(625);
	MOV	#6250, W7
L__Modbus_Send42:
	DEC	W7
	BRA NZ	L__Modbus_Send42
;Modbus.mpas,336 :: 		end
	GOTO	L__Modbus_Send41
;Modbus.mpas,337 :: 		else if ModBus_Baud=38400 then
L__Modbus_Send40:
	MOV	_ModBus_Baud, W1
	MOV	#38400, W0
	CP	W1, W0
	BRA Z	L__Modbus_Send99
	GOTO	L__Modbus_Send45
L__Modbus_Send99:
;Modbus.mpas,339 :: 		Delay_us(260);
	MOV	#2600, W7
L__Modbus_Send47:
	DEC	W7
	BRA NZ	L__Modbus_Send47
;Modbus.mpas,340 :: 		end
	GOTO	L__Modbus_Send46
;Modbus.mpas,341 :: 		else if ModBus_Baud=57600 then
L__Modbus_Send45:
	MOV	_ModBus_Baud, W1
	MOV	#57600, W0
	CP	W1, W0
	BRA Z	L__Modbus_Send100
	GOTO	L__Modbus_Send50
L__Modbus_Send100:
;Modbus.mpas,343 :: 		Delay_us(209);
	MOV	#2090, W7
L__Modbus_Send52:
	DEC	W7
	BRA NZ	L__Modbus_Send52
;Modbus.mpas,344 :: 		end;
L__Modbus_Send50:
L__Modbus_Send46:
L__Modbus_Send41:
L__Modbus_Send36:
;Modbus.mpas,346 :: 		Modbus_RxTx_Pin := 0;
	BCLR	RG13_bit, BitPos(RG13_bit+0)
;Modbus.mpas,349 :: 		ModBus_TimeOut := 0;
	MOV	#lo_addr(_ModBus_TimeOut), W1
	CLR	W0
	MOV.B	W0, [W1]
;Modbus.mpas,350 :: 		end;
L__Modbus_Send27:
;Modbus.mpas,352 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,354 :: 		end;
L_end_Modbus_Send:
	RETURN
; end of _Modbus_Send

_Modbus_Reg_Data_Fill:

;Modbus.mpas,357 :: 		begin
;Modbus.mpas,362 :: 		Modbus_Reg_Data[3] := hi(Read_RedVolt);          // 40 003
	MOV	#lo_addr(_Read_RedVolt+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+4
;Modbus.mpas,363 :: 		Modbus_Reg_Data[4] := lo(Read_RedVolt);          // Redresör Gerilimi
	MOV	#lo_addr(_Read_RedVolt), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+6
;Modbus.mpas,365 :: 		Modbus_Reg_Data[5] := hi(Read_LoadVolt);         // 40 004
	MOV	#lo_addr(_Read_LoadVolt+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+8
;Modbus.mpas,366 :: 		Modbus_Reg_Data[6] := lo(Read_LoadVolt);         // yük gerilimi
	MOV	#lo_addr(_Read_LoadVolt), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+10
;Modbus.mpas,368 :: 		Modbus_Reg_Data[7] := hi(Read_BattAmps);         // 40 005  ///
	MOV	#lo_addr(_Read_BattAmps+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+12
;Modbus.mpas,369 :: 		Modbus_Reg_Data[8] := lo(Read_BattAmps);         // akü akýmý
	MOV	#lo_addr(_Read_BattAmps), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+14
;Modbus.mpas,371 :: 		Modbus_Reg_Data[9]  := hi(Read_OutAmps);         // 40 006
	MOV	#lo_addr(_Read_OutAmps+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+16
;Modbus.mpas,372 :: 		Modbus_Reg_Data[10] := lo(Read_OutAmps);         // çýkýþ akýmý
	MOV	#lo_addr(_Read_OutAmps), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+18
;Modbus.mpas,374 :: 		Modbus_Reg_Data[11] := hi((Read_BattAmps+Read_OutAmps));            // 40 007
	MOV	_Read_BattAmps, W1
	MOV	#lo_addr(_Read_OutAmps), W0
	ADD	W1, [W0], W1
	MOV	#lo_addr(W1), W0
	INC	W0
	MOV.B	[W0], W0
	ZE	W0, W0
	MOV	W0, _Modbus_Reg_data+20
;Modbus.mpas,375 :: 		Modbus_Reg_Data[12]:= lo((Read_BattAmps+Read_OutAmps));             // toplam akým
	ZE	W1, W0
	MOV	W0, _Modbus_Reg_data+22
;Modbus.mpas,377 :: 		Modbus_Reg_Data[13] := hi(Read_U1Volt);          // 40 008
	MOV	#lo_addr(_Read_U1Volt+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+24
;Modbus.mpas,378 :: 		Modbus_Reg_Data[14] := lo(Read_U1Volt);          // u1 gerilim
	MOV	#lo_addr(_Read_U1Volt), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+26
;Modbus.mpas,380 :: 		Modbus_Reg_Data[15]:= hi(Read_U2Volt);           // 40 009
	MOV	#lo_addr(_Read_U2Volt+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+28
;Modbus.mpas,381 :: 		Modbus_Reg_Data[16]:= lo(Read_U2Volt);           // u2 gerilim
	MOV	#lo_addr(_Read_U2Volt), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+30
;Modbus.mpas,383 :: 		Modbus_Reg_Data[17] := hi(Read_U3Volt);          // 40 010
	MOV	#lo_addr(_Read_U3Volt+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+32
;Modbus.mpas,384 :: 		Modbus_Reg_Data[18] := Lo(Read_U3Volt);          // u3 gerilim
	MOV	#lo_addr(_Read_U3Volt), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+34
;Modbus.mpas,386 :: 		Modbus_Reg_Data[19] := hi(Read_U1Amps);          //40 011
	MOV	#lo_addr(_Read_U1Amps+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+36
;Modbus.mpas,387 :: 		Modbus_Reg_Data[20] := lo(Read_U1Amps);          // u1 akým
	MOV	#lo_addr(_Read_U1Amps), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+38
;Modbus.mpas,389 :: 		Modbus_Reg_Data[21] := hi(Read_U2Amps);          // u2 akým
	MOV	#lo_addr(_Read_U2Amps+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+40
;Modbus.mpas,390 :: 		Modbus_Reg_Data[22] := lo(Read_U2Amps);          // 40 012
	MOV	#lo_addr(_Read_U2Amps), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+42
;Modbus.mpas,392 :: 		Modbus_Reg_Data[23] := hi(Read_U3Amps);          // u3 amps
	MOV	#lo_addr(_Read_U3Amps+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+44
;Modbus.mpas,393 :: 		Modbus_Reg_Data[24] := lo(Read_U3Amps);          // 40 013
	MOV	#lo_addr(_Read_U3Amps), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+46
;Modbus.mpas,395 :: 		Modbus_Reg_Data[25] := hi(Read_Freq);            // frekans
	MOV	#lo_addr(_Read_Freq+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+48
;Modbus.mpas,396 :: 		Modbus_Reg_Data[26] := lo(Read_Freq);            // 40 014
	MOV	#lo_addr(_Read_Freq), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+50
;Modbus.mpas,398 :: 		Modbus_Reg_Data[27] := 0;                        // þarj modu
	CLR	W0
	MOV	W0, _Modbus_Reg_data+52
;Modbus.mpas,399 :: 		Modbus_Reg_Data[28] := ChargeMode;               // 40 015
	MOV	#lo_addr(_ChargeMode), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+54
;Modbus.mpas,401 :: 		Modbus_Reg_Data[29] := hi(BoostChargeTimeSet);   // ayarlanan hýzlý þarj süresi
	MOV	#lo_addr(_BoostChargeTimeSet+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+56
;Modbus.mpas,402 :: 		Modbus_Reg_Data[30] := lo(BoostChargeTimeSet);   // 40 016
	MOV	#lo_addr(_BoostChargeTimeSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+58
;Modbus.mpas,404 :: 		Modbus_Reg_Data[31] := hi(BoostChargeTime);      // kalan hýzlý þarj süresi
	MOV	#lo_addr(_BoostChargeTime+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+60
;Modbus.mpas,405 :: 		Modbus_Reg_Data[32] := lo(BoostChargeTime);      // 40 017
	MOV	#lo_addr(_BoostChargeTime), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+62
;Modbus.mpas,407 :: 		Modbus_Reg_Data[33] := 0;                        // otomatik hýzlý þarj/normal þarj
	CLR	W0
	MOV	W0, _Modbus_Reg_data+64
;Modbus.mpas,408 :: 		Modbus_Reg_Data[34] := AutoBFMode;               // 40 018
	MOV	#lo_addr(_AutoBFMode), W1
	MOV	#lo_addr(_Modbus_Reg_data+66), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_AutoBFMode+0)
	INC	[W0], [W0]
;Modbus.mpas,410 :: 		Modbus_Reg_Data[35] := hi(ACMaxVoltSet);         // AC max volt set deðeri
	MOV	#lo_addr(_ACMaxVoltSet+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+68
;Modbus.mpas,411 :: 		Modbus_Reg_Data[36] := lo(ACMaxVoltSet);         // 40 019
	MOV	#lo_addr(_ACMaxVoltSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+70
;Modbus.mpas,413 :: 		Modbus_Reg_Data[37] := hi(ACMinVoltSet);         // AC min volt set deðeri
	MOV	#lo_addr(_ACMinVoltSet+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+72
;Modbus.mpas,414 :: 		Modbus_Reg_Data[38] := lo(ACMinVoltSet);         // 40 020
	MOV	#lo_addr(_ACMinVoltSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+74
;Modbus.mpas,416 :: 		Modbus_Reg_Data[39] := 0;                        // ac tepki süresi
	CLR	W0
	MOV	W0, _Modbus_Reg_data+76
;Modbus.mpas,417 :: 		Modbus_Reg_Data[40] := 0;//ACSetResponseTime;        // 40 021
	CLR	W0
	MOV	W0, _Modbus_Reg_data+78
;Modbus.mpas,419 :: 		Modbus_Reg_Data[41] := hi(DCOutVoltSet);         // dc çýkýþ gerilimi set deðeri
	MOV	#lo_addr(_DCOutVoltSet+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+80
;Modbus.mpas,420 :: 		Modbus_Reg_Data[42] := lo(DCOutVoltSet);         // 40 022
	MOV	#lo_addr(_DCOutVoltSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+82
;Modbus.mpas,422 :: 		Modbus_Reg_Data[43] := hi(DCOutAmpsSet);         // dc çýkýþ akýmý set deðeri
	MOV	#lo_addr(_DcOutAmpsSet+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+84
;Modbus.mpas,423 :: 		Modbus_Reg_Data[44] := lo(DCOutAmpsSet);         // 40 023
	MOV	#lo_addr(_DcOutAmpsSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+86
;Modbus.mpas,425 :: 		Modbus_Reg_Data[45] := hi(MaxvoltSet);           // max dc gerilim set deðeri
	MOV	#lo_addr(_MaxvoltSet+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+88
;Modbus.mpas,426 :: 		Modbus_Reg_Data[46] := lo(MaxvoltSet);           // 40 024
	MOV	#lo_addr(_MaxvoltSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+90
;Modbus.mpas,428 :: 		Modbus_Reg_Data[47] := hi(MinVoltSet);           // min dc gerilim set deðeri
	MOV	#lo_addr(_MinVoltSet+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+92
;Modbus.mpas,429 :: 		Modbus_Reg_Data[48] := lo(MinVoltSet);           // 40 025
	MOV	#lo_addr(_MinVoltSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+94
;Modbus.mpas,431 :: 		Modbus_Reg_Data[49] := 0;                        // 40 026
	CLR	W0
	MOV	W0, _Modbus_Reg_data+96
;Modbus.mpas,432 :: 		Modbus_Reg_Data[50] := 0;//DCSetResponseTime;        // dc röle tepki süresi
	CLR	W0
	MOV	W0, _Modbus_Reg_data+98
;Modbus.mpas,434 :: 		Modbus_Reg_Data[51] := 0;                        // 40 027
	CLR	W0
	MOV	W0, _Modbus_Reg_data+100
;Modbus.mpas,435 :: 		Modbus_Reg_Data[52] := Dropper_OutStatus;        // dropper durumu
	MOV	#lo_addr(_Dropper_OutStatus), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+102
;Modbus.mpas,437 :: 		Modbus_Reg_Data[53] := hi(BatteryAh);            // 40 028
	MOV	#lo_addr(_BatteryAh+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+104
;Modbus.mpas,438 :: 		Modbus_Reg_Data[54] := lo(BatteryAh);            // akü ah set deðeri
	MOV	#lo_addr(_BatteryAh), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+106
;Modbus.mpas,440 :: 		Modbus_Reg_Data[55] := hi(BatteryAmpsSet) ;      // 40 029
	MOV	#lo_addr(_BatteryAmpsSet+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+108
;Modbus.mpas,441 :: 		Modbus_Reg_Data[56] := lo(BatteryAmpsSet);       // akü akým set deðeri
	MOV	#lo_addr(_BatteryAmpsSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+110
;Modbus.mpas,443 :: 		Modbus_Reg_Data[57] := hi(BoostChargeVoltage);   // 40 030
	MOV	#lo_addr(_BoostChargeVoltage+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+112
;Modbus.mpas,444 :: 		Modbus_Reg_Data[58] := lo(BoostChargeVoltage);   // hýzlý þarj gerilim set deðeri
	MOV	#lo_addr(_BoostChargeVoltage), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+114
;Modbus.mpas,446 :: 		Modbus_Reg_Data[59] := hi(FloatChargeVoltage);   // 40 031
	MOV	#lo_addr(_FloatChargeVoltage+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+116
;Modbus.mpas,447 :: 		Modbus_Reg_Data[60] := lo(FloatChargeVoltage);   // float þarj gerilim set deðeri
	MOV	#lo_addr(_FloatChargeVoltage), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+118
;Modbus.mpas,449 :: 		Modbus_Reg_Data[61] := hi(DeepDischargeVolt);    // 40 032
	MOV	#lo_addr(_DeepDischargeVolt+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+120
;Modbus.mpas,450 :: 		Modbus_Reg_Data[62] := lo(DeepDischargeVolt);    // derin deþarj geirlim set deðeri
	MOV	#lo_addr(_DeepDischargeVolt), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+122
;Modbus.mpas,452 :: 		Modbus_Reg_Data[63] := hi(BoostChargeLimit);     // 40 033
	MOV	#lo_addr(_BoostChargeLimit+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+124
;Modbus.mpas,453 :: 		Modbus_Reg_Data[64] := lo(BoostChargeLimit);     // hýzlý þarj limit set deðeri
	MOV	#lo_addr(_BoostChargeLimit), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+126
;Modbus.mpas,455 :: 		Modbus_Reg_Data[65] := hi(FloatChargeLimit);     // 40 034
	MOV	#lo_addr(_FloatChargeLimit+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+128
;Modbus.mpas,456 :: 		Modbus_Reg_Data[66] := lo(FloatChargeLimit);     // float þarj limit set deðeri
	MOV	#lo_addr(_FloatChargeLimit), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+130
;Modbus.mpas,458 :: 		Modbus_Reg_Data[67] := 0;                        // 40 035
	CLR	W0
	MOV	W0, _Modbus_Reg_data+132
;Modbus.mpas,459 :: 		Modbus_Reg_Data[68] := TempAlarmSet;             // sýcaklýk alarm set deðeri
	MOV	#lo_addr(_TempAlarmSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+134
;Modbus.mpas,461 :: 		Modbus_Reg_Data[69] := 0;                        // 40 036
	CLR	W0
	MOV	W0, _Modbus_Reg_data+136
;Modbus.mpas,462 :: 		Modbus_Reg_Data[70] := TempFanOnSet;             // fan açma sýcaklýk set deðeri
	MOV	#lo_addr(_TempFanOnSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+138
;Modbus.mpas,464 :: 		Modbus_Reg_Data[71] := 0;                        // 40 037
	CLR	W0
	MOV	W0, _Modbus_Reg_data+140
;Modbus.mpas,465 :: 		Modbus_Reg_Data[72] := TempFanOffSet;            // fan kapatma sýcaklýk of deðeri
	MOV	#lo_addr(_TempFanOffSet), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+142
;Modbus.mpas,467 :: 		Modbus_Reg_Data[73] := 0;                        // 40 038
	CLR	W0
	MOV	W0, _Modbus_Reg_data+144
;Modbus.mpas,468 :: 		Modbus_Reg_Data[74] := PCB_Temperature;          //kasa iç sýcaklýk bilgisi
	MOV	#lo_addr(_PCB_Temperature), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+146
;Modbus.mpas,470 :: 		Modbus_Reg_Data[75] := 0;                        // 40 039
	CLR	W0
	MOV	W0, _Modbus_Reg_data+148
;Modbus.mpas,471 :: 		Modbus_Reg_Data[76] := LanguageBit;              // dil set deðeri
	MOV	#lo_addr(_LanguageBit), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+150
;Modbus.mpas,473 :: 		Modbus_Reg_Data[77] := 0;                        // 40 040
	CLR	W0
	MOV	W0, _Modbus_Reg_data+152
;Modbus.mpas,474 :: 		Modbus_Reg_Data[78] := Leakage_Pos_Set;          // + kaçak direnç set deðeri
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	SE	[W0], W0
	MOV	W0, _Modbus_Reg_data+154
;Modbus.mpas,476 :: 		Modbus_Reg_Data[79] := 0;                        // 40 041
	CLR	W0
	MOV	W0, _Modbus_Reg_data+156
;Modbus.mpas,477 :: 		Modbus_Reg_Data[80] := Leakage_Neg_Set;          // - kaçak direnç set deðeri
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	SE	[W0], W0
	MOV	W0, _Modbus_Reg_data+158
;Modbus.mpas,479 :: 		Modbus_Reg_Data[81] := 0;                        // 40 042
	CLR	W0
	MOV	W0, _Modbus_Reg_data+160
;Modbus.mpas,480 :: 		Modbus_Reg_Data[82] := Rly_AcHighBit;            // ac yüksek rölesi durumu
	MOV	#lo_addr(_Rly_AcHighBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+162), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_AcHighBit+0)
	INC	[W0], [W0]
;Modbus.mpas,482 :: 		Modbus_Reg_Data[83] := 0;                        // 40 043
	CLR	W0
	MOV	W0, _Modbus_Reg_data+164
;Modbus.mpas,483 :: 		Modbus_Reg_Data[84] := Rly_AcLowBit;             // ac düþük rölesi durumu
	MOV	#lo_addr(_Rly_AcLowBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+166), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_AcLowBit+0)
	INC	[W0], [W0]
;Modbus.mpas,485 :: 		Modbus_Reg_Data[85] := 0;                        // 40 044
	CLR	W0
	MOV	W0, _Modbus_Reg_data+168
;Modbus.mpas,486 :: 		Modbus_Reg_Data[86] := Rly_DcHighBit;            // dc yüksek rölesi durumu
	MOV	#lo_addr(_Rly_DcHighBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+170), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_DcHighBit+0)
	INC	[W0], [W0]
;Modbus.mpas,488 :: 		Modbus_Reg_Data[87] := 0;                        // 40 045
	CLR	W0
	MOV	W0, _Modbus_Reg_data+172
;Modbus.mpas,489 :: 		Modbus_Reg_Data[88] := Rly_DcLowBit;             // dc düþük rölesi durumu
	MOV	#lo_addr(_Rly_DcLowBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+174), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_DcLowBit+0)
	INC	[W0], [W0]
;Modbus.mpas,491 :: 		Modbus_Reg_Data[89] := 0;                        // 40 046
	CLR	W0
	MOV	W0, _Modbus_Reg_data+176
;Modbus.mpas,492 :: 		Modbus_Reg_Data[90] := Rly_PosLeakageBit;        // + kaçak durumu
	MOV	#lo_addr(_Rly_PosLeakageBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+178), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_PosLeakageBit+0)
	INC	[W0], [W0]
;Modbus.mpas,494 :: 		Modbus_Reg_Data[91] := 0;                        // 40 047
	CLR	W0
	MOV	W0, _Modbus_Reg_data+180
;Modbus.mpas,495 :: 		Modbus_Reg_Data[92] := Rly_NegLeakageBit;        // - kaçak durumu
	MOV	#lo_addr(_Rly_NegLeakageBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+182), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_NegLeakageBit+0)
	INC	[W0], [W0]
;Modbus.mpas,497 :: 		Modbus_Reg_Data[93] := 0;                        // 40 048
	CLR	W0
	MOV	W0, _Modbus_Reg_data+184
;Modbus.mpas,498 :: 		Modbus_Reg_Data[94] := LeakageValue;             // kaçak akým deðeri
	MOV	#lo_addr(_LeakageValue), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+186
;Modbus.mpas,500 :: 		Modbus_Reg_Data[95] := 0;                        // 40 049
	CLR	W0
	MOV	W0, _Modbus_Reg_data+188
;Modbus.mpas,501 :: 		Modbus_Reg_Data[96] := Rly_BattAmpsLimitBit;     // akü akým sýnýrlama deðeri
	MOV	#lo_addr(_Rly_BattAmpsLimitBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+190), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_BattAmpsLimitBit+0)
	INC	[W0], [W0]
;Modbus.mpas,503 :: 		Modbus_Reg_Data[97] := 0;                        // 40 050
	CLR	W0
	MOV	W0, _Modbus_Reg_data+192
;Modbus.mpas,504 :: 		Modbus_Reg_Data[98] := Rly_RedAmpsLimitBit;      // redresör akým sýnýrlama deðeri
	MOV	#lo_addr(_Rly_RedAmpsLimitBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+194), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_RedAmpsLimitBit+0)
	INC	[W0], [W0]
;Modbus.mpas,506 :: 		Modbus_Reg_Data[99] := 0;                        // 40 051
	CLR	W0
	MOV	W0, _Modbus_Reg_data+196
;Modbus.mpas,507 :: 		Modbus_Reg_Data[100]:= Rly_FanFaultBit;          // fan hata deðeri
	MOV	#lo_addr(_Rly_FanFaultBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+198), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_FanFaultBit+0)
	INC	[W0], [W0]
;Modbus.mpas,509 :: 		Modbus_Reg_Data[101] := 0;                       // 40 052
	CLR	W0
	MOV	W0, _Modbus_Reg_data+200
;Modbus.mpas,510 :: 		Modbus_Reg_Data[102] := Rly_HighTempBit;         // aþýrý sýcaklýk deðeri
	MOV	#lo_addr(_Rly_HighTempBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+202), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_HighTempBit+0)
	INC	[W0], [W0]
;Modbus.mpas,512 :: 		Modbus_Reg_Data[103] := 0;                        // 40 053
	CLR	W0
	MOV	W0, _Modbus_Reg_data+204
;Modbus.mpas,513 :: 		Modbus_Reg_Data[104] := Rly_BattReverseBit;       // akü ters deðeri
	MOV	#lo_addr(_Rly_BattReverseBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+206), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_BattReverseBit+0)
	INC	[W0], [W0]
;Modbus.mpas,516 :: 		Modbus_Reg_Data[105] := 0;                        // 40 054
	CLR	W0
	MOV	W0, _Modbus_Reg_data+208
;Modbus.mpas,517 :: 		Modbus_Reg_Data[106] := Rly_AcMcbBit;             // ac mcb deðeri
	MOV	#lo_addr(_Rly_AcMcbBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+210), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_AcMcbBit+0)
	INC	[W0], [W0]
;Modbus.mpas,520 :: 		Modbus_Reg_Data[107] := 0;                        // 40 055
	CLR	W0
	MOV	W0, _Modbus_Reg_data+212
;Modbus.mpas,521 :: 		Modbus_Reg_Data[108] := Rly_DcMcbBit;             // dc mcb deðeri
	MOV	#lo_addr(_Rly_DcMcbBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+214), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_DcMcbBit+0)
	INC	[W0], [W0]
;Modbus.mpas,524 :: 		Modbus_Reg_Data[109] := 0;                        // 40 056
	CLR	W0
	MOV	W0, _Modbus_Reg_data+216
;Modbus.mpas,525 :: 		Modbus_Reg_Data[110] := Rly_BattMcbBit;           // akü mcb deðeri
	MOV	#lo_addr(_Rly_BattMcbBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+218), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_BattMcbBit+0)
	INC	[W0], [W0]
;Modbus.mpas,528 :: 		Modbus_Reg_Data[111] := 0;                        // 40 057
	CLR	W0
	MOV	W0, _Modbus_Reg_data+220
;Modbus.mpas,529 :: 		Modbus_Reg_Data[112] := Rly_DeepDschBit;          // derin deþarj deðeri
	MOV	#lo_addr(_Rly_DeepDschBit), W1
	MOV	#lo_addr(_Modbus_Reg_data+222), W0
	CLR	[W0]
	BTSC	[W1], BitPos(_Rly_DeepDschBit+0)
	INC	[W0], [W0]
;Modbus.mpas,532 :: 		Modbus_Reg_Data[113] := hi(HucreSayisi);          // 40 058
	MOV	#lo_addr(_HucreSayisi+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+224
;Modbus.mpas,533 :: 		Modbus_Reg_Data[114] := lo(HucreSayisi);          // hucre sayýsý
	MOV	#lo_addr(_HucreSayisi), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+226
;Modbus.mpas,535 :: 		Modbus_Reg_Data[115] := hi(NomHucreGerilim);      // 40 059
	MOV	#lo_addr(_NomHucreGerilim+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+228
;Modbus.mpas,536 :: 		Modbus_Reg_Data[116] := lo(NomHucreGerilim);      // hücre gerilim
	MOV	#lo_addr(_NomHucreGerilim), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+230
;Modbus.mpas,538 :: 		Modbus_Reg_Data[117] := hi(RedresorAkim);         // 40 060
	MOV	#lo_addr(_RedresorAkim+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+232
;Modbus.mpas,539 :: 		Modbus_Reg_Data[118] := lo(RedresorAkim);         // redresör akým
	MOV	#lo_addr(_RedresorAkim), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+234
;Modbus.mpas,553 :: 		end;
L_end_Modbus_Reg_Data_Fill:
	RETURN
; end of _Modbus_Reg_Data_Fill

_Modbus_Check_Packet:

;Modbus.mpas,555 :: 		begin
;Modbus.mpas,557 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,559 :: 		Modbus_Packet_Good := 0;
	MOV	#lo_addr(_Modbus_Packet_Good), W1
	CLR	W0
	MOV.B	W0, [W1]
;Modbus.mpas,561 :: 		Modbus_Rx_Data_MSB_Adress := Modbus_Rx_data[3];
	MOV	#lo_addr(_Modbus_Rx_Data_MSB_Adress), W1
	MOV	#lo_addr(_Modbus_Rx_data+2), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,562 :: 		Modbus_Rx_Data_LSB_Adress := Modbus_Rx_data[4];
	MOV	#lo_addr(_Modbus_Rx_Data_LSB_Adress), W1
	MOV	#lo_addr(_Modbus_Rx_data+3), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,564 :: 		Modbus_Rx_Data_Count_MSB := Modbus_Rx_data[5];
	MOV	#lo_addr(_Modbus_Rx_Data_Count_MSB), W1
	MOV	#lo_addr(_Modbus_Rx_data+4), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,565 :: 		Modbus_Rx_Data_Count_LSB := Modbus_Rx_data[6];
	MOV	#lo_addr(_Modbus_Rx_Data_Count_LSB), W1
	MOV	#lo_addr(_Modbus_Rx_data+5), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,568 :: 		if (Modbus_Rx_Data_LSB_Adress < Modbus_DataLength)         //41
	MOV	#lo_addr(_Modbus_Rx_data+3), W0
	MOV.B	[W0], W1
	MOV.B	#70, W0
	CP.B	W1, W0
	CLR	W1
	BRA GEU	L__Modbus_Check_Packet103
	COM	W1
L__Modbus_Check_Packet103:
;Modbus.mpas,569 :: 		AND (Modbus_Rx_Data_LSB_Adress > 0 ) //AND (Modbus_Rx_Data_Count_MSB = 0 )
	MOV	#lo_addr(_Modbus_Rx_data+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	CLR	W0
	BRA LEU	L__Modbus_Check_Packet104
	COM	W0
L__Modbus_Check_Packet104:
	AND	W1, W0, W1
;Modbus.mpas,570 :: 		AND (Modbus_Rx_Data_Count_LSB > 0 )
	MOV	#lo_addr(_Modbus_Rx_data+5), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	CLR	W0
	BRA LEU	L__Modbus_Check_Packet105
	COM	W0
L__Modbus_Check_Packet105:
	AND	W1, W0, W2
;Modbus.mpas,571 :: 		AND (Modbus_Rx_Data_Count_LSB < Modbus_DataLength ) then  //Starting address valid range is 0 to MaxReg
	MOV	#lo_addr(_Modbus_Rx_data+5), W0
	MOV.B	[W0], W1
	MOV.B	#70, W0
	CP.B	W1, W0
	CLR	W0
	BRA GEU	L__Modbus_Check_Packet106
	COM	W0
L__Modbus_Check_Packet106:
	AND	W2, W0, W0
	BRA NZ	L__Modbus_Check_Packet107
	GOTO	L__Modbus_Check_Packet57
L__Modbus_Check_Packet107:
;Modbus.mpas,573 :: 		Modbus_Packet_Good := 255;
	MOV	#lo_addr(_Modbus_Packet_Good), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;Modbus.mpas,575 :: 		end
	GOTO	L__Modbus_Check_Packet58
;Modbus.mpas,576 :: 		else
L__Modbus_Check_Packet57:
;Modbus.mpas,578 :: 		Modbus_Packet_Good := 0;
	MOV	#lo_addr(_Modbus_Packet_Good), W1
	CLR	W0
	MOV.B	W0, [W1]
;Modbus.mpas,580 :: 		end;
L__Modbus_Check_Packet58:
;Modbus.mpas,582 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,584 :: 		end;
L_end_Modbus_Check_Packet:
	RETURN
; end of _Modbus_Check_Packet

_Modbus_Function0x03:

;Modbus.mpas,589 :: 		begin
;Modbus.mpas,591 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,594 :: 		Modbus_Tx_data[1] := Modbus_Adress;
	MOV	#lo_addr(_Modbus_Tx_data), W1
	MOV	#lo_addr(_Modbus_Adress), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,595 :: 		Modbus_Tx_data[2] := Modbus_Function;
	MOV	#lo_addr(_Modbus_Tx_data+1), W1
	MOV	#lo_addr(_Modbus_Function), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,596 :: 		Modbus_Tx_data[3] := Modbus_Rx_Data_Count_LSB*2;
	MOV	#lo_addr(_Modbus_Rx_Data_Count_LSB), W0
	ZE	[W0], W0
	SL	W0, #1, W2
	MOV	#lo_addr(_Modbus_Tx_data+2), W0
	MOV.B	W2, [W0]
;Modbus.mpas,598 :: 		Modbus_Rec_Counter := Modbus_Rec_Counter +1;
	MOV	#1, W1
	MOV	#lo_addr(_Modbus_Rec_Counter), W0
	ADD	W1, [W0], [W0]
;Modbus.mpas,600 :: 		Modbus_Reg_Data[1] := hi(Modbus_Rec_Counter);//Modbus_Reg_Data[1];
	MOV	#lo_addr(_Modbus_Rec_Counter+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data
;Modbus.mpas,601 :: 		Modbus_Reg_Data[2] := lo(Modbus_Rec_Counter);//Modbus_Reg_Data[2];
	MOV	#lo_addr(_Modbus_Rec_Counter), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+2
;Modbus.mpas,603 :: 		Modbus_Reg_Data[119]  := hi(Modbus_Rec_Counter);//Modbus_Reg_Data[73]; 79  40 061
	MOV	#lo_addr(_Modbus_Rec_Counter+1), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+236
;Modbus.mpas,604 :: 		Modbus_Reg_Data[120]  := lo(Modbus_Rec_Counter);//Modbus_Reg_Data[74]; 80
	MOV	#lo_addr(_Modbus_Rec_Counter), W0
	ZE	[W0], W0
	MOV	W0, _Modbus_Reg_data+238
;Modbus.mpas,608 :: 		mb_temp_byte_1 := Modbus_Rx_Data_LSB_Adress*2-1;
	MOV	#lo_addr(_Modbus_Rx_Data_LSB_Adress), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_mb_temp_byte_1), W0
	SUB.B	W1, #1, [W0]
;Modbus.mpas,609 :: 		mb_temp_byte_2 := mb_temp_byte_1 + Modbus_Rx_Data_Count_LSB*2-1;
	MOV	#lo_addr(_mb_temp_byte_1), W0
	ZE	[W0], W0
	ADD	W0, W2, W0
	SUB	W0, #1, W1
	MOV	#lo_addr(_mb_temp_byte_2), W0
	MOV.B	W1, [W0]
;Modbus.mpas,611 :: 		if mb_temp_byte_2 > const_modbus_MaxReg then
	MOV.B	#125, W0
	CP.B	W1, W0
	BRA GTU	L__Modbus_Function0x03109
	GOTO	L__Modbus_Function0x0361
L__Modbus_Function0x03109:
;Modbus.mpas,613 :: 		mb_temp_byte_2 := const_modbus_MaxReg;
	MOV	#lo_addr(_mb_temp_byte_2), W1
	MOV.B	#125, W0
	MOV.B	W0, [W1]
;Modbus.mpas,614 :: 		Modbus_Tx_data[3] := mb_temp_byte_2 div 2;
	MOV	#lo_addr(_Modbus_Tx_data+2), W1
	MOV.B	#62, W0
	MOV.B	W0, [W1]
;Modbus.mpas,615 :: 		end;
L__Modbus_Function0x0361:
;Modbus.mpas,617 :: 		mb_temp_byte_3 := 3;
	MOV	#lo_addr(_mb_temp_byte_3), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;Modbus.mpas,619 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,621 :: 		for i:= mb_temp_byte_1 to mb_temp_byte_2 do
	MOV	#lo_addr(_mb_temp_byte_1), W0
; i start address is: 6 (W3)
	MOV.B	[W0], W3
; i end address is: 6 (W3)
L__Modbus_Function0x0363:
; i start address is: 6 (W3)
	MOV	#lo_addr(_mb_temp_byte_2), W0
	CP.B	W3, [W0]
	BRA LEU	L__Modbus_Function0x03110
	GOTO	L__Modbus_Function0x0367
L__Modbus_Function0x03110:
;Modbus.mpas,623 :: 		mb_temp_byte_3 := mb_temp_byte_3 + 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_mb_temp_byte_3), W0
	ADD.B	W1, [W0], [W0]
;Modbus.mpas,624 :: 		Modbus_Tx_data[mb_temp_byte_3] := Modbus_Reg_Data[i];
	MOV	#lo_addr(_mb_temp_byte_3), W0
	ZE	[W0], W0
	SUB	W0, #1, W1
	MOV	#lo_addr(_Modbus_Tx_data), W0
	ADD	W0, W1, W2
	ZE	W3, W0
	DEC	W0
	SL	W0, #1, W1
	MOV	#lo_addr(_Modbus_Reg_data), W0
	ADD	W0, W1, W0
	MOV.B	[W0], [W2]
;Modbus.mpas,625 :: 		end;
	MOV	#lo_addr(_mb_temp_byte_2), W0
	CP.B	W3, [W0]
	BRA NZ	L__Modbus_Function0x03111
	GOTO	L__Modbus_Function0x0367
L__Modbus_Function0x03111:
; i start address is: 0 (W0)
	ADD.B	W3, #1, W0
; i end address is: 6 (W3)
	MOV.B	W0, W3
; i end address is: 0 (W0)
	GOTO	L__Modbus_Function0x0363
L__Modbus_Function0x0367:
;Modbus.mpas,627 :: 		Modbus_Tx_Index := mb_temp_byte_3;
	MOV	#lo_addr(_Modbus_Tx_Index), W1
	MOV	#lo_addr(_mb_temp_byte_3), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,628 :: 		Modbus_Function_Good := 255;
	MOV	#lo_addr(_Modbus_Function_Good), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;Modbus.mpas,630 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,631 :: 		end;
L_end_Modbus_Function0x03:
	RETURN
; end of _Modbus_Function0x03

_Modbus_Decode_Frame:

;Modbus.mpas,635 :: 		begin
;Modbus.mpas,637 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,639 :: 		if (Modbus_Rx_data[1] = Modbus_Adress) then
	MOV	#lo_addr(_Modbus_Rx_data), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_Modbus_Adress), W0
	CP.B	W1, [W0]
	BRA Z	L__Modbus_Decode_Frame113
	GOTO	L__Modbus_Decode_Frame70
L__Modbus_Decode_Frame113:
;Modbus.mpas,641 :: 		Modbus_Rx_CRC_Calculate;
	CALL	_Modbus_Rx_CRC_Calculate
;Modbus.mpas,643 :: 		if (Modbus_Rx_data[7]= Modbus_Rx_CRC_lo) AND (Modbus_Rx_data[8]= Modbus_Rx_CRC_hi) then
	MOV	#lo_addr(_Modbus_Rx_data+6), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_Modbus_Rx_CRC_lo), W0
	CP.B	W1, [W0]
	CLR	W2
	BRA NZ	L__Modbus_Decode_Frame114
	COM	W2
L__Modbus_Decode_Frame114:
	MOV	#lo_addr(_Modbus_Rx_data+7), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_Modbus_Rx_CRC_hi), W0
	CP.B	W1, [W0]
	CLR	W0
	BRA NZ	L__Modbus_Decode_Frame115
	COM	W0
L__Modbus_Decode_Frame115:
	AND	W2, W0, W0
	BRA NZ	L__Modbus_Decode_Frame116
	GOTO	L__Modbus_Decode_Frame73
L__Modbus_Decode_Frame116:
;Modbus.mpas,646 :: 		Modbus_Function := Modbus_Rx_data[2];
	MOV	#lo_addr(_Modbus_Function), W1
	MOV	#lo_addr(_Modbus_Rx_data+1), W0
	MOV.B	[W0], [W1]
;Modbus.mpas,647 :: 		Modbus_Function_Good := 0;
	MOV	#lo_addr(_Modbus_Function_Good), W1
	CLR	W0
	MOV.B	W0, [W1]
;Modbus.mpas,649 :: 		Modbus_Check_Packet;
	CALL	_Modbus_Check_Packet
;Modbus.mpas,651 :: 		if Modbus_Packet_Good = 255 then
	MOV	#lo_addr(_Modbus_Packet_Good), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA Z	L__Modbus_Decode_Frame117
	GOTO	L__Modbus_Decode_Frame76
L__Modbus_Decode_Frame117:
;Modbus.mpas,654 :: 		0x03: //
	MOV	#lo_addr(_Modbus_Function), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Modbus_Decode_Frame118
	GOTO	L__Modbus_Decode_Frame81
L__Modbus_Decode_Frame118:
;Modbus.mpas,656 :: 		Modbus_Function0x03();
	CALL	_Modbus_Function0x03
;Modbus.mpas,663 :: 		else
	GOTO	L__Modbus_Decode_Frame78
L__Modbus_Decode_Frame81:
;Modbus.mpas,664 :: 		Modbus_Function_Good := 0;
	MOV	#lo_addr(_Modbus_Function_Good), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Modbus_Decode_Frame78:
;Modbus.mpas,666 :: 		end;
L__Modbus_Decode_Frame76:
;Modbus.mpas,667 :: 		end
	GOTO	L__Modbus_Decode_Frame74
;Modbus.mpas,668 :: 		else // MB bad crc
L__Modbus_Decode_Frame73:
;Modbus.mpas,670 :: 		Modbus_Function_Good := 0;
	MOV	#lo_addr(_Modbus_Function_Good), W1
	CLR	W0
	MOV.B	W0, [W1]
;Modbus.mpas,671 :: 		Modbus_Reset_Rx_Data;                             // reset rxbuffer for next message
	CALL	_Modbus_Reset_Rx_Data
;Modbus.mpas,672 :: 		end;
L__Modbus_Decode_Frame74:
;Modbus.mpas,673 :: 		end;
L__Modbus_Decode_Frame70:
;Modbus.mpas,675 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,677 :: 		end;
L_end_Modbus_Decode_Frame:
	RETURN
; end of _Modbus_Decode_Frame

_Check_Modbus:

;Modbus.mpas,680 :: 		begin
;Modbus.mpas,682 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,805 :: 		asm ClrWDT; end;
	CLRWDT
;Modbus.mpas,807 :: 		end;
L_end_Check_Modbus:
	RETURN
; end of _Check_Modbus
