
_Pause_Ms:

;GRR3000LManagementPanel.mpas,629 :: 		begin
;GRR3000LManagementPanel.mpas,630 :: 		VDelay_ms(Value);
	CALL	_VDelay_ms
;GRR3000LManagementPanel.mpas,631 :: 		end;
L_end_Pause_Ms:
	RETURN
; end of _Pause_Ms

_Start_Register_Config:

;GRR3000LManagementPanel.mpas,634 :: 		begin
;GRR3000LManagementPanel.mpas,635 :: 		ADPCFG := 0xFFFF;
	PUSH	W10
	PUSH	W11
	MOV	#65535, W0
	MOV	WREG, ADPCFG
;GRR3000LManagementPanel.mpas,637 :: 		Delay_ms(100);
	MOV	#16, W8
	MOV	#16964, W7
L__Start_Register_Config2:
	DEC	W7
	BRA NZ	L__Start_Register_Config2
	DEC	W8
	BRA NZ	L__Start_Register_Config2
;GRR3000LManagementPanel.mpas,639 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,641 :: 		IPC0 := 0;
	CLR	IPC0
;GRR3000LManagementPanel.mpas,642 :: 		IPC1 := 0;
	CLR	IPC1
;GRR3000LManagementPanel.mpas,643 :: 		IPC2 := 0;
	CLR	IPC2
;GRR3000LManagementPanel.mpas,644 :: 		IPC3 := 0;
	CLR	IPC3
;GRR3000LManagementPanel.mpas,645 :: 		IPC4 := 0;
	CLR	IPC4
;GRR3000LManagementPanel.mpas,646 :: 		IPC5 := 0;
	CLR	IPC5
;GRR3000LManagementPanel.mpas,647 :: 		IPC6 := 0;
	CLR	IPC6
;GRR3000LManagementPanel.mpas,649 :: 		IEC0 := 0;
	CLR	IEC0
;GRR3000LManagementPanel.mpas,650 :: 		IEC1 := 0;
	CLR	IEC1
;GRR3000LManagementPanel.mpas,651 :: 		IEC2 := 0;
	CLR	IEC2
;GRR3000LManagementPanel.mpas,655 :: 		INTCON1.15 := 0; //interrupt nesting enable
	BCLR	INTCON1, #15
;GRR3000LManagementPanel.mpas,657 :: 		T3CON  := 0x0000;
	CLR	T3CON
;GRR3000LManagementPanel.mpas,658 :: 		TMR3   := 0;
	CLR	TMR3
;GRR3000LManagementPanel.mpas,659 :: 		PR3    := ModBus_TimeOut_Timer3_PR3;
	MOV	_ModBus_TimeOut_Timer3_PR3, W0
	MOV	WREG, PR3
;GRR3000LManagementPanel.mpas,661 :: 		T4CON      := 0x0000;
	CLR	T4CON
;GRR3000LManagementPanel.mpas,662 :: 		TMR4       := 0;
	CLR	TMR4
;GRR3000LManagementPanel.mpas,663 :: 		PR4        := 30000; // 120MHz 1ms timer
	MOV	#30000, W0
	MOV	WREG, PR4
;GRR3000LManagementPanel.mpas,668 :: 		U1STA := %0000010000000000;
	MOV	#1024, W0
	MOV	WREG, U1STA
;GRR3000LManagementPanel.mpas,669 :: 		U2STA := %0000010000000000; // transmit enable bit
	MOV	#1024, W0
	MOV	WREG, U2STA
;GRR3000LManagementPanel.mpas,670 :: 		IFS0  := %1001110101111111; // timer 1,3 uart1 clear
	MOV	#40319, W0
	MOV	WREG, IFS0
;GRR3000LManagementPanel.mpas,671 :: 		IFS1  := %1111111011011111; // tmr4, Uart2 clear
	MOV	#65247, W0
	MOV	WREG, IFS1
;GRR3000LManagementPanel.mpas,672 :: 		IPC1  := %0101000000000000; // timer 3 level 5;
	MOV	#20480, W0
	MOV	WREG, IPC1
;GRR3000LManagementPanel.mpas,673 :: 		IPC2  := %0000000001100000; // uart1 level 6;
	MOV	#96, W0
	MOV	WREG, IPC2
;GRR3000LManagementPanel.mpas,674 :: 		IPC5  := %0000000001000000; // tmr4 level 4;
	MOV	#64, W0
	MOV	WREG, IPC5
;GRR3000LManagementPanel.mpas,675 :: 		IPC6  := %0000000000000111; // uart2 receiver priority level = 7
	MOV	#7, W0
	MOV	WREG, IPC6
;GRR3000LManagementPanel.mpas,676 :: 		IEC0  := %0000001010000000; // timer 3 enable, uart1 receiver enable
	MOV	#640, W0
	MOV	WREG, IEC0
;GRR3000LManagementPanel.mpas,677 :: 		IEC1  := %0000000100100000; // enable tmr4, uart2 receiver enable
	MOV	#288, W0
	MOV	WREG, IEC1
;GRR3000LManagementPanel.mpas,681 :: 		TRISA  := 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISA
;GRR3000LManagementPanel.mpas,682 :: 		TRISB  := 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISB
;GRR3000LManagementPanel.mpas,683 :: 		TRISC  := 0xFFF1;
	MOV	#65521, W0
	MOV	WREG, TRISC
;GRR3000LManagementPanel.mpas,684 :: 		TRISD  := 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISD
;GRR3000LManagementPanel.mpas,685 :: 		TRISF  := 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISF
;GRR3000LManagementPanel.mpas,686 :: 		TRISG  := 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISG
;GRR3000LManagementPanel.mpas,690 :: 		Dropper_Out_1   := 0;
	BCLR	LATC3_bit, BitPos(LATC3_bit+0)
;GRR3000LManagementPanel.mpas,691 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,692 :: 		Dropper_Out_2   := 0;
	BCLR	LATC2_bit, BitPos(LATC2_bit+0)
;GRR3000LManagementPanel.mpas,693 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,694 :: 		Dropper_Out_3   := 0;
	BCLR	LATC1_bit, BitPos(LATC1_bit+0)
;GRR3000LManagementPanel.mpas,695 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,697 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,699 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,702 :: 		TRISA  := %0011100111111111;
	MOV	#14847, W0
	MOV	WREG, TRISA
;GRR3000LManagementPanel.mpas,703 :: 		TRISB  := %1111101000100111;
	MOV	#64039, W0
	MOV	WREG, TRISB
;GRR3000LManagementPanel.mpas,704 :: 		TRISC  := %0011111111100001;
	MOV	#16353, W0
	MOV	WREG, TRISC
;GRR3000LManagementPanel.mpas,705 :: 		TRISD  := %0011100111111111;
	MOV	#14847, W0
	MOV	WREG, TRISD
;GRR3000LManagementPanel.mpas,706 :: 		TRISF  := %1111111010111111;
	MOV	#65215, W0
	MOV	WREG, TRISF
;GRR3000LManagementPanel.mpas,707 :: 		TRISG  := %0001111010111111;
	MOV	#7871, W0
	MOV	WREG, TRISG
;GRR3000LManagementPanel.mpas,709 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,711 :: 		Temp_CompPin_Direction    := 1;
	BSET	TRISB14_bit, BitPos(TRISB14_bit+0)
;GRR3000LManagementPanel.mpas,712 :: 		Master_OutPin_Direction   := 0;
	BCLR	TRISG14_bit, BitPos(TRISG14_bit+0)
;GRR3000LManagementPanel.mpas,713 :: 		Slave_InputPin_Direction  := 1;
	BSET	TRISG12_bit, BitPos(TRISG12_bit+0)
;GRR3000LManagementPanel.mpas,715 :: 		PORTA := 0x0000;
	CLR	PORTA
;GRR3000LManagementPanel.mpas,716 :: 		PORTB := 0x0000;
	CLR	PORTB
;GRR3000LManagementPanel.mpas,717 :: 		PORTC := 0x0000;
	CLR	PORTC
;GRR3000LManagementPanel.mpas,718 :: 		PORTD := 0x0000;
	CLR	PORTD
;GRR3000LManagementPanel.mpas,719 :: 		PORTF := 0x0000;
	CLR	PORTF
;GRR3000LManagementPanel.mpas,720 :: 		PORTG := 0x0000;
	CLR	PORTG
;GRR3000LManagementPanel.mpas,724 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,726 :: 		Glcd_Init();
	CALL	_Glcd_Init
;GRR3000LManagementPanel.mpas,727 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,728 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,729 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,735 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,737 :: 		SPI1_Init();
	CALL	_SPI1_Init
;GRR3000LManagementPanel.mpas,738 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,740 :: 		SPI_Set_Active(@SPI1_Read, @SPI1_Write);
	MOV	#lo_addr(_SPI1_Write), W11
	MOV	#lo_addr(_SPI1_Read), W10
	CALL	_SPI_Set_Active
;GRR3000LManagementPanel.mpas,742 :: 		SPI2_Initialize();
	CALL	_SPI2_Initialize
;GRR3000LManagementPanel.mpas,744 :: 		SPI_Set_Active(@SPI2_Read, @SPI2_Write);
	MOV	#lo_addr(_SPI2_Write), W11
	MOV	#lo_addr(_SPI2_Read), W10
	CALL	_SPI_Set_Active
;GRR3000LManagementPanel.mpas,746 :: 		ClearDisplay(1);
	MOV.B	#1, W10
	CALL	_ClearDisplay
;GRR3000LManagementPanel.mpas,747 :: 		ClearDisplay(2);
	MOV.B	#2, W10
	CALL	_ClearDisplay
;GRR3000LManagementPanel.mpas,749 :: 		I2C1_Init(100000);
	MOV	#34464, W10
	MOV	#1, W11
	CALL	_I2C1_Init
;GRR3000LManagementPanel.mpas,750 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,754 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,756 :: 		HucreSayisi            := 0;
	CLR	W0
	MOV	W0, _HucreSayisi
;GRR3000LManagementPanel.mpas,757 :: 		NomHucreGerilim        := 0;
	CLR	W0
	MOV	W0, _NomHucreGerilim
;GRR3000LManagementPanel.mpas,758 :: 		RedresorAkim           := 0;
	CLR	W0
	MOV	W0, _RedresorAkim
;GRR3000LManagementPanel.mpas,759 :: 		F_ChargePercentLo      := 0;  // float þarj yüzde min.
	CLR	W0
	MOV	W0, _F_ChargePercentLo
;GRR3000LManagementPanel.mpas,760 :: 		F_ChargePercentHi      := 0;  // float þarj yüzde max.
	CLR	W0
	MOV	W0, _F_ChargePercentHi
;GRR3000LManagementPanel.mpas,761 :: 		B_ChargePercentLo      := 0;  // boost þarj yüzde min.
	CLR	W0
	MOV	W0, _B_ChargePercentLo
;GRR3000LManagementPanel.mpas,762 :: 		B_ChargePercentHi      := 0;  // boost þarj yüzde max.
	CLR	W0
	MOV	W0, _B_ChargePercentHi
;GRR3000LManagementPanel.mpas,763 :: 		MenuSayac              := 0;
	MOV	#lo_addr(_MenuSayac), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,764 :: 		MenuSayacValue         := 0;
	MOV	#lo_addr(_MenuSayacValue), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,765 :: 		Value_Text             := '     ';
	MOV	#lo_addr(_Value_Text), W1
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
;GRR3000LManagementPanel.mpas,766 :: 		ValueText2             := '     ';
	MOV	#lo_addr(_ValueText2), W1
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
;GRR3000LManagementPanel.mpas,767 :: 		ButonStop              := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,768 :: 		BtCounterNormal        := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,769 :: 		BtCounter1             := 0;
	CLR	W0
	MOV	W0, _BtCounter1
;GRR3000LManagementPanel.mpas,770 :: 		ButonStart             := 0;
	MOV	#lo_addr(_ButonStart), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,771 :: 		MainMenuExit           := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,772 :: 		MenuExitCounter        := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _MenuExitCounter
	MOV	W1, _MenuExitCounter+2
;GRR3000LManagementPanel.mpas,773 :: 		MenuExit               := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,774 :: 		BatteryAh              := 0;
	CLR	W0
	MOV	W0, _BatteryAh
;GRR3000LManagementPanel.mpas,775 :: 		BatteryAmpsSet         := 0;
	CLR	W0
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,776 :: 		ChargeMode             := 0;
	MOV	#lo_addr(_ChargeMode), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,777 :: 		Temp_RealAku           := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _Temp_RealAku
	MOV	W1, _Temp_RealAku+2
;GRR3000LManagementPanel.mpas,778 :: 		Temp_WordAku           := 0;
	CLR	W0
	MOV	W0, _Temp_WordAku
;GRR3000LManagementPanel.mpas,779 :: 		BoostChargeVoltage     := 0;
	CLR	W0
	MOV	W0, _BoostChargeVoltage
;GRR3000LManagementPanel.mpas,780 :: 		FloatChargeVoltage     := 0;
	CLR	W0
	MOV	W0, _FloatChargeVoltage
;GRR3000LManagementPanel.mpas,781 :: 		BoostChargeTimeSet     := 0;
	CLR	W0
	MOV	W0, _BoostChargeTimeSet
;GRR3000LManagementPanel.mpas,782 :: 		BoostChargeTime        := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _BoostChargeTime
	MOV	W1, _BoostChargeTime+2
;GRR3000LManagementPanel.mpas,783 :: 		DeepDischargeVolt      := 0;
	CLR	W0
	MOV	W0, _DeepDischargeVolt
;GRR3000LManagementPanel.mpas,784 :: 		AutoBFMode             := 0;
	MOV	#lo_addr(_AutoBFMode), W0
	BCLR	[W0], BitPos(_AutoBFMode+0)
;GRR3000LManagementPanel.mpas,785 :: 		BoostChargeLimit       := 0;
	CLR	W0
	MOV	W0, _BoostChargeLimit
;GRR3000LManagementPanel.mpas,786 :: 		FloatChargeLimit       := 0;
	CLR	W0
	MOV	W0, _FloatChargeLimit
;GRR3000LManagementPanel.mpas,787 :: 		DCOutVoltSet           := 0;
	CLR	W0
	MOV	W0, _DCOutVoltSet
;GRR3000LManagementPanel.mpas,788 :: 		DcOutAmpsSet           := 0;
	CLR	W0
	MOV	W0, _DcOutAmpsSet
;GRR3000LManagementPanel.mpas,789 :: 		MaxvoltSet             := 0;
	CLR	W0
	MOV	W0, _MaxvoltSet
;GRR3000LManagementPanel.mpas,790 :: 		MinVoltSet             := 0;
	CLR	W0
	MOV	W0, _MinVoltSet
;GRR3000LManagementPanel.mpas,792 :: 		Dropper_OutStatus      := 0;
	MOV	#lo_addr(_Dropper_OutStatus), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,794 :: 		Minutes                := 0;
	MOV	#lo_addr(_Minutes), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,795 :: 		Hours                  := 0;
	MOV	#lo_addr(_Hours), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,796 :: 		Day                    := 0;
	MOV	#lo_addr(_Day), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,797 :: 		Month                  := 0;
	MOV	#lo_addr(_Month), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,798 :: 		Year                   := 0;
	MOV	#lo_addr(_Year), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,799 :: 		Seconds                := 0;
	MOV	#lo_addr(_Seconds), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,800 :: 		Week                   := 0;
	MOV	#lo_addr(_Week), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,801 :: 		Clock_Text             := '        ';
	MOV	#lo_addr(_Clock_Text), W1
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
;GRR3000LManagementPanel.mpas,802 :: 		Date_Text              := '          ';
	MOV	#lo_addr(_Date_Text), W1
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
;GRR3000LManagementPanel.mpas,803 :: 		PCB_Temperature        := 20; // açýlýþta ýsýtýcý çalýþmasýn diye kasa sýcaklýðý 20C yapýldý
	MOV	#lo_addr(_PCB_Temperature), W1
	MOV.B	#20, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,804 :: 		PCB_TempHAM            := 0;
	CLR	W0
	MOV	W0, _PCB_TempHAM
;GRR3000LManagementPanel.mpas,805 :: 		PCB_TempText           := '   ';
	MOV	#lo_addr(_PCB_TempText), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,807 :: 		TempFanOffSet          := 0;
	MOV	#lo_addr(_TempFanOffSet), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,808 :: 		TempFanOnSet           := 0;
	MOV	#lo_addr(_TempFanOnSet), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,809 :: 		TempAlarmSet           := 0;
	MOV	#lo_addr(_TempAlarmSet), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,810 :: 		ModbusID               := 0;
	MOV	#lo_addr(_ModbusID), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,811 :: 		ModbusBaudRate         := 0;
	MOV	#lo_addr(_ModbusBaudRate), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,812 :: 		Read_TotalAmps         := 0;
	CLR	W0
	MOV	W0, _Read_TotalAmps
;GRR3000LManagementPanel.mpas,813 :: 		Read_OutAmps           := 0;
	CLR	W0
	MOV	W0, _Read_OutAmps
;GRR3000LManagementPanel.mpas,814 :: 		Read_BattAmps          := 0;
	CLR	W0
	MOV	W0, _Read_BattAmps
;GRR3000LManagementPanel.mpas,815 :: 		Read_RedVolt           := 0;
	CLR	W0
	MOV	W0, _Read_RedVolt
;GRR3000LManagementPanel.mpas,816 :: 		Read_Temp              := 0;
	CLR	W0
	MOV	W0, _Read_Temp
;GRR3000LManagementPanel.mpas,817 :: 		Read_U1Volt            := 0;
	CLR	W0
	MOV	W0, _Read_U1Volt
;GRR3000LManagementPanel.mpas,818 :: 		Read_U2Volt            := 0;
	CLR	W0
	MOV	W0, _Read_U2Volt
;GRR3000LManagementPanel.mpas,819 :: 		Read_U3Volt             := 0;
	CLR	W0
	MOV	W0, _Read_U3Volt
;GRR3000LManagementPanel.mpas,820 :: 		Read_U1VoltRaw          := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Read_U1VoltRaw
	MOV	W1, _Read_U1VoltRaw+2
;GRR3000LManagementPanel.mpas,821 :: 		Read_U2VoltRaw          := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Read_U2VoltRaw
	MOV	W1, _Read_U2VoltRaw+2
;GRR3000LManagementPanel.mpas,822 :: 		Read_U3VoltRaw          := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Read_U3VoltRaw
	MOV	W1, _Read_U3VoltRaw+2
;GRR3000LManagementPanel.mpas,823 :: 		Read_U1Amps             := 0;
	CLR	W0
	MOV	W0, _Read_U1Amps
;GRR3000LManagementPanel.mpas,824 :: 		Read_U2Amps             := 0;
	CLR	W0
	MOV	W0, _Read_U2Amps
;GRR3000LManagementPanel.mpas,825 :: 		Read_U3Amps             := 0;
	CLR	W0
	MOV	W0, _Read_U3Amps
;GRR3000LManagementPanel.mpas,826 :: 		Read_Relay              := 0;
	CLR	W0
	MOV	W0, _Read_Relay
;GRR3000LManagementPanel.mpas,827 :: 		Read_Freq               := 0;
	CLR	W0
	MOV	W0, _Read_Freq
;GRR3000LManagementPanel.mpas,828 :: 		Read_FreqReal           := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _Read_FreqReal
	MOV	W1, _Read_FreqReal+2
;GRR3000LManagementPanel.mpas,829 :: 		Request_Counter         := 1;
	MOV	#1, W0
	MOV	W0, _Request_Counter
;GRR3000LManagementPanel.mpas,830 :: 		Haberlesme_izni         := 0;
	MOV	#lo_addr(_Haberlesme_izni), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,831 :: 		RequestFault_Counter    := 0;
	CLR	W0
	MOV	W0, _RequestFault_Counter
;GRR3000LManagementPanel.mpas,832 :: 		Request_RepeatCounter   := 0;
	CLR	W0
	MOV	W0, _Request_RepeatCounter
;GRR3000LManagementPanel.mpas,833 :: 		Uart_ThryFault          := 0;
	MOV	#lo_addr(_Uart_ThryFault), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,834 :: 		Uart_ACMultFault        := 0;
	MOV	#lo_addr(_Uart_ACMultFault), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,835 :: 		Uart_RelayFault         := 0;
	MOV	#lo_addr(_Uart_RelayFault), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,836 :: 		Uart_VoltmeterFault     := 0;
	MOV	#lo_addr(_Uart_VoltmeterFault), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,837 :: 		Leakage_Pos_Set         := 0;
	MOV	#lo_addr(_Leakage_Pos_Set), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,838 :: 		Leakage_Neg_Set         := 0;
	MOV	#lo_addr(_Leakage_Neg_Set), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,839 :: 		FactoryData             := 0;
	MOV	#lo_addr(_FactoryData), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,840 :: 		FactoryResetBit         := 0;
	MOV	#lo_addr(_FactoryResetBit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,841 :: 		Relay_Out_Data          := 1;
	MOV	#1, W0
	MOV	W0, _Relay_Out_Data
;GRR3000LManagementPanel.mpas,842 :: 		MasterData[0]           := 0;
	MOV	#lo_addr(_MasterData), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,843 :: 		MasterData[1]           := 0;
	MOV	#lo_addr(_MasterData+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,844 :: 		MasterData[2]           := 0;
	MOV	#lo_addr(_MasterData+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,845 :: 		MasterData[3]           := 0;
	MOV	#lo_addr(_MasterData+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,846 :: 		MasterData[4]           := 0;
	MOV	#lo_addr(_MasterData+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,847 :: 		MasterData[5]           := 0;
	MOV	#lo_addr(_MasterData+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,848 :: 		ReceiveData[0]          := 0;
	MOV	#lo_addr(_ReceiveData), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,849 :: 		ReceiveData[1]          := 0;
	MOV	#lo_addr(_ReceiveData+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,850 :: 		ReceiveData[2]          := 0;
	MOV	#lo_addr(_ReceiveData+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,851 :: 		ReceiveData[3]          := 0;
	MOV	#lo_addr(_ReceiveData+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,852 :: 		ReceiveData[4]          := 0;
	MOV	#lo_addr(_ReceiveData+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,853 :: 		ReceiveData[5]          := 0;
	MOV	#lo_addr(_ReceiveData+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,854 :: 		ReceiveData[6]          := 0;
	MOV	#lo_addr(_ReceiveData+6), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,855 :: 		TimeScreenCounter       := 0;
	CLR	W0
	MOV	W0, _TimeScreenCounter
;GRR3000LManagementPanel.mpas,857 :: 		ThryFaultCount          := 0;
	CLR	W0
	MOV	W0, _ThryFaultCount
;GRR3000LManagementPanel.mpas,859 :: 		RlyFaultCount           := 0;
	CLR	W0
	MOV	W0, _RlyFaultCount
;GRR3000LManagementPanel.mpas,861 :: 		ThryCommFault           := 0;
	MOV	#lo_addr(_ThryCommFault), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,863 :: 		RlyCommFault            := 0;
	MOV	#lo_addr(_RlyCommFault), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,864 :: 		RectifierVoltage_Set    := 0;
	CLR	W0
	MOV	W0, _RectifierVoltage_Set
;GRR3000LManagementPanel.mpas,865 :: 		BCTimeCountBit          := 0;
	MOV	#lo_addr(_BCTimeCountBit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,866 :: 		BCTimeCounter           := 0;
	CLR	W0
	MOV	W0, _BCTimeCounter
;GRR3000LManagementPanel.mpas,867 :: 		BTBit                   := 0;
	MOV	#lo_addr(_BTBit), W0
	BCLR	[W0], BitPos(_BTBit+0)
;GRR3000LManagementPanel.mpas,868 :: 		Rly_AcHighBit           := 0;
	MOV	#lo_addr(_Rly_AcHighBit), W0
	BCLR	[W0], BitPos(_Rly_AcHighBit+0)
;GRR3000LManagementPanel.mpas,869 :: 		Rly_AcLowBit            := 0;
	MOV	#lo_addr(_Rly_AcLowBit), W0
	BCLR	[W0], BitPos(_Rly_AcLowBit+0)
;GRR3000LManagementPanel.mpas,870 :: 		Rly_DcHighBit           := 0;
	MOV	#lo_addr(_Rly_DcHighBit), W0
	BCLR	[W0], BitPos(_Rly_DcHighBit+0)
;GRR3000LManagementPanel.mpas,871 :: 		Rly_DcLowBit            := 0;
	MOV	#lo_addr(_Rly_DcLowBit), W0
	BCLR	[W0], BitPos(_Rly_DcLowBit+0)
;GRR3000LManagementPanel.mpas,872 :: 		Rly_PosLeakageBit       := 0;
	MOV	#lo_addr(_Rly_PosLeakageBit), W0
	BCLR	[W0], BitPos(_Rly_PosLeakageBit+0)
;GRR3000LManagementPanel.mpas,873 :: 		Rly_NegLeakageBit       := 0;
	MOV	#lo_addr(_Rly_NegLeakageBit), W0
	BCLR	[W0], BitPos(_Rly_NegLeakageBit+0)
;GRR3000LManagementPanel.mpas,874 :: 		Rly_BattAmpsLimitBit    := 0;
	MOV	#lo_addr(_Rly_BattAmpsLimitBit), W0
	BCLR	[W0], BitPos(_Rly_BattAmpsLimitBit+0)
;GRR3000LManagementPanel.mpas,875 :: 		Rly_RedAmpsLimitBit     := 0;
	MOV	#lo_addr(_Rly_RedAmpsLimitBit), W0
	BCLR	[W0], BitPos(_Rly_RedAmpsLimitBit+0)
;GRR3000LManagementPanel.mpas,876 :: 		Rly_FanFaultBit         := 0;
	MOV	#lo_addr(_Rly_FanFaultBit), W0
	BCLR	[W0], BitPos(_Rly_FanFaultBit+0)
;GRR3000LManagementPanel.mpas,877 :: 		Rly_HighTempBit         := 0;
	MOV	#lo_addr(_Rly_HighTempBit), W0
	BCLR	[W0], BitPos(_Rly_HighTempBit+0)
;GRR3000LManagementPanel.mpas,878 :: 		Rly_BattReverseBit      := 0;
	MOV	#lo_addr(_Rly_BattReverseBit), W0
	BCLR	[W0], BitPos(_Rly_BattReverseBit+0)
;GRR3000LManagementPanel.mpas,879 :: 		Rly_AcMcbBit            := 0;
	MOV	#lo_addr(_Rly_AcMcbBit), W0
	BCLR	[W0], BitPos(_Rly_AcMcbBit+0)
;GRR3000LManagementPanel.mpas,880 :: 		Rly_DcMcbBit            := 0;
	MOV	#lo_addr(_Rly_DcMcbBit), W0
	BCLR	[W0], BitPos(_Rly_DcMcbBit+0)
;GRR3000LManagementPanel.mpas,881 :: 		Rly_BattMcbBit          := 0;
	MOV	#lo_addr(_Rly_BattMcbBit), W0
	BCLR	[W0], BitPos(_Rly_BattMcbBit+0)
;GRR3000LManagementPanel.mpas,882 :: 		Rly_RedGenFaultBit      := 0;
	MOV	#lo_addr(_Rly_RedGenFaultBit), W0
	BCLR	[W0], BitPos(_Rly_RedGenFaultBit+0)
;GRR3000LManagementPanel.mpas,883 :: 		Rly_DeepDschBit         := 0;
	MOV	#lo_addr(_Rly_DeepDschBit), W0
	BCLR	[W0], BitPos(_Rly_DeepDschBit+0)
;GRR3000LManagementPanel.mpas,884 :: 		Modbus_Rec_Counter      := 0;
	CLR	W0
	MOV	W0, _Modbus_Rec_Counter
;GRR3000LManagementPanel.mpas,885 :: 		AlarmSira               := 23;
	MOV	#lo_addr(_AlarmSira), W1
	MOV.B	#23, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,886 :: 		BuzzerBit               := 0;
	MOV	#lo_addr(_BuzzerBit), W0
	BCLR	[W0], BitPos(_BuzzerBit+0)
;GRR3000LManagementPanel.mpas,887 :: 		Buzzer_AllowBit         := 1;
	MOV	#lo_addr(_Buzzer_AllowBit), W0
	BSET	[W0], BitPos(_Buzzer_AllowBit+0)
;GRR3000LManagementPanel.mpas,888 :: 		Buzzer_Counter          := 0;
	CLR	W0
	MOV	W0, _Buzzer_Counter
;GRR3000LManagementPanel.mpas,889 :: 		AlarmSiraCounter        := 0;
	CLR	W0
	MOV	W0, _AlarmSiraCounter
;GRR3000LManagementPanel.mpas,890 :: 		DcFaultRelayTime        := 0;
	CLR	W0
	MOV	W0, _DcFaultRelayTime
;GRR3000LManagementPanel.mpas,891 :: 		ReceiveAddr             := 0;
	MOV	#lo_addr(_ReceiveAddr), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,892 :: 		Dig_LoadVolt            := 0;
	CLR	W0
	MOV	W0, _Dig_LoadVolt
;GRR3000LManagementPanel.mpas,893 :: 		Dig_LoadVoltLeak        := 0;
	CLR	W0
	MOV	W0, _Dig_LoadVoltLeak
;GRR3000LManagementPanel.mpas,894 :: 		Dig_LoadVoltLeakRAW     := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Dig_LoadVoltLeakRAW
	MOV	W1, _Dig_LoadVoltLeakRAW+2
;GRR3000LManagementPanel.mpas,896 :: 		dV_LoadVolt             := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _dV_LoadVolt
	MOV	W1, _dV_LoadVolt+2
;GRR3000LManagementPanel.mpas,897 :: 		Sample_RedDigital       := 0;
	CLR	W0
	MOV	W0, _Sample_RedDigital
;GRR3000LManagementPanel.mpas,898 :: 		Sample_RedVolt          := 0;
	CLR	W0
	MOV	W0, _Sample_RedVolt
;GRR3000LManagementPanel.mpas,899 :: 		Program_StartBit        := 0;
	MOV	#lo_addr(_Program_StartBit), W0
	BCLR	[W0], BitPos(_Program_StartBit+0)
;GRR3000LManagementPanel.mpas,900 :: 		MenuBit                 := 0;
	MOV	#lo_addr(_MenuBit), W0
	BCLR	[W0], BitPos(_MenuBit+0)
;GRR3000LManagementPanel.mpas,901 :: 		ChargeStatus            := Charge;
	MOV	#1923, W0
	MOV	W0, _ChargeStatus
;GRR3000LManagementPanel.mpas,902 :: 		AcViewScreenBit         := 0;
	MOV	#lo_addr(_AcViewScreenBit), W0
	BCLR	[W0], BitPos(_AcViewScreenBit+0)
;GRR3000LManagementPanel.mpas,905 :: 		Leakage_Status          := 0;
	CLR	W0
	MOV	W0, _Leakage_Status
;GRR3000LManagementPanel.mpas,906 :: 		Leakage_Volt            := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Leakage_Volt
	MOV	W1, _Leakage_Volt+2
;GRR3000LManagementPanel.mpas,907 :: 		Adc_Leakage             := 0;
	CLR	W0
	MOV	W0, _Adc_Leakage
;GRR3000LManagementPanel.mpas,908 :: 		Pos_Leak_Ref            := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Pos_Leak_Ref
	MOV	W1, _Pos_Leak_Ref+2
;GRR3000LManagementPanel.mpas,909 :: 		Neg_Leak_Ref            := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Neg_Leak_Ref
	MOV	W1, _Neg_Leak_Ref+2
;GRR3000LManagementPanel.mpas,910 :: 		one_kohm_constant       := 0;
	CLR	W0
	MOV	W0, _one_kohm_constant
;GRR3000LManagementPanel.mpas,911 :: 		Unit_Leak0              := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Unit_Leak0
	MOV	W1, _Unit_Leak0+2
;GRR3000LManagementPanel.mpas,912 :: 		Unit_Leak1              := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Unit_Leak1
	MOV	W1, _Unit_Leak1+2
;GRR3000LManagementPanel.mpas,913 :: 		Unit_Leak2              := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Unit_Leak2
	MOV	W1, _Unit_Leak2+2
;GRR3000LManagementPanel.mpas,914 :: 		R_Leakage               := 0;
	CLR	W0
	MOV	W0, _R_Leakage
;GRR3000LManagementPanel.mpas,915 :: 		R_Leakage0              := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _R_Leakage0
	MOV	W1, _R_Leakage0+2
;GRR3000LManagementPanel.mpas,916 :: 		R_Leakage1              := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _R_Leakage1
	MOV	W1, _R_Leakage1+2
;GRR3000LManagementPanel.mpas,917 :: 		diff_leak_pos           := 0;
	MOV	#lo_addr(_diff_leak_pos), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,918 :: 		diff_leak_neg           := 0;
	MOV	#lo_addr(_diff_leak_neg), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,919 :: 		leakage_show_bit        := 0;
	MOV	#lo_addr(_leakage_show_bit), W0
	BCLR	[W0], BitPos(_leakage_show_bit+0)
;GRR3000LManagementPanel.mpas,920 :: 		Pos_Leakage_bit         := 0;
	MOV	#lo_addr(_Pos_Leakage_bit), W0
	BCLR	[W0], BitPos(_Pos_Leakage_bit+0)
;GRR3000LManagementPanel.mpas,921 :: 		Neg_Leakage_bit         := 0;
	MOV	#lo_addr(_Neg_Leakage_bit), W0
	BCLR	[W0], BitPos(_Neg_Leakage_bit+0)
;GRR3000LManagementPanel.mpas,926 :: 		Adc_Value         := 0;
	CLR	W0
	MOV	W0, _Adc_Value
;GRR3000LManagementPanel.mpas,927 :: 		LoadVolt_Real     := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _LoadVolt_Real
	MOV	W1, _LoadVolt_Real+2
;GRR3000LManagementPanel.mpas,928 :: 		Led1_Group        := 0;
	MOV	#lo_addr(_Led1_Group), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,929 :: 		Led2_Group        := 0;
	MOV	#lo_addr(_Led2_Group), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,930 :: 		Led3_Group        := 0;
	MOV	#lo_addr(_Led3_Group), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,931 :: 		TempHighBit       := 0;
	MOV	#lo_addr(_TempHighBit), W0
	BCLR	[W0], BitPos(_TempHighBit+0)
;GRR3000LManagementPanel.mpas,932 :: 		HighTempBit       := 0;
	MOV	#lo_addr(_HighTempBit), W0
	BCLR	[W0], BitPos(_HighTempBit+0)
;GRR3000LManagementPanel.mpas,933 :: 		ACFltCounter1     := 0;
	CLR	W0
	MOV	W0, _ACFltCounter1
;GRR3000LManagementPanel.mpas,934 :: 		ACFltCounter2     := 0;
	CLR	W0
	MOV	W0, _ACFltCounter2
;GRR3000LManagementPanel.mpas,935 :: 		AcOnCounter       := 0;
	CLR	W0
	MOV	W0, _AcOnCounter
;GRR3000LManagementPanel.mpas,936 :: 		LeakFltCounter1   := 0;
	CLR	W0
	MOV	W0, _LeakFltCounter1
;GRR3000LManagementPanel.mpas,937 :: 		LeakFltCounter2   := 0;
	CLR	W0
	MOV	W0, _LeakFltCounter2
;GRR3000LManagementPanel.mpas,938 :: 		TempFltCounter    := 0;
	CLR	W0
	MOV	W0, _TempFltCounter
;GRR3000LManagementPanel.mpas,939 :: 		Ac_MCB_Bit        := 0;
	MOV	#lo_addr(_Ac_MCB_Bit), W0
	BCLR	[W0], BitPos(_Ac_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,940 :: 		Load_MCB_Bit      := 0;
	MOV	#lo_addr(_Load_MCB_Bit), W0
	BCLR	[W0], BitPos(_Load_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,941 :: 		Batt_MCB_Bit      := 0;
	MOV	#lo_addr(_Batt_MCB_Bit), W0
	BCLR	[W0], BitPos(_Batt_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,942 :: 		DropCounter       := 0;
	CLR	W0
	MOV	W0, _DropCounter
;GRR3000LManagementPanel.mpas,943 :: 		Read_LoadVolt     := 0;
	CLR	W0
	MOV	W0, _Read_LoadVolt
;GRR3000LManagementPanel.mpas,944 :: 		FanFaultBit       := 0;
	MOV	#lo_addr(_FanFaultBit), W0
	BCLR	[W0], BitPos(_FanFaultBit+0)
;GRR3000LManagementPanel.mpas,945 :: 		FanFltBit         := 0;
	MOV	#lo_addr(_FanFltBit), W0
	BCLR	[W0], BitPos(_FanFltBit+0)
;GRR3000LManagementPanel.mpas,946 :: 		FanAmpsRaw        := 0;
	CLR	W0
	MOV	W0, _FanAmpsRaw
;GRR3000LManagementPanel.mpas,947 :: 		FanFaultCounter   := 0;
	CLR	W0
	MOV	W0, _FanFaultCounter
;GRR3000LManagementPanel.mpas,948 :: 		RedAmpsLimitBit   := 0;
	MOV	#lo_addr(_RedAmpsLimitBit), W0
	BCLR	[W0], BitPos(_RedAmpsLimitBit+0)
;GRR3000LManagementPanel.mpas,949 :: 		BattAmpsLimitBit  := 0;
	MOV	#lo_addr(_BattAmpsLimitBit), W0
	BCLR	[W0], BitPos(_BattAmpsLimitBit+0)
;GRR3000LManagementPanel.mpas,950 :: 		RedFaultBit       := 0;
	MOV	#lo_addr(_RedFaultBit), W0
	BCLR	[W0], BitPos(_RedFaultBit+0)
;GRR3000LManagementPanel.mpas,951 :: 		Tcomp2            := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _Tcomp2
	MOV	W1, _Tcomp2+2
;GRR3000LManagementPanel.mpas,952 :: 		TCompV            := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _TCompV
	MOV	W1, _TCompV+2
;GRR3000LManagementPanel.mpas,953 :: 		TempComp_Volt     := 0;
	CLR	W0
	MOV	W0, _TempComp_Volt
;GRR3000LManagementPanel.mpas,954 :: 		AcVoltReal        := 0;
	CLR	W0
	MOV	W0, _AcVoltReal
;GRR3000LManagementPanel.mpas,955 :: 		DcHighBit         := 0;
	MOV	#lo_addr(_DcHighBit), W0
	BCLR	[W0], BitPos(_DcHighBit+0)
;GRR3000LManagementPanel.mpas,956 :: 		DcLowBit          := 0;
	MOV	#lo_addr(_DcLowBit), W0
	BCLR	[W0], BitPos(_DcLowBit+0)
;GRR3000LManagementPanel.mpas,957 :: 		DDischargeCounter := 0;
	CLR	W0
	MOV	W0, _DDischargeCounter
;GRR3000LManagementPanel.mpas,958 :: 		DDschargeBit      := 0;
	MOV	#lo_addr(_DDschargeBit), W0
	BCLR	[W0], BitPos(_DDschargeBit+0)
;GRR3000LManagementPanel.mpas,959 :: 		AcHighFaultBit    := 0;
	MOV	#lo_addr(_AcHighFaultBit), W0
	BCLR	[W0], BitPos(_AcHighFaultBit+0)
;GRR3000LManagementPanel.mpas,960 :: 		AcLowFaultBit     := 0;
	MOV	#lo_addr(_AcLowFaultBit), W0
	BCLR	[W0], BitPos(_AcLowFaultBit+0)
;GRR3000LManagementPanel.mpas,961 :: 		Confirm_AcMenuBit := 0;
	MOV	#lo_addr(_Confirm_AcMenuBit), W0
	BCLR	[W0], BitPos(_Confirm_AcMenuBit+0)
;GRR3000LManagementPanel.mpas,962 :: 		Confirm_DcMenuBit := 0;
	MOV	#lo_addr(_Confirm_DcMenuBit), W0
	BCLR	[W0], BitPos(_Confirm_DcMenuBit+0)
;GRR3000LManagementPanel.mpas,963 :: 		Confirm_BattMenuBit := 0;
	MOV	#lo_addr(_Confirm_BattMenuBit), W0
	BCLR	[W0], BitPos(_Confirm_BattMenuBit+0)
;GRR3000LManagementPanel.mpas,964 :: 		Confirm_OperaMenuBit   := 0;
	MOV	#lo_addr(_Confirm_OperaMenuBit), W0
	BCLR	[W0], BitPos(_Confirm_OperaMenuBit+0)
;GRR3000LManagementPanel.mpas,965 :: 		Confirm_LeakaMenuBit   := 0;
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W0
	BCLR	[W0], BitPos(_Confirm_LeakaMenuBit+0)
;GRR3000LManagementPanel.mpas,966 :: 		Confirm_TempeMenuBit   := 0;
	MOV	#lo_addr(_Confirm_TempeMenuBit), W0
	BCLR	[W0], BitPos(_Confirm_TempeMenuBit+0)
;GRR3000LManagementPanel.mpas,967 :: 		Confirm_ClockMenuBit   := 0;
	MOV	#lo_addr(_Confirm_ClockMenuBit), W0
	BCLR	[W0], BitPos(_Confirm_ClockMenuBit+0)
;GRR3000LManagementPanel.mpas,968 :: 		Confirm_ModbusMenuBit  := 0;
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W0
	BCLR	[W0], BitPos(_Confirm_ModbusMenuBit+0)
;GRR3000LManagementPanel.mpas,971 :: 		PasswordArray[1]:= 0;
	MOV	#lo_addr(_PasswordArray), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,972 :: 		PasswordArray[2]:= 0;
	MOV	#lo_addr(_PasswordArray+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,973 :: 		PasswordArray[3]:= 0;
	MOV	#lo_addr(_PasswordArray+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,974 :: 		PasswordArray[4]:= 0;
	MOV	#lo_addr(_PasswordArray+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,975 :: 		ChngA                := 0;
	MOV	#lo_addr(_ChngA), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,976 :: 		ChngB                := 0;
	MOV	#lo_addr(_ChngB), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,977 :: 		ChngC                := 0;
	MOV	#lo_addr(_ChngC), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,978 :: 		ChngD                := 0;
	MOV	#lo_addr(_ChngD), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,979 :: 		PasswordHam          := 0;
	CLR	W0
	MOV	W0, _PasswordHam
;GRR3000LManagementPanel.mpas,980 :: 		Chng[1]              := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,981 :: 		Chng[2]              := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,982 :: 		Chng[3]              := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,983 :: 		Chng[4]              := 0;
	MOV	#lo_addr(_Chng+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,984 :: 		Chng[5]              := 0;
	MOV	#lo_addr(_Chng+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,985 :: 		Chng[6]              := 0;
	MOV	#lo_addr(_Chng+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,986 :: 		Chng[7]              := 0;
	MOV	#lo_addr(_Chng+6), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,987 :: 		Chng[8]              := 0;
	MOV	#lo_addr(_Chng+7), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,988 :: 		Chng[9]              := 0;
	MOV	#lo_addr(_Chng+8), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,989 :: 		Chng[10]             := 0;
	MOV	#lo_addr(_Chng+9), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,990 :: 		Chng[11]             := 0;
	MOV	#lo_addr(_Chng+10), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,991 :: 		Chng[12]             := 0;
	MOV	#lo_addr(_Chng+11), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,992 :: 		Chng[13]             := 0;
	MOV	#lo_addr(_Chng+12), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,993 :: 		Chng[14]             := 0;
	MOV	#lo_addr(_Chng+13), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,994 :: 		Chng[15]             := 0;
	MOV	#lo_addr(_Chng+14), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,996 :: 		RedVolt_HighPercent10Bit := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _RedVolt_HighPercent10Bit
	MOV	W1, _RedVolt_HighPercent10Bit+2
;GRR3000LManagementPanel.mpas,997 :: 		RedVolt_LowPercent10Bit  := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _RedVolt_LowPercent10Bit
	MOV	W1, _RedVolt_LowPercent10Bit+2
;GRR3000LManagementPanel.mpas,999 :: 		DropperInitCounter1      := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter1
;GRR3000LManagementPanel.mpas,1000 :: 		DropperInitCounter2      := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter2
;GRR3000LManagementPanel.mpas,1001 :: 		DropperInitCounter3      := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter3
;GRR3000LManagementPanel.mpas,1002 :: 		DropperInitCounter4      := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter4
;GRR3000LManagementPanel.mpas,1003 :: 		DropperCloseCounter      := 0;
	CLR	W0
	MOV	W0, _DropperCloseCounter
;GRR3000LManagementPanel.mpas,1011 :: 		Comm_ModbusFaultCounter  := 0;
	CLR	W0
	MOV	W0, _Comm_ModbusFaultCounter
;GRR3000LManagementPanel.mpas,1012 :: 		Modbus_FaultBit          := 0;
	MOV	#lo_addr(_Modbus_FaultBit), W0
	BCLR	[W0], BitPos(_Modbus_FaultBit+0)
;GRR3000LManagementPanel.mpas,1014 :: 		Comm_StatusBit           := 0; // haberleþme durum biti, 0= bütün datalar, 1= sadece AC datalar, 2= GTT Datalar
	MOV	#lo_addr(_Comm_StatusBit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1015 :: 		Start_Bit                := 0;
	MOV	#lo_addr(_Start_Bit), W0
	BCLR	[W0], BitPos(_Start_Bit+0)
;GRR3000LManagementPanel.mpas,1016 :: 		Start_Counter            := 0;
	CLR	W0
	MOV	W0, _Start_Counter
;GRR3000LManagementPanel.mpas,1023 :: 		LV_ScreenCounter         := 0;
	MOV	#lo_addr(_LV_ScreenCounter), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1024 :: 		AC_ScreenCounter         := 0;
	MOV	#lo_addr(_AC_ScreenCounter), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1025 :: 		LoadVoltRMS              := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _LoadVoltRMS
	MOV	W1, _LoadVoltRMS+2
;GRR3000LManagementPanel.mpas,1026 :: 		Read_LoadVoltRaw         := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Read_LoadVoltRaw
	MOV	W1, _Read_LoadVoltRaw+2
;GRR3000LManagementPanel.mpas,1028 :: 		N_LeakBit                := 0;
	MOV	#lo_addr(_N_LeakBit), W0
	BCLR	[W0], BitPos(_N_LeakBit+0)
;GRR3000LManagementPanel.mpas,1029 :: 		P_LeakBit                := 0;
	MOV	#lo_addr(_P_LeakBit), W0
	BCLR	[W0], BitPos(_P_LeakBit+0)
;GRR3000LManagementPanel.mpas,1030 :: 		Red_HighTemp             := 0;
	MOV	#lo_addr(_Red_HighTemp), W0
	BCLR	[W0], BitPos(_Red_HighTemp+0)
;GRR3000LManagementPanel.mpas,1032 :: 		TempComp                 := 0;
	MOV	#lo_addr(_TempComp), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1034 :: 		BattAmps_Calib           := 0;  // GTT kartý için kalibre edilecek datalarýn deðerleri
	MOV	#lo_addr(_BattAmps_Calib), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1035 :: 		RedAmps_Calib            := 0;
	MOV	#lo_addr(_RedAmps_Calib), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1036 :: 		RedVolt_Calib            := 0;
	MOV	#lo_addr(_RedVolt_Calib), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1037 :: 		Temp_Calib               := 0;
	MOV	#lo_addr(_Temp_Calib), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1038 :: 		BattAmps_CalibSend       := 0;  // GTT kartý için kalibre edilecek datalarýn deðerleri
	CLR	W0
	MOV	W0, _BattAmps_CalibSend
;GRR3000LManagementPanel.mpas,1039 :: 		RedAmps_CalibSend        := 0;
	CLR	W0
	MOV	W0, _RedAmps_CalibSend
;GRR3000LManagementPanel.mpas,1040 :: 		RedVolt_CalibSend        := 0;
	CLR	W0
	MOV	W0, _RedVolt_CalibSend
;GRR3000LManagementPanel.mpas,1041 :: 		Temp_CalibSend           := 0;
	CLR	W0
	MOV	W0, _Temp_CalibSend
;GRR3000LManagementPanel.mpas,1044 :: 		Read_Alpha               := 0;  // GTT kartý için okunacak ekstra datalar
	CLR	W0
	MOV	W0, _Read_Alpha
;GRR3000LManagementPanel.mpas,1045 :: 		Read_Phases              := 0;
	CLR	W0
	MOV	W0, _Read_Phases
;GRR3000LManagementPanel.mpas,1046 :: 		Read_DSW                 := 0;
	CLR	W0
	MOV	W0, _Read_DSW
;GRR3000LManagementPanel.mpas,1047 :: 		Read_NomVolt             := 0;
	CLR	W0
	MOV	W0, _Read_NomVolt
;GRR3000LManagementPanel.mpas,1048 :: 		Read_NomAmp              := 0;
	CLR	W0
	MOV	W0, _Read_NomAmp
;GRR3000LManagementPanel.mpas,1050 :: 		GTTSendDataConfirm       := 0;
	MOV	#lo_addr(_GTTSendDataConfirm), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1051 :: 		SendRepeatCounter        := 0;
	MOV	#lo_addr(_SendRepeatCounter), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1052 :: 		GTTCompleteBit           := 0;
	MOV	#lo_addr(_GTTCompleteBit), W0
	BCLR	[W0], BitPos(_GTTCompleteBit+0)
;GRR3000LManagementPanel.mpas,1053 :: 		Read_BatRawAmp           := 0;
	CLR	W0
	MOV	W0, _Read_BatRawAmp
;GRR3000LManagementPanel.mpas,1054 :: 		Read_RedRawAmp           := 0;
	CLR	W0
	MOV	W0, _Read_RedRawAmp
;GRR3000LManagementPanel.mpas,1055 :: 		Read_RedRawVlt           := 0;
	CLR	W0
	MOV	W0, _Read_RedRawVlt
;GRR3000LManagementPanel.mpas,1056 :: 		Read_CalOkBit            := 0;
	CLR	W0
	MOV	W0, _Read_CalOkBit
;GRR3000LManagementPanel.mpas,1057 :: 		Read_RatedVolt           := 0;
	CLR	W0
	MOV	W0, _Read_RatedVolt
;GRR3000LManagementPanel.mpas,1058 :: 		Read_RatedAmps           := 0;
	CLR	W0
	MOV	W0, _Read_RatedAmps
;GRR3000LManagementPanel.mpas,1059 :: 		DDschargeControlBit      := 0;
	MOV	#lo_addr(_DDschargeControlBit), W0
	BCLR	[W0], BitPos(_DDschargeControlBit+0)
;GRR3000LManagementPanel.mpas,1060 :: 		StopBit                  := 0;
	MOV	#lo_addr(_StopBit), W0
	BCLR	[W0], BitPos(_StopBit+0)
;GRR3000LManagementPanel.mpas,1061 :: 		StopCounter1             := 0;
	CLR	W0
	MOV	W0, _StopCounter1
;GRR3000LManagementPanel.mpas,1062 :: 		StopCounter2             := 0;
	CLR	W0
	MOV	W0, _StopCounter2
;GRR3000LManagementPanel.mpas,1063 :: 		BackupCounter            := 0;
	CLR	W0
	MOV	W0, _BackupCounter
;GRR3000LManagementPanel.mpas,1064 :: 		OpTime1                  := 13;
	MOV	#lo_addr(_OpTime1), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1065 :: 		OpTime2                  := 13;
	MOV	#lo_addr(_OpTime2), W1
	MOV.B	#13, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1067 :: 		QuitTime_Sec         := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _QuitTime_Sec
	MOV	W1, _QuitTime_Sec+2
;GRR3000LManagementPanel.mpas,1068 :: 		QuitTimeCounter      := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _QuitTimeCounter
	MOV	W1, _QuitTimeCounter+2
;GRR3000LManagementPanel.mpas,1069 :: 		CurveScan            := 0;
	MOV	#lo_addr(_CurveScan), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1070 :: 		DayCalc              := 0;
	MOV	#lo_addr(_DayCalc), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1071 :: 		Year_1               := 0;
	MOV	#lo_addr(_Year_1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1072 :: 		Year_2               := 0;
	MOV	#lo_addr(_Year_2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1073 :: 		Year_3               := 0;
	MOV	#lo_addr(_Year_3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1074 :: 		Year_4               := 0;
	MOV	#lo_addr(_Year_4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1075 :: 		Month_1              := 0;
	MOV	#lo_addr(_Month_1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1076 :: 		Month_2              := 0;
	MOV	#lo_addr(_Month_2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1077 :: 		Month_3              := 0;
	MOV	#lo_addr(_Month_3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1078 :: 		Month_4              := 0;
	MOV	#lo_addr(_Month_4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1079 :: 		Service1_Date        := 0;
	CLR	W0
	MOV	W0, _Service1_Date
;GRR3000LManagementPanel.mpas,1080 :: 		Service2_Date        := 0;
	CLR	W0
	MOV	W0, _Service2_Date
;GRR3000LManagementPanel.mpas,1081 :: 		Service3_Date        := 0;
	CLR	W0
	MOV	W0, _Service3_Date
;GRR3000LManagementPanel.mpas,1082 :: 		Service4_Date        := 0;
	CLR	W0
	MOV	W0, _Service4_Date
;GRR3000LManagementPanel.mpas,1083 :: 		Temp_Byte_Date       := 0;
	MOV	#lo_addr(_Temp_Byte_Date), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1084 :: 		BakimSelect          := 0;
	MOV	#lo_addr(_BakimSelect), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1085 :: 		Bkm_Status           := 0;
	MOV	#lo_addr(_Bkm_Status), W0
	BCLR	[W0], BitPos(_Bkm_Status+0)
;GRR3000LManagementPanel.mpas,1086 :: 		Bkm_Min              := 0;
	MOV	#lo_addr(_Bkm_Min), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1087 :: 		Bkm_Hour             := 0;
	MOV	#lo_addr(_Bkm_Hour), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1088 :: 		BakimStartBit        := 0;
	MOV	#lo_addr(_BakimStartBit), W0
	BCLR	[W0], BitPos(_BakimStartBit+0)
;GRR3000LManagementPanel.mpas,1089 :: 		Bakim_Start          := 0;
	MOV	#lo_addr(_Bakim_Start), W0
	BCLR	[W0], BitPos(_Bakim_Start+0)
;GRR3000LManagementPanel.mpas,1090 :: 		BakimLockBit         := 1;
	MOV	#lo_addr(_BakimLockBit), W0
	BSET	[W0], BitPos(_BakimLockBit+0)
;GRR3000LManagementPanel.mpas,1091 :: 		BakimControlBit      := 0;
	MOV	#lo_addr(_BakimControlBit), W0
	BCLR	[W0], BitPos(_BakimControlBit+0)
;GRR3000LManagementPanel.mpas,1092 :: 		QuitVoltBit          := 0;
	MOV	#lo_addr(_QuitVoltBit), W0
	BCLR	[W0], BitPos(_QuitVoltBit+0)
;GRR3000LManagementPanel.mpas,1093 :: 		Service_Charge_StateBit := 10;
	MOV	#lo_addr(_Service_Charge_StateBit), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1095 :: 		Bat_Service_Timer_bit := 0;
	MOV	#lo_addr(_Bat_Service_Timer_bit), W0
	BCLR	[W0], BitPos(_Bat_Service_Timer_bit+0)
;GRR3000LManagementPanel.mpas,1096 :: 		Bat_Service_Unit1     := 1;
	MOV	#lo_addr(_Bat_Service_Unit1), W0
	BSET	[W0], BitPos(_Bat_Service_Unit1+0)
;GRR3000LManagementPanel.mpas,1097 :: 		Bat_Service_Unit2     := 1;
	MOV	#lo_addr(_Bat_Service_Unit2), W0
	BSET	[W0], BitPos(_Bat_Service_Unit2+0)
;GRR3000LManagementPanel.mpas,1098 :: 		BakimInitBit          := 0;
	MOV	#lo_addr(_BakimInitBit), W0
	BCLR	[W0], BitPos(_BakimInitBit+0)
;GRR3000LManagementPanel.mpas,1099 :: 		Bat_Service_Timer     := 0;
	CLR	W0
	MOV	W0, _Bat_Service_Timer
;GRR3000LManagementPanel.mpas,1100 :: 		Bat_Curve_Scan_State_bit := 10;
	MOV	#lo_addr(_Bat_Curve_Scan_State_bit), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1101 :: 		Battery_Current_Capacity := 0;
	CLR	W0
	MOV	W0, _Battery_Current_Capacity
;GRR3000LManagementPanel.mpas,1102 :: 		Curve_Time               := 0;
	CLR	W0
	MOV	W0, _Curve_Time
;GRR3000LManagementPanel.mpas,1103 :: 		First_Bat_Current        := 0;
	CLR	W0
	MOV	W0, _First_Bat_Current
;GRR3000LManagementPanel.mpas,1104 :: 		bat_curve_scan_fail      := 0;
	MOV	#lo_addr(_bat_curve_scan_fail), W0
	BCLR	[W0], BitPos(_bat_curve_scan_fail+0)
;GRR3000LManagementPanel.mpas,1106 :: 		Redresor_OK_Bit          := 1;
	MOV	#lo_addr(_Redresor_OK_Bit), W0
	BSET	[W0], BitPos(_Redresor_OK_Bit+0)
;GRR3000LManagementPanel.mpas,1108 :: 		WriteText := '       ';
	MOV	#lo_addr(_WriteText), W1
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
;GRR3000LManagementPanel.mpas,1110 :: 		FirstStartUpBattMenu  := 0;
	MOV	#lo_addr(_FirstStartUpBattMenu), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1112 :: 		posleakbit  := 0;
	MOV	#lo_addr(_posleakbit), W0
	BCLR	[W0], BitPos(_posleakbit+0)
;GRR3000LManagementPanel.mpas,1113 :: 		negleakbit  := 0;
	MOV	#lo_addr(_negleakbit), W0
	BCLR	[W0], BitPos(_negleakbit+0)
;GRR3000LManagementPanel.mpas,1114 :: 		PosCounter  := 0;
	CLR	W0
	MOV	W0, _PosCounter
;GRR3000LManagementPanel.mpas,1115 :: 		NegCounter  := 0;
	CLR	W0
	MOV	W0, _NegCounter
;GRR3000LManagementPanel.mpas,1117 :: 		ADC_LeakRAW := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _ADC_LeakRAW
	MOV	W1, _ADC_LeakRAW+2
;GRR3000LManagementPanel.mpas,1118 :: 		ADC_LeakRAW2:= 0;
	CLR	W0
	CLR	W1
	MOV	W0, _ADC_LeakRAW2
	MOV	W1, _ADC_LeakRAW2+2
;GRR3000LManagementPanel.mpas,1119 :: 		LeakCounter := 0;
	MOV	#lo_addr(_LeakCounter), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1121 :: 		ScreenView        := 0;
	MOV	#lo_addr(_ScreenView), W0
	BCLR	[W0], BitPos(_ScreenView+0)
;GRR3000LManagementPanel.mpas,1122 :: 		ScreenCounter     := 0;
	CLR	W0
	MOV	W0, _ScreenCounter
;GRR3000LManagementPanel.mpas,1123 :: 		FreqHAM           := 0;
	CLR	W0
	MOV	W0, _FreqHAM
;GRR3000LManagementPanel.mpas,1124 :: 		FreqViewCounter   := 0;
	CLR	W0
	MOV	W0, _FreqViewCounter
;GRR3000LManagementPanel.mpas,1125 :: 		FreqLossCounter   := 0;
	CLR	W0
	MOV	W0, _FreqLossCounter
;GRR3000LManagementPanel.mpas,1126 :: 		FreqBit           := 0;
	MOV	#lo_addr(_FreqBit), W0
	BCLR	[W0], BitPos(_FreqBit+0)
;GRR3000LManagementPanel.mpas,1128 :: 		AC_Real           := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _AC_Real
	MOV	W1, _AC_Real+2
;GRR3000LManagementPanel.mpas,1129 :: 		Read_AC_RAW       := 0;
	CLR	W0
	MOV	W0, _Read_AC_RAW
;GRR3000LManagementPanel.mpas,1131 :: 		TotalPOWER_kW     := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _TotalPOWER_kW
	MOV	W1, _TotalPOWER_kW+2
;GRR3000LManagementPanel.mpas,1132 :: 		Reel_Current      := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _Reel_Current
	MOV	W1, _Reel_Current+2
;GRR3000LManagementPanel.mpas,1134 :: 		UpButonCounter    := 0;
	CLR	W0
	MOV	W0, _UpButonCounter
;GRR3000LManagementPanel.mpas,1135 :: 		UP_PressBit       := 0;
	MOV	#lo_addr(_UP_PressBit), W0
	BCLR	[W0], BitPos(_UP_PressBit+0)
;GRR3000LManagementPanel.mpas,1136 :: 		viewbyte          := 1;
	MOV	#lo_addr(_viewbyte), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1138 :: 		ACVolt_Different  := 0;
	MOV	#lo_addr(_ACVolt_Different), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1139 :: 		AC_ProtectBit     := 0;
	MOV	#lo_addr(_AC_ProtectBit), W0
	BCLR	[W0], BitPos(_AC_ProtectBit+0)
;GRR3000LManagementPanel.mpas,1140 :: 		ACVoltDifferentBit:= 0;
	MOV	#lo_addr(_ACVoltDifferentBit), W0
	BCLR	[W0], BitPos(_ACVoltDifferentBit+0)
;GRR3000LManagementPanel.mpas,1142 :: 		U1Volt_Diff       := 0;
	CLR	W0
	MOV	W0, _U1Volt_Diff
;GRR3000LManagementPanel.mpas,1143 :: 		U2Volt_Diff       := 0;
	CLR	W0
	MOV	W0, _U2Volt_Diff
;GRR3000LManagementPanel.mpas,1144 :: 		U3Volt_Diff       := 0;
	CLR	W0
	MOV	W0, _U3Volt_Diff
;GRR3000LManagementPanel.mpas,1146 :: 		KacakSensor       := 0;
	MOV	#lo_addr(_KacakSensor), W0
	BCLR	[W0], BitPos(_KacakSensor+0)
;GRR3000LManagementPanel.mpas,1147 :: 		CalibValue        := 0;
	MOV	#lo_addr(_CalibValue), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1149 :: 		CaseHeaterActiveBit := 0;
	MOV	#lo_addr(_CaseHeaterActiveBit), W0
	BCLR	[W0], BitPos(_CaseHeaterActiveBit+0)
;GRR3000LManagementPanel.mpas,1150 :: 		DiodeValue          := 0;
	MOV	#lo_addr(_DiodeValue), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1152 :: 		DischargeProtect_Pin := 1;
	BSET	RB3_bit, BitPos(RB3_bit+0)
;GRR3000LManagementPanel.mpas,1161 :: 		LogBit_Config(); // loglarýn datalarýný temizle
	CALL	_LogBit_Config
;GRR3000LManagementPanel.mpas,1165 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,1166 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1167 :: 		HC595_CS3_Pin := 0;
	BCLR	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,1168 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1170 :: 		SPI1_Write(0x00);
	CLR	W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,1172 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,1173 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1178 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,1179 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1180 :: 		HC595_CS2_Pin := 0;
	BCLR	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,1181 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1183 :: 		SPI1_Write(0x00);
	CLR	W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,1185 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,1186 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1192 :: 		HC595_CS1_Pin := 1;
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,1193 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1194 :: 		HC595_CS1_Pin := 0;
	BCLR	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,1195 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1197 :: 		SPI1_Write(0x00);
	CLR	W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,1199 :: 		HC595_CS1_Pin := 1;
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,1200 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1207 :: 		end;
L_end_Start_Register_Config:
	POP	W11
	POP	W10
	RETURN
; end of _Start_Register_Config

_AnalogRead:

;GRR3000LManagementPanel.mpas,1212 :: 		begin
;GRR3000LManagementPanel.mpas,1213 :: 		ADC_Ham    := 0;
; ADC_Ham start address is: 6 (W3)
	CLR	W3
	CLR	W4
;GRR3000LManagementPanel.mpas,1216 :: 		for TempSample := 1 to _Sample do
; TempSample start address is: 4 (W2)
	MOV	#1, W2
; ADC_Ham end address is: 6 (W3)
; TempSample end address is: 4 (W2)
L__AnalogRead5:
; TempSample start address is: 4 (W2)
; ADC_Ham start address is: 6 (W3)
	CP	W2, W11
	BRA LEU	L__AnalogRead4861
	GOTO	L__AnalogRead4857
L__AnalogRead4861:
;GRR3000LManagementPanel.mpas,1220 :: 		clrwdt;
	CLRWDT
;GRR3000LManagementPanel.mpas,1223 :: 		ADC_Ham := (ADC_Ham + ADC1_Read(Channel));
	ZE	W10, W10
	CALL	_ADC1_Read
	CLR	W1
; ADC_Ham start address is: 0 (W0)
	ADD	W3, W0, W0
	ADDC	W4, W1, W1
; ADC_Ham end address is: 6 (W3)
;GRR3000LManagementPanel.mpas,1224 :: 		Delay_us(10);
	MOV	#100, W7
L__AnalogRead10:
	DEC	W7
	BRA NZ	L__AnalogRead10
;GRR3000LManagementPanel.mpas,1226 :: 		end;
	CP	W2, W11
	BRA NZ	L__AnalogRead4862
	GOTO	L__AnalogRead4856
L__AnalogRead4862:
; TempSample start address is: 4 (W2)
	INC	W2
; TempSample end address is: 4 (W2)
	MOV	W0, W3
	MOV	W1, W4
; ADC_Ham end address is: 0 (W0)
; TempSample end address is: 4 (W2)
	GOTO	L__AnalogRead5
L__AnalogRead4856:
	MOV.D	W0, W2
	GOTO	L__AnalogRead9
L__AnalogRead4857:
;GRR3000LManagementPanel.mpas,1216 :: 		for TempSample := 1 to _Sample do
	MOV	W3, W2
	MOV	W4, W3
;GRR3000LManagementPanel.mpas,1226 :: 		end;
L__AnalogRead9:
;GRR3000LManagementPanel.mpas,1228 :: 		Result := ADC_Ham div _Sample;
; ADC_Ham start address is: 4 (W2)
	PUSH.D	W10
; ADC_Ham end address is: 4 (W2)
	MOV.D	W2, W0
	MOV	W11, W2
	CLR	W3
	SETM	W4
	CALL	__Divide_32x32
	POP.D	W10
; Result start address is: 2 (W1)
	MOV	W0, W1
;GRR3000LManagementPanel.mpas,1230 :: 		end;
	MOV	W1, W0
; Result end address is: 2 (W1)
L_end_AnalogRead:
	RETURN
; end of _AnalogRead

_FanAmpsRead:

;GRR3000LManagementPanel.mpas,1233 :: 		begin
;GRR3000LManagementPanel.mpas,1237 :: 		FanAmpsRaw := AnalogRead(2,Adc_Sample);
	PUSH	W10
	PUSH	W11
	MOV	#25, W11
	MOV.B	#2, W10
	CALL	_AnalogRead
	MOV	W0, _FanAmpsRaw
;GRR3000LManagementPanel.mpas,1258 :: 		if (FanAmpsRaw < 5) then
	CP	W0, #5
	BRA LTU	L__FanAmpsRead4864
	GOTO	L__FanAmpsRead14
L__FanAmpsRead4864:
;GRR3000LManagementPanel.mpas,1259 :: 		FanFaultBit     := 1 else
	MOV	#lo_addr(_FanFaultBit), W0
	BSET	[W0], BitPos(_FanFaultBit+0)
	GOTO	L__FanAmpsRead15
L__FanAmpsRead14:
;GRR3000LManagementPanel.mpas,1260 :: 		FanFaultBit     := 0;
	MOV	#lo_addr(_FanFaultBit), W0
	BCLR	[W0], BitPos(_FanFaultBit+0)
L__FanAmpsRead15:
;GRR3000LManagementPanel.mpas,1262 :: 		end;
L_end_FanAmpsRead:
	POP	W11
	POP	W10
	RETURN
; end of _FanAmpsRead

_LoadVoltageRead:
	LNK	#8

;GRR3000LManagementPanel.mpas,1265 :: 		begin
;GRR3000LManagementPanel.mpas,1267 :: 		Inc(LV_ScreenCounter);
	PUSH	W10
	PUSH	W11
	MOV.B	#1, W1
	MOV	#lo_addr(_LV_ScreenCounter), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,1269 :: 		if (LV_ScreenCounter < 8) then
	MOV	#lo_addr(_LV_ScreenCounter), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LTU	L__LoadVoltageRead4866
	GOTO	L__LoadVoltageRead18
L__LoadVoltageRead4866:
;GRR3000LManagementPanel.mpas,1272 :: 		LoadVolt_Real := 0.0;
	CLR	W0
	CLR	W1
	MOV	W0, _LoadVolt_Real
	MOV	W1, _LoadVolt_Real+2
;GRR3000LManagementPanel.mpas,1277 :: 		Dig_LoadVolt := AnalogRead(9,Adc_Sample);
	MOV	#25, W11
	MOV.B	#9, W10
	CALL	_AnalogRead
	MOV	W0, _Dig_LoadVolt
;GRR3000LManagementPanel.mpas,1282 :: 		ADC_LeakRAW  := AnalogRead(5,Adc_Sample);
	MOV	#25, W11
	MOV.B	#5, W10
	CALL	_AnalogRead
	CLR	W1
	MOV	W0, _ADC_LeakRAW
	MOV	W1, _ADC_LeakRAW+2
;GRR3000LManagementPanel.mpas,1283 :: 		ADC_LeakRAW2 := ADC_LeakRAW2 + ADC_LeakRAW;
	MOV	_ADC_LeakRAW, W1
	MOV	_ADC_LeakRAW+2, W2
	MOV	#lo_addr(_ADC_LeakRAW2), W0
	ADD	W1, [W0], [W0++]
	ADDC	W2, [W0], [W0--]
;GRR3000LManagementPanel.mpas,1285 :: 		LoadVolt_Real    := Dig_LoadVolt - dV_LoadVolt;
	MOV	_Dig_LoadVolt, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	MOV	_dV_LoadVolt, W0
	MOV	_dV_LoadVolt+2, W1
	SETM	W2
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	PUSH.D	W2
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Sub_FP
	POP.D	W2
	MOV	W0, _LoadVolt_Real
	MOV	W1, _LoadVolt_Real+2
;GRR3000LManagementPanel.mpas,1286 :: 		LoadVolt_Real    := ((LoadVolt_Real* Sample_RedVolt)/Sample_RedDigital);
	MOV	_Sample_RedVolt, W0
	CLR	W1
	CALL	__Long2Float
	MOV	_LoadVolt_Real, W2
	MOV	_LoadVolt_Real+2, W3
	CALL	__Mul_FP
	MOV	W0, [W14+4]
	MOV	W1, [W14+6]
	MOV	_Sample_RedDigital, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	[W14+4], W0
	MOV	[W14+6], W1
	PUSH.D	W2
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Div_FP
	POP.D	W2
	MOV	W0, _LoadVolt_Real
	MOV	W1, _LoadVolt_Real+2
;GRR3000LManagementPanel.mpas,1287 :: 		Read_LoadVoltRaw := (LoadVolt_Real * 10.0);
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _Read_LoadVoltRaw
	MOV	W1, _Read_LoadVoltRaw+2
;GRR3000LManagementPanel.mpas,1289 :: 		LoadVoltRMS      := LoadVoltRMS + Read_LoadVoltRaw;
	MOV	#lo_addr(_LoadVoltRMS), W2
	ADD	W0, [W2], [W2++]
	ADDC	W1, [W2], [W2--]
;GRR3000LManagementPanel.mpas,1291 :: 		Dig_LoadVoltLeakRAW := Dig_LoadVoltLeakRAW + Dig_LoadVolt; // kaçak için load volt digital deðerinin rms' i hesaplanacak, gürültüden etkilenmemesi için
	MOV	_Dig_LoadVolt, W1
	CLR	W2
	MOV	#lo_addr(_Dig_LoadVoltLeakRAW), W0
	ADD	W1, [W0], [W0++]
	ADDC	W2, [W0], [W0--]
;GRR3000LManagementPanel.mpas,1294 :: 		end else
	GOTO	L__LoadVoltageRead19
L__LoadVoltageRead18:
;GRR3000LManagementPanel.mpas,1295 :: 		if (LV_ScreenCounter > 7) then
	MOV	#lo_addr(_LV_ScreenCounter), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA GTU	L__LoadVoltageRead4867
	GOTO	L__LoadVoltageRead21
L__LoadVoltageRead4867:
;GRR3000LManagementPanel.mpas,1298 :: 		Read_LoadVolt    := LoadVoltRMS div 7; // 25 ayrý zamanda alýnan örneklerin ortalamasý
	MOV	#7, W2
	MOV	#0, W3
	MOV	_LoadVoltRMS, W0
	MOV	_LoadVoltRMS+2, W1
	SETM	W4
	CALL	__Divide_32x32
	MOV	W0, _Read_LoadVolt
;GRR3000LManagementPanel.mpas,1299 :: 		Dig_LoadVoltLeak := Dig_LoadVoltLeakRAW div 7; // kaçak için load volt' un digital deðeri rms olarak hesaplandý
	MOV	#7, W2
	MOV	#0, W3
	MOV	_Dig_LoadVoltLeakRAW, W0
	MOV	_Dig_LoadVoltLeakRAW+2, W1
	SETM	W4
	CALL	__Divide_32x32
	MOV	W0, _Dig_LoadVoltLeak
;GRR3000LManagementPanel.mpas,1301 :: 		Adc_Leakage  := ADC_LeakRAW2 div 7;
	MOV	#7, W2
	MOV	#0, W3
	MOV	_ADC_LeakRAW2, W0
	MOV	_ADC_LeakRAW2+2, W1
	SETM	W4
	CALL	__Divide_32x32
	MOV	W0, _Adc_Leakage
;GRR3000LManagementPanel.mpas,1302 :: 		ADC_LeakRAW2 := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _ADC_LeakRAW2
	MOV	W1, _ADC_LeakRAW2+2
;GRR3000LManagementPanel.mpas,1304 :: 		if (KacakSensor = 0) then // kaçak algýlama analog yapýlacaksa
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__LoadVoltageRead24
;GRR3000LManagementPanel.mpas,1307 :: 		Adc_Consideration;
	CALL	_Adc_Consideration
;GRR3000LManagementPanel.mpas,1309 :: 		Leakage_Status := (Read_LoadVolt/10)*(1833/((HucreSayisi*2)*1.36));
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
;GRR3000LManagementPanel.mpas,1310 :: 		Leakage_Volt := Adc_Leakage; /// Dijital Deðer
	MOV	_Adc_Leakage, W0
	CLR	W1
	MOV	W0, _Leakage_Volt
	MOV	W1, _Leakage_Volt+2
;GRR3000LManagementPanel.mpas,1311 :: 		if (Leakage_Volt <= 0) then Leakage_Volt := 0;
	MOV	_Leakage_Volt, W0
	MOV	_Leakage_Volt+2, W1
	CP	W0, #0
	CPB	W1, #0
	BRA LE	L__LoadVoltageRead4868
	GOTO	L__LoadVoltageRead27
L__LoadVoltageRead4868:
	CLR	W0
	CLR	W1
	MOV	W0, _Leakage_Volt
	MOV	W1, _Leakage_Volt+2
L__LoadVoltageRead27:
;GRR3000LManagementPanel.mpas,1313 :: 		Leakage_Function; // kaçak akýmlarý kontrol et
	CALL	_Leakage_Function
;GRR3000LManagementPanel.mpas,1315 :: 		end else
	GOTO	L__LoadVoltageRead25
L__LoadVoltageRead24:
;GRR3000LManagementPanel.mpas,1316 :: 		if (KacakSensor = 1) then // kaçak algýlama digital yapýlacaksa
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__LoadVoltageRead30
;GRR3000LManagementPanel.mpas,1319 :: 		if ((Adc_Leakage > 650)and(Adc_Leakage < 1638)) then // + kaçak durumunda 2,6V oluyor buna göre 2,40V (1965) ile 2,90V (2375) arasý + kaçak deðeri
	MOV	_Adc_Leakage, W2
	MOV	#650, W0
	CP	W2, W0
	CLR	W1
	BRA LEU	L__LoadVoltageRead4869
	COM	W1
L__LoadVoltageRead4869:
	MOV	#1638, W0
	CP	W2, W0
	CLR	W0
	BRA GEU	L__LoadVoltageRead4870
	COM	W0
L__LoadVoltageRead4870:
	AND	W1, W0, W0
	BRA NZ	L__LoadVoltageRead4871
	GOTO	L__LoadVoltageRead33
L__LoadVoltageRead4871:
;GRR3000LManagementPanel.mpas,1321 :: 		if (Leakage_Pos_Set >= 1) then                    // - kaçak durumunda 0,2V gerilim ölçülüyor   17.05.2019
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA GE	L__LoadVoltageRead4872
	GOTO	L__LoadVoltageRead36
L__LoadVoltageRead4872:
;GRR3000LManagementPanel.mpas,1323 :: 		posleakbit := 1;
	MOV	#lo_addr(_posleakbit), W0
	BSET	[W0], BitPos(_posleakbit+0)
;GRR3000LManagementPanel.mpas,1324 :: 		negleakbit := 0;
	MOV	#lo_addr(_negleakbit), W0
	BCLR	[W0], BitPos(_negleakbit+0)
;GRR3000LManagementPanel.mpas,1325 :: 		end else
	GOTO	L__LoadVoltageRead37
L__LoadVoltageRead36:
;GRR3000LManagementPanel.mpas,1326 :: 		if (Leakage_Pos_Set < 1) then
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__LoadVoltageRead4873
	GOTO	L__LoadVoltageRead39
L__LoadVoltageRead4873:
;GRR3000LManagementPanel.mpas,1328 :: 		posleakbit := 0;
	MOV	#lo_addr(_posleakbit), W0
	BCLR	[W0], BitPos(_posleakbit+0)
;GRR3000LManagementPanel.mpas,1329 :: 		negleakbit := 0;
	MOV	#lo_addr(_negleakbit), W0
	BCLR	[W0], BitPos(_negleakbit+0)
;GRR3000LManagementPanel.mpas,1330 :: 		end;
L__LoadVoltageRead39:
L__LoadVoltageRead37:
;GRR3000LManagementPanel.mpas,1331 :: 		end else
	GOTO	L__LoadVoltageRead34
L__LoadVoltageRead33:
;GRR3000LManagementPanel.mpas,1333 :: 		if (Adc_Leakage < 400) then // - kaçak durumunda 3,27V oluyor buna göre 3,00V (2457) ile 3,60V (2950) arasý - kaçak deðeri
	MOV	_Adc_Leakage, W1
	MOV	#400, W0
	CP	W1, W0
	BRA LTU	L__LoadVoltageRead4874
	GOTO	L__LoadVoltageRead42
L__LoadVoltageRead4874:
;GRR3000LManagementPanel.mpas,1335 :: 		if (Leakage_Neg_Set >= 1) then                   // - kaçak durumunda 0,2V gerilim ölçülüyor    17.05.2019
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA GE	L__LoadVoltageRead4875
	GOTO	L__LoadVoltageRead45
L__LoadVoltageRead4875:
;GRR3000LManagementPanel.mpas,1337 :: 		posleakbit := 0;
	MOV	#lo_addr(_posleakbit), W0
	BCLR	[W0], BitPos(_posleakbit+0)
;GRR3000LManagementPanel.mpas,1338 :: 		negleakbit := 1;
	MOV	#lo_addr(_negleakbit), W0
	BSET	[W0], BitPos(_negleakbit+0)
;GRR3000LManagementPanel.mpas,1339 :: 		end else
	GOTO	L__LoadVoltageRead46
L__LoadVoltageRead45:
;GRR3000LManagementPanel.mpas,1340 :: 		if (Leakage_Neg_Set < 1) then
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__LoadVoltageRead4876
	GOTO	L__LoadVoltageRead48
L__LoadVoltageRead4876:
;GRR3000LManagementPanel.mpas,1342 :: 		posleakbit := 0;
	MOV	#lo_addr(_posleakbit), W0
	BCLR	[W0], BitPos(_posleakbit+0)
;GRR3000LManagementPanel.mpas,1343 :: 		negleakbit := 0;
	MOV	#lo_addr(_negleakbit), W0
	BCLR	[W0], BitPos(_negleakbit+0)
;GRR3000LManagementPanel.mpas,1344 :: 		end;
L__LoadVoltageRead48:
L__LoadVoltageRead46:
;GRR3000LManagementPanel.mpas,1345 :: 		end else
	GOTO	L__LoadVoltageRead43
L__LoadVoltageRead42:
;GRR3000LManagementPanel.mpas,1347 :: 		posleakbit := 0;
	MOV	#lo_addr(_posleakbit), W0
	BCLR	[W0], BitPos(_posleakbit+0)
;GRR3000LManagementPanel.mpas,1348 :: 		negleakbit := 0;
	MOV	#lo_addr(_negleakbit), W0
	BCLR	[W0], BitPos(_negleakbit+0)
;GRR3000LManagementPanel.mpas,1349 :: 		end;
L__LoadVoltageRead43:
L__LoadVoltageRead34:
;GRR3000LManagementPanel.mpas,1351 :: 		end;
L__LoadVoltageRead30:
L__LoadVoltageRead25:
;GRR3000LManagementPanel.mpas,1354 :: 		LV_ScreenCounter    := 0;
	MOV	#lo_addr(_LV_ScreenCounter), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1355 :: 		LoadVoltRMS         := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _LoadVoltRMS
	MOV	W1, _LoadVoltRMS+2
;GRR3000LManagementPanel.mpas,1356 :: 		Read_LoadVoltRaw    := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Read_LoadVoltRaw
	MOV	W1, _Read_LoadVoltRaw+2
;GRR3000LManagementPanel.mpas,1357 :: 		Dig_LoadVoltLeakRAW := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _Dig_LoadVoltLeakRAW
	MOV	W1, _Dig_LoadVoltLeakRAW+2
;GRR3000LManagementPanel.mpas,1359 :: 		end;
L__LoadVoltageRead21:
L__LoadVoltageRead19:
;GRR3000LManagementPanel.mpas,1361 :: 		if (BakimStartBit = 1) then
	MOV	#lo_addr(_BakimStartBit), W0
	BTSS	[W0], BitPos(_BakimStartBit+0)
	GOTO	L__LoadVoltageRead51
;GRR3000LManagementPanel.mpas,1363 :: 		if (Read_LoadVolt < QuitVolt) then
	MOV	_Read_LoadVolt, W1
	MOV	#lo_addr(_QuitVolt), W0
	CP	W1, [W0]
	BRA LTU	L__LoadVoltageRead4877
	GOTO	L__LoadVoltageRead54
L__LoadVoltageRead4877:
;GRR3000LManagementPanel.mpas,1364 :: 		QuitVoltBit := 1 else QuitVoltBit := 0;
	MOV	#lo_addr(_QuitVoltBit), W0
	BSET	[W0], BitPos(_QuitVoltBit+0)
	GOTO	L__LoadVoltageRead55
L__LoadVoltageRead54:
	MOV	#lo_addr(_QuitVoltBit), W0
	BCLR	[W0], BitPos(_QuitVoltBit+0)
L__LoadVoltageRead55:
;GRR3000LManagementPanel.mpas,1365 :: 		end;
L__LoadVoltageRead51:
;GRR3000LManagementPanel.mpas,1367 :: 		if (Read_LoadVolt < 50) then // 5.0V küçükse sýfýr yaz
	MOV	#50, W1
	MOV	#lo_addr(_Read_LoadVolt), W0
	CP	W1, [W0]
	BRA GTU	L__LoadVoltageRead4878
	GOTO	L__LoadVoltageRead57
L__LoadVoltageRead4878:
;GRR3000LManagementPanel.mpas,1368 :: 		Read_LoadVolt := 0;
	CLR	W0
	MOV	W0, _Read_LoadVolt
L__LoadVoltageRead57:
;GRR3000LManagementPanel.mpas,1389 :: 		end;
L_end_LoadVoltageRead:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _LoadVoltageRead

_TempCompansation_Measurement:
	LNK	#4

;GRR3000LManagementPanel.mpas,1414 :: 		begin
;GRR3000LManagementPanel.mpas,1420 :: 		TempCompRAW     := AnalogRead(14,Adc_Sample);
	PUSH	W10
	PUSH	W11
	MOV	#25, W11
	MOV.B	#14, W10
	CALL	_AnalogRead
;GRR3000LManagementPanel.mpas,1424 :: 		TempRawReal := (TempCompRAW/0.817);
	CLR	W1
	CALL	__Long2Float
	MOV	#9961, W2
	MOV	#16209, W3
	CALL	__Div_FP
;GRR3000LManagementPanel.mpas,1425 :: 		TempComp    := TempRawReal / 10;
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	#lo_addr(_TempComp), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1427 :: 		if (ChargeMode = TComp) then // þarj modu sýcaklýk komp. ise
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__TempCompansation_Measurement4880
	GOTO	L__TempCompansation_Measurement61
L__TempCompansation_Measurement4880:
;GRR3000LManagementPanel.mpas,1429 :: 		TCompV        := ((TempComp - 20.0)*0.003);
	MOV	#lo_addr(_TempComp), W2
	SE	[W2], W0
	ASR	W0, #15, W1
	SETM	W2
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16800, W3
	CALL	__Sub_FP
	MOV	#39846, W2
	MOV	#15172, W3
	CALL	__Mul_FP
	MOV	W0, _TCompV
	MOV	W1, _TCompV+2
;GRR3000LManagementPanel.mpas,1430 :: 		Tcomp2        := NomHucreGerilim / 100.0;
	MOV	_NomHucreGerilim, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#17096, W3
	CALL	__Div_FP
	MOV	W0, _Tcomp2
	MOV	W1, _Tcomp2+2
;GRR3000LManagementPanel.mpas,1431 :: 		Tcomp2        := (HucreSayisi*(Tcomp2-TCompV))*10.0;
	MOV	_TCompV, W2
	MOV	_TCompV+2, W3
	CALL	__Sub_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_HucreSayisi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Mul_FP
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV	W0, _Tcomp2
	MOV	W1, _Tcomp2+2
;GRR3000LManagementPanel.mpas,1432 :: 		TempComp_Volt := Tcomp2;
	CALL	__Float2Longint
	MOV	W0, _TempComp_Volt
;GRR3000LManagementPanel.mpas,1433 :: 		end;
L__TempCompansation_Measurement61:
;GRR3000LManagementPanel.mpas,1437 :: 		end;
L_end_TempCompansation_Measurement:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _TempCompansation_Measurement

_Temperature_Measurement:

;GRR3000LManagementPanel.mpas,1441 :: 		begin
;GRR3000LManagementPanel.mpas,1446 :: 		PCB_TempHAM     := 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W0
	MOV	W0, _PCB_TempHAM
;GRR3000LManagementPanel.mpas,1449 :: 		PCB_TempHAM     := AnalogRead(15,Adc_Sample);
	MOV	#25, W11
	MOV.B	#15, W10
	CALL	_AnalogRead
	MOV	W0, _PCB_TempHAM
;GRR3000LManagementPanel.mpas,1453 :: 		PCBTempRawReal  := (PCB_TempHAM / 0.817);
	CLR	W1
	CALL	__Long2Float
	MOV	#9961, W2
	MOV	#16209, W3
	CALL	__Div_FP
;GRR3000LManagementPanel.mpas,1454 :: 		PCB_Temperature := PCBTempRawReal / 10;
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Div_FP
	CALL	__Float2Longint
	MOV	#lo_addr(_PCB_Temperature), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1455 :: 		PCB_Temperature := PCB_Temperature - 7; // sýcaklýk sensörü iþlemciye çok yakýn olduðu için
	MOV	#lo_addr(_PCB_Temperature), W1
	SUB.B	W0, #7, [W1]
;GRR3000LManagementPanel.mpas,1458 :: 		byteToStr(PCB_Temperature, PCB_TempText);
	MOV	#lo_addr(_PCB_Temperature), W0
	MOV	#lo_addr(_PCB_TempText), W11
	MOV.B	[W0], W10
	CALL	_ByteToStr
;GRR3000LManagementPanel.mpas,1459 :: 		Glcd_Set_Font(@Small3x7, 3, 7, 32);
	MOV	#___Lib_System_DefaultPage, W0
	MOV.B	#7, W13
	MOV.B	#3, W12
	MOV	#lo_addr(_Small3x7), W10
	MOV	W0, W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,1460 :: 		Glcd_Write_Text(PCB_TempText,0,0,black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_PCB_TempText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,1462 :: 		if ((PCB_Temperature > TempAlarmSet)or(Read_Temp = 1)) then // soðutucu sýcaklýðýndan kapandýðýnda da aþýrý sýcaklýk alarmý versin 27.01.2020
	MOV	#lo_addr(_PCB_Temperature), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_TempAlarmSet), W0
	CP.B	W1, [W0]
	CLR	W1
	BRA LEU	L__Temperature_Measurement4882
	COM	W1
L__Temperature_Measurement4882:
	MOV	_Read_Temp, W0
	CP	W0, #1
	CLR	W0
	BRA NZ	L__Temperature_Measurement4883
	COM	W0
L__Temperature_Measurement4883:
	IOR	W1, W0, W0
	BRA NZ	L__Temperature_Measurement4884
	GOTO	L__Temperature_Measurement65
L__Temperature_Measurement4884:
;GRR3000LManagementPanel.mpas,1463 :: 		TempHighBit := 1 else
	MOV	#lo_addr(_TempHighBit), W0
	BSET	[W0], BitPos(_TempHighBit+0)
	GOTO	L__Temperature_Measurement66
L__Temperature_Measurement65:
;GRR3000LManagementPanel.mpas,1464 :: 		TempHighBit := 0;
	MOV	#lo_addr(_TempHighBit), W0
	BCLR	[W0], BitPos(_TempHighBit+0)
L__Temperature_Measurement66:
;GRR3000LManagementPanel.mpas,1472 :: 		end;
L_end_Temperature_Measurement:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Temperature_Measurement

_AkuBakim_Kontrol:
	LNK	#4

;GRR3000LManagementPanel.mpas,1484 :: 		begin
;GRR3000LManagementPanel.mpas,1487 :: 		if ((Bkm_Status = 1)and(BakimControlBit = 0)) then // bakým yapýlacaksa
	MOV	#lo_addr(_Bkm_Status), W0
	BSET	W3, #0
	BTSS	[W0], BitPos(_Bkm_Status+0)
	BCLR	W3, #0
	MOV	#lo_addr(_BakimControlBit), W0
	BTSS	[W0], BitPos(_BakimControlBit+0)
	BSET	66, #0
	BTSC	[W0], BitPos(_BakimControlBit+0)
	BCLR	66, #0
	BTSC	W3, #0
	BTSS	66, #0
	BRA	L__AkuBakim_Kontrol4887
	BSET	W3, #0
	BRA	L__AkuBakim_Kontrol4889
L__AkuBakim_Kontrol4887:
	BCLR	W3, #0
L__AkuBakim_Kontrol4889:
	BTSS	W3, #0
	GOTO	L__AkuBakim_Kontrol69
;GRR3000LManagementPanel.mpas,1489 :: 		if (ServiceCycle = 1) then
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AkuBakim_Kontrol4890
	GOTO	L__AkuBakim_Kontrol72
L__AkuBakim_Kontrol4890:
;GRR3000LManagementPanel.mpas,1492 :: 		if ((Year = (Service1_Date mod 100))and(Month =(Service1_Date div 100))and
	MOV	#100, W2
	MOV	_Service1_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4891
	COM	W0
L__AkuBakim_Kontrol4891:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service1_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4892
	COM	W1
L__AkuBakim_Kontrol4892:
	MOV	[W14+0], W0
	AND	W0, W1, W1
;GRR3000LManagementPanel.mpas,1493 :: 		(day = 15)) then
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #15
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4893
	COM	W0
L__AkuBakim_Kontrol4893:
	AND	W1, W0, W0
	BRA NZ	L__AkuBakim_Kontrol4894
	GOTO	L__AkuBakim_Kontrol75
L__AkuBakim_Kontrol4894:
;GRR3000LManagementPanel.mpas,1496 :: 		if ((Hours = (Bakim_Start_Time div 100))and(Minutes = (Bakim_Start_Time mod 100))) then
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4895
	COM	W0
L__AkuBakim_Kontrol4895:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4896
	COM	W1
L__AkuBakim_Kontrol4896:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	BRA NZ	L__AkuBakim_Kontrol4897
	GOTO	L__AkuBakim_Kontrol78
L__AkuBakim_Kontrol4897:
;GRR3000LManagementPanel.mpas,1498 :: 		BakimStartBit     := 1;
	MOV	#lo_addr(_BakimStartBit), W0
	BSET	[W0], BitPos(_BakimStartBit+0)
;GRR3000LManagementPanel.mpas,1499 :: 		BakimControlBit   := 1; // bir daha girme
	MOV	#lo_addr(_BakimControlBit), W0
	BSET	[W0], BitPos(_BakimControlBit+0)
;GRR3000LManagementPanel.mpas,1500 :: 		BakimSelect       := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1502 :: 		DateCalculator(); // yeni tarih hesapla
	CALL	_DateCalculator
;GRR3000LManagementPanel.mpas,1504 :: 		end;
L__AkuBakim_Kontrol78:
;GRR3000LManagementPanel.mpas,1506 :: 		end;
L__AkuBakim_Kontrol75:
;GRR3000LManagementPanel.mpas,1508 :: 		end else
	GOTO	L__AkuBakim_Kontrol73
L__AkuBakim_Kontrol72:
;GRR3000LManagementPanel.mpas,1509 :: 		if (ServiceCycle = 2) then
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__AkuBakim_Kontrol4898
	GOTO	L__AkuBakim_Kontrol81
L__AkuBakim_Kontrol4898:
;GRR3000LManagementPanel.mpas,1512 :: 		if  (((Year = (Service1_Date mod 100))and(Month =(Service1_Date div 100))or
	MOV	#100, W2
	MOV	_Service1_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4899
	COM	W0
L__AkuBakim_Kontrol4899:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service1_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4900
	COM	W1
L__AkuBakim_Kontrol4900:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	MOV	W0, [W14+2]
;GRR3000LManagementPanel.mpas,1513 :: 		(Year = (Service2_Date mod 100))and(Month =(Service2_Date div 100)))and
	MOV	#100, W2
	MOV	_Service2_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4901
	COM	W0
L__AkuBakim_Kontrol4901:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service2_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4902
	COM	W1
L__AkuBakim_Kontrol4902:
	MOV	[W14+0], W0
	AND	W0, W1, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
;GRR3000LManagementPanel.mpas,1514 :: 		(day = 15)) then
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #15
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4903
	COM	W0
L__AkuBakim_Kontrol4903:
	AND	W1, W0, W0
	BRA NZ	L__AkuBakim_Kontrol4904
	GOTO	L__AkuBakim_Kontrol84
L__AkuBakim_Kontrol4904:
;GRR3000LManagementPanel.mpas,1519 :: 		if ((Hours = (Bakim_Start_Time div 100))and(Minutes = (Bakim_Start_Time mod 100))) then
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4905
	COM	W0
L__AkuBakim_Kontrol4905:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4906
	COM	W1
L__AkuBakim_Kontrol4906:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	BRA NZ	L__AkuBakim_Kontrol4907
	GOTO	L__AkuBakim_Kontrol87
L__AkuBakim_Kontrol4907:
;GRR3000LManagementPanel.mpas,1521 :: 		BakimStartBit     := 1;
	MOV	#lo_addr(_BakimStartBit), W0
	BSET	[W0], BitPos(_BakimStartBit+0)
;GRR3000LManagementPanel.mpas,1522 :: 		BakimControlBit   := 1; // bir daha girme
	MOV	#lo_addr(_BakimControlBit), W0
	BSET	[W0], BitPos(_BakimControlBit+0)
;GRR3000LManagementPanel.mpas,1524 :: 		if ((Year = (Service2_Date mod 100))and(Month =(Service2_Date div 100))) then
	MOV	#100, W2
	MOV	_Service2_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4908
	COM	W0
L__AkuBakim_Kontrol4908:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service2_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4909
	COM	W1
L__AkuBakim_Kontrol4909:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	BRA NZ	L__AkuBakim_Kontrol4910
	GOTO	L__AkuBakim_Kontrol90
L__AkuBakim_Kontrol4910:
;GRR3000LManagementPanel.mpas,1526 :: 		BakimSelect       := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1527 :: 		DateCalculator(); // yeni tarih hesapla
	CALL	_DateCalculator
;GRR3000LManagementPanel.mpas,1528 :: 		end;
L__AkuBakim_Kontrol90:
;GRR3000LManagementPanel.mpas,1531 :: 		end;
L__AkuBakim_Kontrol87:
;GRR3000LManagementPanel.mpas,1533 :: 		end;
L__AkuBakim_Kontrol84:
;GRR3000LManagementPanel.mpas,1535 :: 		end else
	GOTO	L__AkuBakim_Kontrol82
L__AkuBakim_Kontrol81:
;GRR3000LManagementPanel.mpas,1536 :: 		if (ServiceCycle = 3) then
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__AkuBakim_Kontrol4911
	GOTO	L__AkuBakim_Kontrol93
L__AkuBakim_Kontrol4911:
;GRR3000LManagementPanel.mpas,1539 :: 		if  (((Year = (Service1_Date mod 100))and(Month =(Service1_Date div 100))or
	MOV	#100, W2
	MOV	_Service1_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4912
	COM	W0
L__AkuBakim_Kontrol4912:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service1_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4913
	COM	W1
L__AkuBakim_Kontrol4913:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	MOV	W0, [W14+2]
;GRR3000LManagementPanel.mpas,1540 :: 		(Year = (Service2_Date mod 100))and(Month =(Service2_Date div 100))or
	MOV	#100, W2
	MOV	_Service2_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4914
	COM	W0
L__AkuBakim_Kontrol4914:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service2_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4915
	COM	W1
L__AkuBakim_Kontrol4915:
	MOV	[W14+0], W0
	AND	W0, W1, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
;GRR3000LManagementPanel.mpas,1541 :: 		(Year = (Service3_Date mod 100))and(Month =(Service3_Date div 100)))and
	MOV	#100, W2
	MOV	_Service3_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4916
	COM	W0
L__AkuBakim_Kontrol4916:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service3_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4917
	COM	W1
L__AkuBakim_Kontrol4917:
	MOV	[W14+0], W0
	AND	W0, W1, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
;GRR3000LManagementPanel.mpas,1542 :: 		(day = 15)) then
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #15
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4918
	COM	W0
L__AkuBakim_Kontrol4918:
	AND	W1, W0, W0
	BRA NZ	L__AkuBakim_Kontrol4919
	GOTO	L__AkuBakim_Kontrol96
L__AkuBakim_Kontrol4919:
;GRR3000LManagementPanel.mpas,1546 :: 		if ((Hours = (Bakim_Start_Time div 100))and(Minutes = (Bakim_Start_Time mod 100))) then
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4920
	COM	W0
L__AkuBakim_Kontrol4920:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4921
	COM	W1
L__AkuBakim_Kontrol4921:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	BRA NZ	L__AkuBakim_Kontrol4922
	GOTO	L__AkuBakim_Kontrol99
L__AkuBakim_Kontrol4922:
;GRR3000LManagementPanel.mpas,1548 :: 		BakimStartBit     := 1;
	MOV	#lo_addr(_BakimStartBit), W0
	BSET	[W0], BitPos(_BakimStartBit+0)
;GRR3000LManagementPanel.mpas,1549 :: 		BakimControlBit   := 1; // bir daha girme
	MOV	#lo_addr(_BakimControlBit), W0
	BSET	[W0], BitPos(_BakimControlBit+0)
;GRR3000LManagementPanel.mpas,1551 :: 		if ((Year = (Service3_Date mod 100))and(Month =(Service3_Date div 100))) then
	MOV	#100, W2
	MOV	_Service3_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4923
	COM	W0
L__AkuBakim_Kontrol4923:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service3_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4924
	COM	W1
L__AkuBakim_Kontrol4924:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	BRA NZ	L__AkuBakim_Kontrol4925
	GOTO	L__AkuBakim_Kontrol102
L__AkuBakim_Kontrol4925:
;GRR3000LManagementPanel.mpas,1553 :: 		BakimSelect       := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1554 :: 		DateCalculator(); // yeni tarih hesapla
	CALL	_DateCalculator
;GRR3000LManagementPanel.mpas,1555 :: 		end;
L__AkuBakim_Kontrol102:
;GRR3000LManagementPanel.mpas,1557 :: 		end;
L__AkuBakim_Kontrol99:
;GRR3000LManagementPanel.mpas,1559 :: 		end;
L__AkuBakim_Kontrol96:
;GRR3000LManagementPanel.mpas,1561 :: 		end else
	GOTO	L__AkuBakim_Kontrol94
L__AkuBakim_Kontrol93:
;GRR3000LManagementPanel.mpas,1562 :: 		if (ServiceCycle = 4) then
	MOV	#lo_addr(_ServiceCycle), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__AkuBakim_Kontrol4926
	GOTO	L__AkuBakim_Kontrol105
L__AkuBakim_Kontrol4926:
;GRR3000LManagementPanel.mpas,1565 :: 		if  (((Year = (Service1_Date mod 100))and(Month =(Service1_Date div 100))or
	MOV	#100, W2
	MOV	_Service1_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4927
	COM	W0
L__AkuBakim_Kontrol4927:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service1_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4928
	COM	W1
L__AkuBakim_Kontrol4928:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	MOV	W0, [W14+2]
;GRR3000LManagementPanel.mpas,1566 :: 		(Year = (Service2_Date mod 100))and(Month =(Service2_Date div 100))or
	MOV	#100, W2
	MOV	_Service2_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4929
	COM	W0
L__AkuBakim_Kontrol4929:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service2_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4930
	COM	W1
L__AkuBakim_Kontrol4930:
	MOV	[W14+0], W0
	AND	W0, W1, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
;GRR3000LManagementPanel.mpas,1567 :: 		(Year = (Service3_Date mod 100))and(Month =(Service3_Date div 100))or
	MOV	#100, W2
	MOV	_Service3_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4931
	COM	W0
L__AkuBakim_Kontrol4931:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service3_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4932
	COM	W1
L__AkuBakim_Kontrol4932:
	MOV	[W14+0], W0
	AND	W0, W1, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+2]
;GRR3000LManagementPanel.mpas,1568 :: 		(Year = (Service4_Date mod 100))and(Month =(Service4_Date div 100)))and
	MOV	#100, W2
	MOV	_Service4_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4933
	COM	W0
L__AkuBakim_Kontrol4933:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service4_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4934
	COM	W1
L__AkuBakim_Kontrol4934:
	MOV	[W14+0], W0
	AND	W0, W1, W1
	MOV	[W14+2], W0
	IOR	W0, W1, W1
;GRR3000LManagementPanel.mpas,1569 :: 		(day = 15)) then
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #15
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4935
	COM	W0
L__AkuBakim_Kontrol4935:
	AND	W1, W0, W0
	BRA NZ	L__AkuBakim_Kontrol4936
	GOTO	L__AkuBakim_Kontrol108
L__AkuBakim_Kontrol4936:
;GRR3000LManagementPanel.mpas,1572 :: 		if ((Hours = (Bakim_Start_Time div 100))and(Minutes = (Bakim_Start_Time mod 100))) then
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4937
	COM	W0
L__AkuBakim_Kontrol4937:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Bakim_Start_Time, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4938
	COM	W1
L__AkuBakim_Kontrol4938:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	BRA NZ	L__AkuBakim_Kontrol4939
	GOTO	L__AkuBakim_Kontrol111
L__AkuBakim_Kontrol4939:
;GRR3000LManagementPanel.mpas,1574 :: 		BakimStartBit     := 1;
	MOV	#lo_addr(_BakimStartBit), W0
	BSET	[W0], BitPos(_BakimStartBit+0)
;GRR3000LManagementPanel.mpas,1575 :: 		BakimControlBit   := 1; // bir daha girme
	MOV	#lo_addr(_BakimControlBit), W0
	BSET	[W0], BitPos(_BakimControlBit+0)
;GRR3000LManagementPanel.mpas,1577 :: 		if ((Year = (Service4_Date mod 100))and(Month =(Service4_Date div 100))) then
	MOV	#100, W2
	MOV	_Service4_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W0
	BRA NZ	L__AkuBakim_Kontrol4940
	COM	W0
L__AkuBakim_Kontrol4940:
	MOV	W0, [W14+0]
	MOV	#100, W2
	MOV	_Service4_Date, W0
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W1
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	CP	W0, W1
	CLR	W1
	BRA NZ	L__AkuBakim_Kontrol4941
	COM	W1
L__AkuBakim_Kontrol4941:
	MOV	[W14+0], W0
	AND	W0, W1, W0
	BRA NZ	L__AkuBakim_Kontrol4942
	GOTO	L__AkuBakim_Kontrol114
L__AkuBakim_Kontrol4942:
;GRR3000LManagementPanel.mpas,1579 :: 		BakimSelect       := 1;
	MOV	#lo_addr(_BakimSelect), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1580 :: 		DateCalculator(); // yeni tarih hesapla
	CALL	_DateCalculator
;GRR3000LManagementPanel.mpas,1581 :: 		end;
L__AkuBakim_Kontrol114:
;GRR3000LManagementPanel.mpas,1583 :: 		end;
L__AkuBakim_Kontrol111:
;GRR3000LManagementPanel.mpas,1585 :: 		end;
L__AkuBakim_Kontrol108:
;GRR3000LManagementPanel.mpas,1587 :: 		end;
L__AkuBakim_Kontrol105:
L__AkuBakim_Kontrol94:
L__AkuBakim_Kontrol82:
L__AkuBakim_Kontrol73:
;GRR3000LManagementPanel.mpas,1591 :: 		end;
L__AkuBakim_Kontrol69:
;GRR3000LManagementPanel.mpas,1594 :: 		end;
L_end_AkuBakim_Kontrol:
	ULNK
	RETURN
; end of _AkuBakim_Kontrol

_Read_Time:
	LNK	#0

;GRR3000LManagementPanel.mpas,1597 :: 		begin
	PUSH	W10
; p_week start address is: 6 (W3)
	MOV	[W14-8], W3
; p_month start address is: 8 (W4)
	MOV	[W14-10], W4
; p_year start address is: 10 (W5)
	MOV	[W14-12], W5
;GRR3000LManagementPanel.mpas,1600 :: 		clrwdt;
	CLRWDT
;GRR3000LManagementPanel.mpas,1603 :: 		I2C1_Start();                   // Issue start signal
	CALL	_I2C1_Start
;GRR3000LManagementPanel.mpas,1604 :: 		I2C1_Write(0xD0);           // Address DS1307, see DS1307 datasheet
	PUSH	W10
	MOV.B	#208, W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1605 :: 		I2C1_Write(0);                  // Start from address 0
	CLR	W10
	CALL	_I2C1_Write
	POP	W10
;GRR3000LManagementPanel.mpas,1606 :: 		I2C1_Restart();                 // Issue repeated start signal
	CALL	_I2C1_Restart
;GRR3000LManagementPanel.mpas,1607 :: 		I2C1_Write(0xD0 + 1);       // Address DS1307 for reading R/W=1
	PUSH	W10
	MOV.B	#209, W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1609 :: 		p_seconds^ := I2C1_Read(0);     // Read seconds byte
	CLR	W10
	CALL	_I2C1_Read
	MOV.B	W0, [W12]
;GRR3000LManagementPanel.mpas,1610 :: 		p_minutes^ := I2C1_Read(0);     // Read minutes byte
	CLR	W10
	CALL	_I2C1_Read
	MOV.B	W0, [W11]
;GRR3000LManagementPanel.mpas,1611 :: 		p_hours^   := I2C1_Read(0);       // Read hours byte
	CLR	W10
	CALL	_I2C1_Read
	POP	W10
	MOV.B	W0, [W10]
;GRR3000LManagementPanel.mpas,1612 :: 		p_week^    := I2C1_Read(0);
	CLR	W10
	CALL	_I2C1_Read
	MOV.B	W0, [W3]
; p_week end address is: 6 (W3)
;GRR3000LManagementPanel.mpas,1613 :: 		p_day^     := I2C1_Read(0);
	CLR	W10
	CALL	_I2C1_Read
	MOV.B	W0, [W13]
;GRR3000LManagementPanel.mpas,1614 :: 		p_month^   := I2C1_Read(0);
	CLR	W10
	CALL	_I2C1_Read
	MOV.B	W0, [W4]
; p_month end address is: 8 (W4)
;GRR3000LManagementPanel.mpas,1615 :: 		p_year^    := I2C1_Read(1);
	MOV	#1, W10
	CALL	_I2C1_Read
	MOV.B	W0, [W5]
; p_year end address is: 10 (W5)
;GRR3000LManagementPanel.mpas,1617 :: 		I2C1_Stop();                    // Issue stop signal
	CALL	_I2C1_Stop
;GRR3000LManagementPanel.mpas,1618 :: 		end;
L_end_Read_Time:
	POP	W10
	ULNK
	RETURN
; end of _Read_Time

_Write_Time:
	LNK	#0

;GRR3000LManagementPanel.mpas,1621 :: 		begin
	PUSH	W10
; c_week start address is: 6 (W3)
	MOV.B	[W14-8], W3
; c_month start address is: 8 (W4)
	MOV.B	[W14-10], W4
; c_year start address is: 10 (W5)
	MOV.B	[W14-12], W5
;GRR3000LManagementPanel.mpas,1623 :: 		ClrWdt;
	CLRWDT
;GRR3000LManagementPanel.mpas,1626 :: 		I2C1_Start();                        // issue start signal
	CALL	_I2C1_Start
;GRR3000LManagementPanel.mpas,1627 :: 		I2C1_Write(0xD0);                // address DS1307
	PUSH	W10
	MOV.B	#208, W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1628 :: 		I2C1_Write(0);                       // start from word at address (REG0)
	CLR	W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1629 :: 		I2C1_Write(0x80);                    // write $80 to REG0. (Pause_ms counter + 0 sec)
	MOV.B	#128, W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1631 :: 		I2C1_Write(c_minutes);               // write 0 to minutes word to (REG1)
	MOV.B	W11, W10
	CALL	_I2C1_Write
	POP	W10
;GRR3000LManagementPanel.mpas,1632 :: 		I2C1_Write(c_hours);                 // write 17 to hours word (24-hours mode)(REG2)
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1633 :: 		I2C1_Write(c_week);                  // write 2 - Monday (REG3)
	MOV.B	W3, W10
; c_week end address is: 6 (W3)
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1634 :: 		I2C1_Write(c_day);                   // write 4 to date word (REG4)
	MOV.B	W13, W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1635 :: 		I2C1_Write(c_month);                 // write 5 (May) to month word (REG5)
	MOV.B	W4, W10
; c_month end address is: 8 (W4)
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1636 :: 		I2C1_Write(c_year);                  // write 01 to year word (REG6)
	MOV.B	W5, W10
; c_year end address is: 10 (W5)
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1637 :: 		I2C1_Stop();                         // issue stop signal
	CALL	_I2C1_Stop
;GRR3000LManagementPanel.mpas,1639 :: 		I2C1_Start();                        // issue start signal
	CALL	_I2C1_Start
;GRR3000LManagementPanel.mpas,1640 :: 		I2C1_Write(0xD0);                // address DS1307
	MOV.B	#208, W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1641 :: 		I2C1_Write(0);                       // start from word at address 0
	CLR	W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1642 :: 		I2C1_Write(0 or c_seconds);          // write 0 to REG0 (enable counting + 0 sec)
	ZE	W12, W0
	MOV.B	W0, W10
	CALL	_I2C1_Write
;GRR3000LManagementPanel.mpas,1643 :: 		I2C1_Stop();                         // issue stop signal
	CALL	_I2C1_Stop
;GRR3000LManagementPanel.mpas,1644 :: 		end;
L_end_Write_Time:
	POP	W10
	ULNK
	RETURN
; end of _Write_Time

_Show_Time:

;GRR3000LManagementPanel.mpas,1647 :: 		begin
;GRR3000LManagementPanel.mpas,1649 :: 		clrwdt;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLRWDT
;GRR3000LManagementPanel.mpas,1662 :: 		Seconds  :=  Bcd2Dec16(seconds);
	MOV	#lo_addr(_Seconds), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Seconds), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1663 :: 		minutes  :=  Bcd2Dec16(minutes);
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Minutes), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1664 :: 		hours    :=  Bcd2Dec16(hours);
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Hours), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1665 :: 		week     :=  Bcd2Dec16(Week);
	MOV	#lo_addr(_Week), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Week), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1666 :: 		day      :=  Bcd2Dec16(Day);
	MOV	#lo_addr(_Day), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Day), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1667 :: 		month    :=  Bcd2Dec16(Month);
	MOV	#lo_addr(_Month), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Month), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1668 :: 		year     :=  Bcd2Dec16(Year);
	MOV	#lo_addr(_Year), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Year), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1670 :: 		AkuBakim_Kontrol();
	CALL	_AkuBakim_Kontrol
;GRR3000LManagementPanel.mpas,1677 :: 		Clock_Text[1]  := (Hours div 10)+48;
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Clock_Text), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1678 :: 		Clock_Text[2]  := (hours mod 10)+48;
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Clock_Text+1), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1680 :: 		Clock_Text[4]  := (Minutes div 10)+48;
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Clock_Text+3), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1681 :: 		Clock_Text[5]  := (Minutes mod 10)+48;
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Clock_Text+4), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1684 :: 		Glcd_Set_Font(@Small3x7,3,7,32);
	MOV	#___Lib_System_DefaultPage, W0
	MOV.B	#7, W13
	MOV.B	#3, W12
	MOV	#lo_addr(_Small3x7), W10
	MOV	W0, W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,1685 :: 		Glcd_Write_Char(Clock_Text[1],111,0,Black);
	MOV	#lo_addr(_Clock_Text), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#111, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1686 :: 		Glcd_Write_Char(Clock_Text[2],115,0,Black);
	MOV	#lo_addr(_Clock_Text+1), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#115, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1687 :: 		Glcd_Write_Char(Clock_Text[4],121,0,Black);
	MOV	#lo_addr(_Clock_Text+3), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#121, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1688 :: 		Glcd_Write_Char(Clock_Text[5],125,0,Black);
	MOV	#lo_addr(_Clock_Text+4), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#125, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1691 :: 		Date_text[1] := (day div 10)+48;
	MOV	#lo_addr(_Day), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Date_Text), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1692 :: 		Date_text[2] := (day mod 10)+48;
	MOV	#lo_addr(_Day), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Date_Text+1), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1694 :: 		Date_text[4] := (Month div 10)+48;
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Date_Text+3), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1695 :: 		Date_text[5] := (Month mod 10)+48;
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Date_Text+4), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1697 :: 		Date_text[7] := '2';
	MOV	#lo_addr(_Date_Text+6), W1
	MOV.B	#50, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1698 :: 		Date_text[8] := '0';
	MOV	#lo_addr(_Date_Text+7), W1
	MOV.B	#48, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1699 :: 		Date_text[9] := (Year div 10)+48;
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Date_Text+8), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1700 :: 		Date_text[10]:= (Year mod 10)+48;
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Date_Text+9), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,1702 :: 		Glcd_Write_Char(Date_text[1],68,0,Black);
	MOV	#lo_addr(_Date_Text), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#68, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1703 :: 		Glcd_Write_Char(Date_text[2],72,0,Black);
	MOV	#lo_addr(_Date_Text+1), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#72, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1704 :: 		Glcd_Write_Char(Date_text[4],79,0,Black);
	MOV	#lo_addr(_Date_Text+3), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#79, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1705 :: 		Glcd_Write_Char(Date_text[5],83,0,Black);
	MOV	#lo_addr(_Date_Text+4), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#83, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1706 :: 		Glcd_Write_Char(Date_text[7],90,0,Black);
	MOV	#lo_addr(_Date_Text+6), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#90, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1707 :: 		Glcd_Write_Char(Date_text[8],94,0,Black);
	MOV	#lo_addr(_Date_Text+7), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#94, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1708 :: 		Glcd_Write_Char(Date_text[9],98,0,Black);
	MOV	#lo_addr(_Date_Text+8), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#98, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1709 :: 		Glcd_Write_Char(Date_text[10],102,0,Black);
	MOV	#lo_addr(_Date_Text+9), W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#102, W11
	MOV.B	[W0], W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,1714 :: 		end;
L_end_Show_Time:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Show_Time

_Led_Write:

;GRR3000LManagementPanel.mpas,1717 :: 		begin
;GRR3000LManagementPanel.mpas,1718 :: 		HC595_CS1_Pin := 1;
	PUSH	W10
	PUSH	W11
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,1719 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,1720 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,1721 :: 		Delay_Cyc_Long(1);
	PUSH.D	W10
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1722 :: 		HC595_CS1_Pin := 0;
	BCLR	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,1723 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
	POP.D	W10
;GRR3000LManagementPanel.mpas,1725 :: 		SPI1_Write(Led1_Data);
	ZE	W10, W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,1727 :: 		HC595_CS1_Pin := 1;
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,1728 :: 		Delay_Cyc_Long(1);
	PUSH	W11
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1730 :: 		HC595_CS1_Pin := 1;
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,1731 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,1732 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,1733 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1734 :: 		HC595_CS2_Pin := 0;
	BCLR	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,1735 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
	POP	W11
;GRR3000LManagementPanel.mpas,1737 :: 		SPI1_Write(Led2_Data);
	ZE	W11, W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,1739 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,1740 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1742 :: 		HC595_CS1_Pin := 1;
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,1743 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,1744 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,1745 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1746 :: 		HC595_CS3_Pin := 0;
	BCLR	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,1747 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1749 :: 		SPI1_Write(Led3_Data);
	ZE	W12, W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,1751 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,1752 :: 		Delay_Cyc_Long(1);
	MOV	#1, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,1756 :: 		end;
L_end_Led_Write:
	POP	W11
	POP	W10
	RETURN
; end of _Led_Write

_ButonTimer:

;GRR3000LManagementPanel.mpas,1759 :: 		begin
;GRR3000LManagementPanel.mpas,1761 :: 		if ((Up_Button =0) or (Down_Button =0)) then
	BCLR	W3, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W3, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W3, #0
	BTSC	66, #0
	BRA	L__ButonTimer4948
	BCLR	W3, #0
	BRA	L__ButonTimer4951
L__ButonTimer4948:
	BSET	W3, #0
L__ButonTimer4951:
	BTSS	W3, #0
	GOTO	L__ButonTimer122
;GRR3000LManagementPanel.mpas,1764 :: 		ButonStop := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,1765 :: 		Inc(BtCounter1);
	MOV	#1, W1
	MOV	#lo_addr(_BtCounter1), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,1768 :: 		if (BtCounter1 < 2000) then
	MOV	_BtCounter1, W1
	MOV	#2000, W0
	CP	W1, W0
	BRA LTU	L__ButonTimer4952
	GOTO	L__ButonTimer125
L__ButonTimer4952:
;GRR3000LManagementPanel.mpas,1770 :: 		ButonStart := 1;
	MOV	#lo_addr(_ButonStart), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1771 :: 		ButonStop  := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,1772 :: 		end else
	GOTO	L__ButonTimer126
L__ButonTimer125:
;GRR3000LManagementPanel.mpas,1773 :: 		if ((BtCounter1 > 2000)and(BtCounter1 < 7000)) then
	MOV	_BtCounter1, W2
	MOV	#2000, W0
	CP	W2, W0
	CLR	W1
	BRA LEU	L__ButonTimer4953
	COM	W1
L__ButonTimer4953:
	MOV	#7000, W0
	CP	W2, W0
	CLR	W0
	BRA GEU	L__ButonTimer4954
	COM	W0
L__ButonTimer4954:
	AND	W1, W0, W0
	BRA NZ	L__ButonTimer4955
	GOTO	L__ButonTimer128
L__ButonTimer4955:
;GRR3000LManagementPanel.mpas,1775 :: 		ButonStart := 2;
	MOV	#lo_addr(_ButonStart), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1776 :: 		ButonStop  := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,1777 :: 		end else
	GOTO	L__ButonTimer129
L__ButonTimer128:
;GRR3000LManagementPanel.mpas,1778 :: 		if (BtCounter1 > 7000) then
	MOV	_BtCounter1, W1
	MOV	#7000, W0
	CP	W1, W0
	BRA GTU	L__ButonTimer4956
	GOTO	L__ButonTimer131
L__ButonTimer4956:
;GRR3000LManagementPanel.mpas,1780 :: 		ButonStart := 3;
	MOV	#lo_addr(_ButonStart), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1781 :: 		ButonStop  := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,1782 :: 		BtCounter1 := 7002;
	MOV	#7002, W0
	MOV	W0, _BtCounter1
;GRR3000LManagementPanel.mpas,1783 :: 		end;
L__ButonTimer131:
L__ButonTimer129:
L__ButonTimer126:
;GRR3000LManagementPanel.mpas,1785 :: 		end else
	GOTO	L__ButonTimer123
L__ButonTimer122:
;GRR3000LManagementPanel.mpas,1787 :: 		BtCounter1 := 0;
	CLR	W0
	MOV	W0, _BtCounter1
;GRR3000LManagementPanel.mpas,1788 :: 		end;
L__ButonTimer123:
;GRR3000LManagementPanel.mpas,1791 :: 		if (ButonStart = 1) then
	MOV	#lo_addr(_ButonStart), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__ButonTimer4957
	GOTO	L__ButonTimer134
L__ButonTimer4957:
;GRR3000LManagementPanel.mpas,1793 :: 		Inc(BtCounterNormal);
	MOV	#1, W1
	MOV	#lo_addr(_BtCounterNormal), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,1794 :: 		if (BtCounterNormal > 300) then
	MOV	_BtCounterNormal, W1
	MOV	#300, W0
	CP	W1, W0
	BRA GTU	L__ButonTimer4958
	GOTO	L__ButonTimer137
L__ButonTimer4958:
;GRR3000LManagementPanel.mpas,1796 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,1797 :: 		ButonStop       := 1;
	MOV	#lo_addr(_ButonStop), W0
	BSET	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,1798 :: 		ButonStart      := 0;
	MOV	#lo_addr(_ButonStart), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1799 :: 		end else ButonStop  := 0;
	GOTO	L__ButonTimer138
L__ButonTimer137:
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
L__ButonTimer138:
;GRR3000LManagementPanel.mpas,1800 :: 		end else
	GOTO	L__ButonTimer135
L__ButonTimer134:
;GRR3000LManagementPanel.mpas,1801 :: 		if (ButonStart = 2) then
	MOV	#lo_addr(_ButonStart), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__ButonTimer4959
	GOTO	L__ButonTimer140
L__ButonTimer4959:
;GRR3000LManagementPanel.mpas,1803 :: 		Inc(BtCounterNormal);
	MOV	#1, W1
	MOV	#lo_addr(_BtCounterNormal), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,1804 :: 		if (BtCounterNormal > 50) then
	MOV	#50, W1
	MOV	#lo_addr(_BtCounterNormal), W0
	CP	W1, [W0]
	BRA LTU	L__ButonTimer4960
	GOTO	L__ButonTimer143
L__ButonTimer4960:
;GRR3000LManagementPanel.mpas,1806 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,1807 :: 		ButonStop       := 1;
	MOV	#lo_addr(_ButonStop), W0
	BSET	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,1808 :: 		ButonStart      := 0;
	MOV	#lo_addr(_ButonStart), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1809 :: 		end else ButonStop  := 0;
	GOTO	L__ButonTimer144
L__ButonTimer143:
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
L__ButonTimer144:
;GRR3000LManagementPanel.mpas,1810 :: 		end else
	GOTO	L__ButonTimer141
L__ButonTimer140:
;GRR3000LManagementPanel.mpas,1811 :: 		if (ButonStart = 3) then
	MOV	#lo_addr(_ButonStart), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__ButonTimer4961
	GOTO	L__ButonTimer146
L__ButonTimer4961:
;GRR3000LManagementPanel.mpas,1813 :: 		Inc(BtCounterNormal);
	MOV	#1, W1
	MOV	#lo_addr(_BtCounterNormal), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,1814 :: 		if (BtCounterNormal > 5) then
	MOV	_BtCounterNormal, W0
	CP	W0, #5
	BRA GTU	L__ButonTimer4962
	GOTO	L__ButonTimer149
L__ButonTimer4962:
;GRR3000LManagementPanel.mpas,1816 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,1817 :: 		ButonStop       := 1;
	MOV	#lo_addr(_ButonStop), W0
	BSET	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,1818 :: 		ButonStart      := 0;
	MOV	#lo_addr(_ButonStart), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1819 :: 		end else ButonStop  := 0;
	GOTO	L__ButonTimer150
L__ButonTimer149:
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
L__ButonTimer150:
;GRR3000LManagementPanel.mpas,1820 :: 		end else BtCounterNormal := 0;
	GOTO	L__ButonTimer147
L__ButonTimer146:
	CLR	W0
	MOV	W0, _BtCounterNormal
L__ButonTimer147:
L__ButonTimer141:
L__ButonTimer135:
;GRR3000LManagementPanel.mpas,1822 :: 		end;
L_end_ButonTimer:
	RETURN
; end of _ButonTimer

_Run_Timers:

;GRR3000LManagementPanel.mpas,1825 :: 		begin
;GRR3000LManagementPanel.mpas,1828 :: 		T3CON := %1000000000010000; //start TMR3
	MOV	#32784, W0
	MOV	WREG, T3CON
;GRR3000LManagementPanel.mpas,1829 :: 		T4CON := 0x8000; //start TMR4
	MOV	#32768, W0
	MOV	WREG, T4CON
;GRR3000LManagementPanel.mpas,1833 :: 		end;
L_end_Run_Timers:
	RETURN
; end of _Run_Timers

_InitFreqCalculateTmr:

;GRR3000LManagementPanel.mpas,1836 :: 		begin
;GRR3000LManagementPanel.mpas,1838 :: 		IPC0   := IPC0 or $0020; //Interrupt priority level IC1IP<4:6> = 2
	MOV	#32, W1
	MOV	#lo_addr(IPC0), W0
	IOR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,1839 :: 		IEC0   := IEC0 or $0042; //Interrupt Input Compare module enable
	MOV	#66, W1
	MOV	#lo_addr(IEC0), W0
	IOR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,1840 :: 		PR2    := 15000; //PR2 register at maximum, timer2 free-running
	MOV	#15000, W0
	MOV	WREG, PR2
;GRR3000LManagementPanel.mpas,1842 :: 		IC1CON := $0084; //Configuration of Input  Capture module 1, selected TMR2,
	MOV	#132, W0
	MOV	WREG, IC1CON
;GRR3000LManagementPanel.mpas,1846 :: 		end;
L_end_InitFreqCalculateTmr:
	RETURN
; end of _InitFreqCalculateTmr

_Input1CaptureInt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GRR3000LManagementPanel.mpas,1849 :: 		begin
;GRR3000LManagementPanel.mpas,1851 :: 		TMR2 := 0X0000;
	CLR	TMR2
;GRR3000LManagementPanel.mpas,1852 :: 		IC1CON.0 := 0;
	BCLR	IC1CON, #0
;GRR3000LManagementPanel.mpas,1853 :: 		IC1CON.1 := 0;
	BCLR	IC1CON, #1
;GRR3000LManagementPanel.mpas,1854 :: 		IC1CON.2 := 0;
	BCLR	IC1CON, #2
;GRR3000LManagementPanel.mpas,1857 :: 		FreqHAM := IC1BUF ;
	MOV	IC1BUF, WREG
	MOV	W0, _FreqHAM
;GRR3000LManagementPanel.mpas,1858 :: 		FreqBit := 1;
	MOV	#lo_addr(_FreqBit), W0
	BSET	[W0], BitPos(_FreqBit+0)
;GRR3000LManagementPanel.mpas,1860 :: 		IFS0.1 := 0;      //Clear bit IC1IF (IFS<1>)
	BCLR	IFS0, #1
;GRR3000LManagementPanel.mpas,1861 :: 		IC1CON.0 := 0;
	BCLR	IC1CON, #0
;GRR3000LManagementPanel.mpas,1862 :: 		IC1CON.1 := 0;
	BCLR	IC1CON, #1
;GRR3000LManagementPanel.mpas,1863 :: 		IC1CON.2 := 1;
	BSET	IC1CON, #2
;GRR3000LManagementPanel.mpas,1866 :: 		end;
L_end_Input1CaptureInt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Input1CaptureInt

_Explode:

;GRR3000LManagementPanel.mpas,1869 :: 		begin
;GRR3000LManagementPanel.mpas,1870 :: 		_Data.7   := 0;
	BCLR.B	W10, #7
;GRR3000LManagementPanel.mpas,1871 :: 		_Data.6   := 0;
	BCLR.B	W10, #6
;GRR3000LManagementPanel.mpas,1872 :: 		Result    := _Data;
; Result start address is: 2 (W1)
	MOV.B	W10, W1
;GRR3000LManagementPanel.mpas,1873 :: 		end;
	MOV.B	W1, W0
; Result end address is: 2 (W1)
L_end_Explode:
	RETURN
; end of _Explode

_Collect:

;GRR3000LManagementPanel.mpas,1877 :: 		begin
;GRR3000LManagementPanel.mpas,1878 :: 		Temp_Word := _DataHi Shl 8;
	ZE	W11, W0
	SL	W0, #8, W1
;GRR3000LManagementPanel.mpas,1879 :: 		Result    := (Temp_Word or _DataLo);
	ZE	W10, W0
; Result start address is: 2 (W1)
	IOR	W1, W0, W1
;GRR3000LManagementPanel.mpas,1881 :: 		end;
	MOV	W1, W0
; Result end address is: 2 (W1)
L_end_Collect:
	RETURN
; end of _Collect

_Comm_Interface:
	LNK	#2

;GRR3000LManagementPanel.mpas,1885 :: 		begin
;GRR3000LManagementPanel.mpas,1886 :: 		Temp_Array := 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,1888 :: 		Temp_Array.7 := Control;
	ADD	W14, #0, W0
	BSET.B	[W0], #7
	BTSS	W10, #0
	BCLR.B	[W0], #7
;GRR3000LManagementPanel.mpas,1889 :: 		Temp_Array.6 := RW;
	ADD	W14, #0, W0
	BSET.B	[W0], #6
	BTSS	W11, #0
	BCLR.B	[W0], #6
;GRR3000LManagementPanel.mpas,1890 :: 		Temp_Array.5 := Style.5;
	ADD	W14, #0, W0
	BSET.B	[W0], #5
	BTSS.B	W12, #5
	BCLR.B	[W0], #5
;GRR3000LManagementPanel.mpas,1891 :: 		Temp_Array.4 := Style.4;
	ADD	W14, #0, W0
	BSET.B	[W0], #4
	BTSS.B	W12, #4
	BCLR.B	[W0], #4
;GRR3000LManagementPanel.mpas,1892 :: 		Temp_Array.3 := Style.3;
	ADD	W14, #0, W0
	BSET.B	[W0], #3
	BTSS.B	W12, #3
	BCLR.B	[W0], #3
;GRR3000LManagementPanel.mpas,1893 :: 		Temp_Array.2 := Style.2;
	ADD	W14, #0, W0
	BSET.B	[W0], #2
	BTSS.B	W12, #2
	BCLR.B	[W0], #2
;GRR3000LManagementPanel.mpas,1894 :: 		Temp_Array.1 := Style.1;
	ADD	W14, #0, W0
	BSET.B	[W0], #1
	BTSS.B	W12, #1
	BCLR.B	[W0], #1
;GRR3000LManagementPanel.mpas,1895 :: 		Temp_Array.0 := Style.0;
	ADD	W14, #0, W0
	BSET.B	[W0], #0
	BTSS.B	W12, #0
	BCLR.B	[W0], #0
;GRR3000LManagementPanel.mpas,1897 :: 		MasterData[0] := Temp_Array;
	MOV	#lo_addr(_MasterData), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1898 :: 		MasterData[1] := lo(_Data);
	MOV	#lo_addr(_MasterData+1), W1
	MOV.B	[W14-8], W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1899 :: 		MasterData[2] := Hi(_Data);
	SUB	W14, #8, W0
	INC	W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_MasterData+2), W0
	MOV.B	W1, [W0]
;GRR3000LManagementPanel.mpas,1900 :: 		MasterData[3] := 3;
	MOV	#lo_addr(_MasterData+3), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1901 :: 		MasterData[4] := 0;
	MOV	#lo_addr(_MasterData+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1902 :: 		MasterData[5] := 0;
	MOV	#lo_addr(_MasterData+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1905 :: 		Rs485master_Send(MasterData, 3, Addr);
	MOV.B	W13, W12
	MOV.B	#3, W11
	MOV	#lo_addr(_MasterData), W10
	CALL	_Rs485master_Send
;GRR3000LManagementPanel.mpas,1910 :: 		end;
L_end_Comm_Interface:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Comm_Interface

_Gemta_Uart_Write:

;GRR3000LManagementPanel.mpas,1935 :: 		begin
;GRR3000LManagementPanel.mpas,1943 :: 		MasterData[0]   := Buffer0;         // hangi verinin iþleneceði bilgisi
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_MasterData), W0
	MOV.B	W10, [W0]
;GRR3000LManagementPanel.mpas,1944 :: 		MasterData[1]   := lo(Buffer1);     // yazýlacak verinin low byte' ý
	MOV	#lo_addr(_MasterData+1), W0
	MOV.B	W12, [W0]
;GRR3000LManagementPanel.mpas,1945 :: 		MasterData[2]   := hi(Buffer1);     // yazýlacak verinin high byte' ý
	MOV	#lo_addr(W12), W0
	INC	W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_MasterData+2), W0
	MOV.B	W1, [W0]
;GRR3000LManagementPanel.mpas,1946 :: 		MasterData[3]   := 3;               // 3 byte' lýk veri olduðu için
	MOV	#lo_addr(_MasterData+3), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1947 :: 		MasterData[4]   := 0;
	MOV	#lo_addr(_MasterData+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1948 :: 		MasterData[5]   := 0;
	MOV	#lo_addr(_MasterData+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1949 :: 		MasterData[6]   := Addr;
	MOV	#lo_addr(_MasterData+6), W0
	MOV.B	W11, [W0]
;GRR3000LManagementPanel.mpas,1950 :: 		Rs485master_Send(MasterData, 3, Addr);
	MOV.B	W11, W12
	MOV.B	#3, W11
	MOV	#lo_addr(_MasterData), W10
	CALL	_Rs485master_Send
;GRR3000LManagementPanel.mpas,1952 :: 		ReceiveAddr := ReceiveData[6];
	MOV	#lo_addr(_ReceiveAddr), W1
	MOV	#lo_addr(_ReceiveData+6), W0
	MOV.B	[W0], [W1]
;GRR3000LManagementPanel.mpas,1953 :: 		ReceiveData[6] := 0;
	MOV	#lo_addr(_ReceiveData+6), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,1956 :: 		end;
L_end_Gemta_Uart_Write:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Gemta_Uart_Write

_Uart2_Interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GRR3000LManagementPanel.mpas,1959 :: 		begin
;GRR3000LManagementPanel.mpas,1961 :: 		RS485Master_Receive(ReceiveData);
	PUSH	W10
	MOV	#lo_addr(_ReceiveData), W10
	CALL	_Rs485master_Receive
;GRR3000LManagementPanel.mpas,1963 :: 		U2RXIF_bit := 0;                  // ensure interrupt not pending
	BCLR	U2RXIF_bit, BitPos(U2RXIF_bit+0)
;GRR3000LManagementPanel.mpas,1968 :: 		end;
L_end_Uart2_Interrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Uart2_Interrupt

_Uart_Communication_Function:
	LNK	#52

;GRR3000LManagementPanel.mpas,1975 :: 		begin
;GRR3000LManagementPanel.mpas,1978 :: 		Write_UartData[1]   := 0; // GTT-I Read_BattAmps
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W0
	MOV	W0, [W14+4]
;GRR3000LManagementPanel.mpas,1979 :: 		Write_UartData[2]   := 0; // GTT-I Read_TotalAmps
	CLR	W0
	MOV	W0, [W14+6]
;GRR3000LManagementPanel.mpas,1980 :: 		Write_UartData[3]   := 0; // GTT-I Read_RedVolt
	CLR	W0
	MOV	W0, [W14+8]
;GRR3000LManagementPanel.mpas,1981 :: 		Write_UartData[4]   := 0; // GTT-I Read_Temp
	CLR	W0
	MOV	W0, [W14+10]
;GRR3000LManagementPanel.mpas,1982 :: 		Write_UartData[5]   := RectifierVoltage_Set;
	MOV	_RectifierVoltage_Set, W0
	MOV	W0, [W14+12]
;GRR3000LManagementPanel.mpas,1983 :: 		Write_UartData[6]   := (HucreSayisi*20); // redresör nominal gerilimi  55*20=1100 þeklinde
	MOV	_HucreSayisi, W1
	MOV	#20, W0
	MUL.UU	W1, W0, W0
	MOV	W0, [W14+14]
;GRR3000LManagementPanel.mpas,1984 :: 		Write_UartData[7]   := (RedresorAkim*10);    // redresör nominal akým 60*10=600 þeklinde
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, [W14+16]
;GRR3000LManagementPanel.mpas,1985 :: 		Write_UartData[8]   := BatteryAmpsSet;  // akü akým set
	MOV	_BatteryAmpsSet, W0
	MOV	W0, [W14+18]
;GRR3000LManagementPanel.mpas,1986 :: 		Write_UartData[9]   := DcOutAmpsSet;    // dc çýkýþ akýmý set
	MOV	_DcOutAmpsSet, W0
	MOV	W0, [W14+20]
;GRR3000LManagementPanel.mpas,1987 :: 		Write_UartData[10]  := 0; // tristör kartý þarj deþarj bilgisi
	CLR	W0
	MOV	W0, [W14+22]
;GRR3000LManagementPanel.mpas,1988 :: 		Write_UartData[11]  := 0; // GTT-I Alpha Deðeri
	CLR	W0
	MOV	W0, [W14+24]
;GRR3000LManagementPanel.mpas,1989 :: 		Write_UartData[12]  := 0; // GTT-I Fazlar
	CLR	W0
	MOV	W0, [W14+26]
;GRR3000LManagementPanel.mpas,1990 :: 		Write_UartData[13]  := 0; // GTT-I Dip-Switchler
	CLR	W0
	MOV	W0, [W14+28]
;GRR3000LManagementPanel.mpas,1991 :: 		Write_UartData[14]  := 0; // GTT-I NomVolt deðeri
	CLR	W0
	MOV	W0, [W14+30]
;GRR3000LManagementPanel.mpas,1992 :: 		Write_UartData[15]  := 0; // GTT-I NomAmps deðeri
	CLR	W0
	MOV	W0, [W14+32]
;GRR3000LManagementPanel.mpas,1993 :: 		Write_UartData[16]  := 0; // GTT-I BatRawAmps
	CLR	W0
	MOV	W0, [W14+34]
;GRR3000LManagementPanel.mpas,1994 :: 		Write_UartData[17]  := 0; // GTT-I RedRawAmps
	CLR	W0
	MOV	W0, [W14+36]
;GRR3000LManagementPanel.mpas,1995 :: 		Write_UartData[18]  := 0; // GTT-I RedRawVlt
	CLR	W0
	MOV	W0, [W14+38]
;GRR3000LManagementPanel.mpas,1996 :: 		Write_UartData[19]  := 0; // GTT-I RatedVolt  GTT-I'ye kaydedilen data
	CLR	W0
	MOV	W0, [W14+40]
;GRR3000LManagementPanel.mpas,1997 :: 		Write_UartData[20]  := 0; // GTT-I RatedAmps  GTT-I'ye kaydedilen data
	CLR	W0
	MOV	W0, [W14+42]
;GRR3000LManagementPanel.mpas,1998 :: 		Write_UartData[21]  := StopBit; // durdurma biti   1 = Dur, 0 = Çalýþ
	MOV	#lo_addr(_StopBit), W1
	MOV	#44, W0
	ADD	W14, W0, W0
	CLR	[W0]
	BTSC	[W1], BitPos(_StopBit+0)
	INC	[W0], [W0]
;GRR3000LManagementPanel.mpas,1999 :: 		Write_UartData[22]  := CalibValue;
	MOV	#lo_addr(_CalibValue), W0
	ZE	[W0], W0
	MOV	W0, [W14+46]
;GRR3000LManagementPanel.mpas,2000 :: 		Write_UartData[23]  := Relay_Out_Data; //
	MOV	_Relay_Out_Data, W0
	MOV	W0, [W14+48]
;GRR3000LManagementPanel.mpas,2001 :: 		Write_UartData[24]  := DiodeValue;
	MOV	#lo_addr(_DiodeValue), W0
	ZE	[W0], W0
	MOV	W0, [W14+50]
;GRR3000LManagementPanel.mpas,2003 :: 		IstekByte     := _Request;
; IstekByte start address is: 6 (W3)
	MOV.B	W10, W3
;GRR3000LManagementPanel.mpas,2004 :: 		Veri          := Write_UartData[_Request];
	ZE	W10, W0
	DEC	W0
	ADD	W14, #4, W1
	SL	W0, #1, W0
	ADD	W1, W0, W0
; Veri start address is: 8 (W4)
	MOV	[W0], W4
;GRR3000LManagementPanel.mpas,2007 :: 		if ((IstekByte >0)and(IstekByte <23)) then Addr := Comm_ThrystorModule_Addr else
	CP.B	W10, #0
	CLR	W1
	BRA LEU	L__Uart_Communication_Function4972
	COM	W1
L__Uart_Communication_Function4972:
	CP.B	W10, #23
	CLR	W0
	BRA GEU	L__Uart_Communication_Function4973
	COM	W0
L__Uart_Communication_Function4973:
	AND	W1, W0, W0
	BRA NZ	L__Uart_Communication_Function4974
	GOTO	L__Uart_Communication_Function161
L__Uart_Communication_Function4974:
	MOV.B	#10, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Uart_Communication_Function162
L__Uart_Communication_Function161:
;GRR3000LManagementPanel.mpas,2008 :: 		if (IstekByte = 23) then Addr := Comm_RelayModule;
	CP.B	W3, #23
	BRA Z	L__Uart_Communication_Function4975
	GOTO	L__Uart_Communication_Function164
L__Uart_Communication_Function4975:
	MOV.B	#13, W0
	MOV.B	W0, [W14+0]
L__Uart_Communication_Function164:
L__Uart_Communication_Function162:
;GRR3000LManagementPanel.mpas,2009 :: 		if (IstekByte = 24) then Addr := Comm_ThrystorModule_Addr;
	CP.B	W3, #24
	BRA Z	L__Uart_Communication_Function4976
	GOTO	L__Uart_Communication_Function167
L__Uart_Communication_Function4976:
	MOV.B	#10, W0
	MOV.B	W0, [W14+0]
L__Uart_Communication_Function167:
;GRR3000LManagementPanel.mpas,2011 :: 		if ((ReceiveData[0] = IstekByte)and(ReceiveData[6] = Addr)) then // gelen data istenilen dataya eþit ise
	MOV	#lo_addr(_ReceiveData), W0
	CP.B	W3, [W0]
	CLR	W2
	BRA NZ	L__Uart_Communication_Function4977
	COM	W2
L__Uart_Communication_Function4977:
	MOV	#lo_addr(_ReceiveData+6), W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	CLR	W0
	BRA NZ	L__Uart_Communication_Function4978
	COM	W0
L__Uart_Communication_Function4978:
	AND	W2, W0, W0
	CP0	W0
	BRA NZ	L__Uart_Communication_Function4979
	GOTO	L__Uart_Communication_Function170
L__Uart_Communication_Function4979:
; Veri end address is: 8 (W4)
;GRR3000LManagementPanel.mpas,2013 :: 		Inc(Request_Counter);
	MOV	#1, W1
	MOV	#lo_addr(_Request_Counter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2014 :: 		SaveData := Collect(ReceiveData[1], ReceiveData[2]); // lo ve hi datalarý birleþtir
	MOV	#lo_addr(_ReceiveData+2), W1
	MOV	#lo_addr(_ReceiveData+1), W0
	MOV.B	[W1], W11
	MOV.B	[W0], W10
	CALL	_Collect
	MOV	W0, [W14+2]
;GRR3000LManagementPanel.mpas,2015 :: 		RequestFault_Counter   := 0; // hata olmadý sayacý sýfýrla
	CLR	W0
	MOV	W0, _RequestFault_Counter
;GRR3000LManagementPanel.mpas,2017 :: 		end else
	GOTO	L__Uart_Communication_Function171
L__Uart_Communication_Function170:
;GRR3000LManagementPanel.mpas,2018 :: 		if ((ReceiveData[0] <> IstekByte)or(ReceiveData[6] <> Addr)) then // gelen data istenilen dataya eþit deðil ise
; Veri start address is: 8 (W4)
	MOV	#lo_addr(_ReceiveData), W0
	CP.B	W3, [W0]
	CLR	W2
	BRA Z	L__Uart_Communication_Function4980
	COM	W2
L__Uart_Communication_Function4980:
	MOV	#lo_addr(_ReceiveData+6), W0
	MOV.B	[W0], W1
	ADD	W14, #0, W0
	CP.B	W1, [W0]
	CLR	W0
	BRA Z	L__Uart_Communication_Function4981
	COM	W0
L__Uart_Communication_Function4981:
	IOR	W2, W0, W0
	BRA NZ	L__Uart_Communication_Function4982
	GOTO	L__Uart_Communication_Function173
L__Uart_Communication_Function4982:
;GRR3000LManagementPanel.mpas,2020 :: 		Gemta_Uart_Write(_Request, Addr, Veri);
	PUSH	W3
; Veri end address is: 8 (W4)
	MOV	W4, W12
	MOV.B	[W14+0], W11
	CALL	_Gemta_Uart_Write
	POP	W3
;GRR3000LManagementPanel.mpas,2021 :: 		MCU_State_LED := not MCU_State_LED;
	BTG	RA14_bit, BitPos(RA14_bit+0)
;GRR3000LManagementPanel.mpas,2022 :: 		Inc(RequestFault_Counter);
	MOV	#1, W1
	MOV	#lo_addr(_RequestFault_Counter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2023 :: 		if (RequestFault_Counter > 2) then
	MOV	_RequestFault_Counter, W0
	CP	W0, #2
	BRA GTU	L__Uart_Communication_Function4983
	GOTO	L__Uart_Communication_Function176
L__Uart_Communication_Function4983:
;GRR3000LManagementPanel.mpas,2025 :: 		RequestFault_Counter   := 0;
	CLR	W0
	MOV	W0, _RequestFault_Counter
;GRR3000LManagementPanel.mpas,2026 :: 		Inc(Request_Counter);
	MOV	#1, W1
	MOV	#lo_addr(_Request_Counter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2027 :: 		end;
L__Uart_Communication_Function176:
;GRR3000LManagementPanel.mpas,2028 :: 		end;
L__Uart_Communication_Function173:
L__Uart_Communication_Function171:
;GRR3000LManagementPanel.mpas,2030 :: 		if (Request_Counter > 24) then Request_Counter := 1;
	MOV	_Request_Counter, W0
	CP	W0, #24
	BRA GTU	L__Uart_Communication_Function4984
	GOTO	L__Uart_Communication_Function179
L__Uart_Communication_Function4984:
	MOV	#1, W0
	MOV	W0, _Request_Counter
L__Uart_Communication_Function179:
;GRR3000LManagementPanel.mpas,2032 :: 		if (ReceiveData[6] = Comm_ThrystorModule_Addr) then
	MOV	#lo_addr(_ReceiveData+6), W0
	MOV.B	[W0], W0
	CP.B	W0, #10
	BRA Z	L__Uart_Communication_Function4985
	GOTO	L__Uart_Communication_Function182
L__Uart_Communication_Function4985:
;GRR3000LManagementPanel.mpas,2034 :: 		if (IstekByte  = 1) then Read_BattAmps    := SaveData else
	CP.B	W3, #1
	BRA Z	L__Uart_Communication_Function4986
	GOTO	L__Uart_Communication_Function185
L__Uart_Communication_Function4986:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_BattAmps
	GOTO	L__Uart_Communication_Function186
L__Uart_Communication_Function185:
;GRR3000LManagementPanel.mpas,2035 :: 		if (IstekByte = 2)  then Read_TotalAmps   := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #2
	BRA Z	L__Uart_Communication_Function4987
	GOTO	L__Uart_Communication_Function188
L__Uart_Communication_Function4987:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_TotalAmps
	GOTO	L__Uart_Communication_Function189
L__Uart_Communication_Function188:
;GRR3000LManagementPanel.mpas,2036 :: 		if (IstekByte = 3)  then Read_RedVolt     := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #3
	BRA Z	L__Uart_Communication_Function4988
	GOTO	L__Uart_Communication_Function191
L__Uart_Communication_Function4988:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_RedVolt
	GOTO	L__Uart_Communication_Function192
L__Uart_Communication_Function191:
;GRR3000LManagementPanel.mpas,2037 :: 		if (IstekByte = 4)  then Read_Temp        := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #4
	BRA Z	L__Uart_Communication_Function4989
	GOTO	L__Uart_Communication_Function194
L__Uart_Communication_Function4989:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_Temp
	GOTO	L__Uart_Communication_Function195
L__Uart_Communication_Function194:
;GRR3000LManagementPanel.mpas,2038 :: 		if (IstekByte = 10) then ChargeStatus     := savedata else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #10
	BRA Z	L__Uart_Communication_Function4990
	GOTO	L__Uart_Communication_Function197
L__Uart_Communication_Function4990:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _ChargeStatus
	GOTO	L__Uart_Communication_Function198
L__Uart_Communication_Function197:
;GRR3000LManagementPanel.mpas,2039 :: 		if (IstekByte = 11) then Read_Alpha       := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #11
	BRA Z	L__Uart_Communication_Function4991
	GOTO	L__Uart_Communication_Function200
L__Uart_Communication_Function4991:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_Alpha
	GOTO	L__Uart_Communication_Function201
L__Uart_Communication_Function200:
;GRR3000LManagementPanel.mpas,2040 :: 		if (IstekByte = 12) then Read_Phases      := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #12
	BRA Z	L__Uart_Communication_Function4992
	GOTO	L__Uart_Communication_Function203
L__Uart_Communication_Function4992:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_Phases
	GOTO	L__Uart_Communication_Function204
L__Uart_Communication_Function203:
;GRR3000LManagementPanel.mpas,2041 :: 		if (IstekByte = 13) then Read_DSW         := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #13
	BRA Z	L__Uart_Communication_Function4993
	GOTO	L__Uart_Communication_Function206
L__Uart_Communication_Function4993:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_DSW
	GOTO	L__Uart_Communication_Function207
L__Uart_Communication_Function206:
;GRR3000LManagementPanel.mpas,2042 :: 		if (IstekByte = 14) then Read_NomVolt     := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #14
	BRA Z	L__Uart_Communication_Function4994
	GOTO	L__Uart_Communication_Function209
L__Uart_Communication_Function4994:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_NomVolt
	GOTO	L__Uart_Communication_Function210
L__Uart_Communication_Function209:
;GRR3000LManagementPanel.mpas,2043 :: 		if (IstekByte = 15) then Read_NomAmp      := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #15
	BRA Z	L__Uart_Communication_Function4995
	GOTO	L__Uart_Communication_Function212
L__Uart_Communication_Function4995:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_NomAmp
	GOTO	L__Uart_Communication_Function213
L__Uart_Communication_Function212:
;GRR3000LManagementPanel.mpas,2044 :: 		if (IstekByte = 16) then Read_BatRawAmp   := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #16
	BRA Z	L__Uart_Communication_Function4996
	GOTO	L__Uart_Communication_Function215
L__Uart_Communication_Function4996:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_BatRawAmp
	GOTO	L__Uart_Communication_Function216
L__Uart_Communication_Function215:
;GRR3000LManagementPanel.mpas,2045 :: 		if (IstekByte = 17) then Read_RedRawAmp   := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #17
	BRA Z	L__Uart_Communication_Function4997
	GOTO	L__Uart_Communication_Function218
L__Uart_Communication_Function4997:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_RedRawAmp
	GOTO	L__Uart_Communication_Function219
L__Uart_Communication_Function218:
;GRR3000LManagementPanel.mpas,2046 :: 		if (IstekByte = 18) then Read_RedRawVlt   := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #18
	BRA Z	L__Uart_Communication_Function4998
	GOTO	L__Uart_Communication_Function221
L__Uart_Communication_Function4998:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_RedRawVlt
	GOTO	L__Uart_Communication_Function222
L__Uart_Communication_Function221:
;GRR3000LManagementPanel.mpas,2047 :: 		if (IstekByte = 19) then Read_RatedVolt   := SaveData else
; IstekByte start address is: 6 (W3)
	CP.B	W3, #19
	BRA Z	L__Uart_Communication_Function4999
	GOTO	L__Uart_Communication_Function224
L__Uart_Communication_Function4999:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_RatedVolt
	GOTO	L__Uart_Communication_Function225
L__Uart_Communication_Function224:
;GRR3000LManagementPanel.mpas,2048 :: 		if (IstekByte = 20) then Read_RatedAmps   := SaveData;
; IstekByte start address is: 6 (W3)
	CP.B	W3, #20
	BRA Z	L__Uart_Communication_Function5000
	GOTO	L__Uart_Communication_Function227
L__Uart_Communication_Function5000:
; IstekByte end address is: 6 (W3)
	MOV	[W14+2], W0
	MOV	W0, _Read_RatedAmps
L__Uart_Communication_Function227:
L__Uart_Communication_Function225:
L__Uart_Communication_Function222:
L__Uart_Communication_Function219:
L__Uart_Communication_Function216:
L__Uart_Communication_Function213:
L__Uart_Communication_Function210:
L__Uart_Communication_Function207:
L__Uart_Communication_Function204:
L__Uart_Communication_Function201:
L__Uart_Communication_Function198:
L__Uart_Communication_Function195:
L__Uart_Communication_Function192:
L__Uart_Communication_Function189:
L__Uart_Communication_Function186:
;GRR3000LManagementPanel.mpas,2049 :: 		end;
L__Uart_Communication_Function182:
;GRR3000LManagementPanel.mpas,2051 :: 		end;
L_end_Uart_Communication_Function:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Uart_Communication_Function

_Comm_Fault_Check:

;GRR3000LManagementPanel.mpas,2054 :: 		begin
;GRR3000LManagementPanel.mpas,2056 :: 		if (ReceiveAddr <> Comm_ThrystorModule_Addr) then // tristör kartýndan haberleþme hatasý varsa
	MOV	#lo_addr(_ReceiveAddr), W0
	MOV.B	[W0], W0
	CP.B	W0, #10
	BRA NZ	L__Comm_Fault_Check5002
	GOTO	L__Comm_Fault_Check231
L__Comm_Fault_Check5002:
;GRR3000LManagementPanel.mpas,2058 :: 		Inc(ThryFaultCount); // tristör haberleþme hata sayacýný artýr
	MOV	#1, W1
	MOV	#lo_addr(_ThryFaultCount), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2059 :: 		if (ThryFaultCount > 5000) then // 2sn boyunca hata varsa
	MOV	_ThryFaultCount, W1
	MOV	#5000, W0
	CP	W1, W0
	BRA GTU	L__Comm_Fault_Check5003
	GOTO	L__Comm_Fault_Check234
L__Comm_Fault_Check5003:
;GRR3000LManagementPanel.mpas,2061 :: 		ThryFaultCount     := 0;
	CLR	W0
	MOV	W0, _ThryFaultCount
;GRR3000LManagementPanel.mpas,2062 :: 		ThryCommFault      := 255;
	MOV	#lo_addr(_ThryCommFault), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2063 :: 		end;
L__Comm_Fault_Check234:
;GRR3000LManagementPanel.mpas,2064 :: 		end else
	GOTO	L__Comm_Fault_Check232
L__Comm_Fault_Check231:
;GRR3000LManagementPanel.mpas,2066 :: 		ThryFaultCount     := 0;
	CLR	W0
	MOV	W0, _ThryFaultCount
;GRR3000LManagementPanel.mpas,2067 :: 		ThryCommFault      := 0;
	MOV	#lo_addr(_ThryCommFault), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2068 :: 		LogBit_GTTCommFault:= 0;
	MOV	#lo_addr(_LogBit_GTTCommFault), W0
	BCLR	[W0], BitPos(_LogBit_GTTCommFault+0)
;GRR3000LManagementPanel.mpas,2069 :: 		end;
L__Comm_Fault_Check232:
;GRR3000LManagementPanel.mpas,2072 :: 		if (ReceiveAddr <> Comm_RelayModule) then // röle kartýndan haberleþme hatasý varsa
	MOV	#lo_addr(_ReceiveAddr), W0
	MOV.B	[W0], W0
	CP.B	W0, #13
	BRA NZ	L__Comm_Fault_Check5004
	GOTO	L__Comm_Fault_Check237
L__Comm_Fault_Check5004:
;GRR3000LManagementPanel.mpas,2074 :: 		Inc(RlyFaultCount); // röle haberleþme hata sayacýný artýr
	MOV	#1, W1
	MOV	#lo_addr(_RlyFaultCount), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2075 :: 		if (RlyFaultCount > 5000) then // 2sn boyunca hata varsa
	MOV	_RlyFaultCount, W1
	MOV	#5000, W0
	CP	W1, W0
	BRA GTU	L__Comm_Fault_Check5005
	GOTO	L__Comm_Fault_Check240
L__Comm_Fault_Check5005:
;GRR3000LManagementPanel.mpas,2077 :: 		RlyFaultCount     := 0;
	CLR	W0
	MOV	W0, _RlyFaultCount
;GRR3000LManagementPanel.mpas,2078 :: 		RlyCommFault      := 255;
	MOV	#lo_addr(_RlyCommFault), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2079 :: 		end;
L__Comm_Fault_Check240:
;GRR3000LManagementPanel.mpas,2080 :: 		end else
	GOTO	L__Comm_Fault_Check238
L__Comm_Fault_Check237:
;GRR3000LManagementPanel.mpas,2082 :: 		RlyFaultCount      := 0;
	CLR	W0
	MOV	W0, _RlyFaultCount
;GRR3000LManagementPanel.mpas,2083 :: 		RlyCommFault       := 0;
	MOV	#lo_addr(_RlyCommFault), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2084 :: 		LogBit_RlyCommFault:= 0;
	MOV	#lo_addr(_LogBit_RlyCommFault), W0
	BCLR	[W0], BitPos(_LogBit_RlyCommFault+0)
;GRR3000LManagementPanel.mpas,2085 :: 		end;
L__Comm_Fault_Check238:
;GRR3000LManagementPanel.mpas,2087 :: 		end;
L_end_Comm_Fault_Check:
	RETURN
; end of _Comm_Fault_Check

_Timer3Int:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GRR3000LManagementPanel.mpas,2090 :: 		begin
;GRR3000LManagementPanel.mpas,2092 :: 		IEC0.7 :=0;
	BCLR	IEC0, #7
;GRR3000LManagementPanel.mpas,2093 :: 		T3CON := %0000000000000000; //stop TMR2
	CLR	T3CON
;GRR3000LManagementPanel.mpas,2095 :: 		if ModBus_TimeOut < 250 then
	MOV	#lo_addr(_ModBus_TimeOut), W0
	MOV.B	[W0], W1
	MOV.B	#250, W0
	CP.B	W1, W0
	BRA LTU	L__Timer3Int5007
	GOTO	L__Timer3Int244
L__Timer3Int5007:
;GRR3000LManagementPanel.mpas,2096 :: 		ModBus_TimeOut := ModBus_TimeOut+1;
	MOV.B	#1, W1
	MOV	#lo_addr(_ModBus_TimeOut), W0
	ADD.B	W1, [W0], [W0]
L__Timer3Int244:
;GRR3000LManagementPanel.mpas,2098 :: 		IFS0.7 :=0;
	BCLR	IFS0, #7
;GRR3000LManagementPanel.mpas,2099 :: 		IEC0.7 :=1;
	BSET	IEC0, #7
;GRR3000LManagementPanel.mpas,2100 :: 		T3CON := %1000000000000000; //start TMR2
	MOV	#32768, W0
	MOV	WREG, T3CON
;GRR3000LManagementPanel.mpas,2102 :: 		end;
L_end_Timer3Int:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Timer3Int

_UART1_int:
	LNK	#2
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GRR3000LManagementPanel.mpas,2105 :: 		begin
;GRR3000LManagementPanel.mpas,2107 :: 		IEC0.7 :=0; // disable TMR3IF
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	IEC0, #7
;GRR3000LManagementPanel.mpas,2108 :: 		T3CON := %0000000000000000; //stop TMR3
	CLR	T3CON
;GRR3000LManagementPanel.mpas,2112 :: 		Comm_Tmr := 0;
	MOV	#lo_addr(_Comm_Tmr), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2114 :: 		UART1_Read_Text(test_Text,'*',10);
	ADD	W14, #0, W1
	MOV.B	#42, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#10, W12
	MOV	W0, W11
	MOV	#lo_addr(_test_Text), W10
	CALL	_UART1_Read_Text
;GRR3000LManagementPanel.mpas,2135 :: 		PR3  := ModBus_TimeOut_Timer3_PR3;
	MOV	_ModBus_TimeOut_Timer3_PR3, W0
	MOV	WREG, PR3
;GRR3000LManagementPanel.mpas,2136 :: 		IEC0.7 :=1;
	BSET	IEC0, #7
;GRR3000LManagementPanel.mpas,2137 :: 		ModBus_TimeOut := 0;    //' clear down frame timeout TIMER0 on char reception (>3.5 chars without a char is a frame timeout)
	MOV	#lo_addr(_ModBus_TimeOut), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2138 :: 		T3CON := %1000000000000000; //start TMR2
	MOV	#32768, W0
	MOV	WREG, T3CON
;GRR3000LManagementPanel.mpas,2141 :: 		IFS0.const_UART1_RX_IF_IFS0 := 0 ; //ensure interrupt not pending
	BCLR	IFS0, #9
;GRR3000LManagementPanel.mpas,2142 :: 		end;
L_end_UART1_int:
	POP	W12
	POP	W11
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	ULNK
	RETFIE
; end of _UART1_int

_Led_RelayControl:
	LNK	#4

;GRR3000LManagementPanel.mpas,2145 :: 		begin
;GRR3000LManagementPanel.mpas,2147 :: 		if (Read_LoadVolt < DeepDischargeVolt) then
	PUSH	W10
	MOV	_Read_LoadVolt, W1
	MOV	#lo_addr(_DeepDischargeVolt), W0
	CP	W1, [W0]
	BRA LTU	L__Led_RelayControl5010
	GOTO	L__Led_RelayControl249
L__Led_RelayControl5010:
;GRR3000LManagementPanel.mpas,2149 :: 		Inc(DDischargeCounter);
	MOV	#1, W1
	MOV	#lo_addr(_DDischargeCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2150 :: 		if (DDischargeCounter > FltTime) then
	MOV	_DDischargeCounter, W1
	MOV	#3000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5011
	GOTO	L__Led_RelayControl252
L__Led_RelayControl5011:
;GRR3000LManagementPanel.mpas,2152 :: 		Led2_Group.Led2_BattReverse           := 1;
	MOV	#lo_addr(_Led2_Group), W0
	BSET.B	[W0], #4
;GRR3000LManagementPanel.mpas,2153 :: 		Relay_Out_Data.RlyOut_11_BattReverse  := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #10
;GRR3000LManagementPanel.mpas,2154 :: 		Rly_BattReverseBit                    := 1;
	MOV	#lo_addr(_Rly_BattReverseBit), W0
	BSET	[W0], BitPos(_Rly_BattReverseBit+0)
;GRR3000LManagementPanel.mpas,2155 :: 		DDischargeCounter                     := FltTime + 5;
	MOV	#3005, W0
	MOV	W0, _DDischargeCounter
;GRR3000LManagementPanel.mpas,2156 :: 		DDschargeBit                          := 1;
	MOV	#lo_addr(_DDschargeBit), W0
	BSET	[W0], BitPos(_DDschargeBit+0)
;GRR3000LManagementPanel.mpas,2157 :: 		DDschargeControlBit                   := 1;
	MOV	#lo_addr(_DDschargeControlBit), W0
	BSET	[W0], BitPos(_DDschargeControlBit+0)
;GRR3000LManagementPanel.mpas,2159 :: 		DischargeProtect_Pin                  := 0; // derin deþarj koruma rölesi aktif yani kontaktör býrakýldý yük ayrýldý
	BCLR	RB3_bit, BitPos(RB3_bit+0)
;GRR3000LManagementPanel.mpas,2161 :: 		end;
L__Led_RelayControl252:
;GRR3000LManagementPanel.mpas,2162 :: 		end;
L__Led_RelayControl249:
;GRR3000LManagementPanel.mpas,2164 :: 		if (DDschargeControlBit = 1) then // sistem derin deþarja girmiþse
	MOV	#lo_addr(_DDschargeControlBit), W0
	BTSS	[W0], BitPos(_DDschargeControlBit+0)
	GOTO	L__Led_RelayControl255
;GRR3000LManagementPanel.mpas,2166 :: 		if (Read_LoadVolt >= ((HucreSayisi*2)*(F_ChargePercentHi * 0.1))) then // derin deþarjdan çýkmak için nominal þarj gerilimine ulaþsýn ((55x2)*(115x0,1)) = 126,5
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+0]
	MOV	_F_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+0], W2
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Mul_FP
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	_Read_LoadVolt, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+0], W2
	MOV	[W14+2], W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR	W0
	BRA LT	L__Led_RelayControl5012
	COM	W0
L__Led_RelayControl5012:
	CP0	W0
	BRA NZ	L__Led_RelayControl5013
	GOTO	L__Led_RelayControl258
L__Led_RelayControl5013:
;GRR3000LManagementPanel.mpas,2168 :: 		Led2_Group.Led2_BattReverse          := 0;
	MOV	#lo_addr(_Led2_Group), W0
	BCLR.B	[W0], #4
;GRR3000LManagementPanel.mpas,2169 :: 		Relay_Out_Data.RlyOut_11_BattReverse := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #10
;GRR3000LManagementPanel.mpas,2170 :: 		Rly_BattReverseBit                   := 0;
	MOV	#lo_addr(_Rly_BattReverseBit), W0
	BCLR	[W0], BitPos(_Rly_BattReverseBit+0)
;GRR3000LManagementPanel.mpas,2171 :: 		DDischargeCounter                    := 0;
	CLR	W0
	MOV	W0, _DDischargeCounter
;GRR3000LManagementPanel.mpas,2172 :: 		DDschargeBit                         := 0;
	MOV	#lo_addr(_DDschargeBit), W0
	BCLR	[W0], BitPos(_DDschargeBit+0)
;GRR3000LManagementPanel.mpas,2173 :: 		LogBit_DdschFault                    := 0;
	MOV	#lo_addr(_LogBit_DdschFault), W0
	BCLR	[W0], BitPos(_LogBit_DdschFault+0)
;GRR3000LManagementPanel.mpas,2174 :: 		DDschargeControlBit                  := 0;
	MOV	#lo_addr(_DDschargeControlBit), W0
	BCLR	[W0], BitPos(_DDschargeControlBit+0)
;GRR3000LManagementPanel.mpas,2176 :: 		DischargeProtect_Pin                 := 1; // derin deþarj koruma rölesi kapalý yani kontaktör çekildi yük devrede
	BSET	RB3_bit, BitPos(RB3_bit+0)
;GRR3000LManagementPanel.mpas,2178 :: 		end;
L__Led_RelayControl258:
;GRR3000LManagementPanel.mpas,2179 :: 		end;
L__Led_RelayControl255:
;GRR3000LManagementPanel.mpas,2181 :: 		if ((Read_U1Volt > ACMaxVoltSet)or(Read_U2Volt > ACMaxVoltSet)or(Read_U3Volt > ACMaxVoltSet)) then
	MOV	_Read_U1Volt, W1
	MOV	#lo_addr(_ACMaxVoltSet), W0
	CP	W1, [W0]
	CLR	W2
	BRA LEU	L__Led_RelayControl5014
	COM	W2
L__Led_RelayControl5014:
	MOV	_Read_U2Volt, W1
	MOV	#lo_addr(_ACMaxVoltSet), W0
	CP	W1, [W0]
	CLR	W0
	BRA LEU	L__Led_RelayControl5015
	COM	W0
L__Led_RelayControl5015:
	IOR	W2, W0, W2
	MOV	_Read_U3Volt, W1
	MOV	#lo_addr(_ACMaxVoltSet), W0
	CP	W1, [W0]
	CLR	W0
	BRA LEU	L__Led_RelayControl5016
	COM	W0
L__Led_RelayControl5016:
	IOR	W2, W0, W0
	BRA NZ	L__Led_RelayControl5017
	GOTO	L__Led_RelayControl261
L__Led_RelayControl5017:
;GRR3000LManagementPanel.mpas,2183 :: 		Inc(ACFltCounter1);
	MOV	#1, W1
	MOV	#lo_addr(_ACFltCounter1), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2184 :: 		if (ACFltCounter1 > FltTime) then
	MOV	_ACFltCounter1, W1
	MOV	#3000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5018
	GOTO	L__Led_RelayControl264
L__Led_RelayControl5018:
;GRR3000LManagementPanel.mpas,2186 :: 		Led1_Group.Led1_AcHigh := 1;
	MOV	#lo_addr(_Led1_Group), W0
	BSET.B	[W0], #6
;GRR3000LManagementPanel.mpas,2187 :: 		Relay_Out_Data.RlyOut_1_AcHigh := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #0
;GRR3000LManagementPanel.mpas,2188 :: 		Rly_AcHighBit                  := 1;
	MOV	#lo_addr(_Rly_AcHighBit), W0
	BSET	[W0], BitPos(_Rly_AcHighBit+0)
;GRR3000LManagementPanel.mpas,2189 :: 		ACFltCounter1          := FltTime + 5; // fazlasý yazýlýr sürekli burada kalsýn diye
	MOV	#3005, W0
	MOV	W0, _ACFltCounter1
;GRR3000LManagementPanel.mpas,2190 :: 		AcHighFaultBit             := 1;
	MOV	#lo_addr(_AcHighFaultBit), W0
	BSET	[W0], BitPos(_AcHighFaultBit+0)
;GRR3000LManagementPanel.mpas,2191 :: 		end;
L__Led_RelayControl264:
;GRR3000LManagementPanel.mpas,2193 :: 		end else
	GOTO	L__Led_RelayControl262
L__Led_RelayControl261:
;GRR3000LManagementPanel.mpas,2195 :: 		Led1_Group.Led1_AcHigh         := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #6
;GRR3000LManagementPanel.mpas,2196 :: 		Relay_Out_Data.RlyOut_1_AcHigh := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #0
;GRR3000LManagementPanel.mpas,2197 :: 		Rly_AcHighBit                  := 0;
	MOV	#lo_addr(_Rly_AcHighBit), W0
	BCLR	[W0], BitPos(_Rly_AcHighBit+0)
;GRR3000LManagementPanel.mpas,2198 :: 		ACFltCounter1                  := 0;
	CLR	W0
	MOV	W0, _ACFltCounter1
;GRR3000LManagementPanel.mpas,2199 :: 		AcHighFaultBit                 := 0;
	MOV	#lo_addr(_AcHighFaultBit), W0
	BCLR	[W0], BitPos(_AcHighFaultBit+0)
;GRR3000LManagementPanel.mpas,2200 :: 		LogBit_AcHigh                  := 0; // olay kaydedicisi için
	MOV	#lo_addr(_LogBit_AcHigh), W0
	BCLR	[W0], BitPos(_LogBit_AcHigh+0)
;GRR3000LManagementPanel.mpas,2201 :: 		end;
L__Led_RelayControl262:
;GRR3000LManagementPanel.mpas,2203 :: 		if ((Read_U1Volt < ACMinVoltSet)or(Read_U2Volt < ACMinVoltSet)or(Read_U3Volt < ACMinVoltSet)) then
	MOV	_Read_U1Volt, W1
	MOV	#lo_addr(_ACMinVoltSet), W0
	CP	W1, [W0]
	CLR	W2
	BRA GEU	L__Led_RelayControl5019
	COM	W2
L__Led_RelayControl5019:
	MOV	_Read_U2Volt, W1
	MOV	#lo_addr(_ACMinVoltSet), W0
	CP	W1, [W0]
	CLR	W0
	BRA GEU	L__Led_RelayControl5020
	COM	W0
L__Led_RelayControl5020:
	IOR	W2, W0, W2
	MOV	_Read_U3Volt, W1
	MOV	#lo_addr(_ACMinVoltSet), W0
	CP	W1, [W0]
	CLR	W0
	BRA GEU	L__Led_RelayControl5021
	COM	W0
L__Led_RelayControl5021:
	IOR	W2, W0, W0
	BRA NZ	L__Led_RelayControl5022
	GOTO	L__Led_RelayControl267
L__Led_RelayControl5022:
;GRR3000LManagementPanel.mpas,2205 :: 		Inc(ACFltCounter2);
	MOV	#1, W1
	MOV	#lo_addr(_ACFltCounter2), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2206 :: 		Inc(AcOnCounter);
	MOV	#1, W1
	MOV	#lo_addr(_AcOnCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2207 :: 		if (ACFltCounter2 > FltTime) then
	MOV	_ACFltCounter2, W1
	MOV	#3000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5023
	GOTO	L__Led_RelayControl270
L__Led_RelayControl5023:
;GRR3000LManagementPanel.mpas,2209 :: 		Led1_Group.Led1_AcLow := 1;
	MOV	#lo_addr(_Led1_Group), W0
	BSET.B	[W0], #5
;GRR3000LManagementPanel.mpas,2210 :: 		Relay_Out_Data.RlyOut_2_AcLow   := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #1
;GRR3000LManagementPanel.mpas,2211 :: 		Rly_AcLowBit                    := 1;
	MOV	#lo_addr(_Rly_AcLowBit), W0
	BSET	[W0], BitPos(_Rly_AcLowBit+0)
;GRR3000LManagementPanel.mpas,2212 :: 		Relay_Out_Data.RlyOut_16_ExtOut := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #15
;GRR3000LManagementPanel.mpas,2213 :: 		ACFltCounter2         := FltTime + 5; // fazlasý yazýlýr sürekli burada kalsýn diye
	MOV	#3005, W0
	MOV	W0, _ACFltCounter2
;GRR3000LManagementPanel.mpas,2214 :: 		AclowFaultBit            := 1;
	MOV	#lo_addr(_AcLowFaultBit), W0
	BSET	[W0], BitPos(_AcLowFaultBit+0)
;GRR3000LManagementPanel.mpas,2216 :: 		end;
L__Led_RelayControl270:
;GRR3000LManagementPanel.mpas,2218 :: 		if ((AcOnCounter > 500)and(AcOnCounter < 1000)) then
	MOV	_AcOnCounter, W2
	MOV	#500, W0
	CP	W2, W0
	CLR	W1
	BRA LEU	L__Led_RelayControl5024
	COM	W1
L__Led_RelayControl5024:
	MOV	#1000, W0
	CP	W2, W0
	CLR	W0
	BRA GEU	L__Led_RelayControl5025
	COM	W0
L__Led_RelayControl5025:
	AND	W1, W0, W0
	BRA NZ	L__Led_RelayControl5026
	GOTO	L__Led_RelayControl273
L__Led_RelayControl5026:
;GRR3000LManagementPanel.mpas,2220 :: 		Led1_Group.Led1_AcOn  := 1;
	MOV	#lo_addr(_Led1_Group), W0
	BSET.B	[W0], #7
;GRR3000LManagementPanel.mpas,2221 :: 		end else
	GOTO	L__Led_RelayControl274
L__Led_RelayControl273:
;GRR3000LManagementPanel.mpas,2222 :: 		if (AcOnCounter > 1000) then
	MOV	_AcOnCounter, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5027
	GOTO	L__Led_RelayControl276
L__Led_RelayControl5027:
;GRR3000LManagementPanel.mpas,2224 :: 		Led1_Group.Led1_AcOn  := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #7
;GRR3000LManagementPanel.mpas,2225 :: 		AcOnCounter           := 0;
	CLR	W0
	MOV	W0, _AcOnCounter
;GRR3000LManagementPanel.mpas,2226 :: 		end;
L__Led_RelayControl276:
L__Led_RelayControl274:
;GRR3000LManagementPanel.mpas,2229 :: 		end else
	GOTO	L__Led_RelayControl268
L__Led_RelayControl267:
;GRR3000LManagementPanel.mpas,2231 :: 		Led1_Group.Led1_AcLow           := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #5
;GRR3000LManagementPanel.mpas,2232 :: 		Relay_Out_Data.RlyOut_2_AcLow   := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #1
;GRR3000LManagementPanel.mpas,2233 :: 		Rly_AcLowBit                    := 0;
	MOV	#lo_addr(_Rly_AcLowBit), W0
	BCLR	[W0], BitPos(_Rly_AcLowBit+0)
;GRR3000LManagementPanel.mpas,2234 :: 		Led1_Group.Led1_AcOn            := 1; // ac düþük deðilse AC gerilim var ve sürekli yan
	MOV	#lo_addr(_Led1_Group), W0
	BSET.B	[W0], #7
;GRR3000LManagementPanel.mpas,2235 :: 		Relay_Out_Data.RlyOut_16_ExtOut := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #15
;GRR3000LManagementPanel.mpas,2236 :: 		ACFltCounter2                   := 0;
	CLR	W0
	MOV	W0, _ACFltCounter2
;GRR3000LManagementPanel.mpas,2237 :: 		AclowFaultBit                   := 0;
	MOV	#lo_addr(_AcLowFaultBit), W0
	BCLR	[W0], BitPos(_AcLowFaultBit+0)
;GRR3000LManagementPanel.mpas,2238 :: 		LogBit_AcLow                    := 0; // olay kaydedicisi için
	MOV	#lo_addr(_LogBit_AcLow), W0
	BCLR	[W0], BitPos(_LogBit_AcLow+0)
;GRR3000LManagementPanel.mpas,2239 :: 		end;
L__Led_RelayControl268:
;GRR3000LManagementPanel.mpas,2241 :: 		if (AC_ProtectBit = 1) then // AC Koruma aktifse
	MOV	#lo_addr(_AC_ProtectBit), W0
	BTSS	[W0], BitPos(_AC_ProtectBit+0)
	GOTO	L__Led_RelayControl279
;GRR3000LManagementPanel.mpas,2244 :: 		if ((abs(U1Volt_Diff) > ACVolt_Different) or (abs(U2Volt_Diff) > ACVolt_Different) or (abs(U3Volt_Diff) > ACVolt_Different) or(AcHighFaultBit = 1)or(AcLowFaultBit = 1)) then
	MOV	_U1Volt_Diff, W10
	CALL	_abs
	MOV	#lo_addr(_ACVolt_Different), W1
	ZE	[W1], W1
	CP	W0, W1
	CLR	W0
	BRA LE	L__Led_RelayControl5028
	COM	W0
L__Led_RelayControl5028:
	MOV	W0, [W14+0]
	MOV	_U2Volt_Diff, W10
	CALL	_abs
	MOV	#lo_addr(_ACVolt_Different), W1
	ZE	[W1], W1
	CP	W0, W1
	CLR	W1
	BRA LE	L__Led_RelayControl5029
	COM	W1
L__Led_RelayControl5029:
	MOV	[W14+0], W0
	IOR	W0, W1, W0
	MOV	W0, [W14+0]
	MOV	_U3Volt_Diff, W10
	CALL	_abs
	MOV	#lo_addr(_ACVolt_Different), W1
	ZE	[W1], W1
	CP	W0, W1
	CLR	W1
	BRA LE	L__Led_RelayControl5030
	COM	W1
L__Led_RelayControl5030:
	MOV	[W14+0], W0
	IOR	W0, W1, W1
	MOV	#lo_addr(_AcHighFaultBit), W0
	BTSS	[W0], BitPos(_AcHighFaultBit+0)
	BCLR	66, #0
	BTSC	[W0], BitPos(_AcHighFaultBit+0)
	BSET	66, #0
	CLR.B	W0
	BTSC	66, #0
	INC.B	W0
	ZE	W0, W0
	IOR	W1, W0, W1
	MOV	#lo_addr(_AcLowFaultBit), W0
	BTSS	[W0], BitPos(_AcLowFaultBit+0)
	BCLR	66, #0
	BTSC	[W0], BitPos(_AcLowFaultBit+0)
	BSET	66, #0
	CLR.B	W0
	BTSC	66, #0
	INC.B	W0
	ZE	W0, W0
	IOR	W1, W0, W0
	BRA NZ	L__Led_RelayControl5031
	GOTO	L__Led_RelayControl282
L__Led_RelayControl5031:
;GRR3000LManagementPanel.mpas,2245 :: 		ACVoltDifferentBit := 1 else ACVoltDifferentBit := 0;
	MOV	#lo_addr(_ACVoltDifferentBit), W0
	BSET	[W0], BitPos(_ACVoltDifferentBit+0)
	GOTO	L__Led_RelayControl283
L__Led_RelayControl282:
	MOV	#lo_addr(_ACVoltDifferentBit), W0
	BCLR	[W0], BitPos(_ACVoltDifferentBit+0)
L__Led_RelayControl283:
;GRR3000LManagementPanel.mpas,2247 :: 		end else ACVoltDifferentBit := 0;
	GOTO	L__Led_RelayControl280
L__Led_RelayControl279:
	MOV	#lo_addr(_ACVoltDifferentBit), W0
	BCLR	[W0], BitPos(_ACVoltDifferentBit+0)
L__Led_RelayControl280:
;GRR3000LManagementPanel.mpas,2253 :: 		if ((StopBit = 0)or((OperationMode = 1)or(OperationMode = 3))) then // redresör çalýþýyorsa veya redresör tekli çalýþýyorsa
	MOV	#lo_addr(_StopBit), W0
	BCLR	W4, #0
	BTSS	[W0], BitPos(_StopBit+0)
	BSET	W4, #0
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	CLR	W1
	BRA NZ	L__Led_RelayControl5032
	COM	W1
L__Led_RelayControl5032:
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	CLR	W0
	BRA NZ	L__Led_RelayControl5033
	COM	W0
L__Led_RelayControl5033:
	IOR	W1, W0, W1
	CLR.B	W0
	BTSC	W4, #0
	INC.B	W0
	ZE	W0, W0
	IOR	W0, W1, W0
	BRA NZ	L__Led_RelayControl5034
	GOTO	L__Led_RelayControl285
L__Led_RelayControl5034:
;GRR3000LManagementPanel.mpas,2256 :: 		RedVolt_HighPercent10Bit := (RectifierVoltage_Set*1.1);
	MOV	_RectifierVoltage_Set, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+0]
	MOV	W1, [W14+2]
	MOV	#52429, W2
	MOV	#16268, W3
	CALL	__Mul_FP
	MOV	W0, _RedVolt_HighPercent10Bit
	MOV	W1, _RedVolt_HighPercent10Bit+2
;GRR3000LManagementPanel.mpas,2257 :: 		RedVolt_LowPercent10Bit  := (RectifierVoltage_Set*0.9);
	MOV	[W14+0], W0
	MOV	[W14+2], W1
	MOV	#26214, W2
	MOV	#16230, W3
	CALL	__Mul_FP
	MOV	W0, _RedVolt_LowPercent10Bit
	MOV	W1, _RedVolt_LowPercent10Bit+2
;GRR3000LManagementPanel.mpas,2259 :: 		if ((BattAmpsLimitBit =0)and(RedAmpsLimitBit =0)) then // redresör ya da akü akým sýnýrlamaya girmemiþse kontrol et
	MOV	#lo_addr(_BattAmpsLimitBit), W0
	BCLR	W4, #0
	BTSS	[W0], BitPos(_BattAmpsLimitBit+0)
	BSET	W4, #0
	MOV	#lo_addr(_RedAmpsLimitBit), W0
	BTSS	[W0], BitPos(_RedAmpsLimitBit+0)
	BSET	66, #0
	BTSC	[W0], BitPos(_RedAmpsLimitBit+0)
	BCLR	66, #0
	BTSC	W4, #0
	BTSS	66, #0
	BRA	L__Led_RelayControl5036
	BSET	W4, #0
	BRA	L__Led_RelayControl5038
L__Led_RelayControl5036:
	BCLR	W4, #0
L__Led_RelayControl5038:
	BTSS	W4, #0
	GOTO	L__Led_RelayControl288
;GRR3000LManagementPanel.mpas,2261 :: 		if ((Read_RedVolt > MaxvoltSet)or(Read_RedVolt > RedVolt_HighPercent10Bit)) then // ayarlanan gerilimden yüksekse ve ya set edilen deðerin %10'nundan fazla ise
	MOV	_Read_RedVolt, W1
	MOV	#lo_addr(_MaxvoltSet), W0
	CP	W1, [W0]
	CLR	W0
	BRA LEU	L__Led_RelayControl5039
	COM	W0
L__Led_RelayControl5039:
	MOV	W0, [W14+0]
	MOV	_Read_RedVolt, W0
	CLR	W1
	CALL	__Long2Float
	MOV	_RedVolt_HighPercent10Bit, W2
	MOV	_RedVolt_HighPercent10Bit+2, W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR	W0
	BRA LE	L__Led_RelayControl5040
	COM	W0
L__Led_RelayControl5040:
	MOV	[W14+0], W1
	IOR	W1, W0, W0
	BRA NZ	L__Led_RelayControl5041
	GOTO	L__Led_RelayControl291
L__Led_RelayControl5041:
;GRR3000LManagementPanel.mpas,2263 :: 		Inc(DcFaultRelayTime);
	MOV	#1, W1
	MOV	#lo_addr(_DcFaultRelayTime), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2264 :: 		if (DcFaultRelayTime > (FltTime+2000)) then // burasý diðerlerinden farklý olarak 5sn sonra çalýþacak
	MOV	_DcFaultRelayTime, W1
	MOV	#5000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5042
	GOTO	L__Led_RelayControl294
L__Led_RelayControl5042:
;GRR3000LManagementPanel.mpas,2266 :: 		DcFaultRelayTime := FltTime + 5;
	MOV	#3005, W0
	MOV	W0, _DcFaultRelayTime
;GRR3000LManagementPanel.mpas,2267 :: 		Led1_Group.Led1_DcHigh             := 1;
	MOV	#lo_addr(_Led1_Group), W0
	BSET.B	[W0], #4
;GRR3000LManagementPanel.mpas,2268 :: 		Led1_Group.Led1_DcLow              := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #3
;GRR3000LManagementPanel.mpas,2269 :: 		Relay_Out_Data.RlyOut_3_DcHigh     := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #2
;GRR3000LManagementPanel.mpas,2270 :: 		Relay_Out_Data.RlyOut_4_DcLow      := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #3
;GRR3000LManagementPanel.mpas,2271 :: 		Rly_DcHighBit                      := 1;
	MOV	#lo_addr(_Rly_DcHighBit), W0
	BSET	[W0], BitPos(_Rly_DcHighBit+0)
;GRR3000LManagementPanel.mpas,2272 :: 		Rly_DcLowBit                       := 0;
	MOV	#lo_addr(_Rly_DcLowBit), W0
	BCLR	[W0], BitPos(_Rly_DcLowBit+0)
;GRR3000LManagementPanel.mpas,2273 :: 		Relay_Out_Data.RlyOut_15_RedFault  := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #14
;GRR3000LManagementPanel.mpas,2274 :: 		Rly_RedGenFaultBit                 := 1;
	MOV	#lo_addr(_Rly_RedGenFaultBit), W0
	BSET	[W0], BitPos(_Rly_RedGenFaultBit+0)
;GRR3000LManagementPanel.mpas,2275 :: 		Led3_Group.Led3_RedFault           := 1;
	MOV	#lo_addr(_Led3_Group), W0
	BSET.B	[W0], #2
;GRR3000LManagementPanel.mpas,2276 :: 		RedFaultBit                        := 1;
	MOV	#lo_addr(_RedFaultBit), W0
	BSET	[W0], BitPos(_RedFaultBit+0)
;GRR3000LManagementPanel.mpas,2277 :: 		DcHighBit                          := 1;
	MOV	#lo_addr(_DcHighBit), W0
	BSET	[W0], BitPos(_DcHighBit+0)
;GRR3000LManagementPanel.mpas,2278 :: 		end;
L__Led_RelayControl294:
;GRR3000LManagementPanel.mpas,2279 :: 		end else
	GOTO	L__Led_RelayControl292
L__Led_RelayControl291:
;GRR3000LManagementPanel.mpas,2280 :: 		if ((Read_RedVolt < MinVoltSet)or(Read_RedVolt < RedVolt_LowPercent10Bit)) then // ayarlanan gerilimden küçükse ve ya set edilen deðerin %10 altýnda ise
	MOV	_Read_RedVolt, W1
	MOV	#lo_addr(_MinVoltSet), W0
	CP	W1, [W0]
	CLR	W0
	BRA GEU	L__Led_RelayControl5043
	COM	W0
L__Led_RelayControl5043:
	MOV	W0, [W14+0]
	MOV	_Read_RedVolt, W0
	CLR	W1
	CALL	__Long2Float
	MOV	_RedVolt_LowPercent10Bit, W2
	MOV	_RedVolt_LowPercent10Bit+2, W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR	W0
	BRA GE	L__Led_RelayControl5044
	COM	W0
L__Led_RelayControl5044:
	MOV	[W14+0], W1
	IOR	W1, W0, W0
	BRA NZ	L__Led_RelayControl5045
	GOTO	L__Led_RelayControl297
L__Led_RelayControl5045:
;GRR3000LManagementPanel.mpas,2282 :: 		Inc(DcFaultRelayTime);
	MOV	#1, W1
	MOV	#lo_addr(_DcFaultRelayTime), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2283 :: 		if (DcFaultRelayTime > (FltTime+2000)) then  // burasý diðerlerinden farklý olarak 5sn sonra çalýþacak
	MOV	_DcFaultRelayTime, W1
	MOV	#5000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5046
	GOTO	L__Led_RelayControl300
L__Led_RelayControl5046:
;GRR3000LManagementPanel.mpas,2285 :: 		DcFaultRelayTime := FltTime + 5;
	MOV	#3005, W0
	MOV	W0, _DcFaultRelayTime
;GRR3000LManagementPanel.mpas,2286 :: 		Led1_Group.Led1_DcLow              := 1;
	MOV	#lo_addr(_Led1_Group), W0
	BSET.B	[W0], #3
;GRR3000LManagementPanel.mpas,2287 :: 		Led1_Group.Led1_DcHigh             := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #4
;GRR3000LManagementPanel.mpas,2288 :: 		Led3_Group.Led3_RedFault           := 1;
	MOV	#lo_addr(_Led3_Group), W0
	BSET.B	[W0], #2
;GRR3000LManagementPanel.mpas,2289 :: 		Relay_Out_Data.RlyOut_4_DcLow      := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #3
;GRR3000LManagementPanel.mpas,2290 :: 		Relay_Out_Data.RlyOut_3_DcHigh     := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #2
;GRR3000LManagementPanel.mpas,2291 :: 		Rly_DCHighBit                      := 0;
	MOV	#lo_addr(_Rly_DcHighBit), W0
	BCLR	[W0], BitPos(_Rly_DcHighBit+0)
;GRR3000LManagementPanel.mpas,2292 :: 		Relay_Out_Data.RlyOut_15_RedFault  := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #14
;GRR3000LManagementPanel.mpas,2293 :: 		Rly_RedGenFaultBit                 := 1;
	MOV	#lo_addr(_Rly_RedGenFaultBit), W0
	BSET	[W0], BitPos(_Rly_RedGenFaultBit+0)
;GRR3000LManagementPanel.mpas,2294 :: 		RedFaultBit                        := 1;
	MOV	#lo_addr(_RedFaultBit), W0
	BSET	[W0], BitPos(_RedFaultBit+0)
;GRR3000LManagementPanel.mpas,2295 :: 		DcLowBit                           := 1;
	MOV	#lo_addr(_DcLowBit), W0
	BSET	[W0], BitPos(_DcLowBit+0)
;GRR3000LManagementPanel.mpas,2296 :: 		DcHighBit                          := 0;
	MOV	#lo_addr(_DcHighBit), W0
	BCLR	[W0], BitPos(_DcHighBit+0)
;GRR3000LManagementPanel.mpas,2297 :: 		end;
L__Led_RelayControl300:
;GRR3000LManagementPanel.mpas,2298 :: 		end else
	GOTO	L__Led_RelayControl298
L__Led_RelayControl297:
;GRR3000LManagementPanel.mpas,2300 :: 		DcFaultRelayTime                  := 0;
	CLR	W0
	MOV	W0, _DcFaultRelayTime
;GRR3000LManagementPanel.mpas,2301 :: 		Led1_Group.Led1_DcLow             := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #3
;GRR3000LManagementPanel.mpas,2302 :: 		Relay_Out_Data.RlyOut_4_DcLow     := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #3
;GRR3000LManagementPanel.mpas,2303 :: 		Rly_DcLowBit                      := 0;
	MOV	#lo_addr(_Rly_DcLowBit), W0
	BCLR	[W0], BitPos(_Rly_DcLowBit+0)
;GRR3000LManagementPanel.mpas,2304 :: 		Led1_Group.Led1_DcHigh            := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #4
;GRR3000LManagementPanel.mpas,2305 :: 		Relay_Out_Data.RlyOut_3_DcHigh    := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #2
;GRR3000LManagementPanel.mpas,2306 :: 		Rly_DCHighBit                     := 0;
	MOV	#lo_addr(_Rly_DcHighBit), W0
	BCLR	[W0], BitPos(_Rly_DcHighBit+0)
;GRR3000LManagementPanel.mpas,2307 :: 		Relay_Out_Data.RlyOut_15_RedFault := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #14
;GRR3000LManagementPanel.mpas,2308 :: 		Led3_Group.Led3_RedFault          := 0;
	MOV	#lo_addr(_Led3_Group), W0
	BCLR.B	[W0], #2
;GRR3000LManagementPanel.mpas,2309 :: 		Rly_RedGenFaultBit                := 0;
	MOV	#lo_addr(_Rly_RedGenFaultBit), W0
	BCLR	[W0], BitPos(_Rly_RedGenFaultBit+0)
;GRR3000LManagementPanel.mpas,2310 :: 		if (Read_Temp =0) then RedFaultBit:= 0;
	MOV	_Read_Temp, W0
	CP	W0, #0
	BRA Z	L__Led_RelayControl5047
	GOTO	L__Led_RelayControl303
L__Led_RelayControl5047:
	MOV	#lo_addr(_RedFaultBit), W0
	BCLR	[W0], BitPos(_RedFaultBit+0)
L__Led_RelayControl303:
;GRR3000LManagementPanel.mpas,2311 :: 		DcHighBit                         := 0;
	MOV	#lo_addr(_DcHighBit), W0
	BCLR	[W0], BitPos(_DcHighBit+0)
;GRR3000LManagementPanel.mpas,2312 :: 		DcLowBit                          := 0;
	MOV	#lo_addr(_DcLowBit), W0
	BCLR	[W0], BitPos(_DcLowBit+0)
;GRR3000LManagementPanel.mpas,2313 :: 		LogBit_DcHigh                     := 0; // olay kaydedicisi için
	MOV	#lo_addr(_LogBit_DcHigh), W0
	BCLR	[W0], BitPos(_LogBit_DcHigh+0)
;GRR3000LManagementPanel.mpas,2314 :: 		LogBit_DcLow                      := 0; // olay kaydedicisi için
	MOV	#lo_addr(_LogBit_DcLow), W0
	BCLR	[W0], BitPos(_LogBit_DcLow+0)
;GRR3000LManagementPanel.mpas,2315 :: 		LogBit_RedFault                   := 0;
	MOV	#lo_addr(_LogBit_RedFault), W0
	BCLR	[W0], BitPos(_LogBit_RedFault+0)
;GRR3000LManagementPanel.mpas,2316 :: 		end;
L__Led_RelayControl298:
L__Led_RelayControl292:
;GRR3000LManagementPanel.mpas,2317 :: 		end;
L__Led_RelayControl288:
;GRR3000LManagementPanel.mpas,2318 :: 		end;
L__Led_RelayControl285:
;GRR3000LManagementPanel.mpas,2322 :: 		if (Read_LoadVolt > 100) then // 10,0V' dan küçükse kaçak akýmlara bakma
	MOV	#100, W1
	MOV	#lo_addr(_Read_LoadVolt), W0
	CP	W1, [W0]
	BRA LTU	L__Led_RelayControl5048
	GOTO	L__Led_RelayControl306
L__Led_RelayControl5048:
;GRR3000LManagementPanel.mpas,2324 :: 		if (Pos_Leakage_bit = 1) then // + kaçak gelmiþse
	MOV	#lo_addr(_Pos_Leakage_bit), W0
	BTSS	[W0], BitPos(_Pos_Leakage_bit+0)
	GOTO	L__Led_RelayControl309
;GRR3000LManagementPanel.mpas,2326 :: 		Inc(LeakFltCounter1);
	MOV	#1, W1
	MOV	#lo_addr(_LeakFltCounter1), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2327 :: 		if (LeakFltCounter1 > FltTime) then
	MOV	_LeakFltCounter1, W1
	MOV	#3000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5049
	GOTO	L__Led_RelayControl312
L__Led_RelayControl5049:
;GRR3000LManagementPanel.mpas,2329 :: 		Led1_Group.Led1_PLeakage         := 1;
	MOV	#lo_addr(_Led1_Group), W0
	BSET.B	[W0], #2
;GRR3000LManagementPanel.mpas,2330 :: 		Relay_Out_Data.RlyOut_5_PLeakage := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #4
;GRR3000LManagementPanel.mpas,2331 :: 		Rly_PosLeakageBit                := 1;
	MOV	#lo_addr(_Rly_PosLeakageBit), W0
	BSET	[W0], BitPos(_Rly_PosLeakageBit+0)
;GRR3000LManagementPanel.mpas,2332 :: 		LeakFltCounter1                  := FltTime + 5; // fazlasý yazýlýr sürekli burada kalsýn diye
	MOV	#3005, W0
	MOV	W0, _LeakFltCounter1
;GRR3000LManagementPanel.mpas,2333 :: 		P_LeakBit                        := 1;
	MOV	#lo_addr(_P_LeakBit), W0
	BSET	[W0], BitPos(_P_LeakBit+0)
;GRR3000LManagementPanel.mpas,2334 :: 		end;
L__Led_RelayControl312:
;GRR3000LManagementPanel.mpas,2335 :: 		end else
	GOTO	L__Led_RelayControl310
L__Led_RelayControl309:
;GRR3000LManagementPanel.mpas,2337 :: 		Led1_Group.Led1_PLeakage         := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #2
;GRR3000LManagementPanel.mpas,2338 :: 		Relay_Out_Data.RlyOut_5_PLeakage := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #4
;GRR3000LManagementPanel.mpas,2339 :: 		Rly_PosLeakageBit                := 0;
	MOV	#lo_addr(_Rly_PosLeakageBit), W0
	BCLR	[W0], BitPos(_Rly_PosLeakageBit+0)
;GRR3000LManagementPanel.mpas,2340 :: 		LeakFltCounter1                  := 0;
	CLR	W0
	MOV	W0, _LeakFltCounter1
;GRR3000LManagementPanel.mpas,2341 :: 		end;
L__Led_RelayControl310:
;GRR3000LManagementPanel.mpas,2343 :: 		if (Neg_Leakage_bit = 1) then // - kaçak gelmiþse
	MOV	#lo_addr(_Neg_Leakage_bit), W0
	BTSS	[W0], BitPos(_Neg_Leakage_bit+0)
	GOTO	L__Led_RelayControl315
;GRR3000LManagementPanel.mpas,2345 :: 		Inc(LeakFltCounter2);
	MOV	#1, W1
	MOV	#lo_addr(_LeakFltCounter2), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2346 :: 		if (LeakFltCounter2 > FltTime) then
	MOV	_LeakFltCounter2, W1
	MOV	#3000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5050
	GOTO	L__Led_RelayControl318
L__Led_RelayControl5050:
;GRR3000LManagementPanel.mpas,2348 :: 		Led1_Group.Led1_NLeakage         := 1;
	MOV	#lo_addr(_Led1_Group), W0
	BSET.B	[W0], #1
;GRR3000LManagementPanel.mpas,2349 :: 		Relay_Out_Data.RlyOut_6_NLeakage := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #5
;GRR3000LManagementPanel.mpas,2350 :: 		Rly_NegLeakageBit                := 1;
	MOV	#lo_addr(_Rly_NegLeakageBit), W0
	BSET	[W0], BitPos(_Rly_NegLeakageBit+0)
;GRR3000LManagementPanel.mpas,2351 :: 		LeakFltCounter2                  := FltTime + 5; // fazlasý yazýlýr sürekli burada kalsýn diye
	MOV	#3005, W0
	MOV	W0, _LeakFltCounter2
;GRR3000LManagementPanel.mpas,2352 :: 		N_LeakBit                        := 1;
	MOV	#lo_addr(_N_LeakBit), W0
	BSET	[W0], BitPos(_N_LeakBit+0)
;GRR3000LManagementPanel.mpas,2353 :: 		end;
L__Led_RelayControl318:
;GRR3000LManagementPanel.mpas,2354 :: 		end else
	GOTO	L__Led_RelayControl316
L__Led_RelayControl315:
;GRR3000LManagementPanel.mpas,2356 :: 		Led1_Group.Led1_NLeakage         := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #1
;GRR3000LManagementPanel.mpas,2357 :: 		Relay_Out_Data.RlyOut_6_NLeakage := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #5
;GRR3000LManagementPanel.mpas,2358 :: 		Rly_NegLeakageBit                := 0;
	MOV	#lo_addr(_Rly_NegLeakageBit), W0
	BCLR	[W0], BitPos(_Rly_NegLeakageBit+0)
;GRR3000LManagementPanel.mpas,2359 :: 		LeakFltCounter2                  := 0;
	CLR	W0
	MOV	W0, _LeakFltCounter2
;GRR3000LManagementPanel.mpas,2360 :: 		end;
L__Led_RelayControl316:
;GRR3000LManagementPanel.mpas,2361 :: 		end else
	GOTO	L__Led_RelayControl307
L__Led_RelayControl306:
;GRR3000LManagementPanel.mpas,2363 :: 		Led1_Group.Led1_PLeakage         := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #2
;GRR3000LManagementPanel.mpas,2364 :: 		Relay_Out_Data.RlyOut_5_PLeakage := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #4
;GRR3000LManagementPanel.mpas,2365 :: 		Rly_PosLeakageBit                := 0;
	MOV	#lo_addr(_Rly_PosLeakageBit), W0
	BCLR	[W0], BitPos(_Rly_PosLeakageBit+0)
;GRR3000LManagementPanel.mpas,2366 :: 		Rly_NegLeakageBit                := 0;
	MOV	#lo_addr(_Rly_NegLeakageBit), W0
	BCLR	[W0], BitPos(_Rly_NegLeakageBit+0)
;GRR3000LManagementPanel.mpas,2367 :: 		LeakFltCounter1                  := 0;
	CLR	W0
	MOV	W0, _LeakFltCounter1
;GRR3000LManagementPanel.mpas,2368 :: 		Led1_Group.Led1_NLeakage         := 0;
	MOV	#lo_addr(_Led1_Group), W0
	BCLR.B	[W0], #1
;GRR3000LManagementPanel.mpas,2369 :: 		Relay_Out_Data.RlyOut_6_NLeakage := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #5
;GRR3000LManagementPanel.mpas,2370 :: 		LeakFltCounter2                  := 0;
	CLR	W0
	MOV	W0, _LeakFltCounter2
;GRR3000LManagementPanel.mpas,2371 :: 		P_Leakbit                        := 0;
	MOV	#lo_addr(_P_LeakBit), W0
	BCLR	[W0], BitPos(_P_LeakBit+0)
;GRR3000LManagementPanel.mpas,2372 :: 		N_Leakbit                        := 0;
	MOV	#lo_addr(_N_LeakBit), W0
	BCLR	[W0], BitPos(_N_LeakBit+0)
;GRR3000LManagementPanel.mpas,2373 :: 		LogBit_Pleak                     := 0;
	MOV	#lo_addr(_LogBit_Pleak), W0
	BCLR	[W0], BitPos(_LogBit_Pleak+0)
;GRR3000LManagementPanel.mpas,2374 :: 		LogBit_Nleak                     := 0;
	MOV	#lo_addr(_LogBit_Nleak), W0
	BCLR	[W0], BitPos(_LogBit_Nleak+0)
;GRR3000LManagementPanel.mpas,2375 :: 		end;
L__Led_RelayControl307:
;GRR3000LManagementPanel.mpas,2378 :: 		if (TempHighBit = 1) then
	MOV	#lo_addr(_TempHighBit), W0
	BTSS	[W0], BitPos(_TempHighBit+0)
	GOTO	L__Led_RelayControl321
;GRR3000LManagementPanel.mpas,2380 :: 		Inc(TempFltCounter);
	MOV	#1, W1
	MOV	#lo_addr(_TempFltCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2381 :: 		if (TempFltCounter > FltTime) then
	MOV	_TempFltCounter, W1
	MOV	#3000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5051
	GOTO	L__Led_RelayControl324
L__Led_RelayControl5051:
;GRR3000LManagementPanel.mpas,2383 :: 		Led2_Group.Led2_HighTemp          := 1;
	MOV	#lo_addr(_Led2_Group), W0
	BSET.B	[W0], #5
;GRR3000LManagementPanel.mpas,2384 :: 		Relay_Out_Data.RlyOut_10_HighTemp := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #9
;GRR3000LManagementPanel.mpas,2385 :: 		Rly_HighTempBit                   := 1;
	MOV	#lo_addr(_Rly_HighTempBit), W0
	BSET	[W0], BitPos(_Rly_HighTempBit+0)
;GRR3000LManagementPanel.mpas,2386 :: 		TempFltCounter                    := FltTime + 5;
	MOV	#3005, W0
	MOV	W0, _TempFltCounter
;GRR3000LManagementPanel.mpas,2387 :: 		HighTempBit                       := 1;
	MOV	#lo_addr(_HighTempBit), W0
	BSET	[W0], BitPos(_HighTempBit+0)
;GRR3000LManagementPanel.mpas,2389 :: 		end;
L__Led_RelayControl324:
;GRR3000LManagementPanel.mpas,2391 :: 		end else
	GOTO	L__Led_RelayControl322
L__Led_RelayControl321:
;GRR3000LManagementPanel.mpas,2393 :: 		Led2_Group.Led2_HighTemp          := 0;
	MOV	#lo_addr(_Led2_Group), W0
	BCLR.B	[W0], #5
;GRR3000LManagementPanel.mpas,2394 :: 		Relay_Out_Data.RlyOut_10_HighTemp := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #9
;GRR3000LManagementPanel.mpas,2395 :: 		Rly_HighTempBit                   := 0;
	MOV	#lo_addr(_Rly_HighTempBit), W0
	BCLR	[W0], BitPos(_Rly_HighTempBit+0)
;GRR3000LManagementPanel.mpas,2396 :: 		TempFltCounter                    := 0;
	CLR	W0
	MOV	W0, _TempFltCounter
;GRR3000LManagementPanel.mpas,2397 :: 		HighTempBit                       := 0;
	MOV	#lo_addr(_HighTempBit), W0
	BCLR	[W0], BitPos(_HighTempBit+0)
;GRR3000LManagementPanel.mpas,2398 :: 		LogBit_HighTemp                   := 0;
	MOV	#lo_addr(_LogBit_HighTemp), W0
	BCLR	[W0], BitPos(_LogBit_HighTemp+0)
;GRR3000LManagementPanel.mpas,2400 :: 		end;
L__Led_RelayControl322:
;GRR3000LManagementPanel.mpas,2402 :: 		if (AC_MCB_Input =1) then // ac mcb sigortasý atýk
	BTSS	RA13_bit, BitPos(RA13_bit+0)
	GOTO	L__Led_RelayControl327
;GRR3000LManagementPanel.mpas,2404 :: 		Ac_MCB_Bit            := 1;
	MOV	#lo_addr(_Ac_MCB_Bit), W0
	BSET	[W0], BitPos(_Ac_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,2405 :: 		Led3_Group.Led3_AcMCB := 1;
	MOV	#lo_addr(_Led3_Group), W0
	BSET.B	[W0], #1
;GRR3000LManagementPanel.mpas,2406 :: 		Relay_Out_Data.RlyOut_12_AcMCB := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #11
;GRR3000LManagementPanel.mpas,2407 :: 		Rly_AcMcbBit                   := 1;
	MOV	#lo_addr(_Rly_AcMcbBit), W0
	BSET	[W0], BitPos(_Rly_AcMcbBit+0)
;GRR3000LManagementPanel.mpas,2408 :: 		end else
	GOTO	L__Led_RelayControl328
L__Led_RelayControl327:
;GRR3000LManagementPanel.mpas,2410 :: 		Ac_MCB_Bit            := 0;
	MOV	#lo_addr(_Ac_MCB_Bit), W0
	BCLR	[W0], BitPos(_Ac_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,2411 :: 		Led3_Group.Led3_AcMCB := 0;
	MOV	#lo_addr(_Led3_Group), W0
	BCLR.B	[W0], #1
;GRR3000LManagementPanel.mpas,2412 :: 		Relay_Out_Data.RlyOut_12_AcMCB := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #11
;GRR3000LManagementPanel.mpas,2413 :: 		Rly_AcMcbBit                   := 0;
	MOV	#lo_addr(_Rly_AcMcbBit), W0
	BCLR	[W0], BitPos(_Rly_AcMcbBit+0)
;GRR3000LManagementPanel.mpas,2414 :: 		LogBit_AcMCB                   := 0;
	MOV	#lo_addr(_LogBit_AcMCB), W0
	BCLR	[W0], BitPos(_LogBit_AcMCB+0)
;GRR3000LManagementPanel.mpas,2415 :: 		end;
L__Led_RelayControl328:
;GRR3000LManagementPanel.mpas,2417 :: 		if (Load_MCB_Input =1) then // yük mcb sigortasý atýk
	BTSS	RG9_bit, BitPos(RG9_bit+0)
	GOTO	L__Led_RelayControl330
;GRR3000LManagementPanel.mpas,2419 :: 		Load_MCB_Bit          := 1;
	MOV	#lo_addr(_Load_MCB_Bit), W0
	BSET	[W0], BitPos(_Load_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,2420 :: 		Led3_Group.Led3_DcMCB := 1;
	MOV	#lo_addr(_Led3_Group), W0
	BSET.B	[W0], #4
;GRR3000LManagementPanel.mpas,2421 :: 		Relay_Out_Data.RlyOut_13_DcMCB := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #12
;GRR3000LManagementPanel.mpas,2422 :: 		Rly_DcMcbBit                   := 1;
	MOV	#lo_addr(_Rly_DcMcbBit), W0
	BSET	[W0], BitPos(_Rly_DcMcbBit+0)
;GRR3000LManagementPanel.mpas,2423 :: 		end else
	GOTO	L__Led_RelayControl331
L__Led_RelayControl330:
;GRR3000LManagementPanel.mpas,2425 :: 		Load_MCB_Bit          := 0;
	MOV	#lo_addr(_Load_MCB_Bit), W0
	BCLR	[W0], BitPos(_Load_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,2426 :: 		Led3_Group.Led3_DcMCB := 0;
	MOV	#lo_addr(_Led3_Group), W0
	BCLR.B	[W0], #4
;GRR3000LManagementPanel.mpas,2427 :: 		Relay_Out_Data.RlyOut_13_DcMCB := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #12
;GRR3000LManagementPanel.mpas,2428 :: 		Rly_DcMcbBit                   := 0;
	MOV	#lo_addr(_Rly_DcMcbBit), W0
	BCLR	[W0], BitPos(_Rly_DcMcbBit+0)
;GRR3000LManagementPanel.mpas,2429 :: 		LogBit_LoadMCB                 := 0;
	MOV	#lo_addr(_LogBit_LoadMCB), W0
	BCLR	[W0], BitPos(_LogBit_LoadMCB+0)
;GRR3000LManagementPanel.mpas,2430 :: 		end;
L__Led_RelayControl331:
;GRR3000LManagementPanel.mpas,2432 :: 		if (Batt_MCB_Input =1) then // batt mcb sigortasý atýk
	BTSS	RA12_bit, BitPos(RA12_bit+0)
	GOTO	L__Led_RelayControl333
;GRR3000LManagementPanel.mpas,2434 :: 		Batt_MCB_Bit            := 1;
	MOV	#lo_addr(_Batt_MCB_Bit), W0
	BSET	[W0], BitPos(_Batt_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,2435 :: 		Led3_Group.Led3_BattMCB := 1;
	MOV	#lo_addr(_Led3_Group), W0
	BSET.B	[W0], #3
;GRR3000LManagementPanel.mpas,2436 :: 		Relay_Out_Data.RlyOut_14_BattMCB := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #13
;GRR3000LManagementPanel.mpas,2437 :: 		Rly_BattMcbBit                   := 1;
	MOV	#lo_addr(_Rly_BattMcbBit), W0
	BSET	[W0], BitPos(_Rly_BattMcbBit+0)
;GRR3000LManagementPanel.mpas,2438 :: 		end else
	GOTO	L__Led_RelayControl334
L__Led_RelayControl333:
;GRR3000LManagementPanel.mpas,2440 :: 		Batt_MCB_Bit            := 0;
	MOV	#lo_addr(_Batt_MCB_Bit), W0
	BCLR	[W0], BitPos(_Batt_MCB_Bit+0)
;GRR3000LManagementPanel.mpas,2441 :: 		Led3_Group.Led3_BattMCB := 0;
	MOV	#lo_addr(_Led3_Group), W0
	BCLR.B	[W0], #3
;GRR3000LManagementPanel.mpas,2442 :: 		Relay_Out_Data.RlyOut_14_BattMCB := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #13
;GRR3000LManagementPanel.mpas,2443 :: 		Rly_BattMcbBit                   := 0;
	MOV	#lo_addr(_Rly_BattMcbBit), W0
	BCLR	[W0], BitPos(_Rly_BattMcbBit+0)
;GRR3000LManagementPanel.mpas,2444 :: 		LogBit_BatMCB                    := 0;
	MOV	#lo_addr(_LogBit_BatMCB), W0
	BCLR	[W0], BitPos(_LogBit_BatMCB+0)
;GRR3000LManagementPanel.mpas,2445 :: 		end;
L__Led_RelayControl334:
;GRR3000LManagementPanel.mpas,2447 :: 		if (Dropper_OutStatus = 1) then // bypass ise
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Led_RelayControl5052
	GOTO	L__Led_RelayControl336
L__Led_RelayControl5052:
;GRR3000LManagementPanel.mpas,2449 :: 		Inc(DropCounter);
	MOV	#1, W1
	MOV	#lo_addr(_DropCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2450 :: 		if ((DropCounter > 500)and(DropCounter < 1000)) then
	MOV	_DropCounter, W2
	MOV	#500, W0
	CP	W2, W0
	CLR	W1
	BRA LEU	L__Led_RelayControl5053
	COM	W1
L__Led_RelayControl5053:
	MOV	#1000, W0
	CP	W2, W0
	CLR	W0
	BRA GEU	L__Led_RelayControl5054
	COM	W0
L__Led_RelayControl5054:
	AND	W1, W0, W0
	BRA NZ	L__Led_RelayControl5055
	GOTO	L__Led_RelayControl339
L__Led_RelayControl5055:
;GRR3000LManagementPanel.mpas,2452 :: 		Led3_Group.Led3_DropperStatus := 1;
	MOV	#lo_addr(_Led3_Group), W0
	BSET.B	[W0], #5
;GRR3000LManagementPanel.mpas,2453 :: 		end else
	GOTO	L__Led_RelayControl340
L__Led_RelayControl339:
;GRR3000LManagementPanel.mpas,2454 :: 		if (DropCounter > 1000) then
	MOV	_DropCounter, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5056
	GOTO	L__Led_RelayControl342
L__Led_RelayControl5056:
;GRR3000LManagementPanel.mpas,2456 :: 		Led3_Group.Led3_DropperStatus := 0;
	MOV	#lo_addr(_Led3_Group), W0
	BCLR.B	[W0], #5
;GRR3000LManagementPanel.mpas,2457 :: 		DropCounter                   := 0;
	CLR	W0
	MOV	W0, _DropCounter
;GRR3000LManagementPanel.mpas,2458 :: 		end;
L__Led_RelayControl342:
L__Led_RelayControl340:
;GRR3000LManagementPanel.mpas,2459 :: 		end else
	GOTO	L__Led_RelayControl337
L__Led_RelayControl336:
;GRR3000LManagementPanel.mpas,2460 :: 		if (Dropper_OutStatus = 2) then // disable ise
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Led_RelayControl5057
	GOTO	L__Led_RelayControl345
L__Led_RelayControl5057:
;GRR3000LManagementPanel.mpas,2462 :: 		Led3_Group.Led3_DropperStatus := 1;
	MOV	#lo_addr(_Led3_Group), W0
	BSET.B	[W0], #5
;GRR3000LManagementPanel.mpas,2463 :: 		end else
	GOTO	L__Led_RelayControl346
L__Led_RelayControl345:
;GRR3000LManagementPanel.mpas,2464 :: 		if (Dropper_OutStatus = 3) then // devrede ise
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Led_RelayControl5058
	GOTO	L__Led_RelayControl348
L__Led_RelayControl5058:
;GRR3000LManagementPanel.mpas,2466 :: 		Led3_Group.Led3_DropperStatus := 0;
	MOV	#lo_addr(_Led3_Group), W0
	BCLR.B	[W0], #5
;GRR3000LManagementPanel.mpas,2467 :: 		end;
L__Led_RelayControl348:
L__Led_RelayControl346:
L__Led_RelayControl337:
;GRR3000LManagementPanel.mpas,2470 :: 		if (FanOnBit = 1) then
	MOV	#lo_addr(_FanOnBit), W0
	BTSS	[W0], BitPos(_FanOnBit+0)
	GOTO	L__Led_RelayControl351
;GRR3000LManagementPanel.mpas,2472 :: 		if (FanFaultBit = 1) then
	MOV	#lo_addr(_FanFaultBit), W0
	BTSS	[W0], BitPos(_FanFaultBit+0)
	GOTO	L__Led_RelayControl354
;GRR3000LManagementPanel.mpas,2474 :: 		Inc(FanFaultCounter);
	MOV	#1, W1
	MOV	#lo_addr(_FanFaultCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2475 :: 		if (FanFaultCounter > FltTime) then
	MOV	_FanFaultCounter, W1
	MOV	#3000, W0
	CP	W1, W0
	BRA GTU	L__Led_RelayControl5059
	GOTO	L__Led_RelayControl357
L__Led_RelayControl5059:
;GRR3000LManagementPanel.mpas,2477 :: 		FanFaultCounter := FltTime + 5;
	MOV	#3005, W0
	MOV	W0, _FanFaultCounter
;GRR3000LManagementPanel.mpas,2478 :: 		Led2_Group.Led2_FanFault := 1;
	MOV	#lo_addr(_Led2_Group), W0
	BSET.B	[W0], #6
;GRR3000LManagementPanel.mpas,2479 :: 		Relay_Out_Data.RlyOut_9_FanFault := 1;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BSET	[W0], #8
;GRR3000LManagementPanel.mpas,2480 :: 		Rly_FanFaultBit                  := 1;
	MOV	#lo_addr(_Rly_FanFaultBit), W0
	BSET	[W0], BitPos(_Rly_FanFaultBit+0)
;GRR3000LManagementPanel.mpas,2481 :: 		FanFltBit                        := 1;
	MOV	#lo_addr(_FanFltBit), W0
	BSET	[W0], BitPos(_FanFltBit+0)
;GRR3000LManagementPanel.mpas,2482 :: 		end;
L__Led_RelayControl357:
;GRR3000LManagementPanel.mpas,2483 :: 		end else
	GOTO	L__Led_RelayControl355
L__Led_RelayControl354:
;GRR3000LManagementPanel.mpas,2485 :: 		FanFaultCounter := 0;
	CLR	W0
	MOV	W0, _FanFaultCounter
;GRR3000LManagementPanel.mpas,2486 :: 		Led2_Group.Led2_FanFault := 0;
	MOV	#lo_addr(_Led2_Group), W0
	BCLR.B	[W0], #6
;GRR3000LManagementPanel.mpas,2487 :: 		Relay_Out_Data.RlyOut_9_FanFault := 0;
	MOV	#lo_addr(_Relay_Out_Data), W0
	BCLR	[W0], #8
;GRR3000LManagementPanel.mpas,2488 :: 		Rly_FanFaultBit                  := 0;
	MOV	#lo_addr(_Rly_FanFaultBit), W0
	BCLR	[W0], BitPos(_Rly_FanFaultBit+0)
;GRR3000LManagementPanel.mpas,2489 :: 		FanFltBit                        := 0;
	MOV	#lo_addr(_FanFltBit), W0
	BCLR	[W0], BitPos(_FanFltBit+0)
;GRR3000LManagementPanel.mpas,2490 :: 		LogBit_FanFault                  := 0;
	MOV	#lo_addr(_LogBit_FanFault), W0
	BCLR	[W0], BitPos(_LogBit_FanFault+0)
;GRR3000LManagementPanel.mpas,2491 :: 		end;
L__Led_RelayControl355:
;GRR3000LManagementPanel.mpas,2492 :: 		end;
L__Led_RelayControl351:
;GRR3000LManagementPanel.mpas,2494 :: 		end;
L_end_Led_RelayControl:
	POP	W10
	ULNK
	RETURN
; end of _Led_RelayControl

_Fan_Heat_Control:

;GRR3000LManagementPanel.mpas,2497 :: 		begin
;GRR3000LManagementPanel.mpas,2499 :: 		if ((Dropper_Out_1 =0)or(Dropper_Out_2 =0)) then
	BCLR	W2, #0
	BTSS	LATC3_bit, BitPos(LATC3_bit+0)
	BSET	W2, #0
	BTSS	LATC2_bit, BitPos(LATC2_bit+0)
	BSET	66, #0
	BTSC	LATC2_bit, BitPos(LATC2_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Fan_Heat_Control5061
	BCLR	W2, #0
	BRA	L__Fan_Heat_Control5064
L__Fan_Heat_Control5061:
	BSET	W2, #0
L__Fan_Heat_Control5064:
	BTSS	W2, #0
	GOTO	L__Fan_Heat_Control361
;GRR3000LManagementPanel.mpas,2501 :: 		Dropper_Out_3 := 1; // faný aç, bu çýkýþ dropperlarýn fan çýkýþý yapýldý
	BSET	LATC1_bit, BitPos(LATC1_bit+0)
;GRR3000LManagementPanel.mpas,2502 :: 		end else
	GOTO	L__Fan_Heat_Control362
L__Fan_Heat_Control361:
;GRR3000LManagementPanel.mpas,2503 :: 		if ((Dropper_Out_1 =1)and(Dropper_Out_2 =1)) then
	BSET	W2, #0
	BTSS	LATC3_bit, BitPos(LATC3_bit+0)
	BCLR	W2, #0
	BTSS	LATC2_bit, BitPos(LATC2_bit+0)
	BCLR	66, #0
	BTSC	LATC2_bit, BitPos(LATC2_bit+0)
	BSET	66, #0
	BTSC	W2, #0
	BTSS	66, #0
	BRA	L__Fan_Heat_Control5066
	BSET	W2, #0
	BRA	L__Fan_Heat_Control5068
L__Fan_Heat_Control5066:
	BCLR	W2, #0
L__Fan_Heat_Control5068:
	BTSS	W2, #0
	GOTO	L__Fan_Heat_Control364
;GRR3000LManagementPanel.mpas,2505 :: 		Dropper_Out_3 := 0; // faný aç, bu çýkýþ dropperlarýn fan çýkýþý yapýldý
	BCLR	LATC1_bit, BitPos(LATC1_bit+0)
;GRR3000LManagementPanel.mpas,2506 :: 		end;
L__Fan_Heat_Control364:
L__Fan_Heat_Control362:
;GRR3000LManagementPanel.mpas,2508 :: 		if (PCB_Temperature >= TempFanOnSet) then
	MOV	#lo_addr(_PCB_Temperature), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_TempFanOnSet), W0
	CP.B	W1, [W0]
	BRA GEU	L__Fan_Heat_Control5069
	GOTO	L__Fan_Heat_Control367
L__Fan_Heat_Control5069:
;GRR3000LManagementPanel.mpas,2510 :: 		Fan_Out := 1;
	BSET	RG15_bit, BitPos(RG15_bit+0)
;GRR3000LManagementPanel.mpas,2511 :: 		FanOnBit:= 1;
	MOV	#lo_addr(_FanOnBit), W0
	BSET	[W0], BitPos(_FanOnBit+0)
;GRR3000LManagementPanel.mpas,2512 :: 		end else
	GOTO	L__Fan_Heat_Control368
L__Fan_Heat_Control367:
;GRR3000LManagementPanel.mpas,2513 :: 		if (PCB_Temperature <= TempFanOffSet) then
	MOV	#lo_addr(_PCB_Temperature), W0
	MOV.B	[W0], W1
	MOV	#lo_addr(_TempFanOffSet), W0
	CP.B	W1, [W0]
	BRA LEU	L__Fan_Heat_Control5070
	GOTO	L__Fan_Heat_Control370
L__Fan_Heat_Control5070:
;GRR3000LManagementPanel.mpas,2515 :: 		Fan_Out := 0;
	BCLR	RG15_bit, BitPos(RG15_bit+0)
;GRR3000LManagementPanel.mpas,2516 :: 		FanOnBit:= 0;
	MOV	#lo_addr(_FanOnBit), W0
	BCLR	[W0], BitPos(_FanOnBit+0)
;GRR3000LManagementPanel.mpas,2517 :: 		end;
L__Fan_Heat_Control370:
L__Fan_Heat_Control368:
;GRR3000LManagementPanel.mpas,2521 :: 		if (PCB_Temperature < 10) then // kasa iç sýcaklýk 10C altýnda ýsýtýcýyý çalýþtýr
	MOV	#lo_addr(_PCB_Temperature), W0
	MOV.B	[W0], W0
	CP.B	W0, #10
	BRA LTU	L__Fan_Heat_Control5071
	GOTO	L__Fan_Heat_Control373
L__Fan_Heat_Control5071:
;GRR3000LManagementPanel.mpas,2523 :: 		Heater_Output       := 1;
	BSET	RA9_bit, BitPos(RA9_bit+0)
;GRR3000LManagementPanel.mpas,2524 :: 		CaseHeaterActiveBit := 1;
	MOV	#lo_addr(_CaseHeaterActiveBit), W0
	BSET	[W0], BitPos(_CaseHeaterActiveBit+0)
;GRR3000LManagementPanel.mpas,2525 :: 		end else
	GOTO	L__Fan_Heat_Control374
L__Fan_Heat_Control373:
;GRR3000LManagementPanel.mpas,2526 :: 		if (PCB_Temperature > 15) then // kasa iç sýcaklýk 15C üstünde ýsýtýcýyý kapat
	MOV	#lo_addr(_PCB_Temperature), W0
	MOV.B	[W0], W0
	CP.B	W0, #15
	BRA GTU	L__Fan_Heat_Control5072
	GOTO	L__Fan_Heat_Control376
L__Fan_Heat_Control5072:
;GRR3000LManagementPanel.mpas,2528 :: 		Heater_Output       := 0;
	BCLR	RA9_bit, BitPos(RA9_bit+0)
;GRR3000LManagementPanel.mpas,2529 :: 		CaseHeaterActiveBit := 0;
	MOV	#lo_addr(_CaseHeaterActiveBit), W0
	BCLR	[W0], BitPos(_CaseHeaterActiveBit+0)
;GRR3000LManagementPanel.mpas,2530 :: 		end;
L__Fan_Heat_Control376:
L__Fan_Heat_Control374:
;GRR3000LManagementPanel.mpas,2533 :: 		end;
L_end_Fan_Heat_Control:
	RETURN
; end of _Fan_Heat_Control

_Dropper_Control:

;GRR3000LManagementPanel.mpas,2536 :: 		begin
;GRR3000LManagementPanel.mpas,2538 :: 		if (Dropper_OutStatus <> 2) then  // dropper durumu devredýþý deðilse, dropper özelliði aktif
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__Dropper_Control5074
	GOTO	L__Dropper_Control380
L__Dropper_Control5074:
;GRR3000LManagementPanel.mpas,2540 :: 		DropperCloseCounter := 0;
	CLR	W0
	MOV	W0, _DropperCloseCounter
;GRR3000LManagementPanel.mpas,2541 :: 		if (Read_LoadVolt > (HucreSayisi * 23)) then // gerilim %110' dan büyükse
	MOV	_HucreSayisi, W1
	MOV	#23, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_Read_LoadVolt), W0
	CP	W2, [W0]
	BRA LTU	L__Dropper_Control5075
	GOTO	L__Dropper_Control383
L__Dropper_Control5075:
;GRR3000LManagementPanel.mpas,2543 :: 		Inc(DropperInitCounter1);
	MOV	#1, W1
	MOV	#lo_addr(_DropperInitCounter1), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2545 :: 		DropperInitCounter3 := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter3
;GRR3000LManagementPanel.mpas,2546 :: 		DropperInitCounter4 := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter4
;GRR3000LManagementPanel.mpas,2548 :: 		if (DropperInitCounter1 > DropperSayac) then
	MOV	#250, W1
	MOV	#lo_addr(_DropperInitCounter1), W0
	CP	W1, [W0]
	BRA LTU	L__Dropper_Control5076
	GOTO	L__Dropper_Control386
L__Dropper_Control5076:
;GRR3000LManagementPanel.mpas,2550 :: 		DropperInitCounter1 := DropperSayac;
	MOV	#250, W0
	MOV	W0, _DropperInitCounter1
;GRR3000LManagementPanel.mpas,2551 :: 		Dropper_Out_1       := 0; // dropper 1 devrede
	BCLR	LATC3_bit, BitPos(LATC3_bit+0)
;GRR3000LManagementPanel.mpas,2553 :: 		if (Dropper_OutStatus = 3) then // dropper tamamý aktif ise burayý kullan, bypass ise sadece 1 çýkýþý kullan
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Control5077
	GOTO	L__Dropper_Control389
L__Dropper_Control5077:
;GRR3000LManagementPanel.mpas,2555 :: 		if (Read_LoadVolt > (HucreSayisi *23)) then // gerilim hala %110' dan büyükse
	MOV	_HucreSayisi, W1
	MOV	#23, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_Read_LoadVolt), W0
	CP	W2, [W0]
	BRA LTU	L__Dropper_Control5078
	GOTO	L__Dropper_Control392
L__Dropper_Control5078:
;GRR3000LManagementPanel.mpas,2557 :: 		Inc(DropperInitCounter2);
	MOV	#1, W1
	MOV	#lo_addr(_DropperInitCounter2), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2558 :: 		if (DropperInitCounter2 > DropperSayac) then
	MOV	#250, W1
	MOV	#lo_addr(_DropperInitCounter2), W0
	CP	W1, [W0]
	BRA LTU	L__Dropper_Control5079
	GOTO	L__Dropper_Control395
L__Dropper_Control5079:
;GRR3000LManagementPanel.mpas,2560 :: 		DropperInitCounter2 := 1100;
	MOV	#1100, W0
	MOV	W0, _DropperInitCounter2
;GRR3000LManagementPanel.mpas,2561 :: 		DropperInitCounter1 := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter1
;GRR3000LManagementPanel.mpas,2562 :: 		Dropper_Out_2       := 0; // dropper 2 de devrede
	BCLR	LATC2_bit, BitPos(LATC2_bit+0)
;GRR3000LManagementPanel.mpas,2563 :: 		end;
L__Dropper_Control395:
;GRR3000LManagementPanel.mpas,2564 :: 		end;
L__Dropper_Control392:
;GRR3000LManagementPanel.mpas,2565 :: 		end;
L__Dropper_Control389:
;GRR3000LManagementPanel.mpas,2566 :: 		end;
L__Dropper_Control386:
;GRR3000LManagementPanel.mpas,2567 :: 		end else
	GOTO	L__Dropper_Control384
L__Dropper_Control383:
;GRR3000LManagementPanel.mpas,2568 :: 		if (Read_LoadVolt < (HucreSayisi * 20)) then // gerilim %100' den küçükse
	MOV	_HucreSayisi, W1
	MOV	#20, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_Read_LoadVolt), W0
	CP	W2, [W0]
	BRA GTU	L__Dropper_Control5080
	GOTO	L__Dropper_Control398
L__Dropper_Control5080:
;GRR3000LManagementPanel.mpas,2570 :: 		Inc(DropperInitCounter3);
	MOV	#1, W1
	MOV	#lo_addr(_DropperInitCounter3), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2572 :: 		DropperInitCounter1 := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter1
;GRR3000LManagementPanel.mpas,2573 :: 		DropperInitCounter2 := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter2
;GRR3000LManagementPanel.mpas,2575 :: 		if (DropperInitCounter3 > DropperSayac) then
	MOV	#250, W1
	MOV	#lo_addr(_DropperInitCounter3), W0
	CP	W1, [W0]
	BRA LTU	L__Dropper_Control5081
	GOTO	L__Dropper_Control401
L__Dropper_Control5081:
;GRR3000LManagementPanel.mpas,2577 :: 		DropperInitCounter3  := DropperSayac;
	MOV	#250, W0
	MOV	W0, _DropperInitCounter3
;GRR3000LManagementPanel.mpas,2578 :: 		Dropper_Out_2        := 1; // dropper 2 yi devreden çýkar
	BSET	LATC2_bit, BitPos(LATC2_bit+0)
;GRR3000LManagementPanel.mpas,2580 :: 		if (Dropper_OutStatus = 3) then // dropper tamamý aktif ise burayý kullan, bypass ise sadece 1 çýkýþý kullan
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Control5082
	GOTO	L__Dropper_Control404
L__Dropper_Control5082:
;GRR3000LManagementPanel.mpas,2582 :: 		if (Read_LoadVolt < (HucreSayisi * 20)) then // gerilim hala %100' den küçükse
	MOV	_HucreSayisi, W1
	MOV	#20, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_Read_LoadVolt), W0
	CP	W2, [W0]
	BRA GTU	L__Dropper_Control5083
	GOTO	L__Dropper_Control407
L__Dropper_Control5083:
;GRR3000LManagementPanel.mpas,2584 :: 		Inc(DropperInitCounter4);
	MOV	#1, W1
	MOV	#lo_addr(_DropperInitCounter4), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2585 :: 		if (DropperInitCounter4 > DropperSayac) then
	MOV	#250, W1
	MOV	#lo_addr(_DropperInitCounter4), W0
	CP	W1, [W0]
	BRA LTU	L__Dropper_Control5084
	GOTO	L__Dropper_Control410
L__Dropper_Control5084:
;GRR3000LManagementPanel.mpas,2587 :: 		DropperInitCounter4 := DropperSayac;
	MOV	#250, W0
	MOV	W0, _DropperInitCounter4
;GRR3000LManagementPanel.mpas,2588 :: 		DropperInitCounter3 := 0;
	CLR	W0
	MOV	W0, _DropperInitCounter3
;GRR3000LManagementPanel.mpas,2589 :: 		Dropper_Out_1       := 1; // dropper 1 i devreden çýkar
	BSET	LATC3_bit, BitPos(LATC3_bit+0)
;GRR3000LManagementPanel.mpas,2590 :: 		end;
L__Dropper_Control410:
;GRR3000LManagementPanel.mpas,2592 :: 		end;
L__Dropper_Control407:
;GRR3000LManagementPanel.mpas,2593 :: 		end;
L__Dropper_Control404:
;GRR3000LManagementPanel.mpas,2594 :: 		end;
L__Dropper_Control401:
;GRR3000LManagementPanel.mpas,2595 :: 		end;
L__Dropper_Control398:
L__Dropper_Control384:
;GRR3000LManagementPanel.mpas,2596 :: 		end else
	GOTO	L__Dropper_Control381
L__Dropper_Control380:
;GRR3000LManagementPanel.mpas,2597 :: 		if (Dropper_OutStatus = 2) then // kapalý ise
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Dropper_Control5085
	GOTO	L__Dropper_Control413
L__Dropper_Control5085:
;GRR3000LManagementPanel.mpas,2599 :: 		Dropper_Out_1 := 1;
	BSET	LATC3_bit, BitPos(LATC3_bit+0)
;GRR3000LManagementPanel.mpas,2600 :: 		Inc(DropperCloseCounter);
	MOV	#1, W1
	MOV	#lo_addr(_DropperCloseCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2601 :: 		if (DropperCloseCounter > DropperSayac) then  // ikisi ayný anda çalýþmasýn 2sn sonra çalýþsýn
	MOV	#250, W1
	MOV	#lo_addr(_DropperCloseCounter), W0
	CP	W1, [W0]
	BRA LTU	L__Dropper_Control5086
	GOTO	L__Dropper_Control416
L__Dropper_Control5086:
;GRR3000LManagementPanel.mpas,2603 :: 		DropperCloseCounter := 0;
	CLR	W0
	MOV	W0, _DropperCloseCounter
;GRR3000LManagementPanel.mpas,2604 :: 		Dropper_Out_2       := 1;
	BSET	LATC2_bit, BitPos(LATC2_bit+0)
;GRR3000LManagementPanel.mpas,2605 :: 		end;
L__Dropper_Control416:
;GRR3000LManagementPanel.mpas,2606 :: 		end;
L__Dropper_Control413:
L__Dropper_Control381:
;GRR3000LManagementPanel.mpas,2608 :: 		end;
L_end_Dropper_Control:
	RETURN
; end of _Dropper_Control

_InitTimer5:

;GRR3000LManagementPanel.mpas,2611 :: 		begin
;GRR3000LManagementPanel.mpas,2612 :: 		T5CON     := 0x8000;
	MOV	#32768, W0
	MOV	WREG, T5CON
;GRR3000LManagementPanel.mpas,2613 :: 		TMR5      := 0;
	CLR	TMR5
;GRR3000LManagementPanel.mpas,2614 :: 		PR5       := 3000; // 100us timer için
	MOV	#3000, W0
	MOV	WREG, PR5
;GRR3000LManagementPanel.mpas,2615 :: 		T5IF_bit  := 0;
	BCLR	T5IF_bit, BitPos(T5IF_bit+0)
;GRR3000LManagementPanel.mpas,2616 :: 		T5IE_bit  := 1;
	BSET	T5IE_bit, BitPos(T5IE_bit+0)
;GRR3000LManagementPanel.mpas,2617 :: 		IPC5      := IPC5 or %0000001100000000; // timer 5 priority level 3
	MOV	#768, W1
	MOV	#lo_addr(IPC5), W0
	IOR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2618 :: 		end;
L_end_InitTimer5:
	RETURN
; end of _InitTimer5

_Timer5Interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GRR3000LManagementPanel.mpas,2621 :: 		begin
;GRR3000LManagementPanel.mpas,2623 :: 		IEC1.6 := 0;
	BCLR	IEC1, #6
;GRR3000LManagementPanel.mpas,2624 :: 		T5CON  := 0x0000;
	CLR	T5CON
;GRR3000LManagementPanel.mpas,2626 :: 		Check_Modbus();
	CALL	_Check_Modbus
;GRR3000LManagementPanel.mpas,2628 :: 		IFS1.6 :=0;
	BCLR	IFS1, #6
;GRR3000LManagementPanel.mpas,2629 :: 		IEC1.6 :=1;
	BSET	IEC1, #6
;GRR3000LManagementPanel.mpas,2630 :: 		T5CON := 0x8000; //start TMR5
	MOV	#32768, W0
	MOV	WREG, T5CON
;GRR3000LManagementPanel.mpas,2631 :: 		end;
L_end_Timer5Interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Timer5Interrupt

_Timer4Interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;GRR3000LManagementPanel.mpas,2634 :: 		begin
;GRR3000LManagementPanel.mpas,2635 :: 		IEC1.5 :=0;
	PUSH	W10
	BCLR	IEC1, #5
;GRR3000LManagementPanel.mpas,2636 :: 		T4CON := %0000000000000000; //stop TMR3
	CLR	T4CON
;GRR3000LManagementPanel.mpas,2638 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Timer4Interrupt422
;GRR3000LManagementPanel.mpas,2641 :: 		UP_PressBit := 1;
	MOV	#lo_addr(_UP_PressBit), W0
	BSET	[W0], BitPos(_UP_PressBit+0)
;GRR3000LManagementPanel.mpas,2642 :: 		Inc(UpButonCounter);
	MOV	#1, W1
	MOV	#lo_addr(_UpButonCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2643 :: 		if (UpButonCounter > 2000) then // 2sn den fazla basýlmýþsa sadece lcd ekranda ac akým ve gerilim ekranýný deðiþtir
	MOV	_UpButonCounter, W1
	MOV	#2000, W0
	CP	W1, W0
	BRA GTU	L__Timer4Interrupt5090
	GOTO	L__Timer4Interrupt425
L__Timer4Interrupt5090:
;GRR3000LManagementPanel.mpas,2645 :: 		AcViewScreenBit := not AcViewScreenBit;
	MOV	#lo_addr(_AcViewScreenBit), W1
	MOV	#lo_addr(_AcViewScreenBit), W0
	BTG	[W0], BitPos(_AcViewScreenBit+0)
;GRR3000LManagementPanel.mpas,2646 :: 		UpButonCounter  := 0;
	CLR	W0
	MOV	W0, _UpButonCounter
;GRR3000LManagementPanel.mpas,2647 :: 		end;
L__Timer4Interrupt425:
;GRR3000LManagementPanel.mpas,2649 :: 		end else
	GOTO	L__Timer4Interrupt423
L__Timer4Interrupt422:
;GRR3000LManagementPanel.mpas,2650 :: 		if (Up_Button) then
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Timer4Interrupt428
;GRR3000LManagementPanel.mpas,2652 :: 		if (UP_PressBit = 1) then // butona basýlarak geldiyse
	MOV	#lo_addr(_UP_PressBit), W0
	BTSS	[W0], BitPos(_UP_PressBit+0)
	GOTO	L__Timer4Interrupt431
;GRR3000LManagementPanel.mpas,2654 :: 		if (UpButonCounter < 2000) then // 2sn den az basýlmýþsa sadece voltmetre-ampermetre ekranýný deðiþtir
	MOV	_UpButonCounter, W1
	MOV	#2000, W0
	CP	W1, W0
	BRA LTU	L__Timer4Interrupt5091
	GOTO	L__Timer4Interrupt434
L__Timer4Interrupt5091:
;GRR3000LManagementPanel.mpas,2656 :: 		ScreenView      := not ScreenView;
	MOV	#lo_addr(_ScreenView), W1
	MOV	#lo_addr(_ScreenView), W0
	BTG	[W0], BitPos(_ScreenView+0)
;GRR3000LManagementPanel.mpas,2657 :: 		UpButonCounter  := 0;
	CLR	W0
	MOV	W0, _UpButonCounter
;GRR3000LManagementPanel.mpas,2658 :: 		end;{else
L__Timer4Interrupt434:
;GRR3000LManagementPanel.mpas,2665 :: 		UP_PressBit     := 0;
	MOV	#lo_addr(_UP_PressBit), W0
	BCLR	[W0], BitPos(_UP_PressBit+0)
;GRR3000LManagementPanel.mpas,2666 :: 		UpButonCounter  := 0;
	CLR	W0
	MOV	W0, _UpButonCounter
;GRR3000LManagementPanel.mpas,2667 :: 		end;
L__Timer4Interrupt431:
;GRR3000LManagementPanel.mpas,2668 :: 		end;
L__Timer4Interrupt428:
L__Timer4Interrupt423:
;GRR3000LManagementPanel.mpas,2670 :: 		Inc(Start_Counter);
	MOV	#1, W1
	MOV	#lo_addr(_Start_Counter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2671 :: 		if (Start_Counter >= 20000) then // program açýldýktan 20sn sonra hatalarý yazmaya baþlayacak  45000
	MOV	_Start_Counter, W1
	MOV	#20000, W0
	CP	W1, W0
	BRA GEU	L__Timer4Interrupt5092
	GOTO	L__Timer4Interrupt437
L__Timer4Interrupt5092:
;GRR3000LManagementPanel.mpas,2673 :: 		Start_Counter := 45000;
	MOV	#45000, W0
	MOV	W0, _Start_Counter
;GRR3000LManagementPanel.mpas,2674 :: 		Start_Bit     := 1;
	MOV	#lo_addr(_Start_Bit), W0
	BSET	[W0], BitPos(_Start_Bit+0)
;GRR3000LManagementPanel.mpas,2675 :: 		end;
L__Timer4Interrupt437:
;GRR3000LManagementPanel.mpas,2677 :: 		Inc(ScreenCounter);
	MOV	#1, W1
	MOV	#lo_addr(_ScreenCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2679 :: 		if (posleakbit = 0) then
	MOV	#lo_addr(_posleakbit), W0
	BTSC	[W0], BitPos(_posleakbit+0)
	GOTO	L__Timer4Interrupt440
;GRR3000LManagementPanel.mpas,2681 :: 		inc(PosCounter);
	MOV	#1, W1
	MOV	#lo_addr(_PosCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2682 :: 		if (PosCounter > 2000) then
	MOV	_PosCounter, W1
	MOV	#2000, W0
	CP	W1, W0
	BRA GTU	L__Timer4Interrupt5093
	GOTO	L__Timer4Interrupt443
L__Timer4Interrupt5093:
;GRR3000LManagementPanel.mpas,2684 :: 		Pos_Leakage_bit := 0;
	MOV	#lo_addr(_Pos_Leakage_bit), W0
	BCLR	[W0], BitPos(_Pos_Leakage_bit+0)
;GRR3000LManagementPanel.mpas,2685 :: 		PosCounter      := 2000;
	MOV	#2000, W0
	MOV	W0, _PosCounter
;GRR3000LManagementPanel.mpas,2686 :: 		end;
L__Timer4Interrupt443:
;GRR3000LManagementPanel.mpas,2687 :: 		end else
	GOTO	L__Timer4Interrupt441
L__Timer4Interrupt440:
;GRR3000LManagementPanel.mpas,2689 :: 		PosCounter      := 0;
	CLR	W0
	MOV	W0, _PosCounter
;GRR3000LManagementPanel.mpas,2690 :: 		Pos_Leakage_bit := 1;
	MOV	#lo_addr(_Pos_Leakage_bit), W0
	BSET	[W0], BitPos(_Pos_Leakage_bit+0)
;GRR3000LManagementPanel.mpas,2692 :: 		end;
L__Timer4Interrupt441:
;GRR3000LManagementPanel.mpas,2694 :: 		if (negleakbit = 0) then
	MOV	#lo_addr(_negleakbit), W0
	BTSC	[W0], BitPos(_negleakbit+0)
	GOTO	L__Timer4Interrupt446
;GRR3000LManagementPanel.mpas,2696 :: 		inc(NegCounter);
	MOV	#1, W1
	MOV	#lo_addr(_NegCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2697 :: 		if (NegCounter > 2000) then
	MOV	_NegCounter, W1
	MOV	#2000, W0
	CP	W1, W0
	BRA GTU	L__Timer4Interrupt5094
	GOTO	L__Timer4Interrupt449
L__Timer4Interrupt5094:
;GRR3000LManagementPanel.mpas,2699 :: 		Neg_Leakage_bit := 0;
	MOV	#lo_addr(_Neg_Leakage_bit), W0
	BCLR	[W0], BitPos(_Neg_Leakage_bit+0)
;GRR3000LManagementPanel.mpas,2700 :: 		NegCounter      := 2000;
	MOV	#2000, W0
	MOV	W0, _NegCounter
;GRR3000LManagementPanel.mpas,2701 :: 		end;
L__Timer4Interrupt449:
;GRR3000LManagementPanel.mpas,2702 :: 		end else
	GOTO	L__Timer4Interrupt447
L__Timer4Interrupt446:
;GRR3000LManagementPanel.mpas,2704 :: 		NegCounter      := 0;
	CLR	W0
	MOV	W0, _NegCounter
;GRR3000LManagementPanel.mpas,2705 :: 		Neg_Leakage_bit := 1;
	MOV	#lo_addr(_Neg_Leakage_bit), W0
	BSET	[W0], BitPos(_Neg_Leakage_bit+0)
;GRR3000LManagementPanel.mpas,2707 :: 		end;
L__Timer4Interrupt447:
;GRR3000LManagementPanel.mpas,2710 :: 		if (Bat_Service_Timer_bit = 1) then
	MOV	#lo_addr(_Bat_Service_Timer_bit), W0
	BTSS	[W0], BitPos(_Bat_Service_Timer_bit+0)
	GOTO	L__Timer4Interrupt452
;GRR3000LManagementPanel.mpas,2711 :: 		Inc(Bat_Service_Timer);
	MOV	#1, W1
	MOV	#lo_addr(_Bat_Service_Timer), W0
	ADD	W1, [W0], [W0]
L__Timer4Interrupt452:
;GRR3000LManagementPanel.mpas,2713 :: 		if (Bakim_Start = 1) then
	MOV	#lo_addr(_Bakim_Start), W0
	BTSS	[W0], BitPos(_Bakim_Start+0)
	GOTO	L__Timer4Interrupt455
;GRR3000LManagementPanel.mpas,2715 :: 		Inc(QuitTimeCounter);
	MOV	#1, W1
	MOV	#0, W2
	MOV	#lo_addr(_QuitTimeCounter), W0
	ADD	W1, [W0], [W0++]
	ADDC	W2, [W0], [W0--]
;GRR3000LManagementPanel.mpas,2716 :: 		if ((QuitTimeCounter >= QuitTime_Sec)or(QuitVoltBit = 1)) then // bakým süresi dolmuþsa veya deþarj olmuþsa
	MOV	_QuitTimeCounter, W2
	MOV	_QuitTimeCounter+2, W3
	MOV	#lo_addr(_QuitTime_Sec), W0
	CP	W2, [W0++]
	CPB	W3, [W0--]
	CLR	W1
	BRA LT	L__Timer4Interrupt5095
	COM	W1
L__Timer4Interrupt5095:
	MOV	#lo_addr(_QuitVoltBit), W0
	BTSS	[W0], BitPos(_QuitVoltBit+0)
	BCLR	66, #0
	BTSC	[W0], BitPos(_QuitVoltBit+0)
	BSET	66, #0
	CLR.B	W0
	BTSC	66, #0
	INC.B	W0
	ZE	W0, W0
	IOR	W1, W0, W0
	BRA NZ	L__Timer4Interrupt5096
	GOTO	L__Timer4Interrupt458
L__Timer4Interrupt5096:
;GRR3000LManagementPanel.mpas,2718 :: 		QuitTimeCounter         := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _QuitTimeCounter
	MOV	W1, _QuitTimeCounter+2
;GRR3000LManagementPanel.mpas,2719 :: 		BakimControlBit         := 0; // yeniden bakým kontrolü yapýlsýn
	MOV	#lo_addr(_BakimControlBit), W0
	BCLR	[W0], BitPos(_BakimControlBit+0)
;GRR3000LManagementPanel.mpas,2720 :: 		BakimStartBit           := 0; // bakýmý durdur
	MOV	#lo_addr(_BakimStartBit), W0
	BCLR	[W0], BitPos(_BakimStartBit+0)
;GRR3000LManagementPanel.mpas,2721 :: 		Bakim_Start             := 0;
	MOV	#lo_addr(_Bakim_Start), W0
	BCLR	[W0], BitPos(_Bakim_Start+0)
;GRR3000LManagementPanel.mpas,2722 :: 		BakimLockBit            := 1;
	MOV	#lo_addr(_BakimLockBit), W0
	BSET	[W0], BitPos(_BakimLockBit+0)
;GRR3000LManagementPanel.mpas,2723 :: 		Bat_Service_Unit1       := 1;
	MOV	#lo_addr(_Bat_Service_Unit1), W0
	BSET	[W0], BitPos(_Bat_Service_Unit1+0)
;GRR3000LManagementPanel.mpas,2724 :: 		Bat_Service_Unit2       := 1;
	MOV	#lo_addr(_Bat_Service_Unit2), W0
	BSET	[W0], BitPos(_Bat_Service_Unit2+0)
;GRR3000LManagementPanel.mpas,2725 :: 		Bat_Service_Timer       := 0;
	CLR	W0
	MOV	W0, _Bat_Service_Timer
;GRR3000LManagementPanel.mpas,2726 :: 		Bat_Service_Timer_bit   := 0;
	MOV	#lo_addr(_Bat_Service_Timer_bit), W0
	BCLR	[W0], BitPos(_Bat_Service_Timer_bit+0)
;GRR3000LManagementPanel.mpas,2727 :: 		BakimInitBit            := 0;
	MOV	#lo_addr(_BakimInitBit), W0
	BCLR	[W0], BitPos(_BakimInitBit+0)
;GRR3000LManagementPanel.mpas,2728 :: 		Service_Charge_StateBit := 10;
	MOV	#lo_addr(_Service_Charge_StateBit), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2730 :: 		StopBit   := 0;
	MOV	#lo_addr(_StopBit), W0
	BCLR	[W0], BitPos(_StopBit+0)
;GRR3000LManagementPanel.mpas,2733 :: 		end;
L__Timer4Interrupt458:
;GRR3000LManagementPanel.mpas,2734 :: 		end else QuitTimeCounter := 0;
	GOTO	L__Timer4Interrupt456
L__Timer4Interrupt455:
	CLR	W0
	CLR	W1
	MOV	W0, _QuitTimeCounter
	MOV	W1, _QuitTimeCounter+2
L__Timer4Interrupt456:
;GRR3000LManagementPanel.mpas,2741 :: 		if ((Ok_Button =0)or(Down_Button =0)or(Up_Button =0)) then
	BCLR	W4, #0
	BTSS	Ok_Button, BitPos(Ok_Button+0)
	BSET	W4, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W4, #0
	BTSC	66, #0
	BRA	L__Timer4Interrupt5097
	BCLR	W4, #0
	BRA	L__Timer4Interrupt5100
L__Timer4Interrupt5097:
	BSET	W4, #0
L__Timer4Interrupt5100:
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	66, #0
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	BCLR	66, #0
	BTSS	W4, #0
	BTSC	66, #0
	BRA	L__Timer4Interrupt5101
	BCLR	W4, #0
	BRA	L__Timer4Interrupt5104
L__Timer4Interrupt5101:
	BSET	W4, #0
L__Timer4Interrupt5104:
	BTSS	W4, #0
	GOTO	L__Timer4Interrupt461
;GRR3000LManagementPanel.mpas,2743 :: 		MenuExitCounter           := 0;
	CLR	W0
	CLR	W1
	MOV	W0, _MenuExitCounter
	MOV	W1, _MenuExitCounter+2
;GRR3000LManagementPanel.mpas,2744 :: 		Bat_Curve_Scan_State_bit  := 10;
	MOV	#lo_addr(_Bat_Curve_Scan_State_bit), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2745 :: 		bat_curve_scan_fail       := 0;
	MOV	#lo_addr(_bat_curve_scan_fail), W0
	BCLR	[W0], BitPos(_bat_curve_scan_fail+0)
;GRR3000LManagementPanel.mpas,2746 :: 		end;
L__Timer4Interrupt461:
;GRR3000LManagementPanel.mpas,2748 :: 		Inc(MenuExitCounter);
	MOV	#1, W1
	MOV	#0, W2
	MOV	#lo_addr(_MenuExitCounter), W0
	ADD	W1, [W0], [W0++]
	ADDC	W2, [W0], [W0--]
;GRR3000LManagementPanel.mpas,2749 :: 		if (MenuExitCounter > MenuExitValue) then // menuden otomatik çýkma sayacý
	MOV	#30000, W1
	MOV	#0, W2
	MOV	#lo_addr(_MenuExitCounter), W0
	CP	W1, [W0++]
	CPB	W2, [W0--]
	BRA LT	L__Timer4Interrupt5105
	GOTO	L__Timer4Interrupt464
L__Timer4Interrupt5105:
;GRR3000LManagementPanel.mpas,2751 :: 		MainMenuExit         := 255;
	MOV	#lo_addr(_MainMenuExit), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2752 :: 		MenuExit             := 255;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2753 :: 		Chng[1]              := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2754 :: 		Chng[2]              := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2755 :: 		Chng[3]              := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2756 :: 		Chng[4]              := 0;
	MOV	#lo_addr(_Chng+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2757 :: 		Chng[5]              := 0;
	MOV	#lo_addr(_Chng+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2758 :: 		Chng[6]              := 0;
	MOV	#lo_addr(_Chng+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2759 :: 		Chng[7]              := 0;
	MOV	#lo_addr(_Chng+6), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2760 :: 		Chng[8]              := 0;
	MOV	#lo_addr(_Chng+7), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2761 :: 		Chng[9]              := 0;
	MOV	#lo_addr(_Chng+8), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2762 :: 		Chng[10]             := 0;
	MOV	#lo_addr(_Chng+9), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2763 :: 		Chng[11]             := 0;
	MOV	#lo_addr(_Chng+10), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2764 :: 		Chng[12]             := 0;
	MOV	#lo_addr(_Chng+11), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2765 :: 		Chng[13]             := 0;
	MOV	#lo_addr(_Chng+12), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2766 :: 		Chng[14]             := 0;
	MOV	#lo_addr(_Chng+13), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2767 :: 		Chng[15]             := 0;
	MOV	#lo_addr(_Chng+14), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2768 :: 		end;
L__Timer4Interrupt464:
;GRR3000LManagementPanel.mpas,2770 :: 		if (Program_StartBit =1) then
	MOV	#lo_addr(_Program_StartBit), W0
	BTSS	[W0], BitPos(_Program_StartBit+0)
	GOTO	L__Timer4Interrupt467
;GRR3000LManagementPanel.mpas,2773 :: 		if ((MenuBit =0)and(Start_Bit = 1)) then
	MOV	#lo_addr(_MenuBit), W0
	BCLR	W4, #0
	BTSS	[W0], BitPos(_MenuBit+0)
	BSET	W4, #0
	MOV	#lo_addr(_Start_Bit), W0
	BTSS	[W0], BitPos(_Start_Bit+0)
	BCLR	66, #0
	BTSC	[W0], BitPos(_Start_Bit+0)
	BSET	66, #0
	BTSC	W4, #0
	BTSS	66, #0
	BRA	L__Timer4Interrupt5107
	BSET	W4, #0
	BRA	L__Timer4Interrupt5109
L__Timer4Interrupt5107:
	BCLR	W4, #0
L__Timer4Interrupt5109:
	BTSS	W4, #0
	GOTO	L__Timer4Interrupt470
;GRR3000LManagementPanel.mpas,2775 :: 		Dropper_Control();
	CALL	_Dropper_Control
;GRR3000LManagementPanel.mpas,2776 :: 		Led_RelayControl();
	CALL	_Led_RelayControl
;GRR3000LManagementPanel.mpas,2777 :: 		end;
L__Timer4Interrupt470:
;GRR3000LManagementPanel.mpas,2779 :: 		Fan_Heat_Control();
	CALL	_Fan_Heat_Control
;GRR3000LManagementPanel.mpas,2781 :: 		end;
L__Timer4Interrupt467:
;GRR3000LManagementPanel.mpas,2784 :: 		Modbus_Reg_Data_Fill();
	CALL	_Modbus_Reg_Data_Fill
;GRR3000LManagementPanel.mpas,2786 :: 		if (BCTimeCountBit = 255) then // hýzlý þarj sayacý izni verildiyse
	MOV	#lo_addr(_BCTimeCountBit), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA Z	L__Timer4Interrupt5110
	GOTO	L__Timer4Interrupt473
L__Timer4Interrupt5110:
;GRR3000LManagementPanel.mpas,2788 :: 		inc(BCTimeCounter);
	MOV	#1, W1
	MOV	#lo_addr(_BCTimeCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2789 :: 		if (BCTimeCounter > 60000) then // 60 sn olmuþsa  60000
	MOV	_BCTimeCounter, W1
	MOV	#60000, W0
	CP	W1, W0
	BRA GTU	L__Timer4Interrupt5111
	GOTO	L__Timer4Interrupt476
L__Timer4Interrupt5111:
;GRR3000LManagementPanel.mpas,2791 :: 		BCTimeCounter   := 0;
	CLR	W0
	MOV	W0, _BCTimeCounter
;GRR3000LManagementPanel.mpas,2792 :: 		BoostChargeTime := BoostChargeTime - 1; // hýzlý þarj süresini bir azalt
	MOV	#1, W1
	MOV	#0, W2
	MOV	#lo_addr(_BoostChargeTime), W0
	SUBR	W1, [W0], [W0++]
	SUBBR	W2, [W0], [W0--]
;GRR3000LManagementPanel.mpas,2793 :: 		if (BoostChargeTime < 1) then
	MOV	_BoostChargeTime, W0
	MOV	_BoostChargeTime+2, W1
	CP	W0, #1
	CPB	W1, #0
	BRA LT	L__Timer4Interrupt5112
	GOTO	L__Timer4Interrupt479
L__Timer4Interrupt5112:
;GRR3000LManagementPanel.mpas,2795 :: 		BCTimeCountBit := 0;// sayýcý izni devredýþý býrakýldý
	MOV	#lo_addr(_BCTimeCountBit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2796 :: 		end;
L__Timer4Interrupt479:
;GRR3000LManagementPanel.mpas,2797 :: 		end;
L__Timer4Interrupt476:
;GRR3000LManagementPanel.mpas,2798 :: 		end;
L__Timer4Interrupt473:
;GRR3000LManagementPanel.mpas,2801 :: 		Inc(TimeScreenCounter);
	MOV	#1, W1
	MOV	#lo_addr(_TimeScreenCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2804 :: 		if (Program_StartBit = 1) then // program çalýþmaya baþlamýþsa
	MOV	#lo_addr(_Program_StartBit), W0
	BTSS	[W0], BitPos(_Program_StartBit+0)
	GOTO	L__Timer4Interrupt482
;GRR3000LManagementPanel.mpas,2807 :: 		if (Haberlesme_izni = 255) then
	MOV	#lo_addr(_Haberlesme_izni), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA Z	L__Timer4Interrupt5113
	GOTO	L__Timer4Interrupt485
L__Timer4Interrupt5113:
;GRR3000LManagementPanel.mpas,2809 :: 		Uart_Communication_Function(Request_Counter);
	MOV	_Request_Counter, W10
	CALL	_Uart_Communication_Function
;GRR3000LManagementPanel.mpas,2810 :: 		Haberlesme_izni := 0;
	MOV	#lo_addr(_Haberlesme_izni), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2811 :: 		end else
	GOTO	L__Timer4Interrupt486
L__Timer4Interrupt485:
;GRR3000LManagementPanel.mpas,2812 :: 		if (Haberlesme_izni =0) then
	MOV	#lo_addr(_Haberlesme_izni), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Timer4Interrupt5114
	GOTO	L__Timer4Interrupt488
L__Timer4Interrupt5114:
;GRR3000LManagementPanel.mpas,2814 :: 		Inc(Request_RepeatCounter);
	MOV	#1, W1
	MOV	#lo_addr(_Request_RepeatCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2815 :: 		if (Request_RepeatCounter > 100) then
	MOV	#100, W1
	MOV	#lo_addr(_Request_RepeatCounter), W0
	CP	W1, [W0]
	BRA LTU	L__Timer4Interrupt5115
	GOTO	L__Timer4Interrupt491
L__Timer4Interrupt5115:
;GRR3000LManagementPanel.mpas,2817 :: 		Request_RepeatCounter := 0;
	CLR	W0
	MOV	W0, _Request_RepeatCounter
;GRR3000LManagementPanel.mpas,2818 :: 		Haberlesme_izni       := 255;
	MOV	#lo_addr(_Haberlesme_izni), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2819 :: 		end;
L__Timer4Interrupt491:
;GRR3000LManagementPanel.mpas,2820 :: 		end;
L__Timer4Interrupt488:
L__Timer4Interrupt486:
;GRR3000LManagementPanel.mpas,2822 :: 		if (ReceiveData[4] <> 0) then // veri alýndýysa
	MOV	#lo_addr(_ReceiveData+4), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__Timer4Interrupt5116
	GOTO	L__Timer4Interrupt494
L__Timer4Interrupt5116:
;GRR3000LManagementPanel.mpas,2824 :: 		ReceiveData[4]   := 0;
	MOV	#lo_addr(_ReceiveData+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2825 :: 		Haberlesme_izni  := 255;
	MOV	#lo_addr(_Haberlesme_izni), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2826 :: 		end;
L__Timer4Interrupt494:
;GRR3000LManagementPanel.mpas,2829 :: 		end; //
L__Timer4Interrupt482:
;GRR3000LManagementPanel.mpas,2831 :: 		ButonTimer(); // buton sayacý
	CALL	_ButonTimer
;GRR3000LManagementPanel.mpas,2833 :: 		Comm_Fault_Check();
	CALL	_Comm_Fault_Check
;GRR3000LManagementPanel.mpas,2835 :: 		if (Comm_FaultModbus =0) then // Modbus da hata yoksa
	MOV	#lo_addr(_Comm_FaultModbus), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Timer4Interrupt5117
	GOTO	L__Timer4Interrupt497
L__Timer4Interrupt5117:
;GRR3000LManagementPanel.mpas,2837 :: 		Comm_ModbusFaultCounter := 0;
	CLR	W0
	MOV	W0, _Comm_ModbusFaultCounter
;GRR3000LManagementPanel.mpas,2838 :: 		Modbus_FaultBit         := 0;
	MOV	#lo_addr(_Modbus_FaultBit), W0
	BCLR	[W0], BitPos(_Modbus_FaultBit+0)
;GRR3000LManagementPanel.mpas,2839 :: 		end else
	GOTO	L__Timer4Interrupt498
L__Timer4Interrupt497:
;GRR3000LManagementPanel.mpas,2840 :: 		if (Comm_FaultModbus = 255) then
	MOV	#lo_addr(_Comm_FaultModbus), W0
	MOV.B	[W0], W1
	MOV.B	#255, W0
	CP.B	W1, W0
	BRA Z	L__Timer4Interrupt5118
	GOTO	L__Timer4Interrupt500
L__Timer4Interrupt5118:
;GRR3000LManagementPanel.mpas,2842 :: 		Inc(Comm_ModbusFaultCounter);
	MOV	#1, W1
	MOV	#lo_addr(_Comm_ModbusFaultCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2843 :: 		if (Comm_ModbusFaultCounter > 2000) then
	MOV	_Comm_ModbusFaultCounter, W1
	MOV	#2000, W0
	CP	W1, W0
	BRA GTU	L__Timer4Interrupt5119
	GOTO	L__Timer4Interrupt503
L__Timer4Interrupt5119:
;GRR3000LManagementPanel.mpas,2845 :: 		Modbus_FaultBit := 1;
	MOV	#lo_addr(_Modbus_FaultBit), W0
	BSET	[W0], BitPos(_Modbus_FaultBit+0)
;GRR3000LManagementPanel.mpas,2846 :: 		Comm_ModbusFaultCounter := 2100;
	MOV	#2100, W0
	MOV	W0, _Comm_ModbusFaultCounter
;GRR3000LManagementPanel.mpas,2847 :: 		end;
L__Timer4Interrupt503:
;GRR3000LManagementPanel.mpas,2848 :: 		end;
L__Timer4Interrupt500:
L__Timer4Interrupt498:
;GRR3000LManagementPanel.mpas,2850 :: 		Inc(AlarmSiraCounter);
	MOV	#1, W1
	MOV	#lo_addr(_AlarmSiraCounter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2851 :: 		if (AlarmSiraCounter >= 750) then
	MOV	_AlarmSiraCounter, W1
	MOV	#750, W0
	CP	W1, W0
	BRA GEU	L__Timer4Interrupt5120
	GOTO	L__Timer4Interrupt506
L__Timer4Interrupt5120:
;GRR3000LManagementPanel.mpas,2853 :: 		Comm_FaultModbus   := 255;
	MOV	#lo_addr(_Comm_FaultModbus), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2854 :: 		AlarmSiraCounter := 0;
	CLR	W0
	MOV	W0, _AlarmSiraCounter
;GRR3000LManagementPanel.mpas,2855 :: 		Inc(AlarmSira);
	MOV.B	#1, W1
	MOV	#lo_addr(_AlarmSira), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2856 :: 		if (AlarmSira >= 24) then AlarmSira := 0;
	MOV	#lo_addr(_AlarmSira), W0
	MOV.B	[W0], W0
	CP.B	W0, #24
	BRA GEU	L__Timer4Interrupt5121
	GOTO	L__Timer4Interrupt509
L__Timer4Interrupt5121:
	MOV	#lo_addr(_AlarmSira), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Timer4Interrupt509:
;GRR3000LManagementPanel.mpas,2857 :: 		end;
L__Timer4Interrupt506:
;GRR3000LManagementPanel.mpas,2859 :: 		if (Buzzer_AllowBit = 1) then // Buzzer izni verildiyse bu iþi yap
	MOV	#lo_addr(_Buzzer_AllowBit), W0
	BTSS	[W0], BitPos(_Buzzer_AllowBit+0)
	GOTO	L__Timer4Interrupt512
;GRR3000LManagementPanel.mpas,2861 :: 		if (BuzzerBit = 1) then
	MOV	#lo_addr(_BuzzerBit), W0
	BTSS	[W0], BitPos(_BuzzerBit+0)
	GOTO	L__Timer4Interrupt515
;GRR3000LManagementPanel.mpas,2863 :: 		Inc(Buzzer_Counter);
	MOV	#1, W1
	MOV	#lo_addr(_Buzzer_Counter), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,2865 :: 		if ((Buzzer_Counter > 2000)and(Buzzer_Counter < 2500)) then
	MOV	_Buzzer_Counter, W2
	MOV	#2000, W0
	CP	W2, W0
	CLR	W1
	BRA LEU	L__Timer4Interrupt5122
	COM	W1
L__Timer4Interrupt5122:
	MOV	#2500, W0
	CP	W2, W0
	CLR	W0
	BRA GEU	L__Timer4Interrupt5123
	COM	W0
L__Timer4Interrupt5123:
	AND	W1, W0, W0
	BRA NZ	L__Timer4Interrupt5124
	GOTO	L__Timer4Interrupt518
L__Timer4Interrupt5124:
;GRR3000LManagementPanel.mpas,2867 :: 		Buzzer := 1;
	BSET	RA15_bit, BitPos(RA15_bit+0)
;GRR3000LManagementPanel.mpas,2868 :: 		end else
	GOTO	L__Timer4Interrupt519
L__Timer4Interrupt518:
;GRR3000LManagementPanel.mpas,2869 :: 		if (Buzzer_Counter > 2500) then
	MOV	_Buzzer_Counter, W1
	MOV	#2500, W0
	CP	W1, W0
	BRA GTU	L__Timer4Interrupt5125
	GOTO	L__Timer4Interrupt521
L__Timer4Interrupt5125:
;GRR3000LManagementPanel.mpas,2871 :: 		Buzzer         := 0;
	BCLR	RA15_bit, BitPos(RA15_bit+0)
;GRR3000LManagementPanel.mpas,2872 :: 		Buzzer_Counter := 0;
	CLR	W0
	MOV	W0, _Buzzer_Counter
;GRR3000LManagementPanel.mpas,2873 :: 		end;
L__Timer4Interrupt521:
L__Timer4Interrupt519:
;GRR3000LManagementPanel.mpas,2874 :: 		end else
	GOTO	L__Timer4Interrupt516
L__Timer4Interrupt515:
;GRR3000LManagementPanel.mpas,2875 :: 		if (BuzzerBit =0) then
	MOV	#lo_addr(_BuzzerBit), W0
	BTSC	[W0], BitPos(_BuzzerBit+0)
	GOTO	L__Timer4Interrupt524
;GRR3000LManagementPanel.mpas,2877 :: 		Buzzer         := 0;
	BCLR	RA15_bit, BitPos(RA15_bit+0)
;GRR3000LManagementPanel.mpas,2878 :: 		Buzzer_Counter := 0;
	CLR	W0
	MOV	W0, _Buzzer_Counter
;GRR3000LManagementPanel.mpas,2879 :: 		end;
L__Timer4Interrupt524:
L__Timer4Interrupt516:
;GRR3000LManagementPanel.mpas,2880 :: 		end else
	GOTO	L__Timer4Interrupt513
L__Timer4Interrupt512:
;GRR3000LManagementPanel.mpas,2882 :: 		Buzzer         := 0;
	BCLR	RA15_bit, BitPos(RA15_bit+0)
;GRR3000LManagementPanel.mpas,2883 :: 		Buzzer_Counter := 0;
	CLR	W0
	MOV	W0, _Buzzer_Counter
;GRR3000LManagementPanel.mpas,2884 :: 		end;
L__Timer4Interrupt513:
;GRR3000LManagementPanel.mpas,2886 :: 		IFS1.5 :=0;
	BCLR	IFS1, #5
;GRR3000LManagementPanel.mpas,2887 :: 		IEC1.5 :=1;
	BSET	IEC1, #5
;GRR3000LManagementPanel.mpas,2888 :: 		T4CON := %1000000000000000; //start TMR3
	MOV	#32768, W0
	MOV	WREG, T4CON
;GRR3000LManagementPanel.mpas,2889 :: 		end;
L_end_Timer4Interrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _Timer4Interrupt

_ValueDivide:

;GRR3000LManagementPanel.mpas,2893 :: 		begin
;GRR3000LManagementPanel.mpas,2899 :: 		if (Value >= 60000) then Value := 0; // eepromdan veri saçma gelirse deðerleri 0 yazdýr
	MOV	#60000, W0
	CP	W10, W0
	BRA GEU	L__ValueDivide5127
	GOTO	L__ValueDivide528
L__ValueDivide5127:
	CLR	W10
L__ValueDivide528:
;GRR3000LManagementPanel.mpas,2901 :: 		if (Dot = 255) then // virgülden sonra 1 basamak
	MOV.B	#255, W0
	CP.B	W11, W0
	BRA Z	L__ValueDivide5128
	GOTO	L__ValueDivide531
L__ValueDivide5128:
;GRR3000LManagementPanel.mpas,2904 :: 		Value_Text[4]    := '.';
	MOV	#lo_addr(_Value_Text+3), W1
	MOV.B	#46, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2905 :: 		Value_Text[5]    := ((Value mod 10) + 48);
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+4), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2906 :: 		Fnc_Temp_Byte    := (Value mod 100);
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W0
;GRR3000LManagementPanel.mpas,2907 :: 		Value_Text[3]    := ((Fnc_Temp_Byte div 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+2), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2909 :: 		Dig1 := value div 100;
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2910 :: 		if (Dig1 < 1) then
	CP.B	W0, #1
	BRA LTU	L__ValueDivide5129
	GOTO	L__ValueDivide534
L__ValueDivide5129:
;GRR3000LManagementPanel.mpas,2911 :: 		Value_Text[2] := ' '
	MOV	#lo_addr(_Value_Text+1), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
	GOTO	L__ValueDivide535
;GRR3000LManagementPanel.mpas,2912 :: 		else
L__ValueDivide534:
;GRR3000LManagementPanel.mpas,2914 :: 		Fnc_Temp_Byte    := (Value div 100);
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2915 :: 		Value_Text[2]    := ((Fnc_Temp_Byte mod 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+1), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2916 :: 		end;
L__ValueDivide535:
;GRR3000LManagementPanel.mpas,2918 :: 		Dig2 := value div 1000;
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2919 :: 		if (Dig2 < 1) then
	CP.B	W0, #1
	BRA LTU	L__ValueDivide5130
	GOTO	L__ValueDivide537
L__ValueDivide5130:
;GRR3000LManagementPanel.mpas,2920 :: 		Value_Text[1] := ' '
	MOV	#lo_addr(_Value_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
	GOTO	L__ValueDivide538
;GRR3000LManagementPanel.mpas,2921 :: 		else
L__ValueDivide537:
;GRR3000LManagementPanel.mpas,2923 :: 		Value_Text[1] := (Value div 1000)+48;
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2925 :: 		end;
L__ValueDivide538:
;GRR3000LManagementPanel.mpas,2926 :: 		end else
	GOTO	L__ValueDivide532
L__ValueDivide531:
;GRR3000LManagementPanel.mpas,2927 :: 		if (Dot = 250) then  // virgülden sonra 2 basamak ise
	MOV.B	#250, W0
	CP.B	W11, W0
	BRA Z	L__ValueDivide5131
	GOTO	L__ValueDivide540
L__ValueDivide5131:
;GRR3000LManagementPanel.mpas,2929 :: 		Value_Text[3]    := '.';
	MOV	#lo_addr(_Value_Text+2), W1
	MOV.B	#46, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2930 :: 		Value_Text[5]    := ((Value mod 10) + 48);
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+4), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2931 :: 		Fnc_Temp_Byte    := (Value div 10);
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2932 :: 		Value_Text[4]    := ((Fnc_Temp_Byte mod 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+3), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2933 :: 		Fnc_Temp_Byte    := (Value div 100);
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2934 :: 		Value_Text[2]    := ((Fnc_Temp_Byte mod 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+1), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2937 :: 		Dig2 := value div 1000;
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2938 :: 		if (Dig2 < 1) then
	CP.B	W0, #1
	BRA LTU	L__ValueDivide5132
	GOTO	L__ValueDivide543
L__ValueDivide5132:
;GRR3000LManagementPanel.mpas,2939 :: 		Value_Text[1] := ' '
	MOV	#lo_addr(_Value_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
	GOTO	L__ValueDivide544
;GRR3000LManagementPanel.mpas,2940 :: 		else
L__ValueDivide543:
;GRR3000LManagementPanel.mpas,2941 :: 		Value_Text[1] := ((Value div 1000) + 48);
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text), W0
	ADD.B	W2, W1, [W0]
L__ValueDivide544:
;GRR3000LManagementPanel.mpas,2943 :: 		end else
	GOTO	L__ValueDivide541
L__ValueDivide540:
;GRR3000LManagementPanel.mpas,2944 :: 		if (Dot =0) then  // tam sayý ise
	CP.B	W11, #0
	BRA Z	L__ValueDivide5133
	GOTO	L__ValueDivide546
L__ValueDivide5133:
;GRR3000LManagementPanel.mpas,2948 :: 		Value_Text[5]   := ((Value mod 10) + 48);
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+4), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2949 :: 		Fnc_Temp_Byte   := (Value mod 100);
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W0
;GRR3000LManagementPanel.mpas,2950 :: 		Value_Text[4]   := ((Fnc_Temp_Byte div 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+3), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2952 :: 		Dig1 := value div 100;
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2953 :: 		if (dig1 < 1) then
	CP.B	W0, #1
	BRA LTU	L__ValueDivide5134
	GOTO	L__ValueDivide549
L__ValueDivide5134:
;GRR3000LManagementPanel.mpas,2954 :: 		Value_Text[3] := ' '
	MOV	#lo_addr(_Value_Text+2), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
	GOTO	L__ValueDivide550
;GRR3000LManagementPanel.mpas,2955 :: 		else
L__ValueDivide549:
;GRR3000LManagementPanel.mpas,2957 :: 		Fnc_Temp_Byte      := (Value div 100);
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2958 :: 		Value_Text[3]      := ((Fnc_Temp_Byte mod 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+2), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2959 :: 		end;
L__ValueDivide550:
;GRR3000LManagementPanel.mpas,2961 :: 		Dig2 := value div 1000;
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2962 :: 		if (Dig2 < 1) then
	CP.B	W0, #1
	BRA LTU	L__ValueDivide5135
	GOTO	L__ValueDivide552
L__ValueDivide5135:
;GRR3000LManagementPanel.mpas,2964 :: 		Value_Text[2] := ' ';
	MOV	#lo_addr(_Value_Text+1), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2965 :: 		end else
	GOTO	L__ValueDivide553
L__ValueDivide552:
;GRR3000LManagementPanel.mpas,2967 :: 		Fnc_Temp_Byte   := (Value div 1000);
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2968 :: 		Value_Text[2]   := ((Fnc_Temp_Byte mod 10)+48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+1), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2969 :: 		end;
L__ValueDivide553:
;GRR3000LManagementPanel.mpas,2971 :: 		Value_Text[1] := ' ';
	MOV	#lo_addr(_Value_Text), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2981 :: 		end else
	GOTO	L__ValueDivide547
L__ValueDivide546:
;GRR3000LManagementPanel.mpas,2982 :: 		if (Dot =128) then // Akü%
	MOV.B	#128, W0
	CP.B	W11, W0
	BRA Z	L__ValueDivide5136
	GOTO	L__ValueDivide555
L__ValueDivide5136:
;GRR3000LManagementPanel.mpas,2985 :: 		ValueText2[4]   := '.';
	MOV	#lo_addr(_ValueText2+3), W1
	MOV.B	#46, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,2987 :: 		ValueText2[5]   := ((Value mod 10) + 48);
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_ValueText2+4), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2989 :: 		Fnc_Temp_Byte      := (Value mod 100);
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W0
;GRR3000LManagementPanel.mpas,2990 :: 		ValueText2[3]   := ((Fnc_Temp_Byte div 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_ValueText2+2), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2992 :: 		dig2 := value div 100;
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,2993 :: 		if (dig2 < 1) then ValueText2[2] := ' ' else
	CP.B	W0, #1
	BRA LTU	L__ValueDivide5137
	GOTO	L__ValueDivide558
L__ValueDivide5137:
	MOV	#lo_addr(_ValueText2+1), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
	GOTO	L__ValueDivide559
L__ValueDivide558:
;GRR3000LManagementPanel.mpas,2995 :: 		Fnc_Temp_Byte      := (Value mod 1000);
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W0
;GRR3000LManagementPanel.mpas,2996 :: 		ValueText2[2]   := ((Fnc_Temp_Byte div 100) + 48);
	ZE	W0, W0
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_ValueText2+1), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,2997 :: 		end;
L__ValueDivide559:
;GRR3000LManagementPanel.mpas,2999 :: 		dig1 := value div 1000;
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,3000 :: 		if (dig1 < 1) then ValueText2[1] := ' ' else ValueText2[1] := ((Value div 1000) + 48);
	CP.B	W0, #1
	BRA LTU	L__ValueDivide5138
	GOTO	L__ValueDivide561
L__ValueDivide5138:
	MOV	#lo_addr(_ValueText2), W1
	MOV.B	#32, W0
	MOV.B	W0, [W1]
	GOTO	L__ValueDivide562
L__ValueDivide561:
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_ValueText2), W0
	ADD.B	W2, W1, [W0]
L__ValueDivide562:
;GRR3000LManagementPanel.mpas,3001 :: 		end else
	GOTO	L__ValueDivide556
L__ValueDivide555:
;GRR3000LManagementPanel.mpas,3002 :: 		if (Dot = 31) then  // tam sayý ise :)
	CP.B	W11, #31
	BRA Z	L__ValueDivide5139
	GOTO	L__ValueDivide564
L__ValueDivide5139:
;GRR3000LManagementPanel.mpas,3006 :: 		Value_Text[5]   := ((Value mod 10) + 48);
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+4), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,3007 :: 		Fnc_Temp_Byte   := (Value mod 100);
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
	MOV	W1, W0
;GRR3000LManagementPanel.mpas,3008 :: 		Value_Text[4]   := ((Fnc_Temp_Byte div 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+3), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,3010 :: 		Fnc_Temp_Byte      := (Value div 100);
	MOV	#100, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,3011 :: 		Value_Text[3]      := ((Fnc_Temp_Byte mod 10) + 48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+2), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,3013 :: 		Fnc_Temp_Byte   := (Value div 1000);
	MOV	#1000, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,3014 :: 		Value_Text[2]   := ((Fnc_Temp_Byte mod 10)+48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+1), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,3017 :: 		Value_Text[2]   := ((Fnc_Temp_Byte mod 10)+48);
	ZE	W2, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text+1), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,3019 :: 		Fnc_Temp_Byte   := (Value div 10000);
	MOV	#10000, W2
	REPEAT	#17
	DIV.U	W10, W2
;GRR3000LManagementPanel.mpas,3020 :: 		Value_Text[1]   := ((Fnc_Temp_Byte mod 10)+48);
	ZE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	MOV	#lo_addr(_Value_Text), W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,3021 :: 		end;
L__ValueDivide564:
L__ValueDivide556:
L__ValueDivide547:
L__ValueDivide541:
L__ValueDivide532:
;GRR3000LManagementPanel.mpas,3027 :: 		end;
L_end_ValueDivide:
	RETURN
; end of _ValueDivide

_MenuButtonRead:

;GRR3000LManagementPanel.mpas,3031 :: 		begin
;GRR3000LManagementPanel.mpas,3032 :: 		if (Down_Button =0) then
	PUSH	W12
	PUSH	W13
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__MenuButtonRead568
;GRR3000LManagementPanel.mpas,3034 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,3035 :: 		while (Down_Button =0) do
L__MenuButtonRead571:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__MenuButtonRead572
;GRR3000LManagementPanel.mpas,3037 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3038 :: 		end;
	GOTO	L__MenuButtonRead571
L__MenuButtonRead572:
;GRR3000LManagementPanel.mpas,3040 :: 		if (MenuSayacValue < 8) then
	MOV	#lo_addr(_MenuSayacValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LT	L__MenuButtonRead5141
	GOTO	L__MenuButtonRead576
L__MenuButtonRead5141:
;GRR3000LManagementPanel.mpas,3042 :: 		Glcd_Write_Char(' ',0, MenuSayacValue, Black);
	MOV	#lo_addr(_MenuSayacValue), W0
	PUSH.D	W10
	MOV.B	#1, W13
	MOV.B	[W0], W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
	POP.D	W10
;GRR3000LManagementPanel.mpas,3043 :: 		end else
	GOTO	L__MenuButtonRead577
L__MenuButtonRead576:
;GRR3000LManagementPanel.mpas,3044 :: 		if (MenuSayacValue >= 8) then
	MOV	#lo_addr(_MenuSayacValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA GE	L__MenuButtonRead5142
	GOTO	L__MenuButtonRead579
L__MenuButtonRead5142:
;GRR3000LManagementPanel.mpas,3046 :: 		Glcd_Write_Char(' ',0, (MenuSayacValue-7), Black);
	MOV	#lo_addr(_MenuSayacValue), W0
	SE	[W0], W0
	SUB	W0, #7, W0
	PUSH.D	W10
	MOV.B	#1, W13
	MOV.B	W0, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
	POP.D	W10
;GRR3000LManagementPanel.mpas,3047 :: 		end;
L__MenuButtonRead579:
L__MenuButtonRead577:
;GRR3000LManagementPanel.mpas,3049 :: 		Inc(MenuSayacValue);
	MOV.B	#1, W1
	MOV	#lo_addr(_MenuSayacValue), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3050 :: 		if (MenuSayacValue > Sayac) then MenuSayacValue := 1;
	MOV	#lo_addr(_MenuSayacValue), W0
	CP.B	W10, [W0]
	BRA LT	L__MenuButtonRead5143
	GOTO	L__MenuButtonRead582
L__MenuButtonRead5143:
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__MenuButtonRead582:
;GRR3000LManagementPanel.mpas,3051 :: 		end else
	GOTO	L__MenuButtonRead569
L__MenuButtonRead568:
;GRR3000LManagementPanel.mpas,3052 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__MenuButtonRead585
;GRR3000LManagementPanel.mpas,3054 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,3055 :: 		while (Up_Button =0) do
L__MenuButtonRead588:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__MenuButtonRead589
;GRR3000LManagementPanel.mpas,3057 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3058 :: 		end;
	GOTO	L__MenuButtonRead588
L__MenuButtonRead589:
;GRR3000LManagementPanel.mpas,3060 :: 		if (MenuSayacValue < 8) then
	MOV	#lo_addr(_MenuSayacValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LT	L__MenuButtonRead5144
	GOTO	L__MenuButtonRead593
L__MenuButtonRead5144:
;GRR3000LManagementPanel.mpas,3062 :: 		Glcd_Write_Char(' ',0, MenuSayacValue, Black);
	MOV	#lo_addr(_MenuSayacValue), W0
	PUSH.D	W10
	MOV.B	#1, W13
	MOV.B	[W0], W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
	POP.D	W10
;GRR3000LManagementPanel.mpas,3063 :: 		end else
	GOTO	L__MenuButtonRead594
L__MenuButtonRead593:
;GRR3000LManagementPanel.mpas,3064 :: 		if (MenuSayacValue >= 8) then
	MOV	#lo_addr(_MenuSayacValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA GE	L__MenuButtonRead5145
	GOTO	L__MenuButtonRead596
L__MenuButtonRead5145:
;GRR3000LManagementPanel.mpas,3066 :: 		Glcd_Write_Char(' ',0, (MenuSayacValue-7), Black);
	MOV	#lo_addr(_MenuSayacValue), W0
	SE	[W0], W0
	SUB	W0, #7, W0
	PUSH.D	W10
	MOV.B	#1, W13
	MOV.B	W0, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
	POP.D	W10
;GRR3000LManagementPanel.mpas,3067 :: 		end;
L__MenuButtonRead596:
L__MenuButtonRead594:
;GRR3000LManagementPanel.mpas,3069 :: 		Dec(MenuSayacValue);
	MOV.B	#1, W1
	MOV	#lo_addr(_MenuSayacValue), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3070 :: 		if (MenuSayacValue < 1) then MenuSayacValue := Sayac;
	MOV	#lo_addr(_MenuSayacValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__MenuButtonRead5146
	GOTO	L__MenuButtonRead599
L__MenuButtonRead5146:
	MOV	#lo_addr(_MenuSayacValue), W0
	MOV.B	W10, [W0]
L__MenuButtonRead599:
;GRR3000LManagementPanel.mpas,3071 :: 		end;
L__MenuButtonRead585:
L__MenuButtonRead569:
;GRR3000LManagementPanel.mpas,3073 :: 		if (Menu = 255) then   // program menüleri için ise iþaretleri satýrlara ">" iþaretini koy
	MOV.B	#255, W0
	CP.B	W11, W0
	BRA Z	L__MenuButtonRead5147
	GOTO	L__MenuButtonRead602
L__MenuButtonRead5147:
;GRR3000LManagementPanel.mpas,3075 :: 		if (MenuSayacValue < 8) then
	MOV	#lo_addr(_MenuSayacValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LT	L__MenuButtonRead5148
	GOTO	L__MenuButtonRead605
L__MenuButtonRead5148:
;GRR3000LManagementPanel.mpas,3077 :: 		Glcd_Write_Char('>',0, MenuSayacValue, Black);
	MOV	#lo_addr(_MenuSayacValue), W0
	PUSH.D	W10
	MOV.B	#1, W13
	MOV.B	[W0], W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
	POP.D	W10
;GRR3000LManagementPanel.mpas,3078 :: 		end else
	GOTO	L__MenuButtonRead606
L__MenuButtonRead605:
;GRR3000LManagementPanel.mpas,3079 :: 		if (MenuSayacValue >= 8) then
	MOV	#lo_addr(_MenuSayacValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA GE	L__MenuButtonRead5149
	GOTO	L__MenuButtonRead608
L__MenuButtonRead5149:
;GRR3000LManagementPanel.mpas,3081 :: 		Glcd_Write_Char('>',0, (MenuSayacValue-7), Black);
	MOV	#lo_addr(_MenuSayacValue), W0
	SE	[W0], W0
	SUB	W0, #7, W0
	PUSH.D	W10
	MOV.B	#1, W13
	MOV.B	W0, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
	POP.D	W10
;GRR3000LManagementPanel.mpas,3082 :: 		end;
L__MenuButtonRead608:
L__MenuButtonRead606:
;GRR3000LManagementPanel.mpas,3083 :: 		end;
L__MenuButtonRead602:
;GRR3000LManagementPanel.mpas,3085 :: 		Result := MenuSayacValue;
	MOV	#lo_addr(_MenuSayacValue), W0
; Result start address is: 2 (W1)
	MOV.B	[W0], W1
;GRR3000LManagementPanel.mpas,3087 :: 		end;
	MOV.B	W1, W0
; Result end address is: 2 (W1)
L_end_MenuButtonRead:
	POP	W13
	POP	W12
	RETURN
; end of _MenuButtonRead

_HiddenMenu:
	LNK	#26

;GRR3000LManagementPanel.mpas,3092 :: 		begin
;GRR3000LManagementPanel.mpas,3094 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,3095 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,3099 :: 		Glcd_Write_Text('KAÇAK SENSOR,', 6, Row1,Black);
	ADD	W14, #10, W1
	MOV.B	#75, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#199, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#75, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#79, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3100 :: 		Glcd_Write_Text('HÜCRE SAYISI,', 6, Row2, Black); // , yazýlmasý -> anlamýna gelir
	ADD	W14, #10, W1
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	MOV.B	#220, W0
	MOV.B	W0, [W1++]
	MOV.B	#67, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#89, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3101 :: 		Glcd_Write_Text('HÜCRE GERÝLM,', 6, Row3, Black);
	ADD	W14, #10, W1
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	MOV.B	#220, W0
	MOV.B	W0, [W1++]
	MOV.B	#67, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#221, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3102 :: 		Glcd_Write_Text('ÞARJ AKIMI  ,', 6, Row4, Black);
	ADD	W14, #10, W1
	MOV.B	#222, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#74, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#75, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3103 :: 		Glcd_Write_Text('N.ÞARJ MIN. ,', 6, Row5, Black);
	ADD	W14, #10, W1
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#222, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#74, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3104 :: 		Glcd_Write_Text('N.ÞARJ MAX. ,', 6, Row6, Black);
	ADD	W14, #10, W1
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#222, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#74, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#88, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3105 :: 		Glcd_Write_Text('H.ÞARJ MIN. ,', 6, Row7, Black);
	ADD	W14, #10, W1
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#222, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#74, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3106 :: 		Glcd_Write_Text('H.ÞARJ MAX. ,', 6, Row8, Black);
	ADD	W14, #10, W1
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#222, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#74, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#88, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3108 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3110 :: 		KacakSensor         := 0; // ilk yüklendiðinde ekrana analog gelsin
	MOV	#lo_addr(_KacakSensor), W0
	BCLR	[W0], BitPos(_KacakSensor+0)
;GRR3000LManagementPanel.mpas,3111 :: 		HucreSayisi         := EEPROM_Read(EE_HucreSayisiEeAddr);
	MOV	#61444, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _HucreSayisi
;GRR3000LManagementPanel.mpas,3112 :: 		NomHucreGerilim     := EEPROM_Read(EE_NomHucreGerilimEeAddr);
	MOV	#61446, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _NomHucreGerilim
;GRR3000LManagementPanel.mpas,3113 :: 		F_ChargePercentLo   := EEPROM_Read(EE_F_ChargePercentLoEeAddr);
	MOV	#61448, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _F_ChargePercentLo
;GRR3000LManagementPanel.mpas,3114 :: 		F_ChargePercentHi   := EEPROM_Read(EE_F_ChargePercentHiEeAddr);
	MOV	#61450, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _F_ChargePercentHi
;GRR3000LManagementPanel.mpas,3115 :: 		B_ChargePercentLo   := EEPROM_Read(EE_B_ChargePercentLoEeAddr);
	MOV	#61452, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _B_ChargePercentLo
;GRR3000LManagementPanel.mpas,3116 :: 		B_ChargePercentHi   := EEPROM_Read(EE_B_ChargePercentHiEeAddr);
	MOV	#61454, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _B_ChargePercentHi
;GRR3000LManagementPanel.mpas,3117 :: 		RedresorAkim        := EEPROM_Read(EE_RedresorAkimEeAddr);
	MOV	#61456, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _RedresorAkim
;GRR3000LManagementPanel.mpas,3119 :: 		if (KacakSensor = 0) then Glcd_Write_Text('ANALOG ',84,Row1,Black) else Glcd_Write_Text('DIGITAL',84,Row1,Black);  // kaçak akým algýlama analog ve digital durumu
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__HiddenMenu612
	ADD	W14, #10, W1
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#79, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__HiddenMenu613
L__HiddenMenu612:
	ADD	W14, #10, W1
	MOV.B	#68, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
L__HiddenMenu613:
;GRR3000LManagementPanel.mpas,3121 :: 		ValueDivide(HucreSayisi, 0);
	CLR	W11
	MOV	_HucreSayisi, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3122 :: 		Glcd_Write_Text(Value_Text, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3123 :: 		ValueDivide(NomHucreGerilim, 250);
	MOV.B	#250, W11
	MOV	_NomHucreGerilim, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3124 :: 		WriteText := Value_Text + 'V ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3125 :: 		Glcd_Write_Text(WriteText, 84, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3126 :: 		ValueDivide(RedresorAkim, 0);
	CLR	W11
	MOV	_RedresorAkim, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3127 :: 		WriteText := Value_Text + 'A ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3128 :: 		Glcd_Write_Text(WriteText, 84, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3129 :: 		ValueDivide(F_ChargePercentLo, 0);
	CLR	W11
	MOV	_F_ChargePercentLo, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3130 :: 		WriteText := Value_Text + '% ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3131 :: 		Glcd_Write_Text(WriteText, 84, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3132 :: 		ValueDivide(F_ChargePercentHi, 0);
	CLR	W11
	MOV	_F_ChargePercentHi, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3133 :: 		WriteText := Value_Text + '% ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3134 :: 		Glcd_Write_Text(WriteText, 84, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3135 :: 		ValueDivide(B_ChargePercentLo, 0);
	CLR	W11
	MOV	_B_ChargePercentLo, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3136 :: 		WriteText := Value_Text + '% ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3137 :: 		Glcd_Write_Text(WriteText, 84, Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3138 :: 		ValueDivide(B_ChargePercentHi, 0);
	CLR	W11
	MOV	_B_ChargePercentHi, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3139 :: 		WriteText := Value_Text + '% ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3140 :: 		Glcd_Write_Text(WriteText, 84, Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3142 :: 		HiddenMenuExit  := 0x00;
	CLR	W0
	MOV.B	W0, [W14+9]
;GRR3000LManagementPanel.mpas,3143 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3145 :: 		while (Hidden_Button =0) do
L__HiddenMenu615:
	BTSC	RA7_bit, BitPos(RA7_bit+0)
	GOTO	L__HiddenMenu616
;GRR3000LManagementPanel.mpas,3147 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3148 :: 		end;
	GOTO	L__HiddenMenu615
L__HiddenMenu616:
;GRR3000LManagementPanel.mpas,3150 :: 		While (HiddenMenuExit = 0x00) do
L__HiddenMenu620:
	MOV.B	[W14+9], W0
	CP.B	W0, #0
	BRA Z	L__HiddenMenu5151
	GOTO	L__HiddenMenu621
L__HiddenMenu5151:
;GRR3000LManagementPanel.mpas,3152 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3156 :: 		if (Down_Button=0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu625
;GRR3000LManagementPanel.mpas,3159 :: 		while (Down_Button=0) do
L__HiddenMenu628:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu629
;GRR3000LManagementPanel.mpas,3161 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3162 :: 		end;
	GOTO	L__HiddenMenu628
L__HiddenMenu629:
;GRR3000LManagementPanel.mpas,3164 :: 		Inc(MenuSayac);
	MOV.B	#1, W1
	MOV	#lo_addr(_MenuSayac), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3165 :: 		if (MenuSayac > 7) then MenuSayac := 0;
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA GT	L__HiddenMenu5152
	GOTO	L__HiddenMenu633
L__HiddenMenu5152:
	MOV	#lo_addr(_MenuSayac), W1
	CLR	W0
	MOV.B	W0, [W1]
L__HiddenMenu633:
;GRR3000LManagementPanel.mpas,3167 :: 		end else
	GOTO	L__HiddenMenu626
L__HiddenMenu625:
;GRR3000LManagementPanel.mpas,3168 :: 		if (Up_Button=0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu636
;GRR3000LManagementPanel.mpas,3171 :: 		while (Up_Button=0) do
L__HiddenMenu639:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu640
;GRR3000LManagementPanel.mpas,3173 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3174 :: 		end;
	GOTO	L__HiddenMenu639
L__HiddenMenu640:
;GRR3000LManagementPanel.mpas,3176 :: 		Dec(MenuSayac);
	MOV.B	#1, W1
	MOV	#lo_addr(_MenuSayac), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3177 :: 		if (MenuSayac < 0) then MenuSayac := 7;
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__HiddenMenu5153
	GOTO	L__HiddenMenu644
L__HiddenMenu5153:
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
L__HiddenMenu644:
;GRR3000LManagementPanel.mpas,3179 :: 		end;
L__HiddenMenu636:
L__HiddenMenu626:
;GRR3000LManagementPanel.mpas,3181 :: 		if (Hidden_Button =0) then
	BTSC	RA7_bit, BitPos(RA7_bit+0)
	GOTO	L__HiddenMenu647
;GRR3000LManagementPanel.mpas,3183 :: 		while (Hidden_Button =0) do
L__HiddenMenu650:
	BTSC	RA7_bit, BitPos(RA7_bit+0)
	GOTO	L__HiddenMenu651
;GRR3000LManagementPanel.mpas,3185 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3186 :: 		end;
	GOTO	L__HiddenMenu650
L__HiddenMenu651:
;GRR3000LManagementPanel.mpas,3187 :: 		HiddenMenuExit := 0xFF;
	MOV.B	#255, W0
	MOV.B	W0, [W14+9]
;GRR3000LManagementPanel.mpas,3188 :: 		end;
L__HiddenMenu647:
;GRR3000LManagementPanel.mpas,3191 :: 		0: begin    // kacak akým durumu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__HiddenMenu5154
	GOTO	L__HiddenMenu657
L__HiddenMenu5154:
;GRR3000LManagementPanel.mpas,3193 :: 		Glcd_Write_Char('>',0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3194 :: 		Glcd_Write_Char(' ',0, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3195 :: 		Glcd_Write_Char(' ',0, Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3197 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3199 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu659
;GRR3000LManagementPanel.mpas,3201 :: 		while (Ok_Button =0) do
L__HiddenMenu662:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu663
;GRR3000LManagementPanel.mpas,3203 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3204 :: 		end;
	GOTO	L__HiddenMenu662
L__HiddenMenu663:
;GRR3000LManagementPanel.mpas,3207 :: 		Chng[1] := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,3209 :: 		While (Chng[1] =1) do
L__HiddenMenu667:
	MOV.B	[W14+1], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5155
	GOTO	L__HiddenMenu668
L__HiddenMenu5155:
;GRR3000LManagementPanel.mpas,3211 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3213 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W4, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W4, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W4, #0
	BTSC	66, #0
	BRA	L__HiddenMenu5156
	BCLR	W4, #0
	BRA	L__HiddenMenu5159
L__HiddenMenu5156:
	BSET	W4, #0
L__HiddenMenu5159:
	BTSS	W4, #0
	GOTO	L__HiddenMenu672
;GRR3000LManagementPanel.mpas,3215 :: 		while ((Up_Button =0)or(Down_Button =0)) do
L__HiddenMenu675:
	BCLR	W4, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W4, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W4, #0
	BTSC	66, #0
	BRA	L__HiddenMenu5160
	BCLR	W4, #0
	BRA	L__HiddenMenu5163
L__HiddenMenu5160:
	BSET	W4, #0
L__HiddenMenu5163:
	BTSS	W4, #0
	GOTO	L__HiddenMenu676
;GRR3000LManagementPanel.mpas,3217 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3218 :: 		end;
	GOTO	L__HiddenMenu675
L__HiddenMenu676:
;GRR3000LManagementPanel.mpas,3219 :: 		KacakSensor := not KacakSensor;
	MOV	#lo_addr(_KacakSensor), W1
	MOV	#lo_addr(_KacakSensor), W0
	BTG	[W0], BitPos(_KacakSensor+0)
;GRR3000LManagementPanel.mpas,3220 :: 		end;
L__HiddenMenu672:
;GRR3000LManagementPanel.mpas,3222 :: 		if (KacakSensor = 0) then Glcd_Write_Text('ANALOG ',84,Row1,White) else Glcd_Write_Text('DIGITAL',84,Row1,White);  // kaçak akým algýlama analog ve digital durumu
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__HiddenMenu680
	ADD	W14, #10, W1
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#79, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	CLR	W13
	CLR	W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__HiddenMenu681
L__HiddenMenu680:
	ADD	W14, #10, W1
	MOV.B	#68, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	CLR	W13
	CLR	W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
L__HiddenMenu681:
;GRR3000LManagementPanel.mpas,3224 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu683
;GRR3000LManagementPanel.mpas,3226 :: 		while (Ok_Button =0) do
L__HiddenMenu686:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu687
;GRR3000LManagementPanel.mpas,3228 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3229 :: 		end;
	GOTO	L__HiddenMenu686
L__HiddenMenu687:
;GRR3000LManagementPanel.mpas,3231 :: 		EEPROM_Write(EE_KacakSensorEeAddr, KacakSensor);
	MOV	#lo_addr(_KacakSensor), W0
	CLR	W12
	BTSC	[W0], BitPos(_KacakSensor+0)
	INC	W12
	MOV	#61558, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3232 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__HiddenMenu691:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__HiddenMenu691
;GRR3000LManagementPanel.mpas,3234 :: 		Chng[1] := 0;
	CLR	W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,3235 :: 		if (KacakSensor = 0) then Glcd_Write_Text('ANALOG ',84,Row1,Black) else Glcd_Write_Text('DIGITAL',84,Row1,Black);  // kaçak akým algýlama analog ve digital durumu
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__HiddenMenu696
	ADD	W14, #10, W1
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#79, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__HiddenMenu697
L__HiddenMenu696:
	ADD	W14, #10, W1
	MOV.B	#68, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	CLR	W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
L__HiddenMenu697:
;GRR3000LManagementPanel.mpas,3236 :: 		end;
L__HiddenMenu683:
;GRR3000LManagementPanel.mpas,3239 :: 		end;
	GOTO	L__HiddenMenu667
L__HiddenMenu668:
;GRR3000LManagementPanel.mpas,3240 :: 		end;
L__HiddenMenu659:
;GRR3000LManagementPanel.mpas,3244 :: 		end;
	GOTO	L__HiddenMenu654
L__HiddenMenu657:
;GRR3000LManagementPanel.mpas,3246 :: 		1: begin    // hücre sayýsý
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5164
	GOTO	L__HiddenMenu700
L__HiddenMenu5164:
;GRR3000LManagementPanel.mpas,3248 :: 		Glcd_Write_Char(' ',0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3249 :: 		Glcd_Write_Char('>',0, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3250 :: 		Glcd_Write_Char(' ',0, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3252 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3254 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu702
;GRR3000LManagementPanel.mpas,3256 :: 		while (Ok_Button =0) do
L__HiddenMenu705:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu706
;GRR3000LManagementPanel.mpas,3258 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3259 :: 		end;
	GOTO	L__HiddenMenu705
L__HiddenMenu706:
;GRR3000LManagementPanel.mpas,3262 :: 		Chng[2] := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+2]
;GRR3000LManagementPanel.mpas,3264 :: 		While (Chng[2] =1) do
L__HiddenMenu710:
	MOV.B	[W14+2], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5165
	GOTO	L__HiddenMenu711
L__HiddenMenu5165:
;GRR3000LManagementPanel.mpas,3266 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3268 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu715
;GRR3000LManagementPanel.mpas,3270 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3271 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3272 :: 		while (ButonStop = 0) do
L__HiddenMenu718:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu719
;GRR3000LManagementPanel.mpas,3274 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3275 :: 		end;
	GOTO	L__HiddenMenu718
L__HiddenMenu719:
;GRR3000LManagementPanel.mpas,3276 :: 		Inc(HucreSayisi);
	MOV	#1, W1
	MOV	#lo_addr(_HucreSayisi), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3277 :: 		if (HucreSayisi >200) then HucreSayisi := 2;
	MOV	#200, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	BRA LTU	L__HiddenMenu5166
	GOTO	L__HiddenMenu723
L__HiddenMenu5166:
	MOV	#2, W0
	MOV	W0, _HucreSayisi
L__HiddenMenu723:
;GRR3000LManagementPanel.mpas,3278 :: 		end else
	GOTO	L__HiddenMenu716
L__HiddenMenu715:
;GRR3000LManagementPanel.mpas,3279 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu726
;GRR3000LManagementPanel.mpas,3281 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3282 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3283 :: 		while (ButonStop = 0) do
L__HiddenMenu729:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu730
;GRR3000LManagementPanel.mpas,3285 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3286 :: 		end;
	GOTO	L__HiddenMenu729
L__HiddenMenu730:
;GRR3000LManagementPanel.mpas,3287 :: 		Dec(HucreSayisi);
	MOV	#1, W1
	MOV	#lo_addr(_HucreSayisi), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3288 :: 		if (HucreSayisi < 2) then HucreSayisi := 200;
	MOV	_HucreSayisi, W0
	CP	W0, #2
	BRA LTU	L__HiddenMenu5167
	GOTO	L__HiddenMenu734
L__HiddenMenu5167:
	MOV	#200, W0
	MOV	W0, _HucreSayisi
L__HiddenMenu734:
;GRR3000LManagementPanel.mpas,3289 :: 		end;
L__HiddenMenu726:
L__HiddenMenu716:
;GRR3000LManagementPanel.mpas,3291 :: 		ValueDivide(HucreSayisi, 0);
	CLR	W11
	MOV	_HucreSayisi, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3292 :: 		Glcd_Write_Text(Value_Text, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3294 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu737
;GRR3000LManagementPanel.mpas,3296 :: 		while (Ok_Button =0) do
L__HiddenMenu740:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu741
;GRR3000LManagementPanel.mpas,3298 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3299 :: 		end;
	GOTO	L__HiddenMenu740
L__HiddenMenu741:
;GRR3000LManagementPanel.mpas,3301 :: 		EEPROM_Write(EE_HucreSayisiEeAddr, HucreSayisi);
	MOV	_HucreSayisi, W12
	MOV	#61444, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3302 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__HiddenMenu745:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__HiddenMenu745
;GRR3000LManagementPanel.mpas,3304 :: 		Chng[2] := 0;
	CLR	W0
	MOV.B	W0, [W14+2]
;GRR3000LManagementPanel.mpas,3305 :: 		Glcd_Write_Text(Value_Text, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3306 :: 		end;
L__HiddenMenu737:
;GRR3000LManagementPanel.mpas,3309 :: 		end;
	GOTO	L__HiddenMenu710
L__HiddenMenu711:
;GRR3000LManagementPanel.mpas,3310 :: 		end;
L__HiddenMenu702:
;GRR3000LManagementPanel.mpas,3314 :: 		end;
	GOTO	L__HiddenMenu654
L__HiddenMenu700:
;GRR3000LManagementPanel.mpas,3315 :: 		2: begin   // nominal hücre gerilimi
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__HiddenMenu5168
	GOTO	L__HiddenMenu751
L__HiddenMenu5168:
;GRR3000LManagementPanel.mpas,3317 :: 		Glcd_Write_Char(' ',0, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3318 :: 		Glcd_Write_Char('>',0, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3319 :: 		Glcd_Write_Char(' ',0, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3321 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu753
;GRR3000LManagementPanel.mpas,3323 :: 		while (Ok_Button =0) do
L__HiddenMenu756:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu757
;GRR3000LManagementPanel.mpas,3325 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3326 :: 		end;
	GOTO	L__HiddenMenu756
L__HiddenMenu757:
;GRR3000LManagementPanel.mpas,3329 :: 		Chng[3] := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+3]
;GRR3000LManagementPanel.mpas,3331 :: 		While (Chng[3] =1) do
L__HiddenMenu761:
	MOV.B	[W14+3], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5169
	GOTO	L__HiddenMenu762
L__HiddenMenu5169:
;GRR3000LManagementPanel.mpas,3333 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3335 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu766
;GRR3000LManagementPanel.mpas,3337 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3338 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3339 :: 		while (ButonStop = 0) do
L__HiddenMenu769:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu770
;GRR3000LManagementPanel.mpas,3341 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3342 :: 		end;
	GOTO	L__HiddenMenu769
L__HiddenMenu770:
;GRR3000LManagementPanel.mpas,3343 :: 		Inc(NomHucreGerilim);
	MOV	#1, W1
	MOV	#lo_addr(_NomHucreGerilim), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3344 :: 		if (NomHucreGerilim >500) then NomHucreGerilim := 2;
	MOV	_NomHucreGerilim, W1
	MOV	#500, W0
	CP	W1, W0
	BRA GTU	L__HiddenMenu5170
	GOTO	L__HiddenMenu774
L__HiddenMenu5170:
	MOV	#2, W0
	MOV	W0, _NomHucreGerilim
L__HiddenMenu774:
;GRR3000LManagementPanel.mpas,3345 :: 		end else
	GOTO	L__HiddenMenu767
L__HiddenMenu766:
;GRR3000LManagementPanel.mpas,3346 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu777
;GRR3000LManagementPanel.mpas,3348 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3349 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3350 :: 		while (ButonStop = 0) do
L__HiddenMenu780:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu781
;GRR3000LManagementPanel.mpas,3352 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3353 :: 		end;
	GOTO	L__HiddenMenu780
L__HiddenMenu781:
;GRR3000LManagementPanel.mpas,3354 :: 		Dec(NomHucreGerilim);
	MOV	#1, W1
	MOV	#lo_addr(_NomHucreGerilim), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3355 :: 		if (NomHucreGerilim < 2) then NomHucreGerilim := 500;
	MOV	_NomHucreGerilim, W0
	CP	W0, #2
	BRA LTU	L__HiddenMenu5171
	GOTO	L__HiddenMenu785
L__HiddenMenu5171:
	MOV	#500, W0
	MOV	W0, _NomHucreGerilim
L__HiddenMenu785:
;GRR3000LManagementPanel.mpas,3356 :: 		end;
L__HiddenMenu777:
L__HiddenMenu767:
;GRR3000LManagementPanel.mpas,3358 :: 		ValueDivide(NomHucreGerilim, 250);
	MOV.B	#250, W11
	MOV	_NomHucreGerilim, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3359 :: 		WriteText := Value_Text + 'V ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3360 :: 		Glcd_Write_Text(WriteText, 84, Row3, White);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3362 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu788
;GRR3000LManagementPanel.mpas,3364 :: 		while (Ok_Button =0) do
L__HiddenMenu791:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu792
;GRR3000LManagementPanel.mpas,3366 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3367 :: 		end;
	GOTO	L__HiddenMenu791
L__HiddenMenu792:
;GRR3000LManagementPanel.mpas,3369 :: 		EEPROM_Write(EE_NomHucreGerilimEeAddr, NomHucreGerilim);
	MOV	_NomHucreGerilim, W12
	MOV	#61446, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3370 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__HiddenMenu796:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__HiddenMenu796
;GRR3000LManagementPanel.mpas,3372 :: 		Chng[3] := 0;
	CLR	W0
	MOV.B	W0, [W14+3]
;GRR3000LManagementPanel.mpas,3373 :: 		Glcd_Write_Text(WriteText, 84, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3374 :: 		end;
L__HiddenMenu788:
;GRR3000LManagementPanel.mpas,3377 :: 		end;
	GOTO	L__HiddenMenu761
L__HiddenMenu762:
;GRR3000LManagementPanel.mpas,3378 :: 		end;
L__HiddenMenu753:
;GRR3000LManagementPanel.mpas,3380 :: 		end;
	GOTO	L__HiddenMenu654
L__HiddenMenu751:
;GRR3000LManagementPanel.mpas,3381 :: 		3: begin //þarj akýmý
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__HiddenMenu5172
	GOTO	L__HiddenMenu802
L__HiddenMenu5172:
;GRR3000LManagementPanel.mpas,3383 :: 		Glcd_Write_Char(' ',0, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3384 :: 		Glcd_Write_Char('>',0, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3385 :: 		Glcd_Write_Char(' ',0, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3387 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu804
;GRR3000LManagementPanel.mpas,3389 :: 		while (Ok_Button =0) do
L__HiddenMenu807:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu808
;GRR3000LManagementPanel.mpas,3391 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3392 :: 		end;
	GOTO	L__HiddenMenu807
L__HiddenMenu808:
;GRR3000LManagementPanel.mpas,3395 :: 		Chng[4] := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+4]
;GRR3000LManagementPanel.mpas,3397 :: 		While (Chng[4] =1) do
L__HiddenMenu812:
	MOV.B	[W14+4], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5173
	GOTO	L__HiddenMenu813
L__HiddenMenu5173:
;GRR3000LManagementPanel.mpas,3399 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3401 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu817
;GRR3000LManagementPanel.mpas,3403 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3404 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3405 :: 		while (ButonStop = 0) do
L__HiddenMenu820:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu821
;GRR3000LManagementPanel.mpas,3407 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3408 :: 		end;
	GOTO	L__HiddenMenu820
L__HiddenMenu821:
;GRR3000LManagementPanel.mpas,3409 :: 		Inc(RedresorAkim);
	MOV	#1, W1
	MOV	#lo_addr(_RedresorAkim), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3410 :: 		if (RedresorAkim >200) then RedresorAkim := 2;
	MOV	#200, W1
	MOV	#lo_addr(_RedresorAkim), W0
	CP	W1, [W0]
	BRA LTU	L__HiddenMenu5174
	GOTO	L__HiddenMenu825
L__HiddenMenu5174:
	MOV	#2, W0
	MOV	W0, _RedresorAkim
L__HiddenMenu825:
;GRR3000LManagementPanel.mpas,3411 :: 		end else
	GOTO	L__HiddenMenu818
L__HiddenMenu817:
;GRR3000LManagementPanel.mpas,3412 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu828
;GRR3000LManagementPanel.mpas,3414 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3415 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3416 :: 		while (ButonStop = 0) do
L__HiddenMenu831:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu832
;GRR3000LManagementPanel.mpas,3418 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3419 :: 		end;
	GOTO	L__HiddenMenu831
L__HiddenMenu832:
;GRR3000LManagementPanel.mpas,3420 :: 		Dec(RedresorAkim);
	MOV	#1, W1
	MOV	#lo_addr(_RedresorAkim), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3421 :: 		if (RedresorAkim < 2) then RedresorAkim := 200;
	MOV	_RedresorAkim, W0
	CP	W0, #2
	BRA LTU	L__HiddenMenu5175
	GOTO	L__HiddenMenu836
L__HiddenMenu5175:
	MOV	#200, W0
	MOV	W0, _RedresorAkim
L__HiddenMenu836:
;GRR3000LManagementPanel.mpas,3422 :: 		end;
L__HiddenMenu828:
L__HiddenMenu818:
;GRR3000LManagementPanel.mpas,3424 :: 		ValueDivide(RedresorAkim, 0);
	CLR	W11
	MOV	_RedresorAkim, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3425 :: 		WriteText := Value_Text + 'A ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3426 :: 		Glcd_Write_Text(WriteText, 84, Row4, White);
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3428 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu839
;GRR3000LManagementPanel.mpas,3430 :: 		while (Ok_Button =0) do
L__HiddenMenu842:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu843
;GRR3000LManagementPanel.mpas,3432 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3433 :: 		end;
	GOTO	L__HiddenMenu842
L__HiddenMenu843:
;GRR3000LManagementPanel.mpas,3435 :: 		EEPROM_Write(EE_RedresorAkimEeAddr, RedresorAkim);
	MOV	_RedresorAkim, W12
	MOV	#61456, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3436 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__HiddenMenu847:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__HiddenMenu847
;GRR3000LManagementPanel.mpas,3438 :: 		Chng[4] := 0;
	CLR	W0
	MOV.B	W0, [W14+4]
;GRR3000LManagementPanel.mpas,3439 :: 		Glcd_Write_Text(WriteText, 84, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3441 :: 		end;
L__HiddenMenu839:
;GRR3000LManagementPanel.mpas,3444 :: 		end;
	GOTO	L__HiddenMenu812
L__HiddenMenu813:
;GRR3000LManagementPanel.mpas,3445 :: 		end;
L__HiddenMenu804:
;GRR3000LManagementPanel.mpas,3447 :: 		end;
	GOTO	L__HiddenMenu654
L__HiddenMenu802:
;GRR3000LManagementPanel.mpas,3448 :: 		4: begin // float þarj minimum yüzde deðeri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__HiddenMenu5176
	GOTO	L__HiddenMenu853
L__HiddenMenu5176:
;GRR3000LManagementPanel.mpas,3450 :: 		Glcd_Write_Char(' ',0, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3451 :: 		Glcd_Write_Char('>',0, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3452 :: 		Glcd_Write_Char(' ',0, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3454 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu855
;GRR3000LManagementPanel.mpas,3456 :: 		while (Ok_Button =0) do
L__HiddenMenu858:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu859
;GRR3000LManagementPanel.mpas,3458 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3459 :: 		end;
	GOTO	L__HiddenMenu858
L__HiddenMenu859:
;GRR3000LManagementPanel.mpas,3462 :: 		Chng[5] := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+5]
;GRR3000LManagementPanel.mpas,3464 :: 		While (Chng[5] =1) do
L__HiddenMenu863:
	MOV.B	[W14+5], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5177
	GOTO	L__HiddenMenu864
L__HiddenMenu5177:
;GRR3000LManagementPanel.mpas,3466 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3468 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu868
;GRR3000LManagementPanel.mpas,3470 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3471 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3472 :: 		while (ButonStop = 0) do
L__HiddenMenu871:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu872
;GRR3000LManagementPanel.mpas,3474 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3475 :: 		end;
	GOTO	L__HiddenMenu871
L__HiddenMenu872:
;GRR3000LManagementPanel.mpas,3476 :: 		Inc(F_ChargePercentLo);
	MOV	#1, W1
	MOV	#lo_addr(_F_ChargePercentLo), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3477 :: 		if (F_ChargePercentLo >150) then F_ChargePercentLo := 80;
	MOV	#150, W1
	MOV	#lo_addr(_F_ChargePercentLo), W0
	CP	W1, [W0]
	BRA LTU	L__HiddenMenu5178
	GOTO	L__HiddenMenu876
L__HiddenMenu5178:
	MOV	#80, W0
	MOV	W0, _F_ChargePercentLo
L__HiddenMenu876:
;GRR3000LManagementPanel.mpas,3478 :: 		end else
	GOTO	L__HiddenMenu869
L__HiddenMenu868:
;GRR3000LManagementPanel.mpas,3479 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu879
;GRR3000LManagementPanel.mpas,3481 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3482 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3483 :: 		while (ButonStop = 0) do
L__HiddenMenu882:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu883
;GRR3000LManagementPanel.mpas,3485 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3486 :: 		end;
	GOTO	L__HiddenMenu882
L__HiddenMenu883:
;GRR3000LManagementPanel.mpas,3487 :: 		Dec(F_ChargePercentLo);
	MOV	#1, W1
	MOV	#lo_addr(_F_ChargePercentLo), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3488 :: 		if (F_ChargePercentLo < 80) then F_ChargePercentLo := 150;
	MOV	#80, W1
	MOV	#lo_addr(_F_ChargePercentLo), W0
	CP	W1, [W0]
	BRA GTU	L__HiddenMenu5179
	GOTO	L__HiddenMenu887
L__HiddenMenu5179:
	MOV	#150, W0
	MOV	W0, _F_ChargePercentLo
L__HiddenMenu887:
;GRR3000LManagementPanel.mpas,3489 :: 		end;
L__HiddenMenu879:
L__HiddenMenu869:
;GRR3000LManagementPanel.mpas,3491 :: 		ValueDivide(F_ChargePercentLo, 0);
	CLR	W11
	MOV	_F_ChargePercentLo, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3492 :: 		WriteText := Value_Text + '% ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3493 :: 		Glcd_Write_Text(WriteText, 84, Row5, White);
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3495 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu890
;GRR3000LManagementPanel.mpas,3497 :: 		while (Ok_Button =0) do
L__HiddenMenu893:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu894
;GRR3000LManagementPanel.mpas,3499 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3500 :: 		end;
	GOTO	L__HiddenMenu893
L__HiddenMenu894:
;GRR3000LManagementPanel.mpas,3502 :: 		EEPROM_Write(EE_F_ChargePercentLoEeAddr, F_ChargePercentLo);
	MOV	_F_ChargePercentLo, W12
	MOV	#61448, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3503 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__HiddenMenu898:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__HiddenMenu898
;GRR3000LManagementPanel.mpas,3505 :: 		Chng[5] := 0;
	CLR	W0
	MOV.B	W0, [W14+5]
;GRR3000LManagementPanel.mpas,3506 :: 		Glcd_Write_Text(WriteText, 84, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3510 :: 		end;
L__HiddenMenu890:
;GRR3000LManagementPanel.mpas,3513 :: 		end;
	GOTO	L__HiddenMenu863
L__HiddenMenu864:
;GRR3000LManagementPanel.mpas,3514 :: 		end;
L__HiddenMenu855:
;GRR3000LManagementPanel.mpas,3516 :: 		end;
	GOTO	L__HiddenMenu654
L__HiddenMenu853:
;GRR3000LManagementPanel.mpas,3517 :: 		5: begin // float þarj maximum yüzde deðeri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__HiddenMenu5180
	GOTO	L__HiddenMenu904
L__HiddenMenu5180:
;GRR3000LManagementPanel.mpas,3519 :: 		Glcd_Write_Char(' ',0, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3520 :: 		Glcd_Write_Char('>',0, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3521 :: 		Glcd_Write_Char(' ',0, Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3523 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu906
;GRR3000LManagementPanel.mpas,3525 :: 		while (Ok_Button =0) do
L__HiddenMenu909:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu910
;GRR3000LManagementPanel.mpas,3527 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3528 :: 		end;
	GOTO	L__HiddenMenu909
L__HiddenMenu910:
;GRR3000LManagementPanel.mpas,3530 :: 		Chng[6] := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+6]
;GRR3000LManagementPanel.mpas,3532 :: 		While (Chng[6] =1) do
L__HiddenMenu914:
	MOV.B	[W14+6], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5181
	GOTO	L__HiddenMenu915
L__HiddenMenu5181:
;GRR3000LManagementPanel.mpas,3534 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3536 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu919
;GRR3000LManagementPanel.mpas,3538 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3539 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3540 :: 		while (ButonStop = 0) do
L__HiddenMenu922:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu923
;GRR3000LManagementPanel.mpas,3542 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3543 :: 		end;
	GOTO	L__HiddenMenu922
L__HiddenMenu923:
;GRR3000LManagementPanel.mpas,3544 :: 		Inc(F_ChargePercentHi);
	MOV	#1, W1
	MOV	#lo_addr(_F_ChargePercentHi), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3545 :: 		if (F_ChargePercentHi >150) then F_ChargePercentHi := 80;
	MOV	#150, W1
	MOV	#lo_addr(_F_ChargePercentHi), W0
	CP	W1, [W0]
	BRA LTU	L__HiddenMenu5182
	GOTO	L__HiddenMenu927
L__HiddenMenu5182:
	MOV	#80, W0
	MOV	W0, _F_ChargePercentHi
L__HiddenMenu927:
;GRR3000LManagementPanel.mpas,3546 :: 		end else
	GOTO	L__HiddenMenu920
L__HiddenMenu919:
;GRR3000LManagementPanel.mpas,3547 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu930
;GRR3000LManagementPanel.mpas,3549 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3550 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3551 :: 		while (ButonStop = 0) do
L__HiddenMenu933:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu934
;GRR3000LManagementPanel.mpas,3553 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3554 :: 		end;
	GOTO	L__HiddenMenu933
L__HiddenMenu934:
;GRR3000LManagementPanel.mpas,3555 :: 		Dec(F_ChargePercentHi);
	MOV	#1, W1
	MOV	#lo_addr(_F_ChargePercentHi), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3556 :: 		if (F_ChargePercentHi < 80) then F_ChargePercentHi := 150;
	MOV	#80, W1
	MOV	#lo_addr(_F_ChargePercentHi), W0
	CP	W1, [W0]
	BRA GTU	L__HiddenMenu5183
	GOTO	L__HiddenMenu938
L__HiddenMenu5183:
	MOV	#150, W0
	MOV	W0, _F_ChargePercentHi
L__HiddenMenu938:
;GRR3000LManagementPanel.mpas,3557 :: 		end;
L__HiddenMenu930:
L__HiddenMenu920:
;GRR3000LManagementPanel.mpas,3559 :: 		ValueDivide(F_ChargePercentHi, 0);
	CLR	W11
	MOV	_F_ChargePercentHi, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3560 :: 		WriteText := Value_Text + '% ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3561 :: 		Glcd_Write_Text(WriteText, 84, Row6, White);
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3563 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu941
;GRR3000LManagementPanel.mpas,3565 :: 		while (Ok_Button =0) do
L__HiddenMenu944:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu945
;GRR3000LManagementPanel.mpas,3567 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3568 :: 		end;
	GOTO	L__HiddenMenu944
L__HiddenMenu945:
;GRR3000LManagementPanel.mpas,3570 :: 		EEPROM_Write(EE_F_ChargePercentHiEeAddr, F_ChargePercentHi);
	MOV	_F_ChargePercentHi, W12
	MOV	#61450, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3571 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__HiddenMenu949:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__HiddenMenu949
;GRR3000LManagementPanel.mpas,3573 :: 		Chng[6] := 0;
	CLR	W0
	MOV.B	W0, [W14+6]
;GRR3000LManagementPanel.mpas,3574 :: 		Glcd_Write_Text(WriteText, 84, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3578 :: 		end;
L__HiddenMenu941:
;GRR3000LManagementPanel.mpas,3581 :: 		end;
	GOTO	L__HiddenMenu914
L__HiddenMenu915:
;GRR3000LManagementPanel.mpas,3582 :: 		end;
L__HiddenMenu906:
;GRR3000LManagementPanel.mpas,3584 :: 		end;
	GOTO	L__HiddenMenu654
L__HiddenMenu904:
;GRR3000LManagementPanel.mpas,3585 :: 		6: begin  // boost þarj minimum yüzde deðeri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA Z	L__HiddenMenu5184
	GOTO	L__HiddenMenu955
L__HiddenMenu5184:
;GRR3000LManagementPanel.mpas,3587 :: 		Glcd_Write_Char(' ',0, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3588 :: 		Glcd_Write_Char('>',0, Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3589 :: 		Glcd_Write_Char(' ',0, Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3591 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu957
;GRR3000LManagementPanel.mpas,3593 :: 		while (Ok_Button =0) do
L__HiddenMenu960:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu961
;GRR3000LManagementPanel.mpas,3595 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3596 :: 		end;
	GOTO	L__HiddenMenu960
L__HiddenMenu961:
;GRR3000LManagementPanel.mpas,3598 :: 		Chng[7] := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+7]
;GRR3000LManagementPanel.mpas,3600 :: 		While (Chng[7] =1) do
L__HiddenMenu965:
	MOV.B	[W14+7], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5185
	GOTO	L__HiddenMenu966
L__HiddenMenu5185:
;GRR3000LManagementPanel.mpas,3602 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3604 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu970
;GRR3000LManagementPanel.mpas,3606 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3607 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3608 :: 		while (ButonStop = 0) do
L__HiddenMenu973:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu974
;GRR3000LManagementPanel.mpas,3610 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3611 :: 		end;
	GOTO	L__HiddenMenu973
L__HiddenMenu974:
;GRR3000LManagementPanel.mpas,3612 :: 		Inc(B_ChargePercentLo);
	MOV	#1, W1
	MOV	#lo_addr(_B_ChargePercentLo), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3613 :: 		if (B_ChargePercentLo >180) then B_ChargePercentLo := 100;
	MOV	#180, W1
	MOV	#lo_addr(_B_ChargePercentLo), W0
	CP	W1, [W0]
	BRA LTU	L__HiddenMenu5186
	GOTO	L__HiddenMenu978
L__HiddenMenu5186:
	MOV	#100, W0
	MOV	W0, _B_ChargePercentLo
L__HiddenMenu978:
;GRR3000LManagementPanel.mpas,3614 :: 		end else
	GOTO	L__HiddenMenu971
L__HiddenMenu970:
;GRR3000LManagementPanel.mpas,3615 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu981
;GRR3000LManagementPanel.mpas,3617 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3618 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3619 :: 		while (ButonStop = 0) do
L__HiddenMenu984:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu985
;GRR3000LManagementPanel.mpas,3621 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3622 :: 		end;
	GOTO	L__HiddenMenu984
L__HiddenMenu985:
;GRR3000LManagementPanel.mpas,3623 :: 		Dec(B_ChargePercentLo);
	MOV	#1, W1
	MOV	#lo_addr(_B_ChargePercentLo), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3624 :: 		if (B_ChargePercentLo < 100) then B_ChargePercentLo := 180;
	MOV	#100, W1
	MOV	#lo_addr(_B_ChargePercentLo), W0
	CP	W1, [W0]
	BRA GTU	L__HiddenMenu5187
	GOTO	L__HiddenMenu989
L__HiddenMenu5187:
	MOV	#180, W0
	MOV	W0, _B_ChargePercentLo
L__HiddenMenu989:
;GRR3000LManagementPanel.mpas,3625 :: 		end;
L__HiddenMenu981:
L__HiddenMenu971:
;GRR3000LManagementPanel.mpas,3627 :: 		ValueDivide(B_ChargePercentLo, 0);
	CLR	W11
	MOV	_B_ChargePercentLo, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3628 :: 		WriteText := Value_Text + '% ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3629 :: 		Glcd_Write_Text(WriteText, 84, Row7, White);
	CLR	W13
	MOV.B	#6, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3631 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu992
;GRR3000LManagementPanel.mpas,3633 :: 		while (Ok_Button =0) do
L__HiddenMenu995:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu996
;GRR3000LManagementPanel.mpas,3635 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3636 :: 		end;
	GOTO	L__HiddenMenu995
L__HiddenMenu996:
;GRR3000LManagementPanel.mpas,3638 :: 		EEPROM_Write(EE_B_ChargePercentLoEeAddr, B_ChargePercentLo);
	MOV	_B_ChargePercentLo, W12
	MOV	#61452, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3639 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__HiddenMenu1000:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__HiddenMenu1000
;GRR3000LManagementPanel.mpas,3641 :: 		Chng[7] := 0;
	CLR	W0
	MOV.B	W0, [W14+7]
;GRR3000LManagementPanel.mpas,3642 :: 		Glcd_Write_Text(WriteText, 84, Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3646 :: 		end;
L__HiddenMenu992:
;GRR3000LManagementPanel.mpas,3649 :: 		end;
	GOTO	L__HiddenMenu965
L__HiddenMenu966:
;GRR3000LManagementPanel.mpas,3650 :: 		end;
L__HiddenMenu957:
;GRR3000LManagementPanel.mpas,3652 :: 		end;
	GOTO	L__HiddenMenu654
L__HiddenMenu955:
;GRR3000LManagementPanel.mpas,3654 :: 		7: begin  // boost þarj maximum yüzde deðeri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA Z	L__HiddenMenu5188
	GOTO	L__HiddenMenu1006
L__HiddenMenu5188:
;GRR3000LManagementPanel.mpas,3656 :: 		Glcd_Write_Char(' ',0, Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3657 :: 		Glcd_Write_Char('>',0, Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3658 :: 		Glcd_Write_Char(' ',0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,3660 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu1008
;GRR3000LManagementPanel.mpas,3662 :: 		while (Ok_Button =0) do
L__HiddenMenu1011:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu1012
;GRR3000LManagementPanel.mpas,3664 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3665 :: 		end;
	GOTO	L__HiddenMenu1011
L__HiddenMenu1012:
;GRR3000LManagementPanel.mpas,3667 :: 		Chng[8] := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+8]
;GRR3000LManagementPanel.mpas,3669 :: 		While (Chng[8] =1) do
L__HiddenMenu1016:
	MOV.B	[W14+8], W0
	CP.B	W0, #1
	BRA Z	L__HiddenMenu5189
	GOTO	L__HiddenMenu1017
L__HiddenMenu5189:
;GRR3000LManagementPanel.mpas,3671 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3673 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__HiddenMenu1021
;GRR3000LManagementPanel.mpas,3675 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3676 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3677 :: 		while (ButonStop = 0) do
L__HiddenMenu1024:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu1025
;GRR3000LManagementPanel.mpas,3679 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3680 :: 		end;
	GOTO	L__HiddenMenu1024
L__HiddenMenu1025:
;GRR3000LManagementPanel.mpas,3681 :: 		Inc(B_ChargePercentHi);
	MOV	#1, W1
	MOV	#lo_addr(_B_ChargePercentHi), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3682 :: 		if (B_ChargePercentHi >180) then B_ChargePercentHi := 100;
	MOV	#180, W1
	MOV	#lo_addr(_B_ChargePercentHi), W0
	CP	W1, [W0]
	BRA LTU	L__HiddenMenu5190
	GOTO	L__HiddenMenu1029
L__HiddenMenu5190:
	MOV	#100, W0
	MOV	W0, _B_ChargePercentHi
L__HiddenMenu1029:
;GRR3000LManagementPanel.mpas,3683 :: 		end else
	GOTO	L__HiddenMenu1022
L__HiddenMenu1021:
;GRR3000LManagementPanel.mpas,3684 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__HiddenMenu1032
;GRR3000LManagementPanel.mpas,3686 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,3687 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,3688 :: 		while (ButonStop = 0) do
L__HiddenMenu1035:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__HiddenMenu1036
;GRR3000LManagementPanel.mpas,3690 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3691 :: 		end;
	GOTO	L__HiddenMenu1035
L__HiddenMenu1036:
;GRR3000LManagementPanel.mpas,3692 :: 		Dec(B_ChargePercentHi);
	MOV	#1, W1
	MOV	#lo_addr(_B_ChargePercentHi), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3693 :: 		if (B_ChargePercentHi < 100) then B_ChargePercentHi := 180;
	MOV	#100, W1
	MOV	#lo_addr(_B_ChargePercentHi), W0
	CP	W1, [W0]
	BRA GTU	L__HiddenMenu5191
	GOTO	L__HiddenMenu1040
L__HiddenMenu5191:
	MOV	#180, W0
	MOV	W0, _B_ChargePercentHi
L__HiddenMenu1040:
;GRR3000LManagementPanel.mpas,3694 :: 		end;
L__HiddenMenu1032:
L__HiddenMenu1022:
;GRR3000LManagementPanel.mpas,3696 :: 		ValueDivide(B_ChargePercentHi, 0);
	CLR	W11
	MOV	_B_ChargePercentHi, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,3697 :: 		WriteText := Value_Text + '% ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,3698 :: 		Glcd_Write_Text(WriteText, 84, Row8, White);
	CLR	W13
	MOV.B	#7, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3700 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu1043
;GRR3000LManagementPanel.mpas,3702 :: 		while (Ok_Button =0) do
L__HiddenMenu1046:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__HiddenMenu1047
;GRR3000LManagementPanel.mpas,3704 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3705 :: 		end;
	GOTO	L__HiddenMenu1046
L__HiddenMenu1047:
;GRR3000LManagementPanel.mpas,3707 :: 		EEPROM_Write(EE_B_ChargePercentHiEeAddr, B_ChargePercentHi);
	MOV	_B_ChargePercentHi, W12
	MOV	#61454, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3708 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__HiddenMenu1051:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__HiddenMenu1051
;GRR3000LManagementPanel.mpas,3710 :: 		Chng[8] := 0;
	CLR	W0
	MOV.B	W0, [W14+8]
;GRR3000LManagementPanel.mpas,3711 :: 		Glcd_Write_Text(WriteText, 84, Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3715 :: 		end;
L__HiddenMenu1043:
;GRR3000LManagementPanel.mpas,3718 :: 		end;
	GOTO	L__HiddenMenu1016
L__HiddenMenu1017:
;GRR3000LManagementPanel.mpas,3719 :: 		end;
L__HiddenMenu1008:
;GRR3000LManagementPanel.mpas,3721 :: 		end;
	GOTO	L__HiddenMenu654
L__HiddenMenu1006:
L__HiddenMenu654:
;GRR3000LManagementPanel.mpas,3731 :: 		end; // hiddenmenuexit biti 0x00 olana kadar döngüde kal
	GOTO	L__HiddenMenu620
L__HiddenMenu621:
;GRR3000LManagementPanel.mpas,3733 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,3734 :: 		Glcd_Write_Text('Please Wait...',0,Row1,Black);
	ADD	W14, #10, W1
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#87, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #10, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3735 :: 		Pause_ms(500);
	MOV	#500, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,3739 :: 		end;
L_end_HiddenMenu:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _HiddenMenu

_Language_Settings:
	LNK	#8

;GRR3000LManagementPanel.mpas,3742 :: 		begin
;GRR3000LManagementPanel.mpas,3743 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,3744 :: 		MenuExit        := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3745 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3746 :: 		Chng[2]         := 2;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3748 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,3751 :: 		Glcd_Write_Text(Title_LangMenu,      0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_LangMenu), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3752 :: 		Glcd_Write_Text(Subtitle_Lang,       6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_Subtitle_Lang), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3753 :: 		Glcd_Write_Text(SubTitle_Back,       6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3755 :: 		LanguageBit := EEPROM_Read(EE_LanguageBitEeAddr);
	MOV	#61516, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_LanguageBit), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3757 :: 		English: Glcd_Write_Text('ENGLISH', 84, Row2, Black);
	CP.B	W0, #2
	BRA Z	L__Language_Settings5193
	GOTO	L__Language_Settings1059
L__Language_Settings5193:
	ADD	W14, #0, W1
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Language_Settings1056
L__Language_Settings1059:
;GRR3000LManagementPanel.mpas,3758 :: 		Turkish: Glcd_Write_Text('TÜRKÇE ', 84, Row2, Black);
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Language_Settings5194
	GOTO	L__Language_Settings1062
L__Language_Settings5194:
	ADD	W14, #0, W1
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#220, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#75, W0
	MOV.B	W0, [W1++]
	MOV.B	#199, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Language_Settings1056
L__Language_Settings1062:
L__Language_Settings1056:
;GRR3000LManagementPanel.mpas,3762 :: 		While (MenuExit =0) do
L__Language_Settings1064:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Language_Settings5195
	GOTO	L__Language_Settings1065
L__Language_Settings5195:
;GRR3000LManagementPanel.mpas,3767 :: 		MenuSayac := MenuButtonRead(2, 255);  // menu için butonlarý oku 2 satýr menü var
	MOV.B	#255, W11
	MOV.B	#2, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3769 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3772 :: 		1: begin // dil
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Language_Settings5196
	GOTO	L__Language_Settings1071
L__Language_Settings5196:
;GRR3000LManagementPanel.mpas,3774 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Language_Settings1073
;GRR3000LManagementPanel.mpas,3776 :: 		while (Ok_Button =0) do
L__Language_Settings1076:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Language_Settings1077
;GRR3000LManagementPanel.mpas,3778 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3779 :: 		end;
	GOTO	L__Language_Settings1076
L__Language_Settings1077:
;GRR3000LManagementPanel.mpas,3781 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3783 :: 		While (Chng[1] =1) do
L__Language_Settings1081:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Language_Settings5197
	GOTO	L__Language_Settings1082
L__Language_Settings5197:
;GRR3000LManagementPanel.mpas,3786 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3788 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Language_Settings1086
;GRR3000LManagementPanel.mpas,3790 :: 		while (Up_Button =0) do
L__Language_Settings1089:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Language_Settings1090
;GRR3000LManagementPanel.mpas,3792 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3793 :: 		end;
	GOTO	L__Language_Settings1089
L__Language_Settings1090:
;GRR3000LManagementPanel.mpas,3795 :: 		Inc(LanguageBit);
	MOV.B	#1, W1
	MOV	#lo_addr(_LanguageBit), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3796 :: 		if (LanguageBit >3) then LanguageBit := 2;
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA GTU	L__Language_Settings5198
	GOTO	L__Language_Settings1094
L__Language_Settings5198:
	MOV	#lo_addr(_LanguageBit), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
L__Language_Settings1094:
;GRR3000LManagementPanel.mpas,3798 :: 		end else
	GOTO	L__Language_Settings1087
L__Language_Settings1086:
;GRR3000LManagementPanel.mpas,3799 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Language_Settings1097
;GRR3000LManagementPanel.mpas,3801 :: 		while (Down_Button =0) do
L__Language_Settings1100:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Language_Settings1101
;GRR3000LManagementPanel.mpas,3803 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3804 :: 		end;
	GOTO	L__Language_Settings1100
L__Language_Settings1101:
;GRR3000LManagementPanel.mpas,3806 :: 		Dec(LanguageBit);
	MOV.B	#1, W1
	MOV	#lo_addr(_LanguageBit), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,3807 :: 		if (LanguageBit <2) then LanguageBit := 3;
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA LTU	L__Language_Settings5199
	GOTO	L__Language_Settings1105
L__Language_Settings5199:
	MOV	#lo_addr(_LanguageBit), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
L__Language_Settings1105:
;GRR3000LManagementPanel.mpas,3809 :: 		end;
L__Language_Settings1097:
L__Language_Settings1087:
;GRR3000LManagementPanel.mpas,3812 :: 		English: Glcd_Write_Text('ENGLISH', 84, Row2, White);
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Language_Settings5200
	GOTO	L__Language_Settings1110
L__Language_Settings5200:
	ADD	W14, #0, W1
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Language_Settings1107
L__Language_Settings1110:
;GRR3000LManagementPanel.mpas,3813 :: 		Turkish: Glcd_Write_Text('TÜRKÇE ', 84, Row2, White);
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Language_Settings5201
	GOTO	L__Language_Settings1113
L__Language_Settings5201:
	ADD	W14, #0, W1
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#220, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#75, W0
	MOV.B	W0, [W1++]
	MOV.B	#199, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Language_Settings1107
L__Language_Settings1113:
L__Language_Settings1107:
;GRR3000LManagementPanel.mpas,3817 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Language_Settings1115
;GRR3000LManagementPanel.mpas,3819 :: 		while (Ok_Button =0) do
L__Language_Settings1118:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Language_Settings1119
;GRR3000LManagementPanel.mpas,3821 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3822 :: 		end;
	GOTO	L__Language_Settings1118
L__Language_Settings1119:
;GRR3000LManagementPanel.mpas,3824 :: 		EEPROM_Write(EE_LanguageBitEeAddr, LanguageBit);
	MOV	#lo_addr(_LanguageBit), W0
	ZE	[W0], W12
	MOV	#61516, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,3825 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Language_Settings1123:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Language_Settings1123
;GRR3000LManagementPanel.mpas,3827 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3828 :: 		LanguageBit := EEPROM_Read(EE_LanguageBitEeAddr);
	MOV	#61516, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_LanguageBit), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3830 :: 		English: Glcd_Write_Text('ENGLISH', 84, Row2, Black);
	CP.B	W0, #2
	BRA Z	L__Language_Settings5202
	GOTO	L__Language_Settings1130
L__Language_Settings5202:
	ADD	W14, #0, W1
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#76, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Language_Settings1127
L__Language_Settings1130:
;GRR3000LManagementPanel.mpas,3831 :: 		Turkish: Glcd_Write_Text('TÜRKÇE ', 84, Row2, Black);
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Language_Settings5203
	GOTO	L__Language_Settings1133
L__Language_Settings5203:
	ADD	W14, #0, W1
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#220, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#75, W0
	MOV.B	W0, [W1++]
	MOV.B	#199, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Language_Settings1127
L__Language_Settings1133:
L__Language_Settings1127:
;GRR3000LManagementPanel.mpas,3836 :: 		end;
L__Language_Settings1115:
;GRR3000LManagementPanel.mpas,3841 :: 		end; // chng[1] while end
	GOTO	L__Language_Settings1081
L__Language_Settings1082:
;GRR3000LManagementPanel.mpas,3844 :: 		end;
L__Language_Settings1073:
;GRR3000LManagementPanel.mpas,3846 :: 		end;
	GOTO	L__Language_Settings1068
L__Language_Settings1071:
;GRR3000LManagementPanel.mpas,3848 :: 		2:  begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Language_Settings5204
	GOTO	L__Language_Settings1136
L__Language_Settings5204:
;GRR3000LManagementPanel.mpas,3850 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Language_Settings1138
;GRR3000LManagementPanel.mpas,3852 :: 		while (Ok_Button =0) do
L__Language_Settings1141:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Language_Settings1142
;GRR3000LManagementPanel.mpas,3854 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3855 :: 		end;
	GOTO	L__Language_Settings1141
L__Language_Settings1142:
;GRR3000LManagementPanel.mpas,3856 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3858 :: 		end;
L__Language_Settings1138:
;GRR3000LManagementPanel.mpas,3862 :: 		end;
	GOTO	L__Language_Settings1068
L__Language_Settings1136:
L__Language_Settings1068:
;GRR3000LManagementPanel.mpas,3867 :: 		end;
	GOTO	L__Language_Settings1064
L__Language_Settings1065:
;GRR3000LManagementPanel.mpas,3869 :: 		if (LanguageBit = Turkish) then
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Language_Settings5205
	GOTO	L__Language_Settings1146
L__Language_Settings5205:
;GRR3000LManagementPanel.mpas,3871 :: 		Turkish_Lang;
	CALL	_Turkish_Lang
;GRR3000LManagementPanel.mpas,3872 :: 		end else
	GOTO	L__Language_Settings1147
L__Language_Settings1146:
;GRR3000LManagementPanel.mpas,3873 :: 		if (LanguageBit = English) then
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Language_Settings5206
	GOTO	L__Language_Settings1149
L__Language_Settings5206:
;GRR3000LManagementPanel.mpas,3875 :: 		English_Lang;
	CALL	_English_Lang
;GRR3000LManagementPanel.mpas,3876 :: 		end;
L__Language_Settings1149:
L__Language_Settings1147:
;GRR3000LManagementPanel.mpas,3878 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,3879 :: 		MenuSayacValue := 10;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3881 :: 		end;
L_end_Language_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Language_Settings

_Dropper_Module:
	LNK	#8

;GRR3000LManagementPanel.mpas,3885 :: 		begin
;GRR3000LManagementPanel.mpas,3886 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,3887 :: 		MenuExit        := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3888 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3889 :: 		Chng[5]         := 2;
	MOV	#lo_addr(_Chng+4), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3894 :: 		Glcd_Write_Text(Title_DroppMenu,     0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_DroppMenu), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3895 :: 		Glcd_Write_Text(SubTitle_DropMod,    6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_DropMod), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3896 :: 		Glcd_Write_Text(SubTitle_OpMod,      6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_OpMod), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3897 :: 		Glcd_Write_Text(SubTitle_MS,         6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_MS), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3898 :: 		Glcd_Write_Text(SubTitle_Back,       6, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,3904 :: 		Dropper_OutStatus := EEPROM_Read(EE_DropperOutStatusEeAddr);
	MOV	#61496, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Dropper_OutStatus), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3906 :: 		1: Glcd_Write_Text('ByPass1', 84, Row2, Black);
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5208
	GOTO	L__Dropper_Module1155
L__Dropper_Module5208:
	ADD	W14, #0, W1
	MOV.B	#66, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1152
L__Dropper_Module1155:
;GRR3000LManagementPanel.mpas,3907 :: 		2: Glcd_Write_Text(DisableText, 84, Row2, Black);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Dropper_Module5209
	GOTO	L__Dropper_Module1158
L__Dropper_Module5209:
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1152
L__Dropper_Module1158:
;GRR3000LManagementPanel.mpas,3908 :: 		3: Glcd_Write_Text(EnableText, 84, Row2, Black);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Module5210
	GOTO	L__Dropper_Module1161
L__Dropper_Module5210:
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1152
L__Dropper_Module1161:
L__Dropper_Module1152:
;GRR3000LManagementPanel.mpas,3911 :: 		OperationMode  := EEPROM_Read(EE_OperationModeEeAddr);
	MOV	#61524, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_OperationMode), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3913 :: 		1: Glcd_Write_Text(SingleText, 84, Row3, Black);
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5211
	GOTO	L__Dropper_Module1165
L__Dropper_Module5211:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SingleText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1162
L__Dropper_Module1165:
;GRR3000LManagementPanel.mpas,3914 :: 		2: Glcd_Write_Text(BackupText, 84, Row3, Black);
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Dropper_Module5212
	GOTO	L__Dropper_Module1168
L__Dropper_Module5212:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_BackupText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1162
L__Dropper_Module1168:
;GRR3000LManagementPanel.mpas,3915 :: 		3: Glcd_Write_Text(ParalelText, 84, Row3, Black);
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Module5213
	GOTO	L__Dropper_Module1171
L__Dropper_Module5213:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_ParalelText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1162
L__Dropper_Module1171:
L__Dropper_Module1162:
;GRR3000LManagementPanel.mpas,3918 :: 		MasterSlave  := EEPROM_Read(EE_MasterSlaveEeAddr);
	MOV	#61526, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _MasterSlave
;GRR3000LManagementPanel.mpas,3920 :: 		1: Glcd_Write_Text('Master', 84, Row4, Black);
	CP	W0, #1
	BRA Z	L__Dropper_Module5214
	GOTO	L__Dropper_Module1175
L__Dropper_Module5214:
	ADD	W14, #0, W1
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1172
L__Dropper_Module1175:
;GRR3000LManagementPanel.mpas,3921 :: 		2: Glcd_Write_Text('Slave ', 84, Row4, Black);
	MOV	_MasterSlave, W0
	CP	W0, #2
	BRA Z	L__Dropper_Module5215
	GOTO	L__Dropper_Module1178
L__Dropper_Module5215:
	ADD	W14, #0, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#118, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1172
L__Dropper_Module1178:
L__Dropper_Module1172:
;GRR3000LManagementPanel.mpas,3926 :: 		While (MenuExit =0) do
L__Dropper_Module1180:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Dropper_Module5216
	GOTO	L__Dropper_Module1181
L__Dropper_Module5216:
;GRR3000LManagementPanel.mpas,3930 :: 		MenuSayac := MenuButtonRead(4, 255);  // menu için butonlarý oku 4 satýr menü var
	MOV.B	#255, W11
	MOV.B	#4, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,3932 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,3934 :: 		MenuBit := 0;
	MOV	#lo_addr(_MenuBit), W0
	BCLR	[W0], BitPos(_MenuBit+0)
;GRR3000LManagementPanel.mpas,4008 :: 		1: begin // dropper durumu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5217
	GOTO	L__Dropper_Module1187
L__Dropper_Module5217:
;GRR3000LManagementPanel.mpas,4010 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1189
;GRR3000LManagementPanel.mpas,4012 :: 		while (Ok_Button =0) do
L__Dropper_Module1192:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1193
;GRR3000LManagementPanel.mpas,4014 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4015 :: 		end;
	GOTO	L__Dropper_Module1192
L__Dropper_Module1193:
;GRR3000LManagementPanel.mpas,4017 :: 		MenuBit := 1;
	MOV	#lo_addr(_MenuBit), W0
	BSET	[W0], BitPos(_MenuBit+0)
;GRR3000LManagementPanel.mpas,4019 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4021 :: 		While (Chng[2] =1) do
L__Dropper_Module1197:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5218
	GOTO	L__Dropper_Module1198
L__Dropper_Module5218:
;GRR3000LManagementPanel.mpas,4024 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4026 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Dropper_Module1202
;GRR3000LManagementPanel.mpas,4028 :: 		while (Up_Button =0) do
L__Dropper_Module1205:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Dropper_Module1206
;GRR3000LManagementPanel.mpas,4030 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4031 :: 		end;
	GOTO	L__Dropper_Module1205
L__Dropper_Module1206:
;GRR3000LManagementPanel.mpas,4032 :: 		Inc(Dropper_OutStatus);
	MOV.B	#1, W1
	MOV	#lo_addr(_Dropper_OutStatus), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4033 :: 		if (Dropper_OutStatus > 3) then
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA GTU	L__Dropper_Module5219
	GOTO	L__Dropper_Module1210
L__Dropper_Module5219:
;GRR3000LManagementPanel.mpas,4034 :: 		Dropper_OutStatus := 1;
	MOV	#lo_addr(_Dropper_OutStatus), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Dropper_Module1210:
;GRR3000LManagementPanel.mpas,4035 :: 		end else
	GOTO	L__Dropper_Module1203
L__Dropper_Module1202:
;GRR3000LManagementPanel.mpas,4036 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Dropper_Module1213
;GRR3000LManagementPanel.mpas,4038 :: 		while (Down_Button =0) do
L__Dropper_Module1216:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Dropper_Module1217
;GRR3000LManagementPanel.mpas,4040 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4041 :: 		end;
	GOTO	L__Dropper_Module1216
L__Dropper_Module1217:
;GRR3000LManagementPanel.mpas,4042 :: 		Dec(Dropper_OutStatus);
	MOV.B	#1, W1
	MOV	#lo_addr(_Dropper_OutStatus), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4043 :: 		if (Dropper_OutStatus < 1) then //
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LTU	L__Dropper_Module5220
	GOTO	L__Dropper_Module1221
L__Dropper_Module5220:
;GRR3000LManagementPanel.mpas,4044 :: 		Dropper_OutStatus := 3;
	MOV	#lo_addr(_Dropper_OutStatus), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
L__Dropper_Module1221:
;GRR3000LManagementPanel.mpas,4045 :: 		end;
L__Dropper_Module1213:
L__Dropper_Module1203:
;GRR3000LManagementPanel.mpas,4049 :: 		1: Glcd_Write_Text('ByPass1', 84, Row2, White);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5221
	GOTO	L__Dropper_Module1226
L__Dropper_Module5221:
	ADD	W14, #0, W1
	MOV.B	#66, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1223
L__Dropper_Module1226:
;GRR3000LManagementPanel.mpas,4050 :: 		2: Glcd_Write_Text(DisableText, 84, Row2, White);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Dropper_Module5222
	GOTO	L__Dropper_Module1229
L__Dropper_Module5222:
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1223
L__Dropper_Module1229:
;GRR3000LManagementPanel.mpas,4051 :: 		3: Glcd_Write_Text(EnableText, 84, Row2, White);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Module5223
	GOTO	L__Dropper_Module1232
L__Dropper_Module5223:
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1223
L__Dropper_Module1232:
L__Dropper_Module1223:
;GRR3000LManagementPanel.mpas,4055 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1234
;GRR3000LManagementPanel.mpas,4057 :: 		while (Ok_Button =0) do
L__Dropper_Module1237:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1238
;GRR3000LManagementPanel.mpas,4059 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4060 :: 		end;
	GOTO	L__Dropper_Module1237
L__Dropper_Module1238:
;GRR3000LManagementPanel.mpas,4062 :: 		EEPROM_Write(EE_DropperOutStatusEeAddr, Dropper_OutStatus);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	ZE	[W0], W12
	MOV	#61496, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4063 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Dropper_Module1242:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Dropper_Module1242
;GRR3000LManagementPanel.mpas,4065 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4067 :: 		1: Glcd_Write_Text('ByPass1', 84, Row2, Black);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5224
	GOTO	L__Dropper_Module1249
L__Dropper_Module5224:
	ADD	W14, #0, W1
	MOV.B	#66, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#80, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1246
L__Dropper_Module1249:
;GRR3000LManagementPanel.mpas,4068 :: 		2: Glcd_Write_Text(DisableText, 84, Row2, Black);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Dropper_Module5225
	GOTO	L__Dropper_Module1252
L__Dropper_Module5225:
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1246
L__Dropper_Module1252:
;GRR3000LManagementPanel.mpas,4069 :: 		3: Glcd_Write_Text(EnableText, 84, Row2, Black);
	MOV	#lo_addr(_Dropper_OutStatus), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Module5226
	GOTO	L__Dropper_Module1255
L__Dropper_Module5226:
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1246
L__Dropper_Module1255:
L__Dropper_Module1246:
;GRR3000LManagementPanel.mpas,4074 :: 		end;
L__Dropper_Module1234:
;GRR3000LManagementPanel.mpas,4079 :: 		end; // chng[2] while end
	GOTO	L__Dropper_Module1197
L__Dropper_Module1198:
;GRR3000LManagementPanel.mpas,4082 :: 		end;
L__Dropper_Module1189:
;GRR3000LManagementPanel.mpas,4084 :: 		end;
	GOTO	L__Dropper_Module1184
L__Dropper_Module1187:
;GRR3000LManagementPanel.mpas,4086 :: 		2: begin // çalýþma durumu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Dropper_Module5227
	GOTO	L__Dropper_Module1258
L__Dropper_Module5227:
;GRR3000LManagementPanel.mpas,4088 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1260
;GRR3000LManagementPanel.mpas,4090 :: 		while (Ok_Button =0) do
L__Dropper_Module1263:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1264
;GRR3000LManagementPanel.mpas,4092 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4093 :: 		end;
	GOTO	L__Dropper_Module1263
L__Dropper_Module1264:
;GRR3000LManagementPanel.mpas,4095 :: 		Chng[3] := 1;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4097 :: 		While (Chng[3] =1) do
L__Dropper_Module1268:
	MOV	#lo_addr(_Chng+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5228
	GOTO	L__Dropper_Module1269
L__Dropper_Module5228:
;GRR3000LManagementPanel.mpas,4100 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4102 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Dropper_Module1273
;GRR3000LManagementPanel.mpas,4104 :: 		while (Up_Button =0) do
L__Dropper_Module1276:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Dropper_Module1277
;GRR3000LManagementPanel.mpas,4106 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4107 :: 		end;
	GOTO	L__Dropper_Module1276
L__Dropper_Module1277:
;GRR3000LManagementPanel.mpas,4108 :: 		Inc(OperationMode);
	MOV.B	#1, W1
	MOV	#lo_addr(_OperationMode), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4109 :: 		if (OperationMode > 3) then
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA GTU	L__Dropper_Module5229
	GOTO	L__Dropper_Module1281
L__Dropper_Module5229:
;GRR3000LManagementPanel.mpas,4110 :: 		OperationMode := 1;
	MOV	#lo_addr(_OperationMode), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Dropper_Module1281:
;GRR3000LManagementPanel.mpas,4111 :: 		end else
	GOTO	L__Dropper_Module1274
L__Dropper_Module1273:
;GRR3000LManagementPanel.mpas,4112 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Dropper_Module1284
;GRR3000LManagementPanel.mpas,4114 :: 		while (Down_Button =0) do
L__Dropper_Module1287:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Dropper_Module1288
;GRR3000LManagementPanel.mpas,4116 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4117 :: 		end;
	GOTO	L__Dropper_Module1287
L__Dropper_Module1288:
;GRR3000LManagementPanel.mpas,4118 :: 		Dec(OperationMode);
	MOV.B	#1, W1
	MOV	#lo_addr(_OperationMode), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4119 :: 		if (OperationMode < 1) then //
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LTU	L__Dropper_Module5230
	GOTO	L__Dropper_Module1292
L__Dropper_Module5230:
;GRR3000LManagementPanel.mpas,4120 :: 		OperationMode := 3;
	MOV	#lo_addr(_OperationMode), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
L__Dropper_Module1292:
;GRR3000LManagementPanel.mpas,4121 :: 		end;
L__Dropper_Module1284:
L__Dropper_Module1274:
;GRR3000LManagementPanel.mpas,4125 :: 		1: Glcd_Write_Text(SingleText, 84, Row3, White);
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5231
	GOTO	L__Dropper_Module1297
L__Dropper_Module5231:
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SingleText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1294
L__Dropper_Module1297:
;GRR3000LManagementPanel.mpas,4126 :: 		2: Glcd_Write_Text(BackupText, 84, Row3, White);
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Dropper_Module5232
	GOTO	L__Dropper_Module1300
L__Dropper_Module5232:
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_BackupText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1294
L__Dropper_Module1300:
;GRR3000LManagementPanel.mpas,4127 :: 		3: Glcd_Write_Text(ParalelText, 84, Row3, White);
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Module5233
	GOTO	L__Dropper_Module1303
L__Dropper_Module5233:
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_ParalelText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1294
L__Dropper_Module1303:
L__Dropper_Module1294:
;GRR3000LManagementPanel.mpas,4131 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1305
;GRR3000LManagementPanel.mpas,4133 :: 		while (Ok_Button =0) do
L__Dropper_Module1308:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1309
;GRR3000LManagementPanel.mpas,4135 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4136 :: 		end;
	GOTO	L__Dropper_Module1308
L__Dropper_Module1309:
;GRR3000LManagementPanel.mpas,4138 :: 		EEPROM_Write(EE_OperationModeEeAddr, OperationMode);
	MOV	#lo_addr(_OperationMode), W0
	ZE	[W0], W12
	MOV	#61524, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4139 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Dropper_Module1313:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Dropper_Module1313
;GRR3000LManagementPanel.mpas,4141 :: 		Chng[3] := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4143 :: 		1: Glcd_Write_Text(SingleText, 84, Row3, Black);
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5234
	GOTO	L__Dropper_Module1320
L__Dropper_Module5234:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SingleText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1317
L__Dropper_Module1320:
;GRR3000LManagementPanel.mpas,4144 :: 		2: Glcd_Write_Text(BackupText, 84, Row3, Black);
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Dropper_Module5235
	GOTO	L__Dropper_Module1323
L__Dropper_Module5235:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_BackupText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1317
L__Dropper_Module1323:
;GRR3000LManagementPanel.mpas,4145 :: 		3: Glcd_Write_Text(ParalelText, 84, Row3, Black);
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Module5236
	GOTO	L__Dropper_Module1326
L__Dropper_Module5236:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_ParalelText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1317
L__Dropper_Module1326:
L__Dropper_Module1317:
;GRR3000LManagementPanel.mpas,4150 :: 		end;
L__Dropper_Module1305:
;GRR3000LManagementPanel.mpas,4155 :: 		end; // chng[2] while end
	GOTO	L__Dropper_Module1268
L__Dropper_Module1269:
;GRR3000LManagementPanel.mpas,4158 :: 		end;
L__Dropper_Module1260:
;GRR3000LManagementPanel.mpas,4160 :: 		end;
	GOTO	L__Dropper_Module1184
L__Dropper_Module1258:
;GRR3000LManagementPanel.mpas,4161 :: 		3: begin // master sleave
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Dropper_Module5237
	GOTO	L__Dropper_Module1329
L__Dropper_Module5237:
;GRR3000LManagementPanel.mpas,4163 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1331
;GRR3000LManagementPanel.mpas,4165 :: 		while (Ok_Button =0) do
L__Dropper_Module1334:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1335
;GRR3000LManagementPanel.mpas,4167 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4168 :: 		end;
	GOTO	L__Dropper_Module1334
L__Dropper_Module1335:
;GRR3000LManagementPanel.mpas,4170 :: 		Chng[4] := 1;
	MOV	#lo_addr(_Chng+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4172 :: 		While (Chng[4] =1) do
L__Dropper_Module1339:
	MOV	#lo_addr(_Chng+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Dropper_Module5238
	GOTO	L__Dropper_Module1340
L__Dropper_Module5238:
;GRR3000LManagementPanel.mpas,4175 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4177 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Dropper_Module1344
;GRR3000LManagementPanel.mpas,4179 :: 		while (Up_Button =0) do
L__Dropper_Module1347:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Dropper_Module1348
;GRR3000LManagementPanel.mpas,4181 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4182 :: 		end;
	GOTO	L__Dropper_Module1347
L__Dropper_Module1348:
;GRR3000LManagementPanel.mpas,4183 :: 		Inc(MasterSlave);
	MOV	#1, W1
	MOV	#lo_addr(_MasterSlave), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4184 :: 		if (MasterSlave > 2) then
	MOV	_MasterSlave, W0
	CP	W0, #2
	BRA GTU	L__Dropper_Module5239
	GOTO	L__Dropper_Module1352
L__Dropper_Module5239:
;GRR3000LManagementPanel.mpas,4185 :: 		MasterSlave := 1;
	MOV	#1, W0
	MOV	W0, _MasterSlave
L__Dropper_Module1352:
;GRR3000LManagementPanel.mpas,4186 :: 		end else
	GOTO	L__Dropper_Module1345
L__Dropper_Module1344:
;GRR3000LManagementPanel.mpas,4187 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Dropper_Module1355
;GRR3000LManagementPanel.mpas,4189 :: 		while (Down_Button =0) do
L__Dropper_Module1358:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Dropper_Module1359
;GRR3000LManagementPanel.mpas,4191 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4192 :: 		end;
	GOTO	L__Dropper_Module1358
L__Dropper_Module1359:
;GRR3000LManagementPanel.mpas,4193 :: 		Dec(MasterSlave);
	MOV	#1, W1
	MOV	#lo_addr(_MasterSlave), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4194 :: 		if (MasterSlave < 1) then //
	MOV	_MasterSlave, W0
	CP	W0, #1
	BRA LTU	L__Dropper_Module5240
	GOTO	L__Dropper_Module1363
L__Dropper_Module5240:
;GRR3000LManagementPanel.mpas,4195 :: 		MasterSlave := 2;
	MOV	#2, W0
	MOV	W0, _MasterSlave
L__Dropper_Module1363:
;GRR3000LManagementPanel.mpas,4196 :: 		end;
L__Dropper_Module1355:
L__Dropper_Module1345:
;GRR3000LManagementPanel.mpas,4200 :: 		1: Glcd_Write_Text('Master', 84, Row4, white);
	MOV	_MasterSlave, W0
	CP	W0, #1
	BRA Z	L__Dropper_Module5241
	GOTO	L__Dropper_Module1368
L__Dropper_Module5241:
	ADD	W14, #0, W1
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1365
L__Dropper_Module1368:
;GRR3000LManagementPanel.mpas,4201 :: 		2: Glcd_Write_Text('Slave ', 84, Row4, white);
	MOV	_MasterSlave, W0
	CP	W0, #2
	BRA Z	L__Dropper_Module5242
	GOTO	L__Dropper_Module1371
L__Dropper_Module5242:
	ADD	W14, #0, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#118, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1365
L__Dropper_Module1371:
L__Dropper_Module1365:
;GRR3000LManagementPanel.mpas,4205 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1373
;GRR3000LManagementPanel.mpas,4207 :: 		while (Ok_Button =0) do
L__Dropper_Module1376:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1377
;GRR3000LManagementPanel.mpas,4209 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4210 :: 		end;
	GOTO	L__Dropper_Module1376
L__Dropper_Module1377:
;GRR3000LManagementPanel.mpas,4212 :: 		EEPROM_Write(EE_MasterSlaveEeAddr, MasterSlave);
	MOV	_MasterSlave, W12
	MOV	#61526, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4213 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Dropper_Module1381:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Dropper_Module1381
;GRR3000LManagementPanel.mpas,4215 :: 		Chng[4] := 0;
	MOV	#lo_addr(_Chng+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4217 :: 		1: Glcd_Write_Text('Master', 84, Row4, black);
	MOV	_MasterSlave, W0
	CP	W0, #1
	BRA Z	L__Dropper_Module5243
	GOTO	L__Dropper_Module1388
L__Dropper_Module5243:
	ADD	W14, #0, W1
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1385
L__Dropper_Module1388:
;GRR3000LManagementPanel.mpas,4218 :: 		2: Glcd_Write_Text('Slave ', 84, Row4, black);
	MOV	_MasterSlave, W0
	CP	W0, #2
	BRA Z	L__Dropper_Module5244
	GOTO	L__Dropper_Module1391
L__Dropper_Module5244:
	ADD	W14, #0, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#118, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Dropper_Module1385
L__Dropper_Module1391:
L__Dropper_Module1385:
;GRR3000LManagementPanel.mpas,4223 :: 		end;
L__Dropper_Module1373:
;GRR3000LManagementPanel.mpas,4228 :: 		end; // chng[2] while end
	GOTO	L__Dropper_Module1339
L__Dropper_Module1340:
;GRR3000LManagementPanel.mpas,4231 :: 		end;
L__Dropper_Module1331:
;GRR3000LManagementPanel.mpas,4233 :: 		end;
	GOTO	L__Dropper_Module1184
L__Dropper_Module1329:
;GRR3000LManagementPanel.mpas,4236 :: 		4:  begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Dropper_Module5245
	GOTO	L__Dropper_Module1394
L__Dropper_Module5245:
;GRR3000LManagementPanel.mpas,4238 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1396
;GRR3000LManagementPanel.mpas,4240 :: 		while (Ok_Button =0) do
L__Dropper_Module1399:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Dropper_Module1400
;GRR3000LManagementPanel.mpas,4242 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4243 :: 		end;
	GOTO	L__Dropper_Module1399
L__Dropper_Module1400:
;GRR3000LManagementPanel.mpas,4244 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4246 :: 		end;
L__Dropper_Module1396:
;GRR3000LManagementPanel.mpas,4250 :: 		end;
	GOTO	L__Dropper_Module1184
L__Dropper_Module1394:
L__Dropper_Module1184:
;GRR3000LManagementPanel.mpas,4255 :: 		end;
	GOTO	L__Dropper_Module1180
L__Dropper_Module1181:
;GRR3000LManagementPanel.mpas,4257 :: 		if ((MasterSlave = 1)and(OperationMode = 2)) then // slave den mastera geçiþte açýlýþ counter deðerini sýfýrla
	MOV	_MasterSlave, W0
	CP	W0, #1
	CLR	W1
	BRA NZ	L__Dropper_Module5246
	COM	W1
L__Dropper_Module5246:
	MOV	#lo_addr(_OperationMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR	W0
	BRA NZ	L__Dropper_Module5247
	COM	W0
L__Dropper_Module5247:
	AND	W1, W0, W0
	BRA NZ	L__Dropper_Module5248
	GOTO	L__Dropper_Module1404
L__Dropper_Module5248:
;GRR3000LManagementPanel.mpas,4259 :: 		Start_Counter := 15000;
	MOV	#15000, W0
	MOV	W0, _Start_Counter
;GRR3000LManagementPanel.mpas,4260 :: 		RedFaultBit   := 0;
	MOV	#lo_addr(_RedFaultBit), W0
	BCLR	[W0], BitPos(_RedFaultBit+0)
;GRR3000LManagementPanel.mpas,4261 :: 		StopBit       := 0;
	MOV	#lo_addr(_StopBit), W0
	BCLR	[W0], BitPos(_StopBit+0)
;GRR3000LManagementPanel.mpas,4262 :: 		Start_Bit     := 0;
	MOV	#lo_addr(_Start_Bit), W0
	BCLR	[W0], BitPos(_Start_Bit+0)
;GRR3000LManagementPanel.mpas,4263 :: 		end;
L__Dropper_Module1404:
;GRR3000LManagementPanel.mpas,4268 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,4269 :: 		MenuSayacValue := 3;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#3, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4271 :: 		end;
L_end_Dropper_Module:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Dropper_Module

_AC_Settings:

;GRR3000LManagementPanel.mpas,4274 :: 		begin
;GRR3000LManagementPanel.mpas,4275 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,4276 :: 		MenuExit        := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4277 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4278 :: 		Chng[3]         := 2;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4284 :: 		Glcd_Write_Text(Title_AcMenu,     0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_AcMenu), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4285 :: 		Glcd_Write_Text(SubTitle_MaxVolt, 6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_MaxVolt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4286 :: 		Glcd_Write_Text(SubTitle_MinVolt, 6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_MinVolt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4287 :: 		Glcd_Write_Text(SubTitle_VoltDiff,6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_VoltDiff), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4288 :: 		Glcd_Write_Text(SubTitle_VoltProt,6, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_VoltProt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4289 :: 		Glcd_Write_Text(SubTitle_Back,    6, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4291 :: 		ACMaxVoltSet := EEPROM_Read(EE_ACMaxVoltSetEeAddr);
	MOV	#61498, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _ACMaxVoltSet
;GRR3000LManagementPanel.mpas,4292 :: 		ValueDivide(ACMaxVoltSet, 0);
	CLR	W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4293 :: 		WriteText := Value_Text + 'V ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4294 :: 		Glcd_Write_Text(WriteText, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4296 :: 		ACMinVoltSet := EEPROM_Read(EE_ACMinVoltSetEeAddr);
	MOV	#61500, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _ACMinVoltSet
;GRR3000LManagementPanel.mpas,4297 :: 		ValueDivide(ACMinVoltSet, 0);
	CLR	W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4298 :: 		WriteText := Value_Text + 'V ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4299 :: 		Glcd_Write_Text(WriteText, 84, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4301 :: 		ACVolt_Different := EEPROM_Read(EE_ACVoltDifferentEeAddr);
	MOV	#61554, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ACVolt_Different), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4302 :: 		ValueDivide(ACVolt_Different, 0);
	CLR	W11
	ZE	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4303 :: 		WriteText := Value_Text + 'V ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4304 :: 		Glcd_Write_Text(WriteText, 84, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4306 :: 		AC_ProtectBit   := EEPROM_Read(EE_ACProtectEeAddr);
	MOV	#61556, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_AC_ProtectBit), W1
	BSET	[W1], BitPos(_AC_ProtectBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_AC_ProtectBit+0)
;GRR3000LManagementPanel.mpas,4307 :: 		if (AC_ProtectBit = 0) then
	MOV	#lo_addr(_AC_ProtectBit), W0
	BTSC	[W0], BitPos(_AC_ProtectBit+0)
	GOTO	L__AC_Settings1408
;GRR3000LManagementPanel.mpas,4309 :: 		Glcd_Write_Text(DisableText, 84, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4310 :: 		end else
	GOTO	L__AC_Settings1409
L__AC_Settings1408:
;GRR3000LManagementPanel.mpas,4312 :: 		Glcd_Write_Text(EnableText, 84, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4313 :: 		end;
L__AC_Settings1409:
;GRR3000LManagementPanel.mpas,4317 :: 		While (MenuExit =0) do
L__AC_Settings1411:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__AC_Settings5250
	GOTO	L__AC_Settings1412
L__AC_Settings5250:
;GRR3000LManagementPanel.mpas,4329 :: 		MenuSayac := MenuButtonRead(5, 255);  // menu için butonlarý oku 5 satýr menü var
	MOV.B	#255, W11
	MOV.B	#5, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4331 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4334 :: 		1: begin // AC Max Gerilimi
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AC_Settings5251
	GOTO	L__AC_Settings1418
L__AC_Settings5251:
;GRR3000LManagementPanel.mpas,4335 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1420
;GRR3000LManagementPanel.mpas,4337 :: 		while (Ok_Button =0) do
L__AC_Settings1423:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1424
;GRR3000LManagementPanel.mpas,4339 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4340 :: 		end;
	GOTO	L__AC_Settings1423
L__AC_Settings1424:
;GRR3000LManagementPanel.mpas,4342 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4344 :: 		While (Chng[1] =1) do
L__AC_Settings1428:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AC_Settings5252
	GOTO	L__AC_Settings1429
L__AC_Settings5252:
;GRR3000LManagementPanel.mpas,4347 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4349 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__AC_Settings1433
;GRR3000LManagementPanel.mpas,4351 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4352 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4353 :: 		while (ButonStop = 0) do
L__AC_Settings1436:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AC_Settings1437
;GRR3000LManagementPanel.mpas,4355 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4356 :: 		end;
	GOTO	L__AC_Settings1436
L__AC_Settings1437:
;GRR3000LManagementPanel.mpas,4357 :: 		Inc(ACMaxVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_ACMaxVoltSet), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4358 :: 		if (ACMaxVoltSet > 480) then
	MOV	_ACMaxVoltSet, W1
	MOV	#480, W0
	CP	W1, W0
	BRA GTU	L__AC_Settings5253
	GOTO	L__AC_Settings1441
L__AC_Settings5253:
;GRR3000LManagementPanel.mpas,4359 :: 		ACMaxVoltSet := 480;
	MOV	#480, W0
	MOV	W0, _ACMaxVoltSet
L__AC_Settings1441:
;GRR3000LManagementPanel.mpas,4360 :: 		end else
	GOTO	L__AC_Settings1434
L__AC_Settings1433:
;GRR3000LManagementPanel.mpas,4361 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__AC_Settings1444
;GRR3000LManagementPanel.mpas,4363 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4364 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4365 :: 		while (ButonStop = 0) do
L__AC_Settings1447:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AC_Settings1448
;GRR3000LManagementPanel.mpas,4367 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4368 :: 		end;
	GOTO	L__AC_Settings1447
L__AC_Settings1448:
;GRR3000LManagementPanel.mpas,4369 :: 		Dec(ACMaxVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_ACMaxVoltSet), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4370 :: 		if (ACMaxVoltSet < 320) then
	MOV	_ACMaxVoltSet, W1
	MOV	#320, W0
	CP	W1, W0
	BRA LTU	L__AC_Settings5254
	GOTO	L__AC_Settings1452
L__AC_Settings5254:
;GRR3000LManagementPanel.mpas,4371 :: 		ACMaxVoltSet := 320;
	MOV	#320, W0
	MOV	W0, _ACMaxVoltSet
L__AC_Settings1452:
;GRR3000LManagementPanel.mpas,4372 :: 		end;
L__AC_Settings1444:
L__AC_Settings1434:
;GRR3000LManagementPanel.mpas,4374 :: 		ValueDivide(ACMaxVoltSet, 0);
	CLR	W11
	MOV	_ACMaxVoltSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4375 :: 		WriteText := Value_Text + 'V ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4377 :: 		Glcd_Write_Text(WriteText, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4379 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1455
;GRR3000LManagementPanel.mpas,4381 :: 		while (Ok_Button =0) do
L__AC_Settings1458:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1459
;GRR3000LManagementPanel.mpas,4383 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4384 :: 		end;
	GOTO	L__AC_Settings1458
L__AC_Settings1459:
;GRR3000LManagementPanel.mpas,4386 :: 		EEPROM_Write(EE_ACMaxVoltSetEeAddr, ACMaxVoltSet);
	MOV	_ACMaxVoltSet, W12
	MOV	#61498, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4387 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__AC_Settings1463:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__AC_Settings1463
;GRR3000LManagementPanel.mpas,4389 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4390 :: 		Glcd_Write_Text(WriteText, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4393 :: 		end;
L__AC_Settings1455:
;GRR3000LManagementPanel.mpas,4396 :: 		end; // chng[1] while end
	GOTO	L__AC_Settings1428
L__AC_Settings1429:
;GRR3000LManagementPanel.mpas,4398 :: 		end;
L__AC_Settings1420:
;GRR3000LManagementPanel.mpas,4399 :: 		end;
	GOTO	L__AC_Settings1415
L__AC_Settings1418:
;GRR3000LManagementPanel.mpas,4401 :: 		2: begin // AC Min Gerilimi
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__AC_Settings5255
	GOTO	L__AC_Settings1469
L__AC_Settings5255:
;GRR3000LManagementPanel.mpas,4402 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1471
;GRR3000LManagementPanel.mpas,4404 :: 		while (Ok_Button =0) do
L__AC_Settings1474:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1475
;GRR3000LManagementPanel.mpas,4406 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4407 :: 		end;
	GOTO	L__AC_Settings1474
L__AC_Settings1475:
;GRR3000LManagementPanel.mpas,4409 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4411 :: 		While (Chng[2] =1) do
L__AC_Settings1479:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AC_Settings5256
	GOTO	L__AC_Settings1480
L__AC_Settings5256:
;GRR3000LManagementPanel.mpas,4414 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4416 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__AC_Settings1484
;GRR3000LManagementPanel.mpas,4418 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4419 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4420 :: 		while (ButonStop = 0) do
L__AC_Settings1487:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AC_Settings1488
;GRR3000LManagementPanel.mpas,4422 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4423 :: 		end;
	GOTO	L__AC_Settings1487
L__AC_Settings1488:
;GRR3000LManagementPanel.mpas,4424 :: 		Inc(ACMinVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_ACMinVoltSet), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4425 :: 		if (ACMinVoltSet > 480) then
	MOV	_ACMinVoltSet, W1
	MOV	#480, W0
	CP	W1, W0
	BRA GTU	L__AC_Settings5257
	GOTO	L__AC_Settings1492
L__AC_Settings5257:
;GRR3000LManagementPanel.mpas,4426 :: 		ACMinVoltSet := 480;
	MOV	#480, W0
	MOV	W0, _ACMinVoltSet
L__AC_Settings1492:
;GRR3000LManagementPanel.mpas,4427 :: 		end else
	GOTO	L__AC_Settings1485
L__AC_Settings1484:
;GRR3000LManagementPanel.mpas,4428 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__AC_Settings1495
;GRR3000LManagementPanel.mpas,4430 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4431 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4432 :: 		while (ButonStop = 0) do
L__AC_Settings1498:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AC_Settings1499
;GRR3000LManagementPanel.mpas,4434 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4435 :: 		end;
	GOTO	L__AC_Settings1498
L__AC_Settings1499:
;GRR3000LManagementPanel.mpas,4436 :: 		Dec(ACMinVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_ACMinVoltSet), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4437 :: 		if (ACMinVoltSet < 320) then
	MOV	_ACMinVoltSet, W1
	MOV	#320, W0
	CP	W1, W0
	BRA LTU	L__AC_Settings5258
	GOTO	L__AC_Settings1503
L__AC_Settings5258:
;GRR3000LManagementPanel.mpas,4438 :: 		ACMinVoltSet := 320;
	MOV	#320, W0
	MOV	W0, _ACMinVoltSet
L__AC_Settings1503:
;GRR3000LManagementPanel.mpas,4439 :: 		end;
L__AC_Settings1495:
L__AC_Settings1485:
;GRR3000LManagementPanel.mpas,4441 :: 		ValueDivide(ACMinVoltSet, 0);
	CLR	W11
	MOV	_ACMinVoltSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4442 :: 		WriteText := Value_Text + 'V ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4443 :: 		Glcd_Write_Text(WriteText, 84, Row3, White);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4445 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1506
;GRR3000LManagementPanel.mpas,4447 :: 		while (Ok_Button =0) do
L__AC_Settings1509:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1510
;GRR3000LManagementPanel.mpas,4449 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4450 :: 		end;
	GOTO	L__AC_Settings1509
L__AC_Settings1510:
;GRR3000LManagementPanel.mpas,4452 :: 		EEPROM_Write(EE_ACMinVoltSetEeAddr, ACMinVoltSet);
	MOV	_ACMinVoltSet, W12
	MOV	#61500, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4453 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__AC_Settings1514:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__AC_Settings1514
;GRR3000LManagementPanel.mpas,4455 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4456 :: 		Glcd_Write_Text(WriteText, 84, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4459 :: 		end;
L__AC_Settings1506:
;GRR3000LManagementPanel.mpas,4462 :: 		end; // chng[2] while end
	GOTO	L__AC_Settings1479
L__AC_Settings1480:
;GRR3000LManagementPanel.mpas,4464 :: 		end;
L__AC_Settings1471:
;GRR3000LManagementPanel.mpas,4465 :: 		end;
	GOTO	L__AC_Settings1415
L__AC_Settings1469:
;GRR3000LManagementPanel.mpas,4467 :: 		3: begin // AC Volt farký
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__AC_Settings5259
	GOTO	L__AC_Settings1520
L__AC_Settings5259:
;GRR3000LManagementPanel.mpas,4468 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1522
;GRR3000LManagementPanel.mpas,4470 :: 		while (Ok_Button =0) do
L__AC_Settings1525:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1526
;GRR3000LManagementPanel.mpas,4472 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4473 :: 		end;
	GOTO	L__AC_Settings1525
L__AC_Settings1526:
;GRR3000LManagementPanel.mpas,4475 :: 		Chng[3] := 1;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4477 :: 		While (Chng[3] =1) do
L__AC_Settings1530:
	MOV	#lo_addr(_Chng+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AC_Settings5260
	GOTO	L__AC_Settings1531
L__AC_Settings5260:
;GRR3000LManagementPanel.mpas,4480 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4482 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__AC_Settings1535
;GRR3000LManagementPanel.mpas,4484 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4485 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4486 :: 		while (ButonStop = 0) do
L__AC_Settings1538:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AC_Settings1539
;GRR3000LManagementPanel.mpas,4488 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4489 :: 		end;
	GOTO	L__AC_Settings1538
L__AC_Settings1539:
;GRR3000LManagementPanel.mpas,4490 :: 		Inc(ACVolt_Different);
	MOV.B	#1, W1
	MOV	#lo_addr(_ACVolt_Different), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4491 :: 		if (ACVolt_Different > 30) then // 30V' a kadar ayarlanacak
	MOV	#lo_addr(_ACVolt_Different), W0
	MOV.B	[W0], W0
	CP.B	W0, #30
	BRA GTU	L__AC_Settings5261
	GOTO	L__AC_Settings1543
L__AC_Settings5261:
;GRR3000LManagementPanel.mpas,4492 :: 		ACVolt_Different := 30;
	MOV	#lo_addr(_ACVolt_Different), W1
	MOV.B	#30, W0
	MOV.B	W0, [W1]
L__AC_Settings1543:
;GRR3000LManagementPanel.mpas,4493 :: 		end else
	GOTO	L__AC_Settings1536
L__AC_Settings1535:
;GRR3000LManagementPanel.mpas,4494 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__AC_Settings1546
;GRR3000LManagementPanel.mpas,4496 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4497 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4498 :: 		while (ButonStop = 0) do
L__AC_Settings1549:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__AC_Settings1550
;GRR3000LManagementPanel.mpas,4500 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4501 :: 		end;
	GOTO	L__AC_Settings1549
L__AC_Settings1550:
;GRR3000LManagementPanel.mpas,4502 :: 		Dec(ACVolt_Different);
	MOV.B	#1, W1
	MOV	#lo_addr(_ACVolt_Different), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4503 :: 		if (ACVolt_Different < 15) then
	MOV	#lo_addr(_ACVolt_Different), W0
	MOV.B	[W0], W0
	CP.B	W0, #15
	BRA LTU	L__AC_Settings5262
	GOTO	L__AC_Settings1554
L__AC_Settings5262:
;GRR3000LManagementPanel.mpas,4504 :: 		ACVolt_Different := 15;
	MOV	#lo_addr(_ACVolt_Different), W1
	MOV.B	#15, W0
	MOV.B	W0, [W1]
L__AC_Settings1554:
;GRR3000LManagementPanel.mpas,4505 :: 		end;
L__AC_Settings1546:
L__AC_Settings1536:
;GRR3000LManagementPanel.mpas,4507 :: 		ValueDivide(ACVolt_Different, 0);
	MOV	#lo_addr(_ACVolt_Different), W0
	CLR	W11
	ZE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4508 :: 		WriteText := Value_Text + 'V ';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4509 :: 		Glcd_Write_Text(WriteText, 84, Row4, White);
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4511 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1557
;GRR3000LManagementPanel.mpas,4513 :: 		while (Ok_Button =0) do
L__AC_Settings1560:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1561
;GRR3000LManagementPanel.mpas,4515 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4516 :: 		end;
	GOTO	L__AC_Settings1560
L__AC_Settings1561:
;GRR3000LManagementPanel.mpas,4518 :: 		EEPROM_Write(EE_ACVoltDifferentEeAddr, ACVolt_Different);
	MOV	#lo_addr(_ACVolt_Different), W0
	ZE	[W0], W12
	MOV	#61554, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4519 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__AC_Settings1565:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__AC_Settings1565
;GRR3000LManagementPanel.mpas,4521 :: 		Chng[3] := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4522 :: 		Glcd_Write_Text(WriteText, 84, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4525 :: 		end;
L__AC_Settings1557:
;GRR3000LManagementPanel.mpas,4528 :: 		end; // chng[2] while end
	GOTO	L__AC_Settings1530
L__AC_Settings1531:
;GRR3000LManagementPanel.mpas,4530 :: 		end;
L__AC_Settings1522:
;GRR3000LManagementPanel.mpas,4531 :: 		end;
	GOTO	L__AC_Settings1415
L__AC_Settings1520:
;GRR3000LManagementPanel.mpas,4533 :: 		4: begin // AC Koruma
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__AC_Settings5263
	GOTO	L__AC_Settings1571
L__AC_Settings5263:
;GRR3000LManagementPanel.mpas,4535 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1573
;GRR3000LManagementPanel.mpas,4537 :: 		while (Ok_Button =0) do
L__AC_Settings1576:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1577
;GRR3000LManagementPanel.mpas,4539 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4540 :: 		end;
	GOTO	L__AC_Settings1576
L__AC_Settings1577:
;GRR3000LManagementPanel.mpas,4542 :: 		Chng[4] := 1;
	MOV	#lo_addr(_Chng+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4544 :: 		While (Chng[4] =1) do
L__AC_Settings1581:
	MOV	#lo_addr(_Chng+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__AC_Settings5264
	GOTO	L__AC_Settings1582
L__AC_Settings5264:
;GRR3000LManagementPanel.mpas,4547 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4549 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W3, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W3, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W3, #0
	BTSC	66, #0
	BRA	L__AC_Settings5265
	BCLR	W3, #0
	BRA	L__AC_Settings5268
L__AC_Settings5265:
	BSET	W3, #0
L__AC_Settings5268:
	BTSS	W3, #0
	GOTO	L__AC_Settings1586
;GRR3000LManagementPanel.mpas,4552 :: 		while ((Up_Button =0)or(Down_Button =0)) do
L__AC_Settings1589:
	BCLR	W3, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W3, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W3, #0
	BTSC	66, #0
	BRA	L__AC_Settings5269
	BCLR	W3, #0
	BRA	L__AC_Settings5272
L__AC_Settings5269:
	BSET	W3, #0
L__AC_Settings5272:
	BTSS	W3, #0
	GOTO	L__AC_Settings1590
;GRR3000LManagementPanel.mpas,4554 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4555 :: 		end;
	GOTO	L__AC_Settings1589
L__AC_Settings1590:
;GRR3000LManagementPanel.mpas,4557 :: 		AC_ProtectBit := not AC_ProtectBit;
	MOV	#lo_addr(_AC_ProtectBit), W1
	MOV	#lo_addr(_AC_ProtectBit), W0
	BTG	[W0], BitPos(_AC_ProtectBit+0)
;GRR3000LManagementPanel.mpas,4559 :: 		end;
L__AC_Settings1586:
;GRR3000LManagementPanel.mpas,4563 :: 		if (AC_ProtectBit = 0) then
	MOV	#lo_addr(_AC_ProtectBit), W0
	BTSC	[W0], BitPos(_AC_ProtectBit+0)
	GOTO	L__AC_Settings1594
;GRR3000LManagementPanel.mpas,4565 :: 		Glcd_Write_Text(DisableText, 84, Row5, White);
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4566 :: 		end else
	GOTO	L__AC_Settings1595
L__AC_Settings1594:
;GRR3000LManagementPanel.mpas,4568 :: 		Glcd_Write_Text(EnableText, 84, Row5, White);
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4569 :: 		end;
L__AC_Settings1595:
;GRR3000LManagementPanel.mpas,4572 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1597
;GRR3000LManagementPanel.mpas,4574 :: 		while (Ok_Button =0) do
L__AC_Settings1600:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1601
;GRR3000LManagementPanel.mpas,4576 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4577 :: 		end;
	GOTO	L__AC_Settings1600
L__AC_Settings1601:
;GRR3000LManagementPanel.mpas,4579 :: 		EEPROM_Write(EE_ACProtectEeAddr, AC_ProtectBit);
	MOV	#lo_addr(_AC_ProtectBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_AC_ProtectBit+0)
	INC	W12
	MOV	#61556, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4580 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__AC_Settings1605:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__AC_Settings1605
;GRR3000LManagementPanel.mpas,4582 :: 		Chng[4] := 0;
	MOV	#lo_addr(_Chng+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4583 :: 		if (AC_ProtectBit = 0) then
	MOV	#lo_addr(_AC_ProtectBit), W0
	BTSC	[W0], BitPos(_AC_ProtectBit+0)
	GOTO	L__AC_Settings1610
;GRR3000LManagementPanel.mpas,4585 :: 		Glcd_Write_Text(DisableText, 84, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4586 :: 		end else
	GOTO	L__AC_Settings1611
L__AC_Settings1610:
;GRR3000LManagementPanel.mpas,4588 :: 		Glcd_Write_Text(EnableText, 84, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4589 :: 		end;
L__AC_Settings1611:
;GRR3000LManagementPanel.mpas,4591 :: 		end;
L__AC_Settings1597:
;GRR3000LManagementPanel.mpas,4593 :: 		end; // chng[4] while end
	GOTO	L__AC_Settings1581
L__AC_Settings1582:
;GRR3000LManagementPanel.mpas,4595 :: 		end;
L__AC_Settings1573:
;GRR3000LManagementPanel.mpas,4597 :: 		end;
	GOTO	L__AC_Settings1415
L__AC_Settings1571:
;GRR3000LManagementPanel.mpas,4668 :: 		5: begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__AC_Settings5273
	GOTO	L__AC_Settings1614
L__AC_Settings5273:
;GRR3000LManagementPanel.mpas,4670 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1616
;GRR3000LManagementPanel.mpas,4672 :: 		while (Ok_Button =0) do
L__AC_Settings1619:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__AC_Settings1620
;GRR3000LManagementPanel.mpas,4674 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4675 :: 		end;
	GOTO	L__AC_Settings1619
L__AC_Settings1620:
;GRR3000LManagementPanel.mpas,4676 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4678 :: 		end;
L__AC_Settings1616:
;GRR3000LManagementPanel.mpas,4682 :: 		end;
	GOTO	L__AC_Settings1415
L__AC_Settings1614:
L__AC_Settings1415:
;GRR3000LManagementPanel.mpas,4686 :: 		end; // MenuExit while
	GOTO	L__AC_Settings1411
L__AC_Settings1412:
;GRR3000LManagementPanel.mpas,4688 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,4689 :: 		MenuSayacValue := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4691 :: 		end;
L_end_AC_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _AC_Settings

_Leakage_Settings:

;GRR3000LManagementPanel.mpas,4694 :: 		begin
;GRR3000LManagementPanel.mpas,4695 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,4696 :: 		MenuExit         := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4697 :: 		MenuSayacValue   := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4698 :: 		Chng[3]          := 2;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4706 :: 		Glcd_Write_Text(Title_LeakMenu,     0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_LeakMenu), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4707 :: 		Glcd_Write_Text(SubTitle_Pleak,     6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Pleak), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4708 :: 		Glcd_Write_Text(SubTitle_Nleak,     6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Nleak), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4709 :: 		Glcd_Write_Text(SubTitle_Back,      6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4712 :: 		Leakage_Pos_Set         := EEPROM_Read(EE_LeakagePosEeAddr);
	MOV	#61518, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Leakage_Pos_Set), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4713 :: 		Leakage_Neg_Set         := EEPROM_Read(EE_LeakageNegEeAddr);
	MOV	#61520, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Leakage_Neg_Set), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4715 :: 		if (Leakage_Pos_Set <1) then
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Settings5275
	GOTO	L__Leakage_Settings1625
L__Leakage_Settings5275:
;GRR3000LManagementPanel.mpas,4717 :: 		Glcd_Write_Text(DisableText, 84, Row2, black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4718 :: 		end else
	GOTO	L__Leakage_Settings1626
L__Leakage_Settings1625:
;GRR3000LManagementPanel.mpas,4719 :: 		if (Leakage_Pos_Set >0) then
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GT	L__Leakage_Settings5276
	GOTO	L__Leakage_Settings1628
L__Leakage_Settings5276:
;GRR3000LManagementPanel.mpas,4721 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1631
;GRR3000LManagementPanel.mpas,4723 :: 		ValueDivide(Leakage_Pos_Set, 0);
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	CLR	W11
	SE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4724 :: 		WriteText := Value_Text + 'k';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#107, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4725 :: 		Glcd_Write_Text(WriteText, 84, Row2, black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4726 :: 		end else
	GOTO	L__Leakage_Settings1632
L__Leakage_Settings1631:
;GRR3000LManagementPanel.mpas,4727 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1634
;GRR3000LManagementPanel.mpas,4729 :: 		Glcd_Write_Text(EnableText, 84, Row2, black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4730 :: 		end;
L__Leakage_Settings1634:
L__Leakage_Settings1632:
;GRR3000LManagementPanel.mpas,4731 :: 		end;
L__Leakage_Settings1628:
L__Leakage_Settings1626:
;GRR3000LManagementPanel.mpas,4733 :: 		if (Leakage_Neg_Set <1) then
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Settings5277
	GOTO	L__Leakage_Settings1637
L__Leakage_Settings5277:
;GRR3000LManagementPanel.mpas,4735 :: 		Glcd_Write_Text(DisableText, 84, Row3, black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4736 :: 		end else
	GOTO	L__Leakage_Settings1638
L__Leakage_Settings1637:
;GRR3000LManagementPanel.mpas,4737 :: 		if (Leakage_Neg_Set >0) then
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GT	L__Leakage_Settings5278
	GOTO	L__Leakage_Settings1640
L__Leakage_Settings5278:
;GRR3000LManagementPanel.mpas,4739 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1643
;GRR3000LManagementPanel.mpas,4741 :: 		ValueDivide(Leakage_Neg_Set, 0);
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	CLR	W11
	SE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4742 :: 		WriteText := Value_Text + 'k';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#107, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4743 :: 		Glcd_Write_Text(WriteText, 84, Row3, black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4744 :: 		end else
	GOTO	L__Leakage_Settings1644
L__Leakage_Settings1643:
;GRR3000LManagementPanel.mpas,4745 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1646
;GRR3000LManagementPanel.mpas,4747 :: 		Glcd_Write_Text(EnableText, 84, Row3, black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4748 :: 		end;
L__Leakage_Settings1646:
L__Leakage_Settings1644:
;GRR3000LManagementPanel.mpas,4749 :: 		end;
L__Leakage_Settings1640:
L__Leakage_Settings1638:
;GRR3000LManagementPanel.mpas,4752 :: 		while (MenuExit = 0) do
L__Leakage_Settings1649:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Leakage_Settings5279
	GOTO	L__Leakage_Settings1650
L__Leakage_Settings5279:
;GRR3000LManagementPanel.mpas,4755 :: 		MenuSayac := MenuButtonRead(3, 255);  // menu için butonlarý oku 3 satýr menü var
	MOV.B	#255, W11
	MOV.B	#3, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4757 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4760 :: 		1: begin // + kaçak deðeri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Leakage_Settings5280
	GOTO	L__Leakage_Settings1656
L__Leakage_Settings5280:
;GRR3000LManagementPanel.mpas,4761 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1658
;GRR3000LManagementPanel.mpas,4763 :: 		while (Ok_Button =0) do
L__Leakage_Settings1661:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1662
;GRR3000LManagementPanel.mpas,4765 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4766 :: 		end;
	GOTO	L__Leakage_Settings1661
L__Leakage_Settings1662:
;GRR3000LManagementPanel.mpas,4768 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4770 :: 		While (Chng[1] =1) do
L__Leakage_Settings1666:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Leakage_Settings5281
	GOTO	L__Leakage_Settings1667
L__Leakage_Settings5281:
;GRR3000LManagementPanel.mpas,4773 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4775 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Leakage_Settings1671
;GRR3000LManagementPanel.mpas,4777 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4778 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4779 :: 		while (ButonStop = 0) do
L__Leakage_Settings1674:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Leakage_Settings1675
;GRR3000LManagementPanel.mpas,4781 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4782 :: 		end;
	GOTO	L__Leakage_Settings1674
L__Leakage_Settings1675:
;GRR3000LManagementPanel.mpas,4783 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1679
;GRR3000LManagementPanel.mpas,4785 :: 		Inc(Leakage_Pos_Set);
	MOV.B	#1, W1
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4786 :: 		if (Leakage_Pos_Set > 100) then // 100k ya kadar
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W1
	MOV.B	#100, W0
	CP.B	W1, W0
	BRA GT	L__Leakage_Settings5282
	GOTO	L__Leakage_Settings1682
L__Leakage_Settings5282:
;GRR3000LManagementPanel.mpas,4787 :: 		Leakage_Pos_Set := 100;
	MOV	#lo_addr(_Leakage_Pos_Set), W1
	MOV.B	#100, W0
	MOV.B	W0, [W1]
L__Leakage_Settings1682:
;GRR3000LManagementPanel.mpas,4788 :: 		end else
	GOTO	L__Leakage_Settings1680
L__Leakage_Settings1679:
;GRR3000LManagementPanel.mpas,4789 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1685
;GRR3000LManagementPanel.mpas,4791 :: 		Leakage_Pos_Set := 1; // + kaçak algýlama açýk
	MOV	#lo_addr(_Leakage_Pos_Set), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4792 :: 		end;
L__Leakage_Settings1685:
L__Leakage_Settings1680:
;GRR3000LManagementPanel.mpas,4793 :: 		end else
	GOTO	L__Leakage_Settings1672
L__Leakage_Settings1671:
;GRR3000LManagementPanel.mpas,4794 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Leakage_Settings1688
;GRR3000LManagementPanel.mpas,4796 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4797 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4798 :: 		while (ButonStop = 0) do
L__Leakage_Settings1691:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Leakage_Settings1692
;GRR3000LManagementPanel.mpas,4800 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4801 :: 		end;
	GOTO	L__Leakage_Settings1691
L__Leakage_Settings1692:
;GRR3000LManagementPanel.mpas,4802 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1696
;GRR3000LManagementPanel.mpas,4804 :: 		Dec(Leakage_Pos_Set);
	MOV.B	#1, W1
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4805 :: 		if (Leakage_Pos_Set < 1) then // 100k ya kadar
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Settings5283
	GOTO	L__Leakage_Settings1699
L__Leakage_Settings5283:
;GRR3000LManagementPanel.mpas,4806 :: 		Leakage_Pos_Set := 0;
	MOV	#lo_addr(_Leakage_Pos_Set), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Leakage_Settings1699:
;GRR3000LManagementPanel.mpas,4807 :: 		end else
	GOTO	L__Leakage_Settings1697
L__Leakage_Settings1696:
;GRR3000LManagementPanel.mpas,4808 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1702
;GRR3000LManagementPanel.mpas,4810 :: 		Leakage_Pos_Set := 0; // + kaçak algýlama kapalý
	MOV	#lo_addr(_Leakage_Pos_Set), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4811 :: 		end;
L__Leakage_Settings1702:
L__Leakage_Settings1697:
;GRR3000LManagementPanel.mpas,4812 :: 		end;
L__Leakage_Settings1688:
L__Leakage_Settings1672:
;GRR3000LManagementPanel.mpas,4814 :: 		if (Leakage_Pos_Set <1) then
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Settings5284
	GOTO	L__Leakage_Settings1705
L__Leakage_Settings5284:
;GRR3000LManagementPanel.mpas,4816 :: 		Glcd_Write_Text(DisableText, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4817 :: 		end else
	GOTO	L__Leakage_Settings1706
L__Leakage_Settings1705:
;GRR3000LManagementPanel.mpas,4818 :: 		if (Leakage_Pos_Set >0) then
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GT	L__Leakage_Settings5285
	GOTO	L__Leakage_Settings1708
L__Leakage_Settings5285:
;GRR3000LManagementPanel.mpas,4820 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1711
;GRR3000LManagementPanel.mpas,4822 :: 		ValueDivide(Leakage_Pos_Set, 0);
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	CLR	W11
	SE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4823 :: 		WriteText := Value_Text + 'k';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#107, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4824 :: 		Glcd_Write_Text(WriteText, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4825 :: 		end else
	GOTO	L__Leakage_Settings1712
L__Leakage_Settings1711:
;GRR3000LManagementPanel.mpas,4826 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1714
;GRR3000LManagementPanel.mpas,4828 :: 		Glcd_Write_Text(EnableText, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4829 :: 		end;
L__Leakage_Settings1714:
L__Leakage_Settings1712:
;GRR3000LManagementPanel.mpas,4830 :: 		end;
L__Leakage_Settings1708:
L__Leakage_Settings1706:
;GRR3000LManagementPanel.mpas,4832 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1717
;GRR3000LManagementPanel.mpas,4834 :: 		while (Ok_Button =0) do
L__Leakage_Settings1720:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1721
;GRR3000LManagementPanel.mpas,4836 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4837 :: 		end;
	GOTO	L__Leakage_Settings1720
L__Leakage_Settings1721:
;GRR3000LManagementPanel.mpas,4839 :: 		EEPROM_Write(EE_LeakagePosEeAddr, Leakage_Pos_Set);
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	SE	[W0], W12
	MOV	#61518, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4840 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Leakage_Settings1725:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Leakage_Settings1725
;GRR3000LManagementPanel.mpas,4842 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4844 :: 		if (Leakage_Pos_Set <1) then
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Settings5286
	GOTO	L__Leakage_Settings1730
L__Leakage_Settings5286:
;GRR3000LManagementPanel.mpas,4846 :: 		Glcd_Write_Text(DisableText, 84, Row2, black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4847 :: 		end else
	GOTO	L__Leakage_Settings1731
L__Leakage_Settings1730:
;GRR3000LManagementPanel.mpas,4848 :: 		if (Leakage_Pos_Set >0) then
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GT	L__Leakage_Settings5287
	GOTO	L__Leakage_Settings1733
L__Leakage_Settings5287:
;GRR3000LManagementPanel.mpas,4850 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1736
;GRR3000LManagementPanel.mpas,4852 :: 		ValueDivide(Leakage_Pos_Set, 0);
	MOV	#lo_addr(_Leakage_Pos_Set), W0
	CLR	W11
	SE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4853 :: 		WriteText := Value_Text + 'k';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#107, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4854 :: 		Glcd_Write_Text(WriteText, 84, Row2, black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4855 :: 		end else
	GOTO	L__Leakage_Settings1737
L__Leakage_Settings1736:
;GRR3000LManagementPanel.mpas,4856 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1739
;GRR3000LManagementPanel.mpas,4858 :: 		Glcd_Write_Text(EnableText, 84, Row2, black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4859 :: 		end;
L__Leakage_Settings1739:
L__Leakage_Settings1737:
;GRR3000LManagementPanel.mpas,4860 :: 		end;
L__Leakage_Settings1733:
L__Leakage_Settings1731:
;GRR3000LManagementPanel.mpas,4862 :: 		end;
L__Leakage_Settings1717:
;GRR3000LManagementPanel.mpas,4867 :: 		end; // chng[1] while end
	GOTO	L__Leakage_Settings1666
L__Leakage_Settings1667:
;GRR3000LManagementPanel.mpas,4869 :: 		end;
L__Leakage_Settings1658:
;GRR3000LManagementPanel.mpas,4870 :: 		end;
	GOTO	L__Leakage_Settings1653
L__Leakage_Settings1656:
;GRR3000LManagementPanel.mpas,4872 :: 		2: begin // - kaçak
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Leakage_Settings5288
	GOTO	L__Leakage_Settings1743
L__Leakage_Settings5288:
;GRR3000LManagementPanel.mpas,4873 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1745
;GRR3000LManagementPanel.mpas,4875 :: 		while (Ok_Button =0) do
L__Leakage_Settings1748:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1749
;GRR3000LManagementPanel.mpas,4877 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4878 :: 		end;
	GOTO	L__Leakage_Settings1748
L__Leakage_Settings1749:
;GRR3000LManagementPanel.mpas,4880 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4882 :: 		While (Chng[2] =1) do
L__Leakage_Settings1753:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Leakage_Settings5289
	GOTO	L__Leakage_Settings1754
L__Leakage_Settings5289:
;GRR3000LManagementPanel.mpas,4885 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4887 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Leakage_Settings1758
;GRR3000LManagementPanel.mpas,4889 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4890 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4891 :: 		while (ButonStop = 0) do
L__Leakage_Settings1761:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Leakage_Settings1762
;GRR3000LManagementPanel.mpas,4893 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4894 :: 		end;
	GOTO	L__Leakage_Settings1761
L__Leakage_Settings1762:
;GRR3000LManagementPanel.mpas,4895 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1766
;GRR3000LManagementPanel.mpas,4897 :: 		Inc(Leakage_Neg_Set);
	MOV.B	#1, W1
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4898 :: 		if (Leakage_Neg_Set > 100) then // 100k ya kadar
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W1
	MOV.B	#100, W0
	CP.B	W1, W0
	BRA GT	L__Leakage_Settings5290
	GOTO	L__Leakage_Settings1769
L__Leakage_Settings5290:
;GRR3000LManagementPanel.mpas,4899 :: 		Leakage_Neg_Set := 100;
	MOV	#lo_addr(_Leakage_Neg_Set), W1
	MOV.B	#100, W0
	MOV.B	W0, [W1]
L__Leakage_Settings1769:
;GRR3000LManagementPanel.mpas,4900 :: 		end else
	GOTO	L__Leakage_Settings1767
L__Leakage_Settings1766:
;GRR3000LManagementPanel.mpas,4901 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1772
;GRR3000LManagementPanel.mpas,4903 :: 		Leakage_Neg_Set := 1; // - kaçak algýlama açýk
	MOV	#lo_addr(_Leakage_Neg_Set), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4904 :: 		end;
L__Leakage_Settings1772:
L__Leakage_Settings1767:
;GRR3000LManagementPanel.mpas,4905 :: 		end else
	GOTO	L__Leakage_Settings1759
L__Leakage_Settings1758:
;GRR3000LManagementPanel.mpas,4906 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Leakage_Settings1775
;GRR3000LManagementPanel.mpas,4908 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,4909 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,4910 :: 		while (ButonStop = 0) do
L__Leakage_Settings1778:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Leakage_Settings1779
;GRR3000LManagementPanel.mpas,4912 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4913 :: 		end;
	GOTO	L__Leakage_Settings1778
L__Leakage_Settings1779:
;GRR3000LManagementPanel.mpas,4914 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1783
;GRR3000LManagementPanel.mpas,4916 :: 		Dec(Leakage_Neg_Set);
	MOV.B	#1, W1
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,4917 :: 		if (Leakage_Neg_Set < 1) then // 100k ya kadar
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Settings5291
	GOTO	L__Leakage_Settings1786
L__Leakage_Settings5291:
;GRR3000LManagementPanel.mpas,4918 :: 		Leakage_Neg_Set := 0;
	MOV	#lo_addr(_Leakage_Neg_Set), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Leakage_Settings1786:
;GRR3000LManagementPanel.mpas,4919 :: 		end else
	GOTO	L__Leakage_Settings1784
L__Leakage_Settings1783:
;GRR3000LManagementPanel.mpas,4920 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1789
;GRR3000LManagementPanel.mpas,4922 :: 		Leakage_Neg_Set := 0; // - kaçak algýlama kapalý
	MOV	#lo_addr(_Leakage_Neg_Set), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4923 :: 		end;
L__Leakage_Settings1789:
L__Leakage_Settings1784:
;GRR3000LManagementPanel.mpas,4924 :: 		end;
L__Leakage_Settings1775:
L__Leakage_Settings1759:
;GRR3000LManagementPanel.mpas,4926 :: 		if (Leakage_Neg_Set <1) then
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Settings5292
	GOTO	L__Leakage_Settings1792
L__Leakage_Settings5292:
;GRR3000LManagementPanel.mpas,4928 :: 		Glcd_Write_Text(DisableText, 84, Row3, White);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4929 :: 		end else
	GOTO	L__Leakage_Settings1793
L__Leakage_Settings1792:
;GRR3000LManagementPanel.mpas,4930 :: 		if (Leakage_Neg_Set >0) then
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GT	L__Leakage_Settings5293
	GOTO	L__Leakage_Settings1795
L__Leakage_Settings5293:
;GRR3000LManagementPanel.mpas,4932 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1798
;GRR3000LManagementPanel.mpas,4934 :: 		ValueDivide(Leakage_Neg_Set, 0);
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	CLR	W11
	SE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4935 :: 		WriteText := Value_Text + 'k';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#107, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4936 :: 		Glcd_Write_Text(WriteText, 84, Row3, White);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4937 :: 		end else
	GOTO	L__Leakage_Settings1799
L__Leakage_Settings1798:
;GRR3000LManagementPanel.mpas,4938 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1801
;GRR3000LManagementPanel.mpas,4940 :: 		Glcd_Write_Text(EnableText, 84, Row3, White);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4941 :: 		end;
L__Leakage_Settings1801:
L__Leakage_Settings1799:
;GRR3000LManagementPanel.mpas,4942 :: 		end;
L__Leakage_Settings1795:
L__Leakage_Settings1793:
;GRR3000LManagementPanel.mpas,4944 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1804
;GRR3000LManagementPanel.mpas,4946 :: 		while (Ok_Button =0) do
L__Leakage_Settings1807:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1808
;GRR3000LManagementPanel.mpas,4948 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4949 :: 		end;
	GOTO	L__Leakage_Settings1807
L__Leakage_Settings1808:
;GRR3000LManagementPanel.mpas,4951 :: 		EEPROM_Write(EE_LeakageNegEeAddr, Leakage_Neg_Set);
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	SE	[W0], W12
	MOV	#61520, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,4952 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Leakage_Settings1812:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Leakage_Settings1812
;GRR3000LManagementPanel.mpas,4954 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4956 :: 		if (Leakage_Neg_Set <1) then
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Leakage_Settings5294
	GOTO	L__Leakage_Settings1817
L__Leakage_Settings5294:
;GRR3000LManagementPanel.mpas,4958 :: 		Glcd_Write_Text(DisableText, 84, Row3, black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4959 :: 		end else
	GOTO	L__Leakage_Settings1818
L__Leakage_Settings1817:
;GRR3000LManagementPanel.mpas,4960 :: 		if (Leakage_Neg_Set >0) then
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA GT	L__Leakage_Settings5295
	GOTO	L__Leakage_Settings1820
L__Leakage_Settings5295:
;GRR3000LManagementPanel.mpas,4962 :: 		if (KacakSensor =0) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSC	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1823
;GRR3000LManagementPanel.mpas,4964 :: 		ValueDivide(Leakage_Neg_Set, 0);
	MOV	#lo_addr(_Leakage_Neg_Set), W0
	CLR	W11
	SE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,4965 :: 		WriteText := Value_Text + 'k';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#107, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,4966 :: 		Glcd_Write_Text(WriteText, 84, Row3, black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4967 :: 		end else
	GOTO	L__Leakage_Settings1824
L__Leakage_Settings1823:
;GRR3000LManagementPanel.mpas,4968 :: 		if (KacakSensor =1) then
	MOV	#lo_addr(_KacakSensor), W0
	BTSS	[W0], BitPos(_KacakSensor+0)
	GOTO	L__Leakage_Settings1826
;GRR3000LManagementPanel.mpas,4970 :: 		Glcd_Write_Text(EnableText, 84, Row3, black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,4971 :: 		end;
L__Leakage_Settings1826:
L__Leakage_Settings1824:
;GRR3000LManagementPanel.mpas,4972 :: 		end;
L__Leakage_Settings1820:
L__Leakage_Settings1818:
;GRR3000LManagementPanel.mpas,4974 :: 		end;
L__Leakage_Settings1804:
;GRR3000LManagementPanel.mpas,4979 :: 		end; // chng[2] while end
	GOTO	L__Leakage_Settings1753
L__Leakage_Settings1754:
;GRR3000LManagementPanel.mpas,4981 :: 		end;
L__Leakage_Settings1745:
;GRR3000LManagementPanel.mpas,4982 :: 		end;
	GOTO	L__Leakage_Settings1653
L__Leakage_Settings1743:
;GRR3000LManagementPanel.mpas,4983 :: 		3: begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Leakage_Settings5296
	GOTO	L__Leakage_Settings1830
L__Leakage_Settings5296:
;GRR3000LManagementPanel.mpas,4985 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1832
;GRR3000LManagementPanel.mpas,4987 :: 		while (Ok_Button =0) do
L__Leakage_Settings1835:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Leakage_Settings1836
;GRR3000LManagementPanel.mpas,4989 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,4990 :: 		end;
	GOTO	L__Leakage_Settings1835
L__Leakage_Settings1836:
;GRR3000LManagementPanel.mpas,4991 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,4993 :: 		end;
L__Leakage_Settings1832:
;GRR3000LManagementPanel.mpas,4997 :: 		end;
	GOTO	L__Leakage_Settings1653
L__Leakage_Settings1830:
L__Leakage_Settings1653:
;GRR3000LManagementPanel.mpas,5005 :: 		end;
	GOTO	L__Leakage_Settings1649
L__Leakage_Settings1650:
;GRR3000LManagementPanel.mpas,5007 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,5008 :: 		MenuSayacValue := 10;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5010 :: 		end;
L_end_Leakage_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Leakage_Settings

_Clock_Settings:
	LNK	#24

;GRR3000LManagementPanel.mpas,5018 :: 		begin
;GRR3000LManagementPanel.mpas,5019 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,5020 :: 		MenuExit        := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5021 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5022 :: 		Chng[6]         := 2;
	MOV	#lo_addr(_Chng+5), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5025 :: 		HourText        := '  ';
	ADD	W14, #0, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,5026 :: 		MinText         := '  ';
	ADD	W14, #3, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,5027 :: 		DayText         := '  ';
	ADD	W14, #6, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,5028 :: 		MonthText       := '  ';
	ADD	W14, #9, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,5029 :: 		YearText        := '    ';
	ADD	W14, #12, W1
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
;GRR3000LManagementPanel.mpas,5030 :: 		SaveBit         := 0; // menüden çýkarken sürekli saati ayarlama deðiþiklik yapýlmýþsa ayarla
	ADD	W14, #20, W0
	BCLR	[W0], #0
;GRR3000LManagementPanel.mpas,5037 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,5039 :: 		Glcd_Write_Text(Title_ClockMenu,     0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_ClockMenu), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5040 :: 		Glcd_Write_Text(SubTitle_Back,       6, Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5041 :: 		Glcd_Write_Char(':', 63, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#63, W11
	MOV.B	#58, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5042 :: 		Glcd_Write_Char('.', 48, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#48, W11
	MOV.B	#46, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5043 :: 		Glcd_Write_Char('.', 66, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#66, W11
	MOV.B	#46, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5049 :: 		Read_Time(@hours, @minutes, @seconds, @day, @week, @month, @year);
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
;GRR3000LManagementPanel.mpas,5051 :: 		Seconds  :=  Bcd2Dec16(seconds);
	MOV	#lo_addr(_Seconds), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Seconds), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5052 :: 		minutes  :=  Bcd2Dec16(minutes);
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Minutes), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5053 :: 		hours    :=  Bcd2Dec16(hours);
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Hours), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5054 :: 		week     :=  Bcd2Dec16(Week);
	MOV	#lo_addr(_Week), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Week), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5055 :: 		day      :=  Bcd2Dec16(Day);
	MOV	#lo_addr(_Day), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Day), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5056 :: 		month    :=  Bcd2Dec16(Month);
	MOV	#lo_addr(_Month), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	#lo_addr(_Month), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5057 :: 		year     :=  Bcd2Dec16(Year);
	MOV	#lo_addr(_Year), W0
	SE	[W0], W10
	CALL	_Bcd2Dec16
	MOV	W0, [W14+22]
	MOV	#lo_addr(_Year), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5067 :: 		HourText[1]  := (Hours div 10)+48;
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #0, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5068 :: 		HourText[2]  := (hours mod 10)+48;
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #1, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5070 :: 		MinText[1]  := (Minutes div 10)+48;
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #3, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5071 :: 		MinText[2]  := (Minutes mod 10)+48;
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #4, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5074 :: 		DayText[1]   := (day div 10)+48;
	MOV	#lo_addr(_Day), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #6, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5075 :: 		DayText[2]   := (day mod 10)+48;
	MOV	#lo_addr(_Day), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #7, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5077 :: 		MonthText[1]   := (Month div 10)+48;
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #9, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5078 :: 		MonthText[2]   := (Month mod 10)+48;
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #10, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5080 :: 		YearText[1]   := '2';
	MOV.B	#50, W0
	MOV.B	W0, [W14+12]
;GRR3000LManagementPanel.mpas,5081 :: 		YearText[2]   := '0';
	MOV.B	#48, W0
	MOV.B	W0, [W14+13]
;GRR3000LManagementPanel.mpas,5082 :: 		YearText[3]   := (Year div 10)+48;
	MOV	[W14+22], W0
	SE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #14, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5083 :: 		YearText[4]   := (Year mod 10)+48;
	MOV	[W14+22], W0
	SE	W0, W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #15, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5085 :: 		Glcd_Write_Text(HourText,51,row4,Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#51, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5086 :: 		Glcd_Write_Text(MinText,69,row4,Black);
	ADD	W14, #3, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#69, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5088 :: 		Glcd_Write_Text(DayText,36,row6,Black);
	ADD	W14, #6, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5089 :: 		Glcd_Write_Text(MonthText,54,row6,Black);
	ADD	W14, #9, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#54, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5090 :: 		Glcd_Write_Text(YearText,72,row6,Black);
	ADD	W14, #12, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#72, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5094 :: 		While (MenuExit =0) do
L__Clock_Settings1841:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Clock_Settings5298
	GOTO	L__Clock_Settings1842
L__Clock_Settings5298:
;GRR3000LManagementPanel.mpas,5098 :: 		MenuSayac := MenuButtonRead(6, 0);  // menu için butonlarý oku 6 satýr menü var
	CLR	W11
	MOV.B	#6, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5099 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5102 :: 		1: begin  // saat ayarý
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Clock_Settings5299
	GOTO	L__Clock_Settings1848
L__Clock_Settings5299:
;GRR3000LManagementPanel.mpas,5110 :: 		Glcd_Write_Char('*', 54, Row5, Black); // saat
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#42, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5111 :: 		Glcd_Write_Char(' ', 72, Row5, Black); // dakika
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#72, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5112 :: 		Glcd_Write_Text(' ', 0,  row8, Black);
	ADD	W14, #17, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #17, W0
	MOV.B	#1, W13
	MOV.B	#7, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5114 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1850
;GRR3000LManagementPanel.mpas,5116 :: 		while (Ok_Button =0) do
L__Clock_Settings1853:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1854
;GRR3000LManagementPanel.mpas,5118 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5119 :: 		end;
	GOTO	L__Clock_Settings1853
L__Clock_Settings1854:
;GRR3000LManagementPanel.mpas,5121 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5123 :: 		While (Chng[1] =1) do
L__Clock_Settings1858:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Clock_Settings5300
	GOTO	L__Clock_Settings1859
L__Clock_Settings5300:
;GRR3000LManagementPanel.mpas,5126 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5128 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Clock_Settings1863
;GRR3000LManagementPanel.mpas,5130 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5131 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5132 :: 		while (ButonStop = 0) do
L__Clock_Settings1866:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings1867
;GRR3000LManagementPanel.mpas,5134 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5135 :: 		end;
	GOTO	L__Clock_Settings1866
L__Clock_Settings1867:
;GRR3000LManagementPanel.mpas,5136 :: 		Inc(Hours);
	MOV.B	#1, W1
	MOV	#lo_addr(_Hours), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5137 :: 		if (Hours > 23) then
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W0], W0
	CP.B	W0, #23
	BRA GT	L__Clock_Settings5301
	GOTO	L__Clock_Settings1871
L__Clock_Settings5301:
;GRR3000LManagementPanel.mpas,5138 :: 		Hours := 0;
	MOV	#lo_addr(_Hours), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Clock_Settings1871:
;GRR3000LManagementPanel.mpas,5139 :: 		end else
	GOTO	L__Clock_Settings1864
L__Clock_Settings1863:
;GRR3000LManagementPanel.mpas,5140 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Clock_Settings1874
;GRR3000LManagementPanel.mpas,5142 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5143 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5144 :: 		while (ButonStop = 0) do
L__Clock_Settings1877:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings1878
;GRR3000LManagementPanel.mpas,5146 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5147 :: 		end;
	GOTO	L__Clock_Settings1877
L__Clock_Settings1878:
;GRR3000LManagementPanel.mpas,5148 :: 		Dec(Hours);
	MOV.B	#1, W1
	MOV	#lo_addr(_Hours), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5149 :: 		if (Hours < 0) then
	MOV	#lo_addr(_Hours), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__Clock_Settings5302
	GOTO	L__Clock_Settings1882
L__Clock_Settings5302:
;GRR3000LManagementPanel.mpas,5150 :: 		Hours := 23;
	MOV	#lo_addr(_Hours), W1
	MOV.B	#23, W0
	MOV.B	W0, [W1]
L__Clock_Settings1882:
;GRR3000LManagementPanel.mpas,5151 :: 		end;
L__Clock_Settings1874:
L__Clock_Settings1864:
;GRR3000LManagementPanel.mpas,5153 :: 		HourText[1]  := (Hours div 10)+48;
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #0, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5154 :: 		HourText[2]  := (Hours mod 10)+48;
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #1, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5155 :: 		Glcd_Write_Text(HourText,51,row4,White);
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#51, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5157 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1885
;GRR3000LManagementPanel.mpas,5159 :: 		while (Ok_Button =0) do
L__Clock_Settings1888:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1889
;GRR3000LManagementPanel.mpas,5161 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5162 :: 		end;
	GOTO	L__Clock_Settings1888
L__Clock_Settings1889:
;GRR3000LManagementPanel.mpas,5164 :: 		Glcd_Write_Text(HourText,51,row4,Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#51, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5166 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5167 :: 		SaveBit := 1;
	ADD	W14, #20, W0
	BSET	[W0], #0
;GRR3000LManagementPanel.mpas,5169 :: 		end;
L__Clock_Settings1885:
;GRR3000LManagementPanel.mpas,5174 :: 		end; // chng[1] while end
	GOTO	L__Clock_Settings1858
L__Clock_Settings1859:
;GRR3000LManagementPanel.mpas,5176 :: 		end;
L__Clock_Settings1850:
;GRR3000LManagementPanel.mpas,5178 :: 		end;
	GOTO	L__Clock_Settings1845
L__Clock_Settings1848:
;GRR3000LManagementPanel.mpas,5180 :: 		2: begin  // dakika ayarý
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Clock_Settings5303
	GOTO	L__Clock_Settings1894
L__Clock_Settings5303:
;GRR3000LManagementPanel.mpas,5187 :: 		Glcd_Write_Char(' ', 54, Row5, Black); // saat (*) yukarý ok anlamýna gelir
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5188 :: 		Glcd_Write_Char('*', 72, Row5, Black); // dakika
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#72, W11
	MOV.B	#42, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5189 :: 		Glcd_Write_Char(' ', 39, Row7, Black); // gün
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#39, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5192 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1896
;GRR3000LManagementPanel.mpas,5194 :: 		while (Ok_Button =0) do
L__Clock_Settings1899:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1900
;GRR3000LManagementPanel.mpas,5196 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5197 :: 		end;
	GOTO	L__Clock_Settings1899
L__Clock_Settings1900:
;GRR3000LManagementPanel.mpas,5199 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5202 :: 		While (Chng[2] =1) do
L__Clock_Settings1904:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Clock_Settings5304
	GOTO	L__Clock_Settings1905
L__Clock_Settings5304:
;GRR3000LManagementPanel.mpas,5205 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5207 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Clock_Settings1909
;GRR3000LManagementPanel.mpas,5209 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5210 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5211 :: 		while (ButonStop = 0) do
L__Clock_Settings1912:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings1913
;GRR3000LManagementPanel.mpas,5213 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5214 :: 		end;
	GOTO	L__Clock_Settings1912
L__Clock_Settings1913:
;GRR3000LManagementPanel.mpas,5215 :: 		Inc(Minutes);
	MOV.B	#1, W1
	MOV	#lo_addr(_Minutes), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5216 :: 		if (Minutes > 59) then
	MOV	#lo_addr(_Minutes), W0
	MOV.B	[W0], W1
	MOV.B	#59, W0
	CP.B	W1, W0
	BRA GT	L__Clock_Settings5305
	GOTO	L__Clock_Settings1917
L__Clock_Settings5305:
;GRR3000LManagementPanel.mpas,5217 :: 		Minutes := 0;
	MOV	#lo_addr(_Minutes), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Clock_Settings1917:
;GRR3000LManagementPanel.mpas,5218 :: 		end else
	GOTO	L__Clock_Settings1910
L__Clock_Settings1909:
;GRR3000LManagementPanel.mpas,5219 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Clock_Settings1920
;GRR3000LManagementPanel.mpas,5221 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5222 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5223 :: 		while (ButonStop = 0) do
L__Clock_Settings1923:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings1924
;GRR3000LManagementPanel.mpas,5225 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5226 :: 		end;
	GOTO	L__Clock_Settings1923
L__Clock_Settings1924:
;GRR3000LManagementPanel.mpas,5227 :: 		Dec(Minutes);
	MOV.B	#1, W1
	MOV	#lo_addr(_Minutes), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5228 :: 		if (Minutes < 0) then
	MOV	#lo_addr(_Minutes), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__Clock_Settings5306
	GOTO	L__Clock_Settings1928
L__Clock_Settings5306:
;GRR3000LManagementPanel.mpas,5229 :: 		Minutes := 59;
	MOV	#lo_addr(_Minutes), W1
	MOV.B	#59, W0
	MOV.B	W0, [W1]
L__Clock_Settings1928:
;GRR3000LManagementPanel.mpas,5230 :: 		end;
L__Clock_Settings1920:
L__Clock_Settings1910:
;GRR3000LManagementPanel.mpas,5232 :: 		MinText[1]  := (Minutes div 10)+48;
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #3, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5233 :: 		MinText[2]  := (Minutes mod 10)+48;
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #4, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5234 :: 		Glcd_Write_Text(MinText,69,row4,White);
	ADD	W14, #3, W0
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#69, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5236 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1931
;GRR3000LManagementPanel.mpas,5238 :: 		while (Ok_Button =0) do
L__Clock_Settings1934:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1935
;GRR3000LManagementPanel.mpas,5240 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5241 :: 		end;
	GOTO	L__Clock_Settings1934
L__Clock_Settings1935:
;GRR3000LManagementPanel.mpas,5244 :: 		Glcd_Write_Text(minText,69,row4,Black);
	ADD	W14, #3, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#69, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5246 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5247 :: 		SaveBit := 1;
	ADD	W14, #20, W0
	BSET	[W0], #0
;GRR3000LManagementPanel.mpas,5250 :: 		end;
L__Clock_Settings1931:
;GRR3000LManagementPanel.mpas,5255 :: 		end; // chng[2] while end
	GOTO	L__Clock_Settings1904
L__Clock_Settings1905:
;GRR3000LManagementPanel.mpas,5257 :: 		end;
L__Clock_Settings1896:
;GRR3000LManagementPanel.mpas,5259 :: 		end;
	GOTO	L__Clock_Settings1845
L__Clock_Settings1894:
;GRR3000LManagementPanel.mpas,5261 :: 		3: begin  // gün ayarý
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Clock_Settings5307
	GOTO	L__Clock_Settings1940
L__Clock_Settings5307:
;GRR3000LManagementPanel.mpas,5267 :: 		Glcd_Write_Char(' ', 72, Row5, Black); // dakika
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#72, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5268 :: 		Glcd_Write_Char('*', 39, Row7, Black); // gün
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#39, W11
	MOV.B	#42, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5269 :: 		Glcd_Write_Char(' ', 57, Row7, Black); // ay
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#57, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5273 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1942
;GRR3000LManagementPanel.mpas,5275 :: 		while (Ok_Button =0) do
L__Clock_Settings1945:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings1946
;GRR3000LManagementPanel.mpas,5277 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5278 :: 		end;
	GOTO	L__Clock_Settings1945
L__Clock_Settings1946:
;GRR3000LManagementPanel.mpas,5280 :: 		Chng[3] := 1;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5283 :: 		While (Chng[3] =1) do
L__Clock_Settings1950:
	MOV	#lo_addr(_Chng+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Clock_Settings5308
	GOTO	L__Clock_Settings1951
L__Clock_Settings5308:
;GRR3000LManagementPanel.mpas,5286 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5288 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Clock_Settings1955
;GRR3000LManagementPanel.mpas,5290 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5291 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5292 :: 		while (ButonStop = 0) do
L__Clock_Settings1958:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings1959
;GRR3000LManagementPanel.mpas,5294 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5295 :: 		end;
	GOTO	L__Clock_Settings1958
L__Clock_Settings1959:
;GRR3000LManagementPanel.mpas,5296 :: 		Inc(day);
	MOV.B	#1, W1
	MOV	#lo_addr(_Day), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5297 :: 		if ((Month = 4)or(Month = 6)or(Month= 9)or(Month = 11)) then
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	CLR	W1
	BRA NZ	L__Clock_Settings5309
	COM	W1
L__Clock_Settings5309:
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	CLR	W0
	BRA NZ	L__Clock_Settings5310
	COM	W0
L__Clock_Settings5310:
	IOR	W1, W0, W1
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	CLR	W0
	BRA NZ	L__Clock_Settings5311
	COM	W0
L__Clock_Settings5311:
	IOR	W1, W0, W1
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #11
	CLR	W0
	BRA NZ	L__Clock_Settings5312
	COM	W0
L__Clock_Settings5312:
	IOR	W1, W0, W0
	BRA NZ	L__Clock_Settings5313
	GOTO	L__Clock_Settings1963
L__Clock_Settings5313:
;GRR3000LManagementPanel.mpas,5299 :: 		if (Day > 30) then Day := 1;
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #30
	BRA GT	L__Clock_Settings5314
	GOTO	L__Clock_Settings1966
L__Clock_Settings5314:
	MOV	#lo_addr(_Day), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Clock_Settings1966:
;GRR3000LManagementPanel.mpas,5300 :: 		end else
	GOTO	L__Clock_Settings1964
L__Clock_Settings1963:
;GRR3000LManagementPanel.mpas,5301 :: 		if (((Year mod 4) = 0)and(Month = 2)) then // 4 yýlda bir þubat ise 29' a kadar ayarlat
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	MOV	#4, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP	W0, #0
	CLR	W1
	BRA NZ	L__Clock_Settings5315
	COM	W1
L__Clock_Settings5315:
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR	W0
	BRA NZ	L__Clock_Settings5316
	COM	W0
L__Clock_Settings5316:
	AND	W1, W0, W0
	BRA NZ	L__Clock_Settings5317
	GOTO	L__Clock_Settings1969
L__Clock_Settings5317:
;GRR3000LManagementPanel.mpas,5303 :: 		if (Day > 29) then Day := 1;
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #29
	BRA GT	L__Clock_Settings5318
	GOTO	L__Clock_Settings1972
L__Clock_Settings5318:
	MOV	#lo_addr(_Day), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Clock_Settings1972:
;GRR3000LManagementPanel.mpas,5304 :: 		end else
	GOTO	L__Clock_Settings1970
L__Clock_Settings1969:
;GRR3000LManagementPanel.mpas,5305 :: 		if (((Year mod 4) <> 0)and(Month = 2)) then // þubat ise 28' a kadar ayarlat
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	MOV	#4, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP	W0, #0
	CLR	W1
	BRA Z	L__Clock_Settings5319
	COM	W1
L__Clock_Settings5319:
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR	W0
	BRA NZ	L__Clock_Settings5320
	COM	W0
L__Clock_Settings5320:
	AND	W1, W0, W0
	BRA NZ	L__Clock_Settings5321
	GOTO	L__Clock_Settings1975
L__Clock_Settings5321:
;GRR3000LManagementPanel.mpas,5307 :: 		if (Day > 28) then Day := 1;
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #28
	BRA GT	L__Clock_Settings5322
	GOTO	L__Clock_Settings1978
L__Clock_Settings5322:
	MOV	#lo_addr(_Day), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Clock_Settings1978:
;GRR3000LManagementPanel.mpas,5308 :: 		end else
	GOTO	L__Clock_Settings1976
L__Clock_Settings1975:
;GRR3000LManagementPanel.mpas,5309 :: 		if ((Month <> 4)or(Month <> 6)or(Month<> 9)or(Month <> 11)) then
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	CLR	W1
	BRA Z	L__Clock_Settings5323
	COM	W1
L__Clock_Settings5323:
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	CLR	W0
	BRA Z	L__Clock_Settings5324
	COM	W0
L__Clock_Settings5324:
	IOR	W1, W0, W1
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	CLR	W0
	BRA Z	L__Clock_Settings5325
	COM	W0
L__Clock_Settings5325:
	IOR	W1, W0, W1
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #11
	CLR	W0
	BRA Z	L__Clock_Settings5326
	COM	W0
L__Clock_Settings5326:
	IOR	W1, W0, W0
	BRA NZ	L__Clock_Settings5327
	GOTO	L__Clock_Settings1981
L__Clock_Settings5327:
;GRR3000LManagementPanel.mpas,5311 :: 		if (day > 31) then
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #31
	BRA GT	L__Clock_Settings5328
	GOTO	L__Clock_Settings1984
L__Clock_Settings5328:
;GRR3000LManagementPanel.mpas,5312 :: 		day := 1;
	MOV	#lo_addr(_Day), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Clock_Settings1984:
;GRR3000LManagementPanel.mpas,5313 :: 		end;
L__Clock_Settings1981:
L__Clock_Settings1976:
L__Clock_Settings1970:
L__Clock_Settings1964:
;GRR3000LManagementPanel.mpas,5315 :: 		end else
	GOTO	L__Clock_Settings1956
L__Clock_Settings1955:
;GRR3000LManagementPanel.mpas,5316 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Clock_Settings1987
;GRR3000LManagementPanel.mpas,5318 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5319 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5320 :: 		while (ButonStop = 0) do
L__Clock_Settings1990:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings1991
;GRR3000LManagementPanel.mpas,5322 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5323 :: 		end;
	GOTO	L__Clock_Settings1990
L__Clock_Settings1991:
;GRR3000LManagementPanel.mpas,5324 :: 		Dec(day);
	MOV.B	#1, W1
	MOV	#lo_addr(_Day), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5325 :: 		if ((Month = 4)or(Month = 6)or(Month= 9)or(Month = 11)) then
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	CLR	W1
	BRA NZ	L__Clock_Settings5329
	COM	W1
L__Clock_Settings5329:
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	CLR	W0
	BRA NZ	L__Clock_Settings5330
	COM	W0
L__Clock_Settings5330:
	IOR	W1, W0, W1
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	CLR	W0
	BRA NZ	L__Clock_Settings5331
	COM	W0
L__Clock_Settings5331:
	IOR	W1, W0, W1
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #11
	CLR	W0
	BRA NZ	L__Clock_Settings5332
	COM	W0
L__Clock_Settings5332:
	IOR	W1, W0, W0
	BRA NZ	L__Clock_Settings5333
	GOTO	L__Clock_Settings1995
L__Clock_Settings5333:
;GRR3000LManagementPanel.mpas,5327 :: 		if (day < 1) then day := 30;
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Clock_Settings5334
	GOTO	L__Clock_Settings1998
L__Clock_Settings5334:
	MOV	#lo_addr(_Day), W1
	MOV.B	#30, W0
	MOV.B	W0, [W1]
L__Clock_Settings1998:
;GRR3000LManagementPanel.mpas,5328 :: 		end else
	GOTO	L__Clock_Settings1996
L__Clock_Settings1995:
;GRR3000LManagementPanel.mpas,5329 :: 		if (((Year mod 4) = 0)and(Month = 2)) then // 4 yýlda bir þubat ise 29' a kadar ayarlat
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	MOV	#4, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP	W0, #0
	CLR	W1
	BRA NZ	L__Clock_Settings5335
	COM	W1
L__Clock_Settings5335:
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR	W0
	BRA NZ	L__Clock_Settings5336
	COM	W0
L__Clock_Settings5336:
	AND	W1, W0, W0
	BRA NZ	L__Clock_Settings5337
	GOTO	L__Clock_Settings2001
L__Clock_Settings5337:
;GRR3000LManagementPanel.mpas,5331 :: 		if (day < 1) then day := 29;
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Clock_Settings5338
	GOTO	L__Clock_Settings2004
L__Clock_Settings5338:
	MOV	#lo_addr(_Day), W1
	MOV.B	#29, W0
	MOV.B	W0, [W1]
L__Clock_Settings2004:
;GRR3000LManagementPanel.mpas,5332 :: 		end else
	GOTO	L__Clock_Settings2002
L__Clock_Settings2001:
;GRR3000LManagementPanel.mpas,5333 :: 		if (((Year mod 4) <> 0)and(Month = 2)) then // þubat ise 28' a kadar ayarlat
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	MOV	#4, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W0
	CP	W0, #0
	CLR	W1
	BRA Z	L__Clock_Settings5339
	COM	W1
L__Clock_Settings5339:
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR	W0
	BRA NZ	L__Clock_Settings5340
	COM	W0
L__Clock_Settings5340:
	AND	W1, W0, W0
	BRA NZ	L__Clock_Settings5341
	GOTO	L__Clock_Settings2007
L__Clock_Settings5341:
;GRR3000LManagementPanel.mpas,5335 :: 		if (day < 1) then day := 28;
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Clock_Settings5342
	GOTO	L__Clock_Settings2010
L__Clock_Settings5342:
	MOV	#lo_addr(_Day), W1
	MOV.B	#28, W0
	MOV.B	W0, [W1]
L__Clock_Settings2010:
;GRR3000LManagementPanel.mpas,5336 :: 		end else
	GOTO	L__Clock_Settings2008
L__Clock_Settings2007:
;GRR3000LManagementPanel.mpas,5337 :: 		if ((Month <> 4)or(Month <> 6)or(Month<> 9)or(Month <> 11)) then
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	CLR	W1
	BRA Z	L__Clock_Settings5343
	COM	W1
L__Clock_Settings5343:
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	CLR	W0
	BRA Z	L__Clock_Settings5344
	COM	W0
L__Clock_Settings5344:
	IOR	W1, W0, W1
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	CLR	W0
	BRA Z	L__Clock_Settings5345
	COM	W0
L__Clock_Settings5345:
	IOR	W1, W0, W1
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #11
	CLR	W0
	BRA Z	L__Clock_Settings5346
	COM	W0
L__Clock_Settings5346:
	IOR	W1, W0, W0
	BRA NZ	L__Clock_Settings5347
	GOTO	L__Clock_Settings2013
L__Clock_Settings5347:
;GRR3000LManagementPanel.mpas,5339 :: 		if (day < 1) then
	MOV	#lo_addr(_Day), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Clock_Settings5348
	GOTO	L__Clock_Settings2016
L__Clock_Settings5348:
;GRR3000LManagementPanel.mpas,5340 :: 		day := 31;
	MOV	#lo_addr(_Day), W1
	MOV.B	#31, W0
	MOV.B	W0, [W1]
L__Clock_Settings2016:
;GRR3000LManagementPanel.mpas,5341 :: 		end;
L__Clock_Settings2013:
L__Clock_Settings2008:
L__Clock_Settings2002:
L__Clock_Settings1996:
;GRR3000LManagementPanel.mpas,5342 :: 		end;
L__Clock_Settings1987:
L__Clock_Settings1956:
;GRR3000LManagementPanel.mpas,5344 :: 		dayText[1]  := (day div 10)+48;
	MOV	#lo_addr(_Day), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #6, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5345 :: 		dayText[2]  := (day mod 10)+48;
	MOV	#lo_addr(_Day), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #7, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5346 :: 		Glcd_Write_Text(dayText,36,row6,White);
	ADD	W14, #6, W0
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5348 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2019
;GRR3000LManagementPanel.mpas,5350 :: 		while (Ok_Button =0) do
L__Clock_Settings2022:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2023
;GRR3000LManagementPanel.mpas,5352 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5353 :: 		end;
	GOTO	L__Clock_Settings2022
L__Clock_Settings2023:
;GRR3000LManagementPanel.mpas,5355 :: 		Glcd_Write_Text(dayText,36,row6,Black);
	ADD	W14, #6, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5357 :: 		Chng[3] := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5358 :: 		SaveBit := 1;
	ADD	W14, #20, W0
	BSET	[W0], #0
;GRR3000LManagementPanel.mpas,5360 :: 		end;
L__Clock_Settings2019:
;GRR3000LManagementPanel.mpas,5365 :: 		end; // chng[2] while end
	GOTO	L__Clock_Settings1950
L__Clock_Settings1951:
;GRR3000LManagementPanel.mpas,5367 :: 		end;
L__Clock_Settings1942:
;GRR3000LManagementPanel.mpas,5369 :: 		end;
	GOTO	L__Clock_Settings1845
L__Clock_Settings1940:
;GRR3000LManagementPanel.mpas,5371 :: 		4: begin  // ay ayarý
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Clock_Settings5349
	GOTO	L__Clock_Settings2028
L__Clock_Settings5349:
;GRR3000LManagementPanel.mpas,5377 :: 		Glcd_Write_Char(' ', 39, Row7, Black); // gün
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#39, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5378 :: 		Glcd_Write_Char('*', 57, Row7, Black); // ay
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#57, W11
	MOV.B	#42, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5379 :: 		Glcd_Write_Char(' ', 81, Row7, Black); // yýl
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#81, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5381 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2030
;GRR3000LManagementPanel.mpas,5383 :: 		while (Ok_Button =0) do
L__Clock_Settings2033:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2034
;GRR3000LManagementPanel.mpas,5385 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5386 :: 		end;
	GOTO	L__Clock_Settings2033
L__Clock_Settings2034:
;GRR3000LManagementPanel.mpas,5388 :: 		Chng[4] := 1;
	MOV	#lo_addr(_Chng+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5391 :: 		While (Chng[4] =1) do
L__Clock_Settings2038:
	MOV	#lo_addr(_Chng+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Clock_Settings5350
	GOTO	L__Clock_Settings2039
L__Clock_Settings5350:
;GRR3000LManagementPanel.mpas,5394 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5396 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Clock_Settings2043
;GRR3000LManagementPanel.mpas,5398 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5399 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5400 :: 		while (ButonStop = 0) do
L__Clock_Settings2046:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings2047
;GRR3000LManagementPanel.mpas,5402 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5403 :: 		end;
	GOTO	L__Clock_Settings2046
L__Clock_Settings2047:
;GRR3000LManagementPanel.mpas,5404 :: 		Inc(month);
	MOV.B	#1, W1
	MOV	#lo_addr(_Month), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5405 :: 		if (month > 12) then
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #12
	BRA GT	L__Clock_Settings5351
	GOTO	L__Clock_Settings2051
L__Clock_Settings5351:
;GRR3000LManagementPanel.mpas,5406 :: 		month := 1;
	MOV	#lo_addr(_Month), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Clock_Settings2051:
;GRR3000LManagementPanel.mpas,5407 :: 		end else
	GOTO	L__Clock_Settings2044
L__Clock_Settings2043:
;GRR3000LManagementPanel.mpas,5408 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Clock_Settings2054
;GRR3000LManagementPanel.mpas,5410 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5411 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5412 :: 		while (ButonStop = 0) do
L__Clock_Settings2057:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings2058
;GRR3000LManagementPanel.mpas,5414 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5415 :: 		end;
	GOTO	L__Clock_Settings2057
L__Clock_Settings2058:
;GRR3000LManagementPanel.mpas,5416 :: 		Dec(month);
	MOV.B	#1, W1
	MOV	#lo_addr(_Month), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5417 :: 		if (month < 1) then
	MOV	#lo_addr(_Month), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LT	L__Clock_Settings5352
	GOTO	L__Clock_Settings2062
L__Clock_Settings5352:
;GRR3000LManagementPanel.mpas,5418 :: 		month := 12;
	MOV	#lo_addr(_Month), W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
L__Clock_Settings2062:
;GRR3000LManagementPanel.mpas,5419 :: 		end;
L__Clock_Settings2054:
L__Clock_Settings2044:
;GRR3000LManagementPanel.mpas,5421 :: 		MonthText[1]  := (month div 10)+48;
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #9, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5422 :: 		MonthText[2]  := (month mod 10)+48;
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #10, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5423 :: 		Glcd_Write_Text(monthText,54,row6,White);
	ADD	W14, #9, W0
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#54, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5426 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2065
;GRR3000LManagementPanel.mpas,5428 :: 		while (Ok_Button =0) do
L__Clock_Settings2068:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2069
;GRR3000LManagementPanel.mpas,5430 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5431 :: 		end;
	GOTO	L__Clock_Settings2068
L__Clock_Settings2069:
;GRR3000LManagementPanel.mpas,5433 :: 		Glcd_Write_Text(monthText,54,row6,Black);
	ADD	W14, #9, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#54, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5435 :: 		Chng[4] := 0;
	MOV	#lo_addr(_Chng+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5436 :: 		SaveBit := 1;
	ADD	W14, #20, W0
	BSET	[W0], #0
;GRR3000LManagementPanel.mpas,5439 :: 		end;
L__Clock_Settings2065:
;GRR3000LManagementPanel.mpas,5444 :: 		end; // chng[4] while end
	GOTO	L__Clock_Settings2038
L__Clock_Settings2039:
;GRR3000LManagementPanel.mpas,5446 :: 		end;
L__Clock_Settings2030:
;GRR3000LManagementPanel.mpas,5448 :: 		end;
	GOTO	L__Clock_Settings1845
L__Clock_Settings2028:
;GRR3000LManagementPanel.mpas,5450 :: 		5: begin  // yýl ayarý
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__Clock_Settings5353
	GOTO	L__Clock_Settings2074
L__Clock_Settings5353:
;GRR3000LManagementPanel.mpas,5458 :: 		Glcd_Write_Char(' ', 57, Row7, Black); // ay
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#57, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5459 :: 		Glcd_Write_Char('*', 81, Row7, Black); // yýl
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#81, W11
	MOV.B	#42, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5460 :: 		Glcd_Write_Text(' ', 0,  row8, Black);
	ADD	W14, #17, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #17, W0
	MOV.B	#1, W13
	MOV.B	#7, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5462 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2076
;GRR3000LManagementPanel.mpas,5464 :: 		while (Ok_Button =0) do
L__Clock_Settings2079:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2080
;GRR3000LManagementPanel.mpas,5466 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5467 :: 		end;
	GOTO	L__Clock_Settings2079
L__Clock_Settings2080:
;GRR3000LManagementPanel.mpas,5469 :: 		Chng[5] := 1;
	MOV	#lo_addr(_Chng+4), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5472 :: 		While (Chng[5] =1) do
L__Clock_Settings2084:
	MOV	#lo_addr(_Chng+4), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Clock_Settings5354
	GOTO	L__Clock_Settings2085
L__Clock_Settings5354:
;GRR3000LManagementPanel.mpas,5475 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5477 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Clock_Settings2089
;GRR3000LManagementPanel.mpas,5479 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5480 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5481 :: 		while (ButonStop = 0) do
L__Clock_Settings2092:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings2093
;GRR3000LManagementPanel.mpas,5483 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5484 :: 		end;
	GOTO	L__Clock_Settings2092
L__Clock_Settings2093:
;GRR3000LManagementPanel.mpas,5485 :: 		Inc(year);
	MOV.B	#1, W1
	MOV	#lo_addr(_Year), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5486 :: 		if (year > 99) then
	MOV	#lo_addr(_Year), W0
	MOV.B	[W0], W1
	MOV.B	#99, W0
	CP.B	W1, W0
	BRA GT	L__Clock_Settings5355
	GOTO	L__Clock_Settings2097
L__Clock_Settings5355:
;GRR3000LManagementPanel.mpas,5487 :: 		year := 12;
	MOV	#lo_addr(_Year), W1
	MOV.B	#12, W0
	MOV.B	W0, [W1]
L__Clock_Settings2097:
;GRR3000LManagementPanel.mpas,5488 :: 		end else
	GOTO	L__Clock_Settings2090
L__Clock_Settings2089:
;GRR3000LManagementPanel.mpas,5489 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Clock_Settings2100
;GRR3000LManagementPanel.mpas,5491 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5492 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5493 :: 		while (ButonStop = 0) do
L__Clock_Settings2103:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Clock_Settings2104
;GRR3000LManagementPanel.mpas,5495 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5496 :: 		end;
	GOTO	L__Clock_Settings2103
L__Clock_Settings2104:
;GRR3000LManagementPanel.mpas,5497 :: 		Dec(year);
	MOV.B	#1, W1
	MOV	#lo_addr(_Year), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5498 :: 		if (year < 12) then
	MOV	#lo_addr(_Year), W0
	MOV.B	[W0], W0
	CP.B	W0, #12
	BRA LT	L__Clock_Settings5356
	GOTO	L__Clock_Settings2108
L__Clock_Settings5356:
;GRR3000LManagementPanel.mpas,5499 :: 		year := 99;
	MOV	#lo_addr(_Year), W1
	MOV.B	#99, W0
	MOV.B	W0, [W1]
L__Clock_Settings2108:
;GRR3000LManagementPanel.mpas,5500 :: 		end;
L__Clock_Settings2100:
L__Clock_Settings2090:
;GRR3000LManagementPanel.mpas,5502 :: 		YearText[1]  := '2';
	MOV.B	#50, W0
	MOV.B	W0, [W14+12]
;GRR3000LManagementPanel.mpas,5503 :: 		YearText[2]  := '0';
	MOV.B	#48, W0
	MOV.B	W0, [W14+13]
;GRR3000LManagementPanel.mpas,5504 :: 		YearText[3]  := (year div 10)+48;
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W0, W2
	MOV.B	#48, W1
	ADD	W14, #14, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5505 :: 		YearText[4]  := (year mod 10)+48;
	MOV	#lo_addr(_Year), W0
	SE	[W0], W0
	MOV	#10, W2
	REPEAT	#17
	DIV.S	W0, W2
	MOV	W1, W2
	MOV.B	#48, W1
	ADD	W14, #15, W0
	ADD.B	W2, W1, [W0]
;GRR3000LManagementPanel.mpas,5506 :: 		Glcd_Write_Text(yearText,72,row6,White);
	ADD	W14, #12, W0
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#72, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5509 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2111
;GRR3000LManagementPanel.mpas,5511 :: 		while (Ok_Button =0) do
L__Clock_Settings2114:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2115
;GRR3000LManagementPanel.mpas,5513 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5514 :: 		end;
	GOTO	L__Clock_Settings2114
L__Clock_Settings2115:
;GRR3000LManagementPanel.mpas,5516 :: 		Glcd_Write_Text(yearText,72,row6,black);
	ADD	W14, #12, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#72, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5518 :: 		Chng[5] := 0;
	MOV	#lo_addr(_Chng+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5519 :: 		SaveBit := 1;
	ADD	W14, #20, W0
	BSET	[W0], #0
;GRR3000LManagementPanel.mpas,5521 :: 		end;
L__Clock_Settings2111:
;GRR3000LManagementPanel.mpas,5526 :: 		end; // chng[5] while end
	GOTO	L__Clock_Settings2084
L__Clock_Settings2085:
;GRR3000LManagementPanel.mpas,5528 :: 		end;
L__Clock_Settings2076:
;GRR3000LManagementPanel.mpas,5530 :: 		end;
	GOTO	L__Clock_Settings1845
L__Clock_Settings2074:
;GRR3000LManagementPanel.mpas,5533 :: 		6: begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA Z	L__Clock_Settings5357
	GOTO	L__Clock_Settings2120
L__Clock_Settings5357:
;GRR3000LManagementPanel.mpas,5539 :: 		Glcd_Write_Char(' ', 54, Row5, Black); // saat
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5540 :: 		Glcd_Write_Char(' ', 81, Row7, Black); // yýl
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#81, W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,5541 :: 		Glcd_Write_Text('>', 0,  Row8, Black);
	ADD	W14, #17, W1
	MOV.B	#62, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #17, W0
	MOV.B	#1, W13
	MOV.B	#7, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5543 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2122
;GRR3000LManagementPanel.mpas,5545 :: 		while (Ok_Button =0) do
L__Clock_Settings2125:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Clock_Settings2126
;GRR3000LManagementPanel.mpas,5547 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5548 :: 		end;
	GOTO	L__Clock_Settings2125
L__Clock_Settings2126:
;GRR3000LManagementPanel.mpas,5550 :: 		if (SaveBit = 1) then // ayar yapýlmýþsa kaydet, yapýlmamýþsa kaydetme
	ADD	W14, #20, W0
	BTSS	[W0], #0
	GOTO	L__Clock_Settings2130
;GRR3000LManagementPanel.mpas,5552 :: 		Hours   := Dec2Bcd16(Hours);
	MOV	#lo_addr(_Hours), W0
	SE	[W0], W10
	CALL	_Dec2Bcd16
	MOV	#lo_addr(_Hours), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5553 :: 		Minutes := Dec2Bcd16(Minutes);
	MOV	#lo_addr(_Minutes), W0
	SE	[W0], W10
	CALL	_Dec2Bcd16
	MOV	#lo_addr(_Minutes), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5554 :: 		Day     := Dec2Bcd16(Day);
	MOV	#lo_addr(_Day), W0
	SE	[W0], W10
	CALL	_Dec2Bcd16
	MOV	#lo_addr(_Day), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5555 :: 		Month   := Dec2Bcd16(Month);
	MOV	#lo_addr(_Month), W0
	SE	[W0], W10
	CALL	_Dec2Bcd16
	MOV	#lo_addr(_Month), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5556 :: 		Year    := Dec2Bcd16(Year);
	MOV	#lo_addr(_Year), W0
	SE	[W0], W10
	CALL	_Dec2Bcd16
	MOV	#lo_addr(_Year), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5558 :: 		Write_Time(Hours,Minutes,0x00,Day,0x01,Month,Year);
	MOV	#lo_addr(_Day), W3
	MOV	#lo_addr(_Minutes), W2
	MOV	#lo_addr(_Hours), W1
	MOV.B	[W3], W13
	CLR	W12
	MOV.B	[W2], W11
	MOV.B	[W1], W10
	PUSH	W0
	MOV	#lo_addr(_Month), W0
	SE	[W0], W0
	PUSH	W0
	MOV	#1, W0
	PUSH	W0
	CALL	_Write_Time
	SUB	#6, W15
;GRR3000LManagementPanel.mpas,5559 :: 		end;
L__Clock_Settings2130:
;GRR3000LManagementPanel.mpas,5561 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5563 :: 		end;
L__Clock_Settings2122:
;GRR3000LManagementPanel.mpas,5564 :: 		end;
	GOTO	L__Clock_Settings1845
L__Clock_Settings2120:
L__Clock_Settings1845:
;GRR3000LManagementPanel.mpas,5572 :: 		end;
	GOTO	L__Clock_Settings1841
L__Clock_Settings1842:
;GRR3000LManagementPanel.mpas,5574 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,5575 :: 		MenuSayacValue := 7;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#7, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5577 :: 		end;
L_end_Clock_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Clock_Settings

_Uart_Procedures:

;GRR3000LManagementPanel.mpas,5580 :: 		begin
;GRR3000LManagementPanel.mpas,5582 :: 		asm ClrWDT; end;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLRWDT
;GRR3000LManagementPanel.mpas,5584 :: 		if (ModbusBaudRate = 1) then ModBus_Baud := 0 else
	MOV	#lo_addr(_ModbusBaudRate), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Uart_Procedures5359
	GOTO	L__Uart_Procedures2134
L__Uart_Procedures5359:
	CLR	W0
	MOV	W0, _ModBus_Baud
	GOTO	L__Uart_Procedures2135
L__Uart_Procedures2134:
;GRR3000LManagementPanel.mpas,5585 :: 		if (ModbusBaudRate = 2) then ModBus_Baud := 9600 else
	MOV	#lo_addr(_ModbusBaudRate), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Uart_Procedures5360
	GOTO	L__Uart_Procedures2137
L__Uart_Procedures5360:
	MOV	#9600, W0
	MOV	W0, _ModBus_Baud
	GOTO	L__Uart_Procedures2138
L__Uart_Procedures2137:
;GRR3000LManagementPanel.mpas,5586 :: 		if (ModbusBaudRate = 3) then ModBus_Baud := 19200 else
	MOV	#lo_addr(_ModbusBaudRate), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Uart_Procedures5361
	GOTO	L__Uart_Procedures2140
L__Uart_Procedures5361:
	MOV	#19200, W0
	MOV	W0, _ModBus_Baud
	GOTO	L__Uart_Procedures2141
L__Uart_Procedures2140:
;GRR3000LManagementPanel.mpas,5587 :: 		if (ModbusBaudRate = 4) then ModBus_Baud := 38400 else
	MOV	#lo_addr(_ModbusBaudRate), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Uart_Procedures5362
	GOTO	L__Uart_Procedures2143
L__Uart_Procedures5362:
	MOV	#38400, W0
	MOV	W0, _ModBus_Baud
	GOTO	L__Uart_Procedures2144
L__Uart_Procedures2143:
;GRR3000LManagementPanel.mpas,5588 :: 		if (ModbusBaudRate = 5) then ModBus_Baud := 57600;
	MOV	#lo_addr(_ModbusBaudRate), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__Uart_Procedures5363
	GOTO	L__Uart_Procedures2146
L__Uart_Procedures5363:
	MOV	#57600, W0
	MOV	W0, _ModBus_Baud
L__Uart_Procedures2146:
L__Uart_Procedures2144:
L__Uart_Procedures2141:
L__Uart_Procedures2138:
L__Uart_Procedures2135:
;GRR3000LManagementPanel.mpas,5592 :: 		if (ModBus_Baud = 0) then
	MOV	_ModBus_Baud, W0
	CP	W0, #0
	BRA Z	L__Uart_Procedures5364
	GOTO	L__Uart_Procedures2149
L__Uart_Procedures5364:
;GRR3000LManagementPanel.mpas,5593 :: 		ModBus_TimeOut_Timer3_PR3 := const_ModBus_TimeOut_Timer3_PR3_9600*0 else
	CLR	W0
	MOV	W0, _ModBus_TimeOut_Timer3_PR3
	GOTO	L__Uart_Procedures2150
L__Uart_Procedures2149:
;GRR3000LManagementPanel.mpas,5594 :: 		if (ModBus_Baud = 9600) then
	MOV	_ModBus_Baud, W1
	MOV	#9600, W0
	CP	W1, W0
	BRA Z	L__Uart_Procedures5365
	GOTO	L__Uart_Procedures2152
L__Uart_Procedures5365:
;GRR3000LManagementPanel.mpas,5595 :: 		ModBus_TimeOut_Timer3_PR3 := const_ModBus_TimeOut_Timer3_PR3_9600*5 else
	MOV	#15925, W0
	MOV	W0, _ModBus_TimeOut_Timer3_PR3
	GOTO	L__Uart_Procedures2153
L__Uart_Procedures2152:
;GRR3000LManagementPanel.mpas,5596 :: 		if (ModBus_Baud = 19200) then
	MOV	_ModBus_Baud, W1
	MOV	#19200, W0
	CP	W1, W0
	BRA Z	L__Uart_Procedures5366
	GOTO	L__Uart_Procedures2155
L__Uart_Procedures5366:
;GRR3000LManagementPanel.mpas,5597 :: 		ModBus_TimeOut_Timer3_PR3 := Const_ModBus_TimeOut_Timer3_PR3_19200*5 else
	MOV	#8050, W0
	MOV	W0, _ModBus_TimeOut_Timer3_PR3
	GOTO	L__Uart_Procedures2156
L__Uart_Procedures2155:
;GRR3000LManagementPanel.mpas,5598 :: 		if (ModBus_Baud = 38400) then
	MOV	_ModBus_Baud, W1
	MOV	#38400, W0
	CP	W1, W0
	BRA Z	L__Uart_Procedures5367
	GOTO	L__Uart_Procedures2158
L__Uart_Procedures5367:
;GRR3000LManagementPanel.mpas,5599 :: 		ModBus_TimeOut_Timer3_PR3 := Const_ModBus_TimeOut_Timer3_PR3_38400*5 else
	MOV	#3950, W0
	MOV	W0, _ModBus_TimeOut_Timer3_PR3
	GOTO	L__Uart_Procedures2159
L__Uart_Procedures2158:
;GRR3000LManagementPanel.mpas,5600 :: 		if (ModBus_Baud = 57600) then
	MOV	_ModBus_Baud, W1
	MOV	#57600, W0
	CP	W1, W0
	BRA Z	L__Uart_Procedures5368
	GOTO	L__Uart_Procedures2161
L__Uart_Procedures5368:
;GRR3000LManagementPanel.mpas,5601 :: 		ModBus_TimeOut_Timer3_PR3 := Const_ModBus_TimeOut_Timer3_PR3_57600*5;
	MOV	#2750, W0
	MOV	W0, _ModBus_TimeOut_Timer3_PR3
L__Uart_Procedures2161:
L__Uart_Procedures2159:
L__Uart_Procedures2156:
L__Uart_Procedures2153:
L__Uart_Procedures2150:
;GRR3000LManagementPanel.mpas,5603 :: 		ModBus_TimeOut := 0;
	MOV	#lo_addr(_ModBus_TimeOut), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5605 :: 		UART1_Init(ModBus_Baud);
	MOV	_ModBus_Baud, W10
	CLR	W11
	CALL	_UART1_Init
;GRR3000LManagementPanel.mpas,5606 :: 		Pause_ms(10);
	MOV	#10, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,5608 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5610 :: 		UART2_Init(19200); // kartlar arasý haberleþme hýzý
	MOV	#19200, W10
	MOV	#0, W11
	CALL	_UART2_Init
;GRR3000LManagementPanel.mpas,5611 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,5613 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5615 :: 		Rs485master_Init;
	CALL	_Rs485master_Init
;GRR3000LManagementPanel.mpas,5616 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,5618 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5620 :: 		U2BRG := U2BRG_Value;
	MOV	#96, W0
	MOV	WREG, U2BRG
;GRR3000LManagementPanel.mpas,5623 :: 		UART_Set_Active(@UART1_Read, @UART1_Write, @UART1_Data_Ready, @UART1_Tx_Idle);
	MOV	#lo_addr(_UART1_TX_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
;GRR3000LManagementPanel.mpas,5625 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5627 :: 		UART_Set_Active(@UART2_Read, @UART2_Write, @UART2_Data_Ready, @UART2_Tx_Idle);
	MOV	#lo_addr(_UART2_TX_Idle), W13
	MOV	#lo_addr(_UART2_Data_Ready), W12
	MOV	#lo_addr(_UART2_Write), W11
	MOV	#lo_addr(_UART2_Read), W10
	CALL	_UART_Set_Active
;GRR3000LManagementPanel.mpas,5629 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5631 :: 		Start_Modbus_Init;
	CALL	_Start_Modbus_Init
;GRR3000LManagementPanel.mpas,5633 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5635 :: 		end;
L_end_Uart_Procedures:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Uart_Procedures

_Modbus_Settings:
	LNK	#10

;GRR3000LManagementPanel.mpas,5639 :: 		begin
;GRR3000LManagementPanel.mpas,5640 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,5641 :: 		MenuExit         := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5642 :: 		MenuSayacValue   := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5643 :: 		Chng[3]          := 2;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5651 :: 		Glcd_Write_Text(Title_ModbusMenu,     0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_ModbusMenu), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5652 :: 		Glcd_Write_Text(SubTitle_Id,          6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Id), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5653 :: 		Glcd_Write_Text(SubTitle_BaudRate,    6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_BaudRate), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5654 :: 		Glcd_Write_Text(SubTitle_Back,        6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5656 :: 		ModbusID         := EEPROM_Read(EE_ModbusIDEeAddr);
	MOV	#61512, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ModbusID), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5657 :: 		BaudRateSet      := EEPROM_Read(EE_ModbusBaudRate);
	MOV	#61514, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,5659 :: 		ValueDivide(ModbusID, 0);
	MOV	#lo_addr(_ModbusID), W0
	CLR	W11
	ZE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,5660 :: 		Glcd_Write_Text(Value_Text, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5663 :: 		1: Glcd_Write_Text(DisableText,84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #1
	BRA Z	L__Modbus_Settings5370
	GOTO	L__Modbus_Settings2167
L__Modbus_Settings5370:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2164
L__Modbus_Settings2167:
;GRR3000LManagementPanel.mpas,5664 :: 		2: Glcd_Write_Text(' 9600  ',84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #2
	BRA Z	L__Modbus_Settings5371
	GOTO	L__Modbus_Settings2170
L__Modbus_Settings5371:
	ADD	W14, #1, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2164
L__Modbus_Settings2170:
;GRR3000LManagementPanel.mpas,5665 :: 		3: Glcd_Write_Text('19200  ',84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #3
	BRA Z	L__Modbus_Settings5372
	GOTO	L__Modbus_Settings2173
L__Modbus_Settings5372:
	ADD	W14, #1, W1
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2164
L__Modbus_Settings2173:
;GRR3000LManagementPanel.mpas,5666 :: 		4: Glcd_Write_Text('38400  ',84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA Z	L__Modbus_Settings5373
	GOTO	L__Modbus_Settings2176
L__Modbus_Settings5373:
	ADD	W14, #1, W1
	MOV.B	#51, W0
	MOV.B	W0, [W1++]
	MOV.B	#56, W0
	MOV.B	W0, [W1++]
	MOV.B	#52, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2164
L__Modbus_Settings2176:
;GRR3000LManagementPanel.mpas,5667 :: 		5: Glcd_Write_Text('57600  ',84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #5
	BRA Z	L__Modbus_Settings5374
	GOTO	L__Modbus_Settings2179
L__Modbus_Settings5374:
	ADD	W14, #1, W1
	MOV.B	#53, W0
	MOV.B	W0, [W1++]
	MOV.B	#55, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2164
L__Modbus_Settings2179:
L__Modbus_Settings2164:
;GRR3000LManagementPanel.mpas,5670 :: 		while (MenuExit = 0) do
L__Modbus_Settings2181:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Modbus_Settings5375
	GOTO	L__Modbus_Settings2182
L__Modbus_Settings5375:
;GRR3000LManagementPanel.mpas,5674 :: 		MenuSayac := MenuButtonRead(3, 255);  // menu için butonlarý oku 3 satýr menü var
	MOV.B	#255, W11
	MOV.B	#3, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5676 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5679 :: 		1: begin // modbus id
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Modbus_Settings5376
	GOTO	L__Modbus_Settings2188
L__Modbus_Settings5376:
;GRR3000LManagementPanel.mpas,5680 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2190
;GRR3000LManagementPanel.mpas,5682 :: 		while (Ok_Button =0) do
L__Modbus_Settings2193:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2194
;GRR3000LManagementPanel.mpas,5684 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5685 :: 		end;
	GOTO	L__Modbus_Settings2193
L__Modbus_Settings2194:
;GRR3000LManagementPanel.mpas,5687 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5689 :: 		While (Chng[1] =1) do
L__Modbus_Settings2198:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Modbus_Settings5377
	GOTO	L__Modbus_Settings2199
L__Modbus_Settings5377:
;GRR3000LManagementPanel.mpas,5692 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5694 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Modbus_Settings2203
;GRR3000LManagementPanel.mpas,5696 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5697 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5698 :: 		while (ButonStop = 0) do
L__Modbus_Settings2206:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Modbus_Settings2207
;GRR3000LManagementPanel.mpas,5700 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5701 :: 		end;
	GOTO	L__Modbus_Settings2206
L__Modbus_Settings2207:
;GRR3000LManagementPanel.mpas,5702 :: 		Inc(ModbusID);
	MOV.B	#1, W1
	MOV	#lo_addr(_ModbusID), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5703 :: 		if (ModbusID > 254) then
	MOV	#lo_addr(_ModbusID), W0
	MOV.B	[W0], W1
	MOV.B	#254, W0
	CP.B	W1, W0
	BRA GTU	L__Modbus_Settings5378
	GOTO	L__Modbus_Settings2211
L__Modbus_Settings5378:
;GRR3000LManagementPanel.mpas,5704 :: 		ModbusID := 254;
	MOV	#lo_addr(_ModbusID), W1
	MOV.B	#254, W0
	MOV.B	W0, [W1]
L__Modbus_Settings2211:
;GRR3000LManagementPanel.mpas,5705 :: 		end else
	GOTO	L__Modbus_Settings2204
L__Modbus_Settings2203:
;GRR3000LManagementPanel.mpas,5706 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Modbus_Settings2214
;GRR3000LManagementPanel.mpas,5708 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5709 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5710 :: 		while (ButonStop = 0) do
L__Modbus_Settings2217:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Modbus_Settings2218
;GRR3000LManagementPanel.mpas,5712 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5713 :: 		end;
	GOTO	L__Modbus_Settings2217
L__Modbus_Settings2218:
;GRR3000LManagementPanel.mpas,5714 :: 		Dec(ModbusID);
	MOV.B	#1, W1
	MOV	#lo_addr(_ModbusID), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5715 :: 		if (ModbusID < 1) then
	MOV	#lo_addr(_ModbusID), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LTU	L__Modbus_Settings5379
	GOTO	L__Modbus_Settings2222
L__Modbus_Settings5379:
;GRR3000LManagementPanel.mpas,5716 :: 		ModbusID := 1;
	MOV	#lo_addr(_ModbusID), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Modbus_Settings2222:
;GRR3000LManagementPanel.mpas,5717 :: 		end;
L__Modbus_Settings2214:
L__Modbus_Settings2204:
;GRR3000LManagementPanel.mpas,5719 :: 		ValueDivide(ModbusID, 0);
	MOV	#lo_addr(_ModbusID), W0
	CLR	W11
	ZE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,5720 :: 		Glcd_Write_Text(Value_Text, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5722 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2225
;GRR3000LManagementPanel.mpas,5724 :: 		while (Ok_Button =0) do
L__Modbus_Settings2228:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2229
;GRR3000LManagementPanel.mpas,5726 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5727 :: 		end;
	GOTO	L__Modbus_Settings2228
L__Modbus_Settings2229:
;GRR3000LManagementPanel.mpas,5729 :: 		EEPROM_Write(EE_ModbusIDEeAddr, ModbusID);
	MOV	#lo_addr(_ModbusID), W0
	ZE	[W0], W12
	MOV	#61512, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,5730 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Modbus_Settings2233:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Modbus_Settings2233
;GRR3000LManagementPanel.mpas,5732 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5733 :: 		Glcd_Write_Text(Value_Text, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_Value_Text), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5735 :: 		end;
L__Modbus_Settings2225:
;GRR3000LManagementPanel.mpas,5740 :: 		end; // chng[1] while end
	GOTO	L__Modbus_Settings2198
L__Modbus_Settings2199:
;GRR3000LManagementPanel.mpas,5742 :: 		end;
L__Modbus_Settings2190:
;GRR3000LManagementPanel.mpas,5743 :: 		end;
	GOTO	L__Modbus_Settings2185
L__Modbus_Settings2188:
;GRR3000LManagementPanel.mpas,5745 :: 		2: begin // modbus baud rate
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Modbus_Settings5380
	GOTO	L__Modbus_Settings2239
L__Modbus_Settings5380:
;GRR3000LManagementPanel.mpas,5746 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2241
;GRR3000LManagementPanel.mpas,5748 :: 		while (Ok_Button =0) do
L__Modbus_Settings2244:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2245
;GRR3000LManagementPanel.mpas,5750 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5751 :: 		end;
	GOTO	L__Modbus_Settings2244
L__Modbus_Settings2245:
;GRR3000LManagementPanel.mpas,5753 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5755 :: 		While (Chng[2] =1) do
L__Modbus_Settings2249:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Modbus_Settings5381
	GOTO	L__Modbus_Settings2250
L__Modbus_Settings5381:
;GRR3000LManagementPanel.mpas,5758 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5760 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Modbus_Settings2254
;GRR3000LManagementPanel.mpas,5762 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5763 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5764 :: 		while (ButonStop = 0) do
L__Modbus_Settings2257:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Modbus_Settings2258
;GRR3000LManagementPanel.mpas,5766 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5767 :: 		end;
	GOTO	L__Modbus_Settings2257
L__Modbus_Settings2258:
;GRR3000LManagementPanel.mpas,5768 :: 		Inc(BaudRateSet);
	ADD	W14, #0, W0
	ZE	[W0], W0
	INC	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,5769 :: 		if (BaudRateSet > 5) then
	CP.B	W0, #5
	BRA GTU	L__Modbus_Settings5382
	GOTO	L__Modbus_Settings2262
L__Modbus_Settings5382:
;GRR3000LManagementPanel.mpas,5770 :: 		BaudRateSet := 5;
	MOV.B	#5, W0
	MOV.B	W0, [W14+0]
L__Modbus_Settings2262:
;GRR3000LManagementPanel.mpas,5771 :: 		end else
	GOTO	L__Modbus_Settings2255
L__Modbus_Settings2254:
;GRR3000LManagementPanel.mpas,5772 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Modbus_Settings2265
;GRR3000LManagementPanel.mpas,5774 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5775 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5776 :: 		while (ButonStop = 0) do
L__Modbus_Settings2268:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Modbus_Settings2269
;GRR3000LManagementPanel.mpas,5778 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5779 :: 		end;
	GOTO	L__Modbus_Settings2268
L__Modbus_Settings2269:
;GRR3000LManagementPanel.mpas,5780 :: 		Dec(BaudRateSet);
	ADD	W14, #0, W0
	ZE	[W0], W0
	DEC	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,5781 :: 		if (BaudRateSet < 1) then
	CP.B	W0, #1
	BRA LTU	L__Modbus_Settings5383
	GOTO	L__Modbus_Settings2273
L__Modbus_Settings5383:
;GRR3000LManagementPanel.mpas,5782 :: 		BaudRateSet := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
L__Modbus_Settings2273:
;GRR3000LManagementPanel.mpas,5783 :: 		end;
L__Modbus_Settings2265:
L__Modbus_Settings2255:
;GRR3000LManagementPanel.mpas,5786 :: 		1: Glcd_Write_Text(DisableText,84,row3,White);
	MOV.B	[W14+0], W0
	CP.B	W0, #1
	BRA Z	L__Modbus_Settings5384
	GOTO	L__Modbus_Settings2278
L__Modbus_Settings5384:
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2275
L__Modbus_Settings2278:
;GRR3000LManagementPanel.mpas,5787 :: 		2: Glcd_Write_Text(' 9600  ',84,row3,White);
	MOV.B	[W14+0], W0
	CP.B	W0, #2
	BRA Z	L__Modbus_Settings5385
	GOTO	L__Modbus_Settings2281
L__Modbus_Settings5385:
	ADD	W14, #1, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2275
L__Modbus_Settings2281:
;GRR3000LManagementPanel.mpas,5788 :: 		3: Glcd_Write_Text('19200  ',84,row3,White);
	MOV.B	[W14+0], W0
	CP.B	W0, #3
	BRA Z	L__Modbus_Settings5386
	GOTO	L__Modbus_Settings2284
L__Modbus_Settings5386:
	ADD	W14, #1, W1
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2275
L__Modbus_Settings2284:
;GRR3000LManagementPanel.mpas,5789 :: 		4: Glcd_Write_Text('38400  ',84,row3,White);
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA Z	L__Modbus_Settings5387
	GOTO	L__Modbus_Settings2287
L__Modbus_Settings5387:
	ADD	W14, #1, W1
	MOV.B	#51, W0
	MOV.B	W0, [W1++]
	MOV.B	#56, W0
	MOV.B	W0, [W1++]
	MOV.B	#52, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2275
L__Modbus_Settings2287:
;GRR3000LManagementPanel.mpas,5790 :: 		5: Glcd_Write_Text('57600  ',84,row3,White);
	MOV.B	[W14+0], W0
	CP.B	W0, #5
	BRA Z	L__Modbus_Settings5388
	GOTO	L__Modbus_Settings2290
L__Modbus_Settings5388:
	ADD	W14, #1, W1
	MOV.B	#53, W0
	MOV.B	W0, [W1++]
	MOV.B	#55, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2275
L__Modbus_Settings2290:
L__Modbus_Settings2275:
;GRR3000LManagementPanel.mpas,5794 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2292
;GRR3000LManagementPanel.mpas,5796 :: 		while (Ok_Button =0) do
L__Modbus_Settings2295:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2296
;GRR3000LManagementPanel.mpas,5798 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5799 :: 		end;
	GOTO	L__Modbus_Settings2295
L__Modbus_Settings2296:
;GRR3000LManagementPanel.mpas,5801 :: 		EEPROM_Write(EE_ModbusBaudRate, BaudRateSet);
	ADD	W14, #0, W0
	ZE	[W0], W12
	MOV	#61514, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,5802 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Modbus_Settings2300:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Modbus_Settings2300
;GRR3000LManagementPanel.mpas,5804 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5807 :: 		1: Glcd_Write_Text(DisableText,84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #1
	BRA Z	L__Modbus_Settings5389
	GOTO	L__Modbus_Settings2307
L__Modbus_Settings5389:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2304
L__Modbus_Settings2307:
;GRR3000LManagementPanel.mpas,5808 :: 		2: Glcd_Write_Text(' 9600  ',84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #2
	BRA Z	L__Modbus_Settings5390
	GOTO	L__Modbus_Settings2310
L__Modbus_Settings5390:
	ADD	W14, #1, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2304
L__Modbus_Settings2310:
;GRR3000LManagementPanel.mpas,5809 :: 		3: Glcd_Write_Text('19200  ',84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #3
	BRA Z	L__Modbus_Settings5391
	GOTO	L__Modbus_Settings2313
L__Modbus_Settings5391:
	ADD	W14, #1, W1
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#57, W0
	MOV.B	W0, [W1++]
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2304
L__Modbus_Settings2313:
;GRR3000LManagementPanel.mpas,5810 :: 		4: Glcd_Write_Text('38400  ',84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA Z	L__Modbus_Settings5392
	GOTO	L__Modbus_Settings2316
L__Modbus_Settings5392:
	ADD	W14, #1, W1
	MOV.B	#51, W0
	MOV.B	W0, [W1++]
	MOV.B	#56, W0
	MOV.B	W0, [W1++]
	MOV.B	#52, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2304
L__Modbus_Settings2316:
;GRR3000LManagementPanel.mpas,5811 :: 		5: Glcd_Write_Text('57600  ',84,row3,Black);
	MOV.B	[W14+0], W0
	CP.B	W0, #5
	BRA Z	L__Modbus_Settings5393
	GOTO	L__Modbus_Settings2319
L__Modbus_Settings5393:
	ADD	W14, #1, W1
	MOV.B	#53, W0
	MOV.B	W0, [W1++]
	MOV.B	#55, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #1, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	GOTO	L__Modbus_Settings2304
L__Modbus_Settings2319:
L__Modbus_Settings2304:
;GRR3000LManagementPanel.mpas,5817 :: 		end;
L__Modbus_Settings2292:
;GRR3000LManagementPanel.mpas,5822 :: 		end; // chng[2] while end
	GOTO	L__Modbus_Settings2249
L__Modbus_Settings2250:
;GRR3000LManagementPanel.mpas,5824 :: 		end;
L__Modbus_Settings2241:
;GRR3000LManagementPanel.mpas,5825 :: 		end;
	GOTO	L__Modbus_Settings2185
L__Modbus_Settings2239:
;GRR3000LManagementPanel.mpas,5826 :: 		3: begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Modbus_Settings5394
	GOTO	L__Modbus_Settings2322
L__Modbus_Settings5394:
;GRR3000LManagementPanel.mpas,5828 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2324
;GRR3000LManagementPanel.mpas,5830 :: 		while (Ok_Button =0) do
L__Modbus_Settings2327:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Modbus_Settings2328
;GRR3000LManagementPanel.mpas,5832 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5833 :: 		end;
	GOTO	L__Modbus_Settings2327
L__Modbus_Settings2328:
;GRR3000LManagementPanel.mpas,5834 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5836 :: 		end;
L__Modbus_Settings2324:
;GRR3000LManagementPanel.mpas,5840 :: 		end;
	GOTO	L__Modbus_Settings2185
L__Modbus_Settings2322:
L__Modbus_Settings2185:
;GRR3000LManagementPanel.mpas,5848 :: 		end;
	GOTO	L__Modbus_Settings2181
L__Modbus_Settings2182:
;GRR3000LManagementPanel.mpas,5850 :: 		Modbus_Adress  := ModbusID;
	MOV	#lo_addr(_Modbus_Adress), W1
	MOV	#lo_addr(_ModbusID), W0
	MOV.B	[W0], [W1]
;GRR3000LManagementPanel.mpas,5851 :: 		ModbusBaudRate := BaudRateSet; // ayarlanan deðeri yükle
	MOV	#lo_addr(_ModbusBaudRate), W1
	MOV.B	[W14+0], W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5853 :: 		Uart_Procedures;
	CALL	_Uart_Procedures
;GRR3000LManagementPanel.mpas,5856 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,5857 :: 		MenuSayacValue := 8;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#8, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5859 :: 		end;
L_end_Modbus_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Modbus_Settings

_Temperature_Settings:
	LNK	#14

;GRR3000LManagementPanel.mpas,5862 :: 		begin
;GRR3000LManagementPanel.mpas,5863 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,5864 :: 		MenuExit        := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5865 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5866 :: 		Chng[5]         := 2;
	MOV	#lo_addr(_Chng+4), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5877 :: 		Glcd_Write_Text(Title_TempMenu,     0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_TempMenu), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5878 :: 		Glcd_Write_Text(SubTitle_TempAlarm, 6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_TempAlarm), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5879 :: 		Glcd_Write_Text(SubTitle_FanOn,     6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_FanOn), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5880 :: 		Glcd_Write_Text(SubTitle_FanOff,    6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_FanOff), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5881 :: 		Glcd_Write_Text(SubTitle_Back,      6, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5882 :: 		Glcd_Write_Text(SubTitle_TempComp,  0, Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	CLR	W11
	MOV	#lo_addr(_SubTitle_TempComp), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5883 :: 		Glcd_Write_Text('Ext. Sensor,',     6, Row8, Black);
	ADD	W14, #0, W1
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#120, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#44, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5885 :: 		TempFanOffSet         := EEPROM_Read(EE_TempFanOffSetEeAddr);
	MOV	#61508, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_TempFanOffSet), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5886 :: 		ValueDivide(TempFanOffSet, 0);
	CLR	W11
	ZE	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,5887 :: 		WriteText := Value_Text + '^'; // derece iþareti eklendi
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#94, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,5888 :: 		Glcd_Write_Text(WriteText,84 , Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5890 :: 		TempFanOnSet          := EEPROM_Read(EE_TempFanOnSetEeAddr);
	MOV	#61506, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_TempFanOnSet), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5891 :: 		ValueDivide(TempFanOnSet, 0);
	CLR	W11
	ZE	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,5892 :: 		WriteText := Value_Text + '^'; // derece iþareti eklendi
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#94, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,5893 :: 		Glcd_Write_Text(WriteText,84 , Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5895 :: 		TempAlarmSet          := EEPROM_Read(EE_TempAlarmSetEeAddr);
	MOV	#61504, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_TempAlarmSet), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5896 :: 		ValueDivide(TempAlarmSet, 0);
	CLR	W11
	ZE	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,5897 :: 		WriteText := Value_Text + '^'; // derece iþareti eklendi
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#94, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,5898 :: 		Glcd_Write_Text(WriteText,84 , Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5901 :: 		While (MenuExit =0) do
L__Temperature_Settings2333:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Temperature_Settings5396
	GOTO	L__Temperature_Settings2334
L__Temperature_Settings5396:
;GRR3000LManagementPanel.mpas,5904 :: 		TempCompansation_Measurement;
	CALL	_TempCompansation_Measurement
;GRR3000LManagementPanel.mpas,5906 :: 		MenuSayac := MenuButtonRead(4, 255);  // menu için butonlarý oku 5 satýr menü var
	MOV.B	#255, W11
	MOV.B	#4, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5908 :: 		if ((TempComp > 0)and(TempComp < 100)) then
	MOV	#lo_addr(_TempComp), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	CLR	W2
	BRA LE	L__Temperature_Settings5397
	COM	W2
L__Temperature_Settings5397:
	MOV	#lo_addr(_TempComp), W0
	MOV.B	[W0], W1
	MOV.B	#100, W0
	CP.B	W1, W0
	CLR	W0
	BRA GE	L__Temperature_Settings5398
	COM	W0
L__Temperature_Settings5398:
	AND	W2, W0, W0
	BRA NZ	L__Temperature_Settings5399
	GOTO	L__Temperature_Settings2338
L__Temperature_Settings5399:
;GRR3000LManagementPanel.mpas,5910 :: 		ValueDivide(TempComp, 0);
	MOV	#lo_addr(_TempComp), W0
	CLR	W11
	SE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,5911 :: 		WriteText := Value_Text + '^'; // derece iþareti eklendi
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#94, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,5912 :: 		Glcd_Write_Text(WriteText,82,Row8,Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#82, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5913 :: 		end else
	GOTO	L__Temperature_Settings2339
L__Temperature_Settings2338:
;GRR3000LManagementPanel.mpas,5914 :: 		if ((TempComp < 0)or(TempComp > 100)) then
	MOV	#lo_addr(_TempComp), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	CLR	W2
	BRA GE	L__Temperature_Settings5400
	COM	W2
L__Temperature_Settings5400:
	MOV	#lo_addr(_TempComp), W0
	MOV.B	[W0], W1
	MOV.B	#100, W0
	CP.B	W1, W0
	CLR	W0
	BRA LE	L__Temperature_Settings5401
	COM	W0
L__Temperature_Settings5401:
	IOR	W2, W0, W0
	BRA NZ	L__Temperature_Settings5402
	GOTO	L__Temperature_Settings2341
L__Temperature_Settings5402:
;GRR3000LManagementPanel.mpas,5916 :: 		Glcd_Write_Text('-----',82,Row8,Black);
	ADD	W14, #0, W1
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#82, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5917 :: 		end;
L__Temperature_Settings2341:
L__Temperature_Settings2339:
;GRR3000LManagementPanel.mpas,5919 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5922 :: 		1: begin // temp. alarm value
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Temperature_Settings5403
	GOTO	L__Temperature_Settings2346
L__Temperature_Settings5403:
;GRR3000LManagementPanel.mpas,5923 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2348
;GRR3000LManagementPanel.mpas,5925 :: 		while (Ok_Button =0) do
L__Temperature_Settings2351:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2352
;GRR3000LManagementPanel.mpas,5927 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5928 :: 		end;
	GOTO	L__Temperature_Settings2351
L__Temperature_Settings2352:
;GRR3000LManagementPanel.mpas,5930 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5932 :: 		While (Chng[1] =1) do
L__Temperature_Settings2356:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Temperature_Settings5404
	GOTO	L__Temperature_Settings2357
L__Temperature_Settings5404:
;GRR3000LManagementPanel.mpas,5935 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5937 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Temperature_Settings2361
;GRR3000LManagementPanel.mpas,5939 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5940 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5941 :: 		while (ButonStop = 0) do
L__Temperature_Settings2364:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Temperature_Settings2365
;GRR3000LManagementPanel.mpas,5943 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5944 :: 		end;
	GOTO	L__Temperature_Settings2364
L__Temperature_Settings2365:
;GRR3000LManagementPanel.mpas,5945 :: 		Inc(TempAlarmSet);
	MOV.B	#1, W1
	MOV	#lo_addr(_TempAlarmSet), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5946 :: 		if (TempAlarmSet > 99) then
	MOV	#lo_addr(_TempAlarmSet), W0
	MOV.B	[W0], W1
	MOV.B	#99, W0
	CP.B	W1, W0
	BRA GTU	L__Temperature_Settings5405
	GOTO	L__Temperature_Settings2369
L__Temperature_Settings5405:
;GRR3000LManagementPanel.mpas,5947 :: 		TempAlarmSet := 99;
	MOV	#lo_addr(_TempAlarmSet), W1
	MOV.B	#99, W0
	MOV.B	W0, [W1]
L__Temperature_Settings2369:
;GRR3000LManagementPanel.mpas,5948 :: 		end else
	GOTO	L__Temperature_Settings2362
L__Temperature_Settings2361:
;GRR3000LManagementPanel.mpas,5949 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Temperature_Settings2372
;GRR3000LManagementPanel.mpas,5951 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,5952 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,5953 :: 		while (ButonStop = 0) do
L__Temperature_Settings2375:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Temperature_Settings2376
;GRR3000LManagementPanel.mpas,5955 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5956 :: 		end;
	GOTO	L__Temperature_Settings2375
L__Temperature_Settings2376:
;GRR3000LManagementPanel.mpas,5957 :: 		Dec(TempAlarmSet);
	MOV.B	#1, W1
	MOV	#lo_addr(_TempAlarmSet), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,5958 :: 		if (TempAlarmSet < 5) then
	MOV	#lo_addr(_TempAlarmSet), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA LTU	L__Temperature_Settings5406
	GOTO	L__Temperature_Settings2380
L__Temperature_Settings5406:
;GRR3000LManagementPanel.mpas,5959 :: 		TempAlarmSet := 5;
	MOV	#lo_addr(_TempAlarmSet), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
L__Temperature_Settings2380:
;GRR3000LManagementPanel.mpas,5960 :: 		end;
L__Temperature_Settings2372:
L__Temperature_Settings2362:
;GRR3000LManagementPanel.mpas,5962 :: 		ValueDivide(TempAlarmSet, 0);
	MOV	#lo_addr(_TempAlarmSet), W0
	CLR	W11
	ZE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,5963 :: 		WriteText := Value_Text + '^'; // derece iþareti eklendi
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#94, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,5964 :: 		Glcd_Write_Text(WriteText, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5966 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2383
;GRR3000LManagementPanel.mpas,5968 :: 		while (Ok_Button =0) do
L__Temperature_Settings2386:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2387
;GRR3000LManagementPanel.mpas,5970 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5971 :: 		end;
	GOTO	L__Temperature_Settings2386
L__Temperature_Settings2387:
;GRR3000LManagementPanel.mpas,5973 :: 		EEPROM_Write(EE_TempAlarmSetEeAddr, TempAlarmSet);
	MOV	#lo_addr(_TempAlarmSet), W0
	ZE	[W0], W12
	MOV	#61504, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,5974 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Temperature_Settings2391:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Temperature_Settings2391
;GRR3000LManagementPanel.mpas,5976 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5977 :: 		Glcd_Write_Text(WriteText, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,5979 :: 		end;
L__Temperature_Settings2383:
;GRR3000LManagementPanel.mpas,5984 :: 		end; // chng[1] while end
	GOTO	L__Temperature_Settings2356
L__Temperature_Settings2357:
;GRR3000LManagementPanel.mpas,5986 :: 		end;
L__Temperature_Settings2348:
;GRR3000LManagementPanel.mpas,5987 :: 		end;
	GOTO	L__Temperature_Settings2343
L__Temperature_Settings2346:
;GRR3000LManagementPanel.mpas,5989 :: 		2: begin   // fan on value
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Temperature_Settings5407
	GOTO	L__Temperature_Settings2397
L__Temperature_Settings5407:
;GRR3000LManagementPanel.mpas,5990 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2399
;GRR3000LManagementPanel.mpas,5992 :: 		while (Ok_Button =0) do
L__Temperature_Settings2402:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2403
;GRR3000LManagementPanel.mpas,5994 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,5995 :: 		end;
	GOTO	L__Temperature_Settings2402
L__Temperature_Settings2403:
;GRR3000LManagementPanel.mpas,5997 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,5999 :: 		While (Chng[2] =1) do
L__Temperature_Settings2407:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Temperature_Settings5408
	GOTO	L__Temperature_Settings2408
L__Temperature_Settings5408:
;GRR3000LManagementPanel.mpas,6002 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6004 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Temperature_Settings2412
;GRR3000LManagementPanel.mpas,6006 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6007 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6008 :: 		while (ButonStop = 0) do
L__Temperature_Settings2415:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Temperature_Settings2416
;GRR3000LManagementPanel.mpas,6010 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6011 :: 		end;
	GOTO	L__Temperature_Settings2415
L__Temperature_Settings2416:
;GRR3000LManagementPanel.mpas,6012 :: 		Inc(TempFanOnSet);
	MOV.B	#1, W1
	MOV	#lo_addr(_TempFanOnSet), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6013 :: 		if (TempFanOnSet > 99) then
	MOV	#lo_addr(_TempFanOnSet), W0
	MOV.B	[W0], W1
	MOV.B	#99, W0
	CP.B	W1, W0
	BRA GTU	L__Temperature_Settings5409
	GOTO	L__Temperature_Settings2420
L__Temperature_Settings5409:
;GRR3000LManagementPanel.mpas,6014 :: 		TempFanOnSet := 99;
	MOV	#lo_addr(_TempFanOnSet), W1
	MOV.B	#99, W0
	MOV.B	W0, [W1]
L__Temperature_Settings2420:
;GRR3000LManagementPanel.mpas,6015 :: 		end else
	GOTO	L__Temperature_Settings2413
L__Temperature_Settings2412:
;GRR3000LManagementPanel.mpas,6016 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Temperature_Settings2423
;GRR3000LManagementPanel.mpas,6018 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6019 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6020 :: 		while (ButonStop = 0) do
L__Temperature_Settings2426:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Temperature_Settings2427
;GRR3000LManagementPanel.mpas,6022 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6023 :: 		end;
	GOTO	L__Temperature_Settings2426
L__Temperature_Settings2427:
;GRR3000LManagementPanel.mpas,6024 :: 		Dec(TempFanOnSet);
	MOV.B	#1, W1
	MOV	#lo_addr(_TempFanOnSet), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6025 :: 		if (TempFanOnSet < 5) then
	MOV	#lo_addr(_TempFanOnSet), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA LTU	L__Temperature_Settings5410
	GOTO	L__Temperature_Settings2431
L__Temperature_Settings5410:
;GRR3000LManagementPanel.mpas,6026 :: 		TempFanOnSet := 5;
	MOV	#lo_addr(_TempFanOnSet), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
L__Temperature_Settings2431:
;GRR3000LManagementPanel.mpas,6027 :: 		end;
L__Temperature_Settings2423:
L__Temperature_Settings2413:
;GRR3000LManagementPanel.mpas,6029 :: 		ValueDivide(TempFanOnSet, 0);
	MOV	#lo_addr(_TempFanOnSet), W0
	CLR	W11
	ZE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6030 :: 		WriteText := Value_Text + '^'; // derece iþareti eklendi
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#94, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6031 :: 		Glcd_Write_Text(WriteText, 84, Row3, White);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6033 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2434
;GRR3000LManagementPanel.mpas,6035 :: 		while (Ok_Button =0) do
L__Temperature_Settings2437:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2438
;GRR3000LManagementPanel.mpas,6037 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6038 :: 		end;
	GOTO	L__Temperature_Settings2437
L__Temperature_Settings2438:
;GRR3000LManagementPanel.mpas,6040 :: 		EEPROM_Write(EE_TempFanOnSetEeAddr, TempFanOnSet);
	MOV	#lo_addr(_TempFanOnSet), W0
	ZE	[W0], W12
	MOV	#61506, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6041 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Temperature_Settings2442:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Temperature_Settings2442
;GRR3000LManagementPanel.mpas,6043 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6044 :: 		Glcd_Write_Text(WriteText, 84, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6046 :: 		end;
L__Temperature_Settings2434:
;GRR3000LManagementPanel.mpas,6051 :: 		end; // chng[2] while end
	GOTO	L__Temperature_Settings2407
L__Temperature_Settings2408:
;GRR3000LManagementPanel.mpas,6053 :: 		end;
L__Temperature_Settings2399:
;GRR3000LManagementPanel.mpas,6054 :: 		end;
	GOTO	L__Temperature_Settings2343
L__Temperature_Settings2397:
;GRR3000LManagementPanel.mpas,6056 :: 		3: begin   // fan off value
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Temperature_Settings5411
	GOTO	L__Temperature_Settings2448
L__Temperature_Settings5411:
;GRR3000LManagementPanel.mpas,6057 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2450
;GRR3000LManagementPanel.mpas,6059 :: 		while (Ok_Button =0) do
L__Temperature_Settings2453:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2454
;GRR3000LManagementPanel.mpas,6061 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6062 :: 		end;
	GOTO	L__Temperature_Settings2453
L__Temperature_Settings2454:
;GRR3000LManagementPanel.mpas,6064 :: 		Chng[3] := 1;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6066 :: 		While (Chng[3] =1) do
L__Temperature_Settings2458:
	MOV	#lo_addr(_Chng+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Temperature_Settings5412
	GOTO	L__Temperature_Settings2459
L__Temperature_Settings5412:
;GRR3000LManagementPanel.mpas,6069 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6071 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Temperature_Settings2463
;GRR3000LManagementPanel.mpas,6073 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6074 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6075 :: 		while (ButonStop = 0) do
L__Temperature_Settings2466:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Temperature_Settings2467
;GRR3000LManagementPanel.mpas,6077 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6078 :: 		end;
	GOTO	L__Temperature_Settings2466
L__Temperature_Settings2467:
;GRR3000LManagementPanel.mpas,6079 :: 		Inc(TempFanOffSet);
	MOV.B	#1, W1
	MOV	#lo_addr(_TempFanOffSet), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6080 :: 		if (TempFanOffSet > 99) then
	MOV	#lo_addr(_TempFanOffSet), W0
	MOV.B	[W0], W1
	MOV.B	#99, W0
	CP.B	W1, W0
	BRA GTU	L__Temperature_Settings5413
	GOTO	L__Temperature_Settings2471
L__Temperature_Settings5413:
;GRR3000LManagementPanel.mpas,6081 :: 		TempFanOffSet := 99;
	MOV	#lo_addr(_TempFanOffSet), W1
	MOV.B	#99, W0
	MOV.B	W0, [W1]
L__Temperature_Settings2471:
;GRR3000LManagementPanel.mpas,6082 :: 		end else
	GOTO	L__Temperature_Settings2464
L__Temperature_Settings2463:
;GRR3000LManagementPanel.mpas,6083 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Temperature_Settings2474
;GRR3000LManagementPanel.mpas,6085 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6086 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6087 :: 		while (ButonStop = 0) do
L__Temperature_Settings2477:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Temperature_Settings2478
;GRR3000LManagementPanel.mpas,6089 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6090 :: 		end;
	GOTO	L__Temperature_Settings2477
L__Temperature_Settings2478:
;GRR3000LManagementPanel.mpas,6091 :: 		Dec(TempFanOffSet);
	MOV.B	#1, W1
	MOV	#lo_addr(_TempFanOffSet), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6092 :: 		if (TempFanOffSet < 5) then
	MOV	#lo_addr(_TempFanOffSet), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA LTU	L__Temperature_Settings5414
	GOTO	L__Temperature_Settings2482
L__Temperature_Settings5414:
;GRR3000LManagementPanel.mpas,6093 :: 		TempFanOffSet := 5;
	MOV	#lo_addr(_TempFanOffSet), W1
	MOV.B	#5, W0
	MOV.B	W0, [W1]
L__Temperature_Settings2482:
;GRR3000LManagementPanel.mpas,6094 :: 		end;
L__Temperature_Settings2474:
L__Temperature_Settings2464:
;GRR3000LManagementPanel.mpas,6096 :: 		ValueDivide(TempFanOffSet, 0);
	MOV	#lo_addr(_TempFanOffSet), W0
	CLR	W11
	ZE	[W0], W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6097 :: 		WriteText := Value_Text + '^'; // derece iþareti eklendi
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#94, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6098 :: 		Glcd_Write_Text(WriteText, 84, Row4, White);
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6100 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2485
;GRR3000LManagementPanel.mpas,6102 :: 		while (Ok_Button =0) do
L__Temperature_Settings2488:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2489
;GRR3000LManagementPanel.mpas,6104 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6105 :: 		end;
	GOTO	L__Temperature_Settings2488
L__Temperature_Settings2489:
;GRR3000LManagementPanel.mpas,6107 :: 		EEPROM_Write(EE_TempFanOffSetEeAddr, TempFanOffSet);
	MOV	#lo_addr(_TempFanOffSet), W0
	ZE	[W0], W12
	MOV	#61508, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6108 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Temperature_Settings2493:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Temperature_Settings2493
;GRR3000LManagementPanel.mpas,6110 :: 		Chng[3] := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6111 :: 		Glcd_Write_Text(WriteText, 84, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6113 :: 		end;
L__Temperature_Settings2485:
;GRR3000LManagementPanel.mpas,6118 :: 		end; // chng[3] while end
	GOTO	L__Temperature_Settings2458
L__Temperature_Settings2459:
;GRR3000LManagementPanel.mpas,6120 :: 		end;
L__Temperature_Settings2450:
;GRR3000LManagementPanel.mpas,6121 :: 		end;
	GOTO	L__Temperature_Settings2343
L__Temperature_Settings2448:
;GRR3000LManagementPanel.mpas,6192 :: 		4: begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Temperature_Settings5415
	GOTO	L__Temperature_Settings2499
L__Temperature_Settings5415:
;GRR3000LManagementPanel.mpas,6194 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2501
;GRR3000LManagementPanel.mpas,6196 :: 		while (Ok_Button =0) do
L__Temperature_Settings2504:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Temperature_Settings2505
;GRR3000LManagementPanel.mpas,6198 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6199 :: 		end;
	GOTO	L__Temperature_Settings2504
L__Temperature_Settings2505:
;GRR3000LManagementPanel.mpas,6200 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6202 :: 		end;
L__Temperature_Settings2501:
;GRR3000LManagementPanel.mpas,6206 :: 		end;
	GOTO	L__Temperature_Settings2343
L__Temperature_Settings2499:
L__Temperature_Settings2343:
;GRR3000LManagementPanel.mpas,6211 :: 		end;
	GOTO	L__Temperature_Settings2333
L__Temperature_Settings2334:
;GRR3000LManagementPanel.mpas,6213 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,6214 :: 		MenuSayacValue := 6;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#6, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6216 :: 		end;
L_end_Temperature_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Temperature_Settings

_DC_Settings:
	LNK	#12

;GRR3000LManagementPanel.mpas,6219 :: 		begin
;GRR3000LManagementPanel.mpas,6220 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,6221 :: 		MenuExit        := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6222 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6223 :: 		Chng[6]         := 2;
	MOV	#lo_addr(_Chng+5), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6230 :: 		Glcd_Write_Text(Title_DcMenu,     0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_DcMenu), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6231 :: 		Glcd_Write_Text(SubTitle_SetVolt, 6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_SetVolt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6232 :: 		Glcd_Write_Text(SubTitle_SetAmps, 6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_SetAmps), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6233 :: 		Glcd_Write_Text(SubTitle_MaxVolt, 6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_MaxVolt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6234 :: 		Glcd_Write_Text(SubTitle_MinVolt, 6, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_MinVolt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6235 :: 		Glcd_Write_Text(SubTitle_Back,    6, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6237 :: 		ChargeMode     := EEPROM_Read(EE_ChargeModeEeAddr);
	MOV	#61468, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ChargeMode), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6238 :: 		DCOutVoltSet   := EEPROM_Read(EE_DCOutVoltSetEeAddr);
	MOV	#61484, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _DCOutVoltSet
;GRR3000LManagementPanel.mpas,6239 :: 		RedresorAkim   := EEPROM_Read(EE_RedresorAkimEeAddr);
	MOV	#61456, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _RedresorAkim
;GRR3000LManagementPanel.mpas,6240 :: 		DCOutAmpsSet   := EEPROM_Read(EE_DcOutAmpsSetEeAddr);
	MOV	#61486, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _DcOutAmpsSet
;GRR3000LManagementPanel.mpas,6241 :: 		MaxVoltSet     := EEPROM_Read(EE_MaxVoltSetEeAddr);
	MOV	#61488, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _MaxvoltSet
;GRR3000LManagementPanel.mpas,6242 :: 		MinVoltSet     := EEPROM_Read(EE_MinVoltSetEeAddr);
	MOV	#61490, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _MinVoltSet
;GRR3000LManagementPanel.mpas,6244 :: 		ValueDivide(DCOutVoltSet, 255);
	MOV.B	#255, W11
	MOV	_DCOutVoltSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6245 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6246 :: 		Glcd_Write_Text(WriteText, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6248 :: 		ValueDivide(DcOutAmpsSet, 255);
	MOV.B	#255, W11
	MOV	_DcOutAmpsSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6249 :: 		WriteText := Value_Text + 'A';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6250 :: 		Glcd_Write_Text(WriteText, 84, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6252 :: 		ValueDivide(MaxVoltSet, 255);
	MOV.B	#255, W11
	MOV	_MaxvoltSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6253 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6254 :: 		Glcd_Write_Text(WriteText, 84, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6256 :: 		ValueDivide(MinVoltSet, 255);
	MOV.B	#255, W11
	MOV	_MinVoltSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6257 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6258 :: 		Glcd_Write_Text(WriteText, 84, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6264 :: 		While (MenuExit =0) do
L__DC_Settings2510:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__DC_Settings5417
	GOTO	L__DC_Settings2511
L__DC_Settings5417:
;GRR3000LManagementPanel.mpas,6267 :: 		MenuSayac := MenuButtonRead(5, 255);  // menu için butonlarý oku 6 satýr menü var
	MOV.B	#255, W11
	MOV.B	#5, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6269 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6272 :: 		1: begin  // çýkýþ gerilimi
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__DC_Settings5418
	GOTO	L__DC_Settings2517
L__DC_Settings5418:
;GRR3000LManagementPanel.mpas,6274 :: 		if (ChargeMode = Manuel) then // þarj modu Manuel ise ayar yap deðilse yapma
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__DC_Settings5419
	GOTO	L__DC_Settings2519
L__DC_Settings5419:
;GRR3000LManagementPanel.mpas,6276 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2522
;GRR3000LManagementPanel.mpas,6278 :: 		while (Ok_Button =0) do
L__DC_Settings2525:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2526
;GRR3000LManagementPanel.mpas,6280 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6281 :: 		end;
	GOTO	L__DC_Settings2525
L__DC_Settings2526:
;GRR3000LManagementPanel.mpas,6283 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6285 :: 		While (Chng[1] =1) do
L__DC_Settings2530:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__DC_Settings5420
	GOTO	L__DC_Settings2531
L__DC_Settings5420:
;GRR3000LManagementPanel.mpas,6288 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6290 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__DC_Settings2535
;GRR3000LManagementPanel.mpas,6292 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6293 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6294 :: 		while (ButonStop = 0) do
L__DC_Settings2538:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__DC_Settings2539
;GRR3000LManagementPanel.mpas,6296 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6297 :: 		end;
	GOTO	L__DC_Settings2538
L__DC_Settings2539:
;GRR3000LManagementPanel.mpas,6298 :: 		Inc(DCOutVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_DCOutVoltSet), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6299 :: 		if (DCOutVoltSet > ((HucreSayisi*2)*(B_ChargePercentHi * 0.1))) then
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_B_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	_DCOutVoltSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR	W0
	BRA LE	L__DC_Settings5421
	COM	W0
L__DC_Settings5421:
	CP0	W0
	BRA NZ	L__DC_Settings5422
	GOTO	L__DC_Settings2543
L__DC_Settings5422:
;GRR3000LManagementPanel.mpas,6300 :: 		DCOutVoltSet := ((HucreSayisi*2)*(B_ChargePercentHi * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_B_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _DCOutVoltSet
L__DC_Settings2543:
;GRR3000LManagementPanel.mpas,6301 :: 		end else
	GOTO	L__DC_Settings2536
L__DC_Settings2535:
;GRR3000LManagementPanel.mpas,6302 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__DC_Settings2546
;GRR3000LManagementPanel.mpas,6304 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6305 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6306 :: 		while (ButonStop = 0) do
L__DC_Settings2549:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__DC_Settings2550
;GRR3000LManagementPanel.mpas,6308 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6309 :: 		end;
	GOTO	L__DC_Settings2549
L__DC_Settings2550:
;GRR3000LManagementPanel.mpas,6310 :: 		Dec(DCOutVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_DCOutVoltSet), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6311 :: 		if (DCOutVoltSet < ((HucreSayisi*2)*(F_ChargePercentlo * 0.1))) then
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_F_ChargePercentLo, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	_DCOutVoltSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR	W0
	BRA GE	L__DC_Settings5423
	COM	W0
L__DC_Settings5423:
	CP0	W0
	BRA NZ	L__DC_Settings5424
	GOTO	L__DC_Settings2554
L__DC_Settings5424:
;GRR3000LManagementPanel.mpas,6312 :: 		DCOutVoltSet := ((HucreSayisi*2)*(F_ChargePercentLo * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_F_ChargePercentLo, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _DCOutVoltSet
L__DC_Settings2554:
;GRR3000LManagementPanel.mpas,6313 :: 		end;
L__DC_Settings2546:
L__DC_Settings2536:
;GRR3000LManagementPanel.mpas,6315 :: 		ValueDivide(DCOutVoltSet, 255);
	MOV.B	#255, W11
	MOV	_DCOutVoltSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6316 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6317 :: 		Glcd_Write_Text(WriteText, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6319 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2557
;GRR3000LManagementPanel.mpas,6321 :: 		while (Ok_Button =0) do
L__DC_Settings2560:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2561
;GRR3000LManagementPanel.mpas,6323 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6324 :: 		end;
	GOTO	L__DC_Settings2560
L__DC_Settings2561:
;GRR3000LManagementPanel.mpas,6326 :: 		EEPROM_Write(EE_DCOutVoltSetEeAddr, DCOutVoltSet);
	MOV	_DCOutVoltSet, W12
	MOV	#61484, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6327 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__DC_Settings2565:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__DC_Settings2565
;GRR3000LManagementPanel.mpas,6329 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6330 :: 		Glcd_Write_Text(WriteText, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6336 :: 		end;
L__DC_Settings2557:
;GRR3000LManagementPanel.mpas,6341 :: 		end; // chng[1] while end
	GOTO	L__DC_Settings2530
L__DC_Settings2531:
;GRR3000LManagementPanel.mpas,6344 :: 		end;
L__DC_Settings2522:
;GRR3000LManagementPanel.mpas,6345 :: 		end else Glcd_Write_Text('------',84,Row2, Black); // þarj modu Manuel deðilse ekrana ---- iþaretlerini yaz
	GOTO	L__DC_Settings2520
L__DC_Settings2519:
	ADD	W14, #0, W1
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
L__DC_Settings2520:
;GRR3000LManagementPanel.mpas,6347 :: 		end;
	GOTO	L__DC_Settings2514
L__DC_Settings2517:
;GRR3000LManagementPanel.mpas,6349 :: 		2: begin  // çýkýþ akýmý
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__DC_Settings5425
	GOTO	L__DC_Settings2571
L__DC_Settings5425:
;GRR3000LManagementPanel.mpas,6352 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2573
;GRR3000LManagementPanel.mpas,6354 :: 		while (Ok_Button =0) do
L__DC_Settings2576:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2577
;GRR3000LManagementPanel.mpas,6356 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6357 :: 		end;
	GOTO	L__DC_Settings2576
L__DC_Settings2577:
;GRR3000LManagementPanel.mpas,6359 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6361 :: 		While (Chng[2] =1) do
L__DC_Settings2581:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__DC_Settings5426
	GOTO	L__DC_Settings2582
L__DC_Settings5426:
;GRR3000LManagementPanel.mpas,6364 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6366 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__DC_Settings2586
;GRR3000LManagementPanel.mpas,6368 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6369 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6370 :: 		while (ButonStop = 0) do
L__DC_Settings2589:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__DC_Settings2590
;GRR3000LManagementPanel.mpas,6372 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6373 :: 		end;
	GOTO	L__DC_Settings2589
L__DC_Settings2590:
;GRR3000LManagementPanel.mpas,6374 :: 		Inc(DcOutAmpsSet);
	MOV	#1, W1
	MOV	#lo_addr(_DcOutAmpsSet), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6375 :: 		if (DcOutAmpsSet > RedresorAkim*10) then
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_DcOutAmpsSet), W0
	CP	W2, [W0]
	BRA LTU	L__DC_Settings5427
	GOTO	L__DC_Settings2594
L__DC_Settings5427:
;GRR3000LManagementPanel.mpas,6376 :: 		DcOutAmpsSet := RedresorAkim*10;
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _DcOutAmpsSet
L__DC_Settings2594:
;GRR3000LManagementPanel.mpas,6377 :: 		end else
	GOTO	L__DC_Settings2587
L__DC_Settings2586:
;GRR3000LManagementPanel.mpas,6378 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__DC_Settings2597
;GRR3000LManagementPanel.mpas,6380 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6381 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6382 :: 		while (ButonStop = 0) do
L__DC_Settings2600:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__DC_Settings2601
;GRR3000LManagementPanel.mpas,6384 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6385 :: 		end;
	GOTO	L__DC_Settings2600
L__DC_Settings2601:
;GRR3000LManagementPanel.mpas,6386 :: 		Dec(DcOutAmpsSet);
	MOV	#1, W1
	MOV	#lo_addr(_DcOutAmpsSet), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6387 :: 		if (DcOutAmpsSet < 1) then
	MOV	_DcOutAmpsSet, W0
	CP	W0, #1
	BRA LTU	L__DC_Settings5428
	GOTO	L__DC_Settings2605
L__DC_Settings5428:
;GRR3000LManagementPanel.mpas,6388 :: 		DcOutAmpsSet := 1;
	MOV	#1, W0
	MOV	W0, _DcOutAmpsSet
L__DC_Settings2605:
;GRR3000LManagementPanel.mpas,6389 :: 		end;
L__DC_Settings2597:
L__DC_Settings2587:
;GRR3000LManagementPanel.mpas,6391 :: 		ValueDivide(DcOutAmpsSet, 255);
	MOV.B	#255, W11
	MOV	_DcOutAmpsSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6392 :: 		WriteText := Value_Text + 'A';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6393 :: 		Glcd_Write_Text(WriteText, 84, Row3, White);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6395 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2608
;GRR3000LManagementPanel.mpas,6397 :: 		while (Ok_Button =0) do
L__DC_Settings2611:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2612
;GRR3000LManagementPanel.mpas,6399 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6400 :: 		end;
	GOTO	L__DC_Settings2611
L__DC_Settings2612:
;GRR3000LManagementPanel.mpas,6402 :: 		EEPROM_Write(EE_DcOutAmpsSetEeAddr, DcOutAmpsSet);
	MOV	_DcOutAmpsSet, W12
	MOV	#61486, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6403 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__DC_Settings2616:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__DC_Settings2616
;GRR3000LManagementPanel.mpas,6405 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6406 :: 		Glcd_Write_Text(WriteText, 84, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6410 :: 		end;
L__DC_Settings2608:
;GRR3000LManagementPanel.mpas,6415 :: 		end; // chng[2] while end
	GOTO	L__DC_Settings2581
L__DC_Settings2582:
;GRR3000LManagementPanel.mpas,6418 :: 		end;
L__DC_Settings2573:
;GRR3000LManagementPanel.mpas,6421 :: 		end;
	GOTO	L__DC_Settings2514
L__DC_Settings2571:
;GRR3000LManagementPanel.mpas,6423 :: 		3: begin  // max gerilimi
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__DC_Settings5429
	GOTO	L__DC_Settings2622
L__DC_Settings5429:
;GRR3000LManagementPanel.mpas,6425 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2624
;GRR3000LManagementPanel.mpas,6427 :: 		while (Ok_Button =0) do
L__DC_Settings2627:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2628
;GRR3000LManagementPanel.mpas,6429 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6430 :: 		end;
	GOTO	L__DC_Settings2627
L__DC_Settings2628:
;GRR3000LManagementPanel.mpas,6432 :: 		Chng[3] := 1;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6434 :: 		While (Chng[3] =1) do
L__DC_Settings2632:
	MOV	#lo_addr(_Chng+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__DC_Settings5430
	GOTO	L__DC_Settings2633
L__DC_Settings5430:
;GRR3000LManagementPanel.mpas,6437 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6439 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__DC_Settings2637
;GRR3000LManagementPanel.mpas,6441 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6442 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6443 :: 		while (ButonStop = 0) do
L__DC_Settings2640:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__DC_Settings2641
;GRR3000LManagementPanel.mpas,6445 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6446 :: 		end;
	GOTO	L__DC_Settings2640
L__DC_Settings2641:
;GRR3000LManagementPanel.mpas,6447 :: 		Inc(MaxVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_MaxvoltSet), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6448 :: 		if (MaxVoltSet > ((HucreSayisi*2)*((B_ChargePercentHi+10) * 0.1))) then
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_B_ChargePercentHi, W0
	ADD	W0, #10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	_MaxvoltSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR	W0
	BRA LE	L__DC_Settings5431
	COM	W0
L__DC_Settings5431:
	CP0	W0
	BRA NZ	L__DC_Settings5432
	GOTO	L__DC_Settings2645
L__DC_Settings5432:
;GRR3000LManagementPanel.mpas,6449 :: 		MaxVoltSet := ((HucreSayisi*2)*((B_ChargePercentHi+10) * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_B_ChargePercentHi, W0
	ADD	W0, #10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _MaxvoltSet
L__DC_Settings2645:
;GRR3000LManagementPanel.mpas,6450 :: 		end else
	GOTO	L__DC_Settings2638
L__DC_Settings2637:
;GRR3000LManagementPanel.mpas,6451 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__DC_Settings2648
;GRR3000LManagementPanel.mpas,6453 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6454 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6455 :: 		while (ButonStop = 0) do
L__DC_Settings2651:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__DC_Settings2652
;GRR3000LManagementPanel.mpas,6457 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6458 :: 		end;
	GOTO	L__DC_Settings2651
L__DC_Settings2652:
;GRR3000LManagementPanel.mpas,6459 :: 		Dec(MaxVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_MaxvoltSet), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6460 :: 		if (MaxVoltSet < ((HucreSayisi*2)*(F_ChargePercentlo * 0.1))) then
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_F_ChargePercentLo, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	_MaxvoltSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR	W0
	BRA GE	L__DC_Settings5433
	COM	W0
L__DC_Settings5433:
	CP0	W0
	BRA NZ	L__DC_Settings5434
	GOTO	L__DC_Settings2656
L__DC_Settings5434:
;GRR3000LManagementPanel.mpas,6461 :: 		MaxVoltSet := ((HucreSayisi*2)*(F_ChargePercentLo * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_F_ChargePercentLo, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _MaxvoltSet
L__DC_Settings2656:
;GRR3000LManagementPanel.mpas,6462 :: 		end;
L__DC_Settings2648:
L__DC_Settings2638:
;GRR3000LManagementPanel.mpas,6464 :: 		ValueDivide(MaxVoltSet, 255);
	MOV.B	#255, W11
	MOV	_MaxvoltSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6465 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6466 :: 		Glcd_Write_Text(WriteText, 84, Row4, White);
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6468 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2659
;GRR3000LManagementPanel.mpas,6470 :: 		while (Ok_Button =0) do
L__DC_Settings2662:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2663
;GRR3000LManagementPanel.mpas,6472 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6473 :: 		end;
	GOTO	L__DC_Settings2662
L__DC_Settings2663:
;GRR3000LManagementPanel.mpas,6475 :: 		EEPROM_Write(EE_MaxVoltSetEeAddr, MaxVoltSet);
	MOV	_MaxvoltSet, W12
	MOV	#61488, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6476 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__DC_Settings2667:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__DC_Settings2667
;GRR3000LManagementPanel.mpas,6478 :: 		Chng[3] := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6479 :: 		Glcd_Write_Text(WriteText, 84, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6483 :: 		end;
L__DC_Settings2659:
;GRR3000LManagementPanel.mpas,6488 :: 		end; // chng[3] while end
	GOTO	L__DC_Settings2632
L__DC_Settings2633:
;GRR3000LManagementPanel.mpas,6490 :: 		end;
L__DC_Settings2624:
;GRR3000LManagementPanel.mpas,6492 :: 		end;
	GOTO	L__DC_Settings2514
L__DC_Settings2622:
;GRR3000LManagementPanel.mpas,6494 :: 		4: begin  // min gerilimi
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__DC_Settings5435
	GOTO	L__DC_Settings2673
L__DC_Settings5435:
;GRR3000LManagementPanel.mpas,6496 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2675
;GRR3000LManagementPanel.mpas,6498 :: 		while (Ok_Button =0) do
L__DC_Settings2678:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2679
;GRR3000LManagementPanel.mpas,6500 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6501 :: 		end;
	GOTO	L__DC_Settings2678
L__DC_Settings2679:
;GRR3000LManagementPanel.mpas,6503 :: 		Chng[4] := 1;
	MOV	#lo_addr(_Chng+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6505 :: 		While (Chng[4] =1) do
L__DC_Settings2683:
	MOV	#lo_addr(_Chng+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__DC_Settings5436
	GOTO	L__DC_Settings2684
L__DC_Settings5436:
;GRR3000LManagementPanel.mpas,6508 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6510 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__DC_Settings2688
;GRR3000LManagementPanel.mpas,6512 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6513 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6514 :: 		while (ButonStop = 0) do
L__DC_Settings2691:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__DC_Settings2692
;GRR3000LManagementPanel.mpas,6516 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6517 :: 		end;
	GOTO	L__DC_Settings2691
L__DC_Settings2692:
;GRR3000LManagementPanel.mpas,6518 :: 		Inc(MinVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_MinVoltSet), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6519 :: 		if (MinVoltSet > ((HucreSayisi*2)*(B_ChargePercentHi * 0.1))) then
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_B_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	_MinVoltSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR	W0
	BRA LE	L__DC_Settings5437
	COM	W0
L__DC_Settings5437:
	CP0	W0
	BRA NZ	L__DC_Settings5438
	GOTO	L__DC_Settings2696
L__DC_Settings5438:
;GRR3000LManagementPanel.mpas,6520 :: 		MinVoltSet := ((HucreSayisi*2)*(B_ChargePercentHi * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_B_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _MinVoltSet
L__DC_Settings2696:
;GRR3000LManagementPanel.mpas,6521 :: 		end else
	GOTO	L__DC_Settings2689
L__DC_Settings2688:
;GRR3000LManagementPanel.mpas,6522 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__DC_Settings2699
;GRR3000LManagementPanel.mpas,6524 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6525 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6526 :: 		while (ButonStop = 0) do
L__DC_Settings2702:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__DC_Settings2703
;GRR3000LManagementPanel.mpas,6528 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6529 :: 		end;
	GOTO	L__DC_Settings2702
L__DC_Settings2703:
;GRR3000LManagementPanel.mpas,6530 :: 		Dec(MinVoltSet);
	MOV	#1, W1
	MOV	#lo_addr(_MinVoltSet), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6531 :: 		if (MinVoltSet < ((HucreSayisi*2)*((F_ChargePercentlo-10) * 0.1))) then
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_F_ChargePercentLo, W0
	SUB	W0, #10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	_MinVoltSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR	W0
	BRA GE	L__DC_Settings5439
	COM	W0
L__DC_Settings5439:
	CP0	W0
	BRA NZ	L__DC_Settings5440
	GOTO	L__DC_Settings2707
L__DC_Settings5440:
;GRR3000LManagementPanel.mpas,6532 :: 		MinVoltSet := ((HucreSayisi*2)*((F_ChargePercentLo-10) * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+8]
	MOV	_F_ChargePercentLo, W0
	SUB	W0, #10, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+8], W2
	MOV	W0, [W14+8]
	MOV	W1, [W14+10]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+8], W2
	MOV	[W14+10], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _MinVoltSet
L__DC_Settings2707:
;GRR3000LManagementPanel.mpas,6533 :: 		end;
L__DC_Settings2699:
L__DC_Settings2689:
;GRR3000LManagementPanel.mpas,6535 :: 		ValueDivide(MinVoltSet, 255);
	MOV.B	#255, W11
	MOV	_MinVoltSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6536 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6537 :: 		Glcd_Write_Text(WriteText, 84, Row5, White);
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6539 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2710
;GRR3000LManagementPanel.mpas,6541 :: 		while (Ok_Button =0) do
L__DC_Settings2713:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2714
;GRR3000LManagementPanel.mpas,6543 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6544 :: 		end;
	GOTO	L__DC_Settings2713
L__DC_Settings2714:
;GRR3000LManagementPanel.mpas,6546 :: 		EEPROM_Write(EE_MinVoltSetEeAddr, MinVoltSet);
	MOV	_MinVoltSet, W12
	MOV	#61490, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6547 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__DC_Settings2718:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__DC_Settings2718
;GRR3000LManagementPanel.mpas,6549 :: 		Chng[4] := 0;
	MOV	#lo_addr(_Chng+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6550 :: 		Glcd_Write_Text(WriteText, 84, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6554 :: 		end;
L__DC_Settings2710:
;GRR3000LManagementPanel.mpas,6559 :: 		end; // chng[4] while end
	GOTO	L__DC_Settings2683
L__DC_Settings2684:
;GRR3000LManagementPanel.mpas,6562 :: 		end;
L__DC_Settings2675:
;GRR3000LManagementPanel.mpas,6564 :: 		end;
	GOTO	L__DC_Settings2514
L__DC_Settings2673:
;GRR3000LManagementPanel.mpas,6635 :: 		5: begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__DC_Settings5441
	GOTO	L__DC_Settings2724
L__DC_Settings5441:
;GRR3000LManagementPanel.mpas,6637 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2726
;GRR3000LManagementPanel.mpas,6639 :: 		while (Ok_Button =0) do
L__DC_Settings2729:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__DC_Settings2730
;GRR3000LManagementPanel.mpas,6641 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6642 :: 		end;
	GOTO	L__DC_Settings2729
L__DC_Settings2730:
;GRR3000LManagementPanel.mpas,6643 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6645 :: 		end;
L__DC_Settings2726:
;GRR3000LManagementPanel.mpas,6649 :: 		end;
	GOTO	L__DC_Settings2514
L__DC_Settings2724:
L__DC_Settings2514:
;GRR3000LManagementPanel.mpas,6652 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6654 :: 		end; // MenuExit while end
	GOTO	L__DC_Settings2510
L__DC_Settings2511:
;GRR3000LManagementPanel.mpas,6656 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,6657 :: 		MenuSayacValue := 2;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6659 :: 		end;
L_end_DC_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _DC_Settings

_ChargeModeWrite:

;GRR3000LManagementPanel.mpas,6662 :: 		begin
;GRR3000LManagementPanel.mpas,6664 :: 		1: begin
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CP.B	W10, #1
	BRA Z	L__ChargeModeWrite5443
	GOTO	L__ChargeModeWrite2737
L__ChargeModeWrite5443:
;GRR3000LManagementPanel.mpas,6665 :: 		Glcd_Write_Text(BoostChargeText,84,row4,State);
	MOV.B	W11, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_BoostChargeText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6666 :: 		end;
	GOTO	L__ChargeModeWrite2734
L__ChargeModeWrite2737:
;GRR3000LManagementPanel.mpas,6668 :: 		2: begin
	CP.B	W10, #2
	BRA Z	L__ChargeModeWrite5444
	GOTO	L__ChargeModeWrite2740
L__ChargeModeWrite5444:
;GRR3000LManagementPanel.mpas,6669 :: 		Glcd_Write_Text(FloatChargeText,84,row4,State);
	MOV.B	W11, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_FloatChargeText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6670 :: 		end;
	GOTO	L__ChargeModeWrite2734
L__ChargeModeWrite2740:
;GRR3000LManagementPanel.mpas,6672 :: 		3: begin
	CP.B	W10, #3
	BRA Z	L__ChargeModeWrite5445
	GOTO	L__ChargeModeWrite2743
L__ChargeModeWrite5445:
;GRR3000LManagementPanel.mpas,6673 :: 		Glcd_Write_Text(TCompChargeText,84,row4,State);
	MOV.B	W11, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_TCompChargeText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6674 :: 		end;
	GOTO	L__ChargeModeWrite2734
L__ChargeModeWrite2743:
;GRR3000LManagementPanel.mpas,6676 :: 		4: begin
	CP.B	W10, #4
	BRA Z	L__ChargeModeWrite5446
	GOTO	L__ChargeModeWrite2746
L__ChargeModeWrite5446:
;GRR3000LManagementPanel.mpas,6677 :: 		Glcd_Write_Text(ManualChargeText,84,row4,State);
	MOV.B	W11, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_ManualChargeText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6678 :: 		end;
	GOTO	L__ChargeModeWrite2734
L__ChargeModeWrite2746:
L__ChargeModeWrite2734:
;GRR3000LManagementPanel.mpas,6680 :: 		end;
L_end_ChargeModeWrite:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _ChargeModeWrite

_Battery_Settings:
	LNK	#38

;GRR3000LManagementPanel.mpas,6684 :: 		begin
;GRR3000LManagementPanel.mpas,6685 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,6686 :: 		MenuExit        := 0;
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6687 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6688 :: 		Chng[11]        := 2;
	MOV	#lo_addr(_Chng+10), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6689 :: 		AkuAkimText     := '             ';
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
;GRR3000LManagementPanel.mpas,6691 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,6693 :: 		BatteryAh           := EEPROM_Read(EE_BatteryAhEeAddr);
	MOV	#61458, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAh
;GRR3000LManagementPanel.mpas,6694 :: 		ChargeMode          := EEPROM_Read(EE_ChargeModeEeAddr);
	MOV	#61468, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ChargeMode), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6695 :: 		HucreSayisi         := EEPROM_Read(EE_HucreSayisiEeAddr);
	MOV	#61444, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _HucreSayisi
;GRR3000LManagementPanel.mpas,6696 :: 		NomHucreGerilim     := EEPROM_Read(EE_NomHucreGerilimEeAddr);
	MOV	#61446, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _NomHucreGerilim
;GRR3000LManagementPanel.mpas,6697 :: 		F_ChargePercentLo   := EEPROM_Read(EE_F_ChargePercentLoEeAddr);
	MOV	#61448, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _F_ChargePercentLo
;GRR3000LManagementPanel.mpas,6698 :: 		F_ChargePercentHi   := EEPROM_Read(EE_F_ChargePercentHiEeAddr);
	MOV	#61450, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _F_ChargePercentHi
;GRR3000LManagementPanel.mpas,6699 :: 		B_ChargePercentLo   := EEPROM_Read(EE_B_ChargePercentLoEeAddr);
	MOV	#61452, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _B_ChargePercentLo
;GRR3000LManagementPanel.mpas,6700 :: 		B_ChargePercentHi   := EEPROM_Read(EE_B_ChargePercentHiEeAddr);
	MOV	#61454, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _B_ChargePercentHi
;GRR3000LManagementPanel.mpas,6701 :: 		BoostChargeLimit    := EEPROM_Read(EE_BoostChargeLimitEeAddr);
	MOV	#61480, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BoostChargeLimit
;GRR3000LManagementPanel.mpas,6702 :: 		FloatChargeLimit    := EEPROM_Read(EE_FloatChargeLimitEeAddr);
	MOV	#61482, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _FloatChargeLimit
;GRR3000LManagementPanel.mpas,6703 :: 		DeepDischargeVolt   := EEPROM_Read(EE_DeepDischargeVoltEeAddr);
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _DeepDischargeVolt
;GRR3000LManagementPanel.mpas,6705 :: 		While (MenuExit =0) do
L__Battery_Settings2749:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Battery_Settings5448
	GOTO	L__Battery_Settings2750
L__Battery_Settings5448:
;GRR3000LManagementPanel.mpas,6709 :: 		MenuSayac := MenuButtonRead(11,255); // menu için butonlarý oku 11 satýr menü var
	MOV.B	#255, W11
	MOV.B	#11, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6711 :: 		if (Hidden_Button =0) then // fabrikadan gönderilirken bu butona basýlacak. ilk devreye almada akü ayarlarý menüsü açýlacak.
	BTSC	RA7_bit, BitPos(RA7_bit+0)
	GOTO	L__Battery_Settings2754
;GRR3000LManagementPanel.mpas,6713 :: 		Glcd_Write_Text('+',0,Row1,Black);
	ADD	W14, #14, W1
	MOV.B	#43, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #14, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6714 :: 		FirstStartUpBattMenu := 120;
	MOV	#lo_addr(_FirstStartUpBattMenu), W1
	MOV.B	#120, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6715 :: 		EEPROM_Write(EE_FirstBattMenuEeAddr, FirstStartUpBattMenu);
	MOV	#120, W12
	MOV	#61574, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6716 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2757:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2757
;GRR3000LManagementPanel.mpas,6718 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,6720 :: 		end;
L__Battery_Settings2754:
;GRR3000LManagementPanel.mpas,6722 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6724 :: 		if (MenuSayac < 8) then
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LT	L__Battery_Settings5449
	GOTO	L__Battery_Settings2762
L__Battery_Settings5449:
;GRR3000LManagementPanel.mpas,6727 :: 		if (Chng[11] = 2) then // ekrana sürekli resmi basma
	MOV	#lo_addr(_Chng+10), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Battery_Settings5450
	GOTO	L__Battery_Settings2765
L__Battery_Settings5450:
;GRR3000LManagementPanel.mpas,6734 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,6737 :: 		Glcd_Write_Text(Title_BattMenu1,      0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_BattMenu1), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6738 :: 		Glcd_Write_Text(SubTitle_BattAh,      6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_BattAh), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6739 :: 		Glcd_Write_Text(SubTitle_BattAmps,    6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_BattAmps), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6740 :: 		Glcd_Write_Text(SubTitle_ChrgMode,    6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_ChrgMode), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6741 :: 		Glcd_Write_Text(SubTitle_BoostVolt,   6, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_BoostVolt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6742 :: 		Glcd_Write_Text(SubTitle_FloatVolt,   6, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_FloatVolt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6743 :: 		Glcd_Write_Text(SubTitle_BoostTime,   6, Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_BoostTime), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6744 :: 		Glcd_Write_Text(SubTitle_DeepVolt,    6, Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_DeepVolt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6746 :: 		Chng[11] := 1;
	MOV	#lo_addr(_Chng+10), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6748 :: 		WordToStr(BatteryAh, Value_Text);
	MOV	#lo_addr(_Value_Text), W11
	MOV	_BatteryAh, W10
	CALL	_WordToStr
;GRR3000LManagementPanel.mpas,6749 :: 		WriteText := Value_Text + 'Ah';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	MOV.B	#104, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6750 :: 		Glcd_Write_Text(WriteText, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6752 :: 		ChargeModeWrite(ChargeMode,Black);
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	#1, W11
	MOV.B	[W0], W10
	CALL	_ChargeModeWrite
;GRR3000LManagementPanel.mpas,6755 :: 		Boost : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5451
	GOTO	L__Battery_Settings2770
L__Battery_Settings5451:
;GRR3000LManagementPanel.mpas,6756 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsBoostEeAddr);
	MOV	#61460, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6757 :: 		end;
	GOTO	L__Battery_Settings2767
L__Battery_Settings2770:
;GRR3000LManagementPanel.mpas,6759 :: 		Float : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Battery_Settings5452
	GOTO	L__Battery_Settings2773
L__Battery_Settings5452:
;GRR3000LManagementPanel.mpas,6760 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsFloatEeAddr);
	MOV	#61462, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6761 :: 		end;
	GOTO	L__Battery_Settings2767
L__Battery_Settings2773:
;GRR3000LManagementPanel.mpas,6763 :: 		TComp : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Battery_Settings5453
	GOTO	L__Battery_Settings2776
L__Battery_Settings5453:
;GRR3000LManagementPanel.mpas,6764 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsTCompEeAddr);
	MOV	#61464, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6765 :: 		end;
	GOTO	L__Battery_Settings2767
L__Battery_Settings2776:
;GRR3000LManagementPanel.mpas,6767 :: 		Manuel: begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Battery_Settings5454
	GOTO	L__Battery_Settings2779
L__Battery_Settings5454:
;GRR3000LManagementPanel.mpas,6768 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsManuelEeAddr);
	MOV	#61466, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6769 :: 		end;
	GOTO	L__Battery_Settings2767
L__Battery_Settings2779:
L__Battery_Settings2767:
;GRR3000LManagementPanel.mpas,6773 :: 		Temp_RealAku  := ((BatteryAmpsSet*10.0) / (BatteryAh*1.0));
	MOV	_BatteryAmpsSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
	MOV	_BatteryAh, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	PUSH.D	W2
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Div_FP
	POP.D	W2
	MOV	W0, _Temp_RealAku
	MOV	W1, _Temp_RealAku+2
;GRR3000LManagementPanel.mpas,6774 :: 		Temp_WordAku  := Temp_RealAku * 10.0;
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _Temp_WordAku
;GRR3000LManagementPanel.mpas,6775 :: 		ValueDivide(Temp_WordAku, 128);
	MOV.B	#128, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6776 :: 		ValueDivide(BatteryAmpsSet, 255);
	MOV.B	#255, W11
	MOV	_BatteryAmpsSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6777 :: 		AkuAkimText   := ValueText2 + '% - '+ Value_Text+'A';
	ADD	W14, #16, W0
	MOV	#lo_addr(_ValueText2), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	ADD	W14, #16, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,6778 :: 		Glcd_Write_Text(AkuAkimText,36 , Row3, Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6780 :: 		BoostChargeVoltage := EEPROM_Read(EE_BoostChargeVoltEeAddr);
	MOV	#61470, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BoostChargeVoltage
;GRR3000LManagementPanel.mpas,6781 :: 		ValueDivide(BoostChargeVoltage,255);
	MOV.B	#255, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6782 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6783 :: 		Glcd_Write_Text(WriteText,84 , Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6785 :: 		FloatChargeVoltage := EEPROM_Read(EE_FloatChargeVoltEeAddr);
	MOV	#61472, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _FloatChargeVoltage
;GRR3000LManagementPanel.mpas,6786 :: 		ValueDivide(FloatChargeVoltage,255);
	MOV.B	#255, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6787 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6788 :: 		Glcd_Write_Text(WriteText,84 , Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6790 :: 		BoostChargeTimeSet    := EEPROM_Read(EE_BoostChargeTimeEeAddr);
	MOV	#61474, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BoostChargeTimeSet
;GRR3000LManagementPanel.mpas,6791 :: 		ValueDivide(BoostChargeTimeSet,0);
	CLR	W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6792 :: 		WriteText := Value_Text + MinuteText;
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV	#lo_addr(_MinuteText), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,6793 :: 		Glcd_Write_Text(WriteText,84 , Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6795 :: 		DeepDischargeVolt    := EEPROM_Read(EE_DeepDischargeVoltEeAddr);
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _DeepDischargeVolt
;GRR3000LManagementPanel.mpas,6796 :: 		ValueDivide(DeepDischargeVolt,255);
	MOV.B	#255, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6797 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6798 :: 		Glcd_Write_Text(WriteText,84 , Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6801 :: 		end;
L__Battery_Settings2765:
;GRR3000LManagementPanel.mpas,6802 :: 		end else
	GOTO	L__Battery_Settings2763
L__Battery_Settings2762:
;GRR3000LManagementPanel.mpas,6803 :: 		if (MenuSayac >= 8) then
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA GE	L__Battery_Settings5455
	GOTO	L__Battery_Settings2781
L__Battery_Settings5455:
;GRR3000LManagementPanel.mpas,6805 :: 		if (Chng[11] = 1) then   // ekrana sürekli resmi basma
	MOV	#lo_addr(_Chng+10), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5456
	GOTO	L__Battery_Settings2784
L__Battery_Settings5456:
;GRR3000LManagementPanel.mpas,6812 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,6815 :: 		Glcd_Write_Text(Title_BattMenu2,      0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_BattMenu2), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6816 :: 		Glcd_Write_Text(SubTitle_BFMode,      6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_BFMode), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6817 :: 		Glcd_Write_Text(SubTitle_Blimit,      6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Blimit), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6818 :: 		Glcd_Write_Text(SubTitle_Flimit,      6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Flimit), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6819 :: 		Glcd_Write_Text(SubTitle_Back,        6, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6821 :: 		Chng[11] := 2;
	MOV	#lo_addr(_Chng+10), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6823 :: 		AutoBFMode := EEPROM_Read(EE_AutoBFModeEeAddr);
	MOV	#61478, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_AutoBFMode), W1
	BSET	[W1], BitPos(_AutoBFMode+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_AutoBFMode+0)
;GRR3000LManagementPanel.mpas,6825 :: 		if (AutoBFMode =0) then Glcd_Write_Text(DisableText, 84, Row2, Black) else
	MOV	#lo_addr(_AutoBFMode), W0
	BTSC	[W0], BitPos(_AutoBFMode+0)
	GOTO	L__Battery_Settings2787
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Battery_Settings2788
L__Battery_Settings2787:
;GRR3000LManagementPanel.mpas,6826 :: 		if (AutoBFMode =1) then Glcd_Write_Text(EnableText, 84, Row2, Black);
	MOV	#lo_addr(_AutoBFMode), W0
	BTSS	[W0], BitPos(_AutoBFMode+0)
	GOTO	L__Battery_Settings2790
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
L__Battery_Settings2790:
L__Battery_Settings2788:
;GRR3000LManagementPanel.mpas,6828 :: 		BoostChargeLimit    := EEPROM_Read(EE_BoostChargeLimitEeAddr);
	MOV	#61480, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BoostChargeLimit
;GRR3000LManagementPanel.mpas,6829 :: 		ValueDivide(BoostChargeLimit, 255);
	MOV.B	#255, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6830 :: 		WriteText := Value_Text + 'A';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6831 :: 		Glcd_Write_Text(WriteText,84 , Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6833 :: 		FloatChargeLimit    := EEPROM_Read(EE_FloatChargeLimitEeAddr);
	MOV	#61482, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _FloatChargeLimit
;GRR3000LManagementPanel.mpas,6834 :: 		ValueDivide(FloatChargeLimit, 255);
	MOV.B	#255, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6835 :: 		WriteText := Value_Text + 'A';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6836 :: 		Glcd_Write_Text(WriteText,84 , Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6838 :: 		end;
L__Battery_Settings2784:
;GRR3000LManagementPanel.mpas,6839 :: 		end;
L__Battery_Settings2781:
L__Battery_Settings2763:
;GRR3000LManagementPanel.mpas,6846 :: 		1: begin // akü ah
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5457
	GOTO	L__Battery_Settings2795
L__Battery_Settings5457:
;GRR3000LManagementPanel.mpas,6848 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings2797
;GRR3000LManagementPanel.mpas,6850 :: 		while (Ok_Button =0) do
L__Battery_Settings2800:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings2801
;GRR3000LManagementPanel.mpas,6852 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6853 :: 		end;
	GOTO	L__Battery_Settings2800
L__Battery_Settings2801:
;GRR3000LManagementPanel.mpas,6855 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6857 :: 		While (Chng[1] =1) do
L__Battery_Settings2805:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5458
	GOTO	L__Battery_Settings2806
L__Battery_Settings5458:
;GRR3000LManagementPanel.mpas,6860 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6862 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings2810
;GRR3000LManagementPanel.mpas,6864 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6865 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6866 :: 		while (ButonStop = 0) do
L__Battery_Settings2813:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings2814
;GRR3000LManagementPanel.mpas,6868 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6869 :: 		end;
	GOTO	L__Battery_Settings2813
L__Battery_Settings2814:
;GRR3000LManagementPanel.mpas,6870 :: 		Inc(BatteryAh);
	MOV	#1, W1
	MOV	#lo_addr(_BatteryAh), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6871 :: 		if (BatteryAh >1000) then BatteryAh := 7;  // 7 - 500Ah arasý
	MOV	_BatteryAh, W1
	MOV	#1000, W0
	CP	W1, W0
	BRA GTU	L__Battery_Settings5459
	GOTO	L__Battery_Settings2818
L__Battery_Settings5459:
	MOV	#7, W0
	MOV	W0, _BatteryAh
L__Battery_Settings2818:
;GRR3000LManagementPanel.mpas,6872 :: 		end else
	GOTO	L__Battery_Settings2811
L__Battery_Settings2810:
;GRR3000LManagementPanel.mpas,6873 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings2821
;GRR3000LManagementPanel.mpas,6875 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,6876 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,6877 :: 		while (ButonStop = 0) do
L__Battery_Settings2824:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings2825
;GRR3000LManagementPanel.mpas,6879 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6880 :: 		end;
	GOTO	L__Battery_Settings2824
L__Battery_Settings2825:
;GRR3000LManagementPanel.mpas,6881 :: 		Dec(BatteryAh);
	MOV	#1, W1
	MOV	#lo_addr(_BatteryAh), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,6882 :: 		if (BatteryAh < 7) then BatteryAh := 1000;
	MOV	_BatteryAh, W0
	CP	W0, #7
	BRA LTU	L__Battery_Settings5460
	GOTO	L__Battery_Settings2829
L__Battery_Settings5460:
	MOV	#1000, W0
	MOV	W0, _BatteryAh
L__Battery_Settings2829:
;GRR3000LManagementPanel.mpas,6883 :: 		end;
L__Battery_Settings2821:
L__Battery_Settings2811:
;GRR3000LManagementPanel.mpas,6887 :: 		WordToStr(BatteryAh, Value_Text);
	MOV	#lo_addr(_Value_Text), W11
	MOV	_BatteryAh, W10
	CALL	_WordToStr
;GRR3000LManagementPanel.mpas,6888 :: 		WriteText := Value_Text + 'Ah';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	MOV.B	#104, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,6889 :: 		Glcd_Write_Text(WriteText, 84, Row2, White);
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6891 :: 		if (ChargeMode = Boost) then // þarj modu hýzlý ise
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5461
	GOTO	L__Battery_Settings2832
L__Battery_Settings5461:
;GRR3000LManagementPanel.mpas,6895 :: 		BatteryAmpsSet := BatteryAh*2;
	MOV	_BatteryAh, W0
	SL	W0, #1, W2
	MOV	W2, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6896 :: 		if (BatteryAmpsSet > (RedresorAkim*10)) then BatteryAmpsSet := (RedresorAkim*10); // 06.01.2020 TEÝAÞ isteðiyle akü ah deðeri ayarlanýrken akü þarj akýmý, redresör akýmýnýn üzerine çýkmayacak.
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	CP	W2, W0
	BRA GTU	L__Battery_Settings5462
	GOTO	L__Battery_Settings2835
L__Battery_Settings5462:
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2835:
;GRR3000LManagementPanel.mpas,6900 :: 		Temp_RealAku  := ((BatteryAmpsSet*10.0) / (BatteryAh*1.0));
	MOV	_BatteryAmpsSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
	MOV	_BatteryAh, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	PUSH.D	W2
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Div_FP
	POP.D	W2
	MOV	W0, _Temp_RealAku
	MOV	W1, _Temp_RealAku+2
;GRR3000LManagementPanel.mpas,6901 :: 		Temp_WordAku  := Temp_RealAku * 10.0;
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _Temp_WordAku
;GRR3000LManagementPanel.mpas,6902 :: 		ValueDivide(Temp_WordAku, 128);
	MOV.B	#128, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6903 :: 		ValueDivide(BatteryAmpsSet, 255);
	MOV.B	#255, W11
	MOV	_BatteryAmpsSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6904 :: 		AkuAkimText   := ValueText2 + '% - '+ Value_Text+'A';
	ADD	W14, #16, W0
	MOV	#lo_addr(_ValueText2), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	ADD	W14, #16, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,6905 :: 		Glcd_Write_Text(AkuAkimText,36 , Row3, Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6907 :: 		end else
	GOTO	L__Battery_Settings2833
L__Battery_Settings2832:
;GRR3000LManagementPanel.mpas,6908 :: 		if ((ChargeMode = Float)or(ChargeMode = Tcomp)or(ChargeMode = Manuel))then // þarj modu hýzlý deðilse
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR	W1
	BRA NZ	L__Battery_Settings5463
	COM	W1
L__Battery_Settings5463:
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	CLR	W0
	BRA NZ	L__Battery_Settings5464
	COM	W0
L__Battery_Settings5464:
	IOR	W1, W0, W1
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	CLR	W0
	BRA NZ	L__Battery_Settings5465
	COM	W0
L__Battery_Settings5465:
	IOR	W1, W0, W0
	BRA NZ	L__Battery_Settings5466
	GOTO	L__Battery_Settings2838
L__Battery_Settings5466:
;GRR3000LManagementPanel.mpas,6911 :: 		BatteryAmpsSet := BatteryAh;
	MOV	_BatteryAh, W0
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6912 :: 		if (BatteryAmpsSet > (RedresorAkim*10)) then BatteryAmpsSet := (RedresorAkim*10); // 06.01.2020 TEÝAÞ isteðiyle akü ah deðeri ayarlanýrken akü þarj akýmý, redresör akýmýnýn üzerine çýkmayacak.
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_BatteryAh), W0
	CP	W2, [W0]
	BRA LTU	L__Battery_Settings5467
	GOTO	L__Battery_Settings2841
L__Battery_Settings5467:
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2841:
;GRR3000LManagementPanel.mpas,6915 :: 		Temp_RealAku  := ((BatteryAmpsSet*10.0) / (BatteryAh*1.0));
	MOV	_BatteryAmpsSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
	MOV	_BatteryAh, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	PUSH.D	W2
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Div_FP
	POP.D	W2
	MOV	W0, _Temp_RealAku
	MOV	W1, _Temp_RealAku+2
;GRR3000LManagementPanel.mpas,6916 :: 		Temp_WordAku  := Temp_RealAku * 10.0;
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _Temp_WordAku
;GRR3000LManagementPanel.mpas,6917 :: 		ValueDivide(Temp_WordAku, 128);
	MOV.B	#128, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6918 :: 		ValueDivide(BatteryAmpsSet, 255);
	MOV.B	#255, W11
	MOV	_BatteryAmpsSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6919 :: 		AkuAkimText   := ValueText2 + '% - '+ Value_Text+'A';
	ADD	W14, #16, W0
	MOV	#lo_addr(_ValueText2), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	ADD	W14, #16, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,6920 :: 		Glcd_Write_Text(AkuAkimText,36 , Row3, Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6922 :: 		end;
L__Battery_Settings2838:
L__Battery_Settings2833:
;GRR3000LManagementPanel.mpas,6927 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings2844
;GRR3000LManagementPanel.mpas,6929 :: 		while (Ok_Button =0) do
L__Battery_Settings2847:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings2848
;GRR3000LManagementPanel.mpas,6931 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,6932 :: 		end;
	GOTO	L__Battery_Settings2847
L__Battery_Settings2848:
;GRR3000LManagementPanel.mpas,6934 :: 		EEPROM_Write(EE_BatteryAhEeAddr, BatteryAh);
	MOV	_BatteryAh, W12
	MOV	#61458, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6935 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2852:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2852
;GRR3000LManagementPanel.mpas,6937 :: 		BoostChargeLimit := BatteryAh *2;
	MOV	_BatteryAh, W0
	SL	W0, #1, W0
	MOV	W0, _BoostChargeLimit
;GRR3000LManagementPanel.mpas,6938 :: 		EEPROM_Write(EE_BoostChargeLimitEeAddr, BoostChargeLimit);
	MOV	W0, W12
	MOV	#61480, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6939 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2857:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2857
;GRR3000LManagementPanel.mpas,6941 :: 		FloatChargeLimit := BatteryAh;
	MOV	_BatteryAh, W0
	MOV	W0, _FloatChargeLimit
;GRR3000LManagementPanel.mpas,6942 :: 		EEPROM_Write(EE_FloatChargeLimitEeAddr, FloatChargeLimit);
	MOV	_BatteryAh, W12
	MOV	#61482, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6943 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2862:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2862
;GRR3000LManagementPanel.mpas,6946 :: 		if (BatteryAmpsSet > (BatteryAh*2)) then BatteryAmpsSet := RedresorAkim*10; // 06.01.2020 TEÝAÞ isteðiyle akü ah deðeri ayarlanýrken akü þarj akýmý, redresör akýmýnýn üzerine çýkmayacak.
	MOV	_BatteryAh, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_BatteryAmpsSet), W0
	CP	W1, [W0]
	BRA LTU	L__Battery_Settings5468
	GOTO	L__Battery_Settings2867
L__Battery_Settings5468:
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2867:
;GRR3000LManagementPanel.mpas,6947 :: 		EEPROM_Write(EE_BatteryAmpsBoostEeAddr, BatteryAmpsSet);
	MOV	_BatteryAmpsSet, W12
	MOV	#61460, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6948 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2870:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2870
;GRR3000LManagementPanel.mpas,6950 :: 		EEPROM_Write(EE_BatteryAmpsFloatEeAddr, BatteryAmpsSet);
	MOV	_BatteryAmpsSet, W12
	MOV	#61462, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6951 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2875:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2875
;GRR3000LManagementPanel.mpas,6953 :: 		EEPROM_Write(EE_BatteryAmpsManuelEeAddr, BatteryAmpsSet);
	MOV	_BatteryAmpsSet, W12
	MOV	#61466, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6954 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2880:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2880
;GRR3000LManagementPanel.mpas,6956 :: 		EEPROM_Write(EE_BatteryAmpsTCompEeAddr, BatteryAmpsSet);
	MOV	_BatteryAmpsSet, W12
	MOV	#61464, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,6957 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2885:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2885
;GRR3000LManagementPanel.mpas,6959 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,6960 :: 		Glcd_Write_Text(WriteText, 84, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6963 :: 		Boost : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5469
	GOTO	L__Battery_Settings2892
L__Battery_Settings5469:
;GRR3000LManagementPanel.mpas,6964 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsBoostEeAddr);
	MOV	#61460, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6965 :: 		end;
	GOTO	L__Battery_Settings2889
L__Battery_Settings2892:
;GRR3000LManagementPanel.mpas,6967 :: 		Float : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Battery_Settings5470
	GOTO	L__Battery_Settings2895
L__Battery_Settings5470:
;GRR3000LManagementPanel.mpas,6968 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsFloatEeAddr);
	MOV	#61462, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6969 :: 		end;
	GOTO	L__Battery_Settings2889
L__Battery_Settings2895:
;GRR3000LManagementPanel.mpas,6971 :: 		TComp : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Battery_Settings5471
	GOTO	L__Battery_Settings2898
L__Battery_Settings5471:
;GRR3000LManagementPanel.mpas,6972 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsTCompEeAddr);
	MOV	#61464, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6973 :: 		end;
	GOTO	L__Battery_Settings2889
L__Battery_Settings2898:
;GRR3000LManagementPanel.mpas,6975 :: 		Manuel: begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Battery_Settings5472
	GOTO	L__Battery_Settings2901
L__Battery_Settings5472:
;GRR3000LManagementPanel.mpas,6976 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsManuelEeAddr);
	MOV	#61466, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,6977 :: 		end;
	GOTO	L__Battery_Settings2889
L__Battery_Settings2901:
L__Battery_Settings2889:
;GRR3000LManagementPanel.mpas,6981 :: 		Temp_RealAku  := ((BatteryAmpsSet*10.0) / (BatteryAh*1.0));
	MOV	_BatteryAmpsSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
	MOV	_BatteryAh, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	PUSH.D	W2
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Div_FP
	POP.D	W2
	MOV	W0, _Temp_RealAku
	MOV	W1, _Temp_RealAku+2
;GRR3000LManagementPanel.mpas,6982 :: 		Temp_WordAku  := Temp_RealAku * 10.0;
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _Temp_WordAku
;GRR3000LManagementPanel.mpas,6983 :: 		ValueDivide(Temp_WordAku, 128);
	MOV.B	#128, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6984 :: 		ValueDivide(BatteryAmpsSet, 255);
	MOV.B	#255, W11
	MOV	_BatteryAmpsSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,6985 :: 		AkuAkimText   := ValueText2 + '% - '+ Value_Text+'A';
	ADD	W14, #16, W0
	MOV	#lo_addr(_ValueText2), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	ADD	W14, #16, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,6986 :: 		Glcd_Write_Text(AkuAkimText,36 , Row3, Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,6988 :: 		end;
L__Battery_Settings2844:
;GRR3000LManagementPanel.mpas,6993 :: 		end; // chng[1] while end
	GOTO	L__Battery_Settings2805
L__Battery_Settings2806:
;GRR3000LManagementPanel.mpas,6996 :: 		end;
L__Battery_Settings2797:
;GRR3000LManagementPanel.mpas,6999 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings2795:
;GRR3000LManagementPanel.mpas,7001 :: 		2: begin // akü akým
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Battery_Settings5473
	GOTO	L__Battery_Settings2904
L__Battery_Settings5473:
;GRR3000LManagementPanel.mpas,7004 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings2906
;GRR3000LManagementPanel.mpas,7006 :: 		while (Ok_Button =0) do
L__Battery_Settings2909:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings2910
;GRR3000LManagementPanel.mpas,7008 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7009 :: 		end;
	GOTO	L__Battery_Settings2909
L__Battery_Settings2910:
;GRR3000LManagementPanel.mpas,7011 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7013 :: 		While (Chng[2] =1) do
L__Battery_Settings2914:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5474
	GOTO	L__Battery_Settings2915
L__Battery_Settings5474:
;GRR3000LManagementPanel.mpas,7015 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7017 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings2919
;GRR3000LManagementPanel.mpas,7019 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7020 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7021 :: 		while (ButonStop = 0) do
L__Battery_Settings2922:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings2923
;GRR3000LManagementPanel.mpas,7023 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7024 :: 		end;
	GOTO	L__Battery_Settings2922
L__Battery_Settings2923:
;GRR3000LManagementPanel.mpas,7025 :: 		Inc(BatteryAmpsSet);
	MOV	#1, W1
	MOV	#lo_addr(_BatteryAmpsSet), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7026 :: 		if ((ChargeMode = Boost)or(ChargeMode = Manuel)) then // þarj modu hýzlýysa veya manuelse
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	CLR	W1
	BRA NZ	L__Battery_Settings5475
	COM	W1
L__Battery_Settings5475:
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	CLR	W0
	BRA NZ	L__Battery_Settings5476
	COM	W0
L__Battery_Settings5476:
	IOR	W1, W0, W0
	BRA NZ	L__Battery_Settings5477
	GOTO	L__Battery_Settings2927
L__Battery_Settings5477:
;GRR3000LManagementPanel.mpas,7028 :: 		if (BatteryAmpsSet > (BatteryAh * 2)) then BatteryAmpsSet := (BatteryAh *2); // 0.2C ile
	MOV	_BatteryAh, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_BatteryAmpsSet), W0
	CP	W1, [W0]
	BRA LTU	L__Battery_Settings5478
	GOTO	L__Battery_Settings2930
L__Battery_Settings5478:
	MOV	_BatteryAh, W0
	SL	W0, #1, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2930:
;GRR3000LManagementPanel.mpas,7029 :: 		if (BatteryAmpsSet > (RedresorAkim*10)) then BatteryAmpsSet := (RedresorAkim*10); // 06.01.2020 TEÝAÞ isteðiyle akü ah deðeri ayarlanýrken akü þarj akýmý, redresör akýmýnýn üzerine çýkmayacak.
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_BatteryAmpsSet), W0
	CP	W2, [W0]
	BRA LTU	L__Battery_Settings5479
	GOTO	L__Battery_Settings2933
L__Battery_Settings5479:
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2933:
;GRR3000LManagementPanel.mpas,7030 :: 		end else
	GOTO	L__Battery_Settings2928
L__Battery_Settings2927:
;GRR3000LManagementPanel.mpas,7031 :: 		if ((ChargeMode = Float)or(ChargeMode = TComp)) then // þarj normal veya sýcaklýk kompanzasyonsa
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR	W1
	BRA NZ	L__Battery_Settings5480
	COM	W1
L__Battery_Settings5480:
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	CLR	W0
	BRA NZ	L__Battery_Settings5481
	COM	W0
L__Battery_Settings5481:
	IOR	W1, W0, W0
	BRA NZ	L__Battery_Settings5482
	GOTO	L__Battery_Settings2936
L__Battery_Settings5482:
;GRR3000LManagementPanel.mpas,7033 :: 		if (BatteryAmpsSet > (BatteryAh * 1)) then BatteryAmpsSet := (BatteryAh *1); // 0.1C ile
	MOV	_BatteryAmpsSet, W1
	MOV	#lo_addr(_BatteryAh), W0
	CP	W1, [W0]
	BRA GTU	L__Battery_Settings5483
	GOTO	L__Battery_Settings2939
L__Battery_Settings5483:
	MOV	_BatteryAh, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2939:
;GRR3000LManagementPanel.mpas,7034 :: 		if (BatteryAmpsSet > (RedresorAkim*10)) then BatteryAmpsSet := (RedresorAkim*10); // 06.01.2020 TEÝAÞ isteðiyle akü ah deðeri ayarlanýrken akü þarj akýmý, redresör akýmýnýn üzerine çýkmayacak.
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_BatteryAmpsSet), W0
	CP	W2, [W0]
	BRA LTU	L__Battery_Settings5484
	GOTO	L__Battery_Settings2942
L__Battery_Settings5484:
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2942:
;GRR3000LManagementPanel.mpas,7035 :: 		end;
L__Battery_Settings2936:
L__Battery_Settings2928:
;GRR3000LManagementPanel.mpas,7036 :: 		end else
	GOTO	L__Battery_Settings2920
L__Battery_Settings2919:
;GRR3000LManagementPanel.mpas,7037 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings2945
;GRR3000LManagementPanel.mpas,7039 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7040 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7041 :: 		while (ButonStop = 0) do
L__Battery_Settings2948:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings2949
;GRR3000LManagementPanel.mpas,7043 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7044 :: 		end;
	GOTO	L__Battery_Settings2948
L__Battery_Settings2949:
;GRR3000LManagementPanel.mpas,7045 :: 		Dec(BatteryAmpsSet);
	MOV	#1, W1
	MOV	#lo_addr(_BatteryAmpsSet), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7046 :: 		if (ChargeMode = Boost) then // þarj modu hýzlýysa
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5485
	GOTO	L__Battery_Settings2953
L__Battery_Settings5485:
;GRR3000LManagementPanel.mpas,7048 :: 		if (BatteryAmpsSet < (BatteryAh * 1)) then BatteryAmpsSet := (BatteryAh *1); // 0.1C ye kadar
	MOV	_BatteryAmpsSet, W1
	MOV	#lo_addr(_BatteryAh), W0
	CP	W1, [W0]
	BRA LTU	L__Battery_Settings5486
	GOTO	L__Battery_Settings2956
L__Battery_Settings5486:
	MOV	_BatteryAh, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2956:
;GRR3000LManagementPanel.mpas,7049 :: 		if (BatteryAmpsSet > (RedresorAkim*10)) then BatteryAmpsSet := (RedresorAkim*10); // 06.01.2020 TEÝAÞ isteðiyle akü ah deðeri ayarlanýrken akü þarj akýmý, redresör akýmýnýn üzerine çýkmayacak.
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_BatteryAmpsSet), W0
	CP	W2, [W0]
	BRA LTU	L__Battery_Settings5487
	GOTO	L__Battery_Settings2959
L__Battery_Settings5487:
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2959:
;GRR3000LManagementPanel.mpas,7050 :: 		end else
	GOTO	L__Battery_Settings2954
L__Battery_Settings2953:
;GRR3000LManagementPanel.mpas,7051 :: 		if ((ChargeMode = Float)or(ChargeMode = TComp)or(ChargeMode = Manuel)) then // þarj normal veya sýcaklýk kompanzasyon veya Manuel ise
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	CLR	W1
	BRA NZ	L__Battery_Settings5488
	COM	W1
L__Battery_Settings5488:
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	CLR	W0
	BRA NZ	L__Battery_Settings5489
	COM	W0
L__Battery_Settings5489:
	IOR	W1, W0, W1
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	CLR	W0
	BRA NZ	L__Battery_Settings5490
	COM	W0
L__Battery_Settings5490:
	IOR	W1, W0, W0
	BRA NZ	L__Battery_Settings5491
	GOTO	L__Battery_Settings2962
L__Battery_Settings5491:
;GRR3000LManagementPanel.mpas,7053 :: 		if (BatteryAmpsSet < 1) then BatteryAmpsSet := 1; // 0.1A e kadar
	MOV	_BatteryAmpsSet, W0
	CP	W0, #1
	BRA LTU	L__Battery_Settings5492
	GOTO	L__Battery_Settings2965
L__Battery_Settings5492:
	MOV	#1, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2965:
;GRR3000LManagementPanel.mpas,7054 :: 		if (BatteryAmpsSet > (RedresorAkim*10)) then BatteryAmpsSet := (RedresorAkim*10); // 06.01.2020 TEÝAÞ isteðiyle akü ah deðeri ayarlanýrken akü þarj akýmý, redresör akýmýnýn üzerine çýkmayacak.
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_BatteryAmpsSet), W0
	CP	W2, [W0]
	BRA LTU	L__Battery_Settings5493
	GOTO	L__Battery_Settings2968
L__Battery_Settings5493:
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _BatteryAmpsSet
L__Battery_Settings2968:
;GRR3000LManagementPanel.mpas,7055 :: 		end;
L__Battery_Settings2962:
L__Battery_Settings2954:
;GRR3000LManagementPanel.mpas,7056 :: 		end;
L__Battery_Settings2945:
L__Battery_Settings2920:
;GRR3000LManagementPanel.mpas,7058 :: 		Temp_RealAku  := ((BatteryAmpsSet*10.0) / (BatteryAh*1.0));
	MOV	_BatteryAmpsSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
	MOV	_BatteryAh, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	PUSH.D	W2
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Div_FP
	POP.D	W2
	MOV	W0, _Temp_RealAku
	MOV	W1, _Temp_RealAku+2
;GRR3000LManagementPanel.mpas,7059 :: 		Temp_WordAku  := Temp_RealAku * 10.0;
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _Temp_WordAku
;GRR3000LManagementPanel.mpas,7060 :: 		ValueDivide(Temp_WordAku, 128);
	MOV.B	#128, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7061 :: 		ValueDivide(BatteryAmpsSet, 255);
	MOV.B	#255, W11
	MOV	_BatteryAmpsSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7062 :: 		AkuAkimText   := ValueText2 + '% - '+ Value_Text+'A';
	ADD	W14, #16, W0
	MOV	#lo_addr(_ValueText2), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	ADD	W14, #16, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,7063 :: 		Glcd_Write_Text(AkuAkimText,36 , Row3, 0);
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7066 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings2971
;GRR3000LManagementPanel.mpas,7068 :: 		while (Ok_Button =0) do
L__Battery_Settings2974:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings2975
;GRR3000LManagementPanel.mpas,7070 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7071 :: 		end;
	GOTO	L__Battery_Settings2974
L__Battery_Settings2975:
;GRR3000LManagementPanel.mpas,7075 :: 		Boost : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5494
	GOTO	L__Battery_Settings2981
L__Battery_Settings5494:
;GRR3000LManagementPanel.mpas,7076 :: 		EEPROM_Write(EE_BatteryAmpsBoostEeAddr, BatteryAmpsSet);
	MOV	_BatteryAmpsSet, W12
	MOV	#61460, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7077 :: 		end;
	GOTO	L__Battery_Settings2978
L__Battery_Settings2981:
;GRR3000LManagementPanel.mpas,7079 :: 		Float : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Battery_Settings5495
	GOTO	L__Battery_Settings2984
L__Battery_Settings5495:
;GRR3000LManagementPanel.mpas,7080 :: 		EEPROM_Write(EE_BatteryAmpsFloatEeAddr, BatteryAmpsSet);
	MOV	_BatteryAmpsSet, W12
	MOV	#61462, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7081 :: 		end;
	GOTO	L__Battery_Settings2978
L__Battery_Settings2984:
;GRR3000LManagementPanel.mpas,7083 :: 		TComp : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Battery_Settings5496
	GOTO	L__Battery_Settings2987
L__Battery_Settings5496:
;GRR3000LManagementPanel.mpas,7084 :: 		EEPROM_Write(EE_BatteryAmpsTCompEeAddr, BatteryAmpsSet);
	MOV	_BatteryAmpsSet, W12
	MOV	#61464, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7085 :: 		end;
	GOTO	L__Battery_Settings2978
L__Battery_Settings2987:
;GRR3000LManagementPanel.mpas,7087 :: 		Manuel: begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Battery_Settings5497
	GOTO	L__Battery_Settings2990
L__Battery_Settings5497:
;GRR3000LManagementPanel.mpas,7088 :: 		EEPROM_Write(EE_BatteryAmpsManuelEeAddr, BatteryAmpsSet);
	MOV	_BatteryAmpsSet, W12
	MOV	#61466, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7089 :: 		end;
	GOTO	L__Battery_Settings2978
L__Battery_Settings2990:
L__Battery_Settings2978:
;GRR3000LManagementPanel.mpas,7094 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings2992:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings2992
;GRR3000LManagementPanel.mpas,7096 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7097 :: 		Glcd_Write_Text(AkuAkimText,36 , Row3, Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7101 :: 		end;
L__Battery_Settings2971:
;GRR3000LManagementPanel.mpas,7106 :: 		end; // chng[2] while end
	GOTO	L__Battery_Settings2914
L__Battery_Settings2915:
;GRR3000LManagementPanel.mpas,7109 :: 		end;
L__Battery_Settings2906:
;GRR3000LManagementPanel.mpas,7112 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings2904:
;GRR3000LManagementPanel.mpas,7114 :: 		3: begin // þarj modu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Battery_Settings5498
	GOTO	L__Battery_Settings2998
L__Battery_Settings5498:
;GRR3000LManagementPanel.mpas,7116 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3000
;GRR3000LManagementPanel.mpas,7118 :: 		while (Ok_Button =0) do
L__Battery_Settings3003:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3004
;GRR3000LManagementPanel.mpas,7120 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7121 :: 		end;
	GOTO	L__Battery_Settings3003
L__Battery_Settings3004:
;GRR3000LManagementPanel.mpas,7123 :: 		Chng[3] := 1;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7125 :: 		While (Chng[3] =1) do
L__Battery_Settings3008:
	MOV	#lo_addr(_Chng+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5499
	GOTO	L__Battery_Settings3009
L__Battery_Settings5499:
;GRR3000LManagementPanel.mpas,7127 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7129 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings3013
;GRR3000LManagementPanel.mpas,7131 :: 		while (Up_Button = 0) do
L__Battery_Settings3016:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings3017
;GRR3000LManagementPanel.mpas,7133 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7134 :: 		end;
	GOTO	L__Battery_Settings3016
L__Battery_Settings3017:
;GRR3000LManagementPanel.mpas,7135 :: 		Inc(ChargeMode);
	MOV.B	#1, W1
	MOV	#lo_addr(_ChargeMode), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7136 :: 		if (ChargeMode >4) then ChargeMode := 1;
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA GTU	L__Battery_Settings5500
	GOTO	L__Battery_Settings3021
L__Battery_Settings5500:
	MOV	#lo_addr(_ChargeMode), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
L__Battery_Settings3021:
;GRR3000LManagementPanel.mpas,7137 :: 		end else
	GOTO	L__Battery_Settings3014
L__Battery_Settings3013:
;GRR3000LManagementPanel.mpas,7138 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings3024
;GRR3000LManagementPanel.mpas,7140 :: 		while (Down_Button = 0) do
L__Battery_Settings3027:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings3028
;GRR3000LManagementPanel.mpas,7142 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7143 :: 		end;
	GOTO	L__Battery_Settings3027
L__Battery_Settings3028:
;GRR3000LManagementPanel.mpas,7144 :: 		Dec(ChargeMode);
	MOV.B	#1, W1
	MOV	#lo_addr(_ChargeMode), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7145 :: 		if (ChargeMode < 1) then ChargeMode := 4;
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LTU	L__Battery_Settings5501
	GOTO	L__Battery_Settings3032
L__Battery_Settings5501:
	MOV	#lo_addr(_ChargeMode), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
L__Battery_Settings3032:
;GRR3000LManagementPanel.mpas,7146 :: 		end;
L__Battery_Settings3024:
L__Battery_Settings3014:
;GRR3000LManagementPanel.mpas,7148 :: 		ChargeModeWrite(ChargeMode,0);
	MOV	#lo_addr(_ChargeMode), W0
	CLR	W11
	MOV.B	[W0], W10
	CALL	_ChargeModeWrite
;GRR3000LManagementPanel.mpas,7151 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3035
;GRR3000LManagementPanel.mpas,7153 :: 		while (Ok_Button =0) do
L__Battery_Settings3038:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3039
;GRR3000LManagementPanel.mpas,7155 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7156 :: 		end;
	GOTO	L__Battery_Settings3038
L__Battery_Settings3039:
;GRR3000LManagementPanel.mpas,7158 :: 		EEPROM_Write(EE_ChargeModeEeAddr, ChargeMode);
	MOV	#lo_addr(_ChargeMode), W0
	ZE	[W0], W12
	MOV	#61468, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7159 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3043:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3043
;GRR3000LManagementPanel.mpas,7161 :: 		Chng[3] := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7162 :: 		ChargeModeWrite(ChargeMode,black);
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	#1, W11
	MOV.B	[W0], W10
	CALL	_ChargeModeWrite
;GRR3000LManagementPanel.mpas,7165 :: 		Boost : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5502
	GOTO	L__Battery_Settings3050
L__Battery_Settings5502:
;GRR3000LManagementPanel.mpas,7166 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsBoostEeAddr);
	MOV	#61460, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,7168 :: 		end;
	GOTO	L__Battery_Settings3047
L__Battery_Settings3050:
;GRR3000LManagementPanel.mpas,7170 :: 		Float : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Battery_Settings5503
	GOTO	L__Battery_Settings3053
L__Battery_Settings5503:
;GRR3000LManagementPanel.mpas,7171 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsFloatEeAddr);
	MOV	#61462, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,7173 :: 		end;
	GOTO	L__Battery_Settings3047
L__Battery_Settings3053:
;GRR3000LManagementPanel.mpas,7175 :: 		TComp : begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Battery_Settings5504
	GOTO	L__Battery_Settings3056
L__Battery_Settings5504:
;GRR3000LManagementPanel.mpas,7176 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsTCompEeAddr);
	MOV	#61464, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,7177 :: 		end;
	GOTO	L__Battery_Settings3047
L__Battery_Settings3056:
;GRR3000LManagementPanel.mpas,7179 :: 		Manuel: begin
	MOV	#lo_addr(_ChargeMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Battery_Settings5505
	GOTO	L__Battery_Settings3059
L__Battery_Settings5505:
;GRR3000LManagementPanel.mpas,7180 :: 		BatteryAmpsSet := EEPROM_Read(EE_BatteryAmpsManuelEeAddr);
	MOV	#61466, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,7182 :: 		end;
	GOTO	L__Battery_Settings3047
L__Battery_Settings3059:
L__Battery_Settings3047:
;GRR3000LManagementPanel.mpas,7186 :: 		Temp_RealAku  := ((BatteryAmpsSet*10.0) / (BatteryAh*1.0));
	MOV	_BatteryAmpsSet, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	MOV	W0, [W14+34]
	MOV	W1, [W14+36]
	MOV	_BatteryAh, W0
	CLR	W1
	CALL	__Long2Float
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	[W14+34], W0
	MOV	[W14+36], W1
	PUSH.D	W2
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Div_FP
	POP.D	W2
	MOV	W0, _Temp_RealAku
	MOV	W1, _Temp_RealAku+2
;GRR3000LManagementPanel.mpas,7187 :: 		Temp_WordAku  := Temp_RealAku * 10.0;
	MOV	#0, W2
	MOV	#16672, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _Temp_WordAku
;GRR3000LManagementPanel.mpas,7188 :: 		ValueDivide(Temp_WordAku, 128);
	MOV.B	#128, W11
	MOV	W0, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7189 :: 		ValueDivide(BatteryAmpsSet, 255);
	MOV.B	#255, W11
	MOV	_BatteryAmpsSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7190 :: 		AkuAkimText   := ValueText2 + '% - '+ Value_Text;
	ADD	W14, #16, W0
	MOV	#lo_addr(_ValueText2), W1
	CALL	___CS2S
	MOV.B	#37, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	ADD	W14, #16, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,7191 :: 		Glcd_Write_Text(AkuAkimText,36 , Row3, Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#36, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7195 :: 		end;
L__Battery_Settings3035:
;GRR3000LManagementPanel.mpas,7200 :: 		end; // chng[3] while end
	GOTO	L__Battery_Settings3008
L__Battery_Settings3009:
;GRR3000LManagementPanel.mpas,7203 :: 		end;
L__Battery_Settings3000:
;GRR3000LManagementPanel.mpas,7204 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings2998:
;GRR3000LManagementPanel.mpas,7206 :: 		4: begin // hýzlý þarj gerilim
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Battery_Settings5506
	GOTO	L__Battery_Settings3062
L__Battery_Settings5506:
;GRR3000LManagementPanel.mpas,7208 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3064
;GRR3000LManagementPanel.mpas,7210 :: 		while (Ok_Button =0) do
L__Battery_Settings3067:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3068
;GRR3000LManagementPanel.mpas,7212 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7213 :: 		end;
	GOTO	L__Battery_Settings3067
L__Battery_Settings3068:
;GRR3000LManagementPanel.mpas,7215 :: 		Chng[4] := 1;
	MOV	#lo_addr(_Chng+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7217 :: 		While (Chng[4] =1) do
L__Battery_Settings3072:
	MOV	#lo_addr(_Chng+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5507
	GOTO	L__Battery_Settings3073
L__Battery_Settings5507:
;GRR3000LManagementPanel.mpas,7220 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7222 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings3077
;GRR3000LManagementPanel.mpas,7224 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7225 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7226 :: 		while (ButonStop = 0) do
L__Battery_Settings3080:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3081
;GRR3000LManagementPanel.mpas,7228 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7229 :: 		end;
	GOTO	L__Battery_Settings3080
L__Battery_Settings3081:
;GRR3000LManagementPanel.mpas,7230 :: 		Inc(BoostChargeVoltage);
	MOV	#1, W1
	MOV	#lo_addr(_BoostChargeVoltage), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7231 :: 		if (BoostChargeVoltage > ((HucreSayisi*2)*(B_ChargePercentHi * 0.1))) then      // örneðin (24 eleman *2 yani 48V için) (%135 div 10 =13.5) 48*13,5=648 yani 64,8V
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+30]
	MOV	_B_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+30], W2
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	_BoostChargeVoltage, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR	W0
	BRA LE	L__Battery_Settings5508
	COM	W0
L__Battery_Settings5508:
	CP0	W0
	BRA NZ	L__Battery_Settings5509
	GOTO	L__Battery_Settings3085
L__Battery_Settings5509:
;GRR3000LManagementPanel.mpas,7232 :: 		BoostChargeVoltage := ((HucreSayisi*2)*(B_ChargePercentHi * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+30]
	MOV	_B_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+30], W2
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _BoostChargeVoltage
L__Battery_Settings3085:
;GRR3000LManagementPanel.mpas,7233 :: 		end else
	GOTO	L__Battery_Settings3078
L__Battery_Settings3077:
;GRR3000LManagementPanel.mpas,7234 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings3088
;GRR3000LManagementPanel.mpas,7236 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7237 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7238 :: 		while (ButonStop = 0) do
L__Battery_Settings3091:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3092
;GRR3000LManagementPanel.mpas,7240 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7241 :: 		end;
	GOTO	L__Battery_Settings3091
L__Battery_Settings3092:
;GRR3000LManagementPanel.mpas,7242 :: 		Dec(BoostChargeVoltage);
	MOV	#1, W1
	MOV	#lo_addr(_BoostChargeVoltage), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7243 :: 		if (BoostChargeVoltage < ((HucreSayisi*2)*(B_ChargePercentLo * 0.1))) then      // örneðin (24 eleman *2 yani 48V için) (%115 div 10 =11.5) 48*11,5=552 yani 55,2V
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+30]
	MOV	_B_ChargePercentLo, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+30], W2
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	_BoostChargeVoltage, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR	W0
	BRA GE	L__Battery_Settings5510
	COM	W0
L__Battery_Settings5510:
	CP0	W0
	BRA NZ	L__Battery_Settings5511
	GOTO	L__Battery_Settings3096
L__Battery_Settings5511:
;GRR3000LManagementPanel.mpas,7244 :: 		BoostChargeVoltage := ((HucreSayisi*2)*(B_ChargePercentLo * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+30]
	MOV	_B_ChargePercentLo, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+30], W2
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _BoostChargeVoltage
L__Battery_Settings3096:
;GRR3000LManagementPanel.mpas,7245 :: 		end;
L__Battery_Settings3088:
L__Battery_Settings3078:
;GRR3000LManagementPanel.mpas,7247 :: 		ValueDivide(BoostChargeVoltage, 255);
	MOV.B	#255, W11
	MOV	_BoostChargeVoltage, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7248 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,7249 :: 		Glcd_Write_Text(WriteText,84 , Row5, 0);
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7251 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3099
;GRR3000LManagementPanel.mpas,7253 :: 		while (Ok_Button =0) do
L__Battery_Settings3102:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3103
;GRR3000LManagementPanel.mpas,7255 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7256 :: 		end;
	GOTO	L__Battery_Settings3102
L__Battery_Settings3103:
;GRR3000LManagementPanel.mpas,7258 :: 		EEPROM_Write(EE_BoostChargeVoltEeAddr, BoostChargeVoltage);
	MOV	_BoostChargeVoltage, W12
	MOV	#61470, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7259 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3107:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3107
;GRR3000LManagementPanel.mpas,7261 :: 		Chng[4] := 0;
	MOV	#lo_addr(_Chng+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7262 :: 		Glcd_Write_Text(WriteText,84 , Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7265 :: 		end;
L__Battery_Settings3099:
;GRR3000LManagementPanel.mpas,7268 :: 		end; // chng[4] while end
	GOTO	L__Battery_Settings3072
L__Battery_Settings3073:
;GRR3000LManagementPanel.mpas,7271 :: 		end;
L__Battery_Settings3064:
;GRR3000LManagementPanel.mpas,7272 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings3062:
;GRR3000LManagementPanel.mpas,7274 :: 		5: begin // normal þarj gerilim
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__Battery_Settings5512
	GOTO	L__Battery_Settings3113
L__Battery_Settings5512:
;GRR3000LManagementPanel.mpas,7276 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3115
;GRR3000LManagementPanel.mpas,7278 :: 		while (Ok_Button =0) do
L__Battery_Settings3118:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3119
;GRR3000LManagementPanel.mpas,7280 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7281 :: 		end;
	GOTO	L__Battery_Settings3118
L__Battery_Settings3119:
;GRR3000LManagementPanel.mpas,7283 :: 		Chng[5] := 1;
	MOV	#lo_addr(_Chng+4), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7285 :: 		While (Chng[5] =1) do
L__Battery_Settings3123:
	MOV	#lo_addr(_Chng+4), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5513
	GOTO	L__Battery_Settings3124
L__Battery_Settings5513:
;GRR3000LManagementPanel.mpas,7288 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7290 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings3128
;GRR3000LManagementPanel.mpas,7292 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7293 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7294 :: 		while (ButonStop = 0) do
L__Battery_Settings3131:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3132
;GRR3000LManagementPanel.mpas,7296 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7297 :: 		end;
	GOTO	L__Battery_Settings3131
L__Battery_Settings3132:
;GRR3000LManagementPanel.mpas,7298 :: 		Inc(FloatChargeVoltage);
	MOV	#1, W1
	MOV	#lo_addr(_FloatChargeVoltage), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7299 :: 		if (FloatChargeVoltage > ((HucreSayisi*2)*(F_ChargePercentHi * 0.1))) then      // örneðin (24 eleman *2 yani 48V için) (%135 div 10 =13.5) 48*13,5=648 yani 64,8V
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+30]
	MOV	_F_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+30], W2
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	_FloatChargeVoltage, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Compare_Ge_Fp
	CP0	W0
	CLR	W0
	BRA LE	L__Battery_Settings5514
	COM	W0
L__Battery_Settings5514:
	CP0	W0
	BRA NZ	L__Battery_Settings5515
	GOTO	L__Battery_Settings3136
L__Battery_Settings5515:
;GRR3000LManagementPanel.mpas,7300 :: 		FloatChargeVoltage := ((HucreSayisi*2)*(F_ChargePercentHi * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+30]
	MOV	_F_ChargePercentHi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+30], W2
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _FloatChargeVoltage
L__Battery_Settings3136:
;GRR3000LManagementPanel.mpas,7301 :: 		end else
	GOTO	L__Battery_Settings3129
L__Battery_Settings3128:
;GRR3000LManagementPanel.mpas,7302 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings3139
;GRR3000LManagementPanel.mpas,7304 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7305 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7306 :: 		while (ButonStop = 0) do
L__Battery_Settings3142:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3143
;GRR3000LManagementPanel.mpas,7308 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7309 :: 		end;
	GOTO	L__Battery_Settings3142
L__Battery_Settings3143:
;GRR3000LManagementPanel.mpas,7310 :: 		Dec(FloatChargeVoltage);
	MOV	#1, W1
	MOV	#lo_addr(_FloatChargeVoltage), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7311 :: 		if (FloatChargeVoltage < ((HucreSayisi*2)*(F_ChargePercentLo * 0.1))) then      // örneðin (24 eleman *2 yani 48V için) (%115 div 10 =11.5) 48*11,5=552 yani 55,2V
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+30]
	MOV	_F_ChargePercentLo, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+30], W2
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	_FloatChargeVoltage, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR	W0
	BRA GE	L__Battery_Settings5516
	COM	W0
L__Battery_Settings5516:
	CP0	W0
	BRA NZ	L__Battery_Settings5517
	GOTO	L__Battery_Settings3147
L__Battery_Settings5517:
;GRR3000LManagementPanel.mpas,7312 :: 		FloatChargeVoltage := ((HucreSayisi*2)*(F_ChargePercentLo * 0.1));
	MOV	_HucreSayisi, W0
	SL	W0, #1, W0
	MOV	W0, [W14+30]
	MOV	_F_ChargePercentLo, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#52429, W2
	MOV	#15820, W3
	CALL	__Mul_FP
	MOV	[W14+30], W2
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	W2, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _FloatChargeVoltage
L__Battery_Settings3147:
;GRR3000LManagementPanel.mpas,7313 :: 		end;
L__Battery_Settings3139:
L__Battery_Settings3129:
;GRR3000LManagementPanel.mpas,7315 :: 		ValueDivide(FloatChargeVoltage, 255);
	MOV.B	#255, W11
	MOV	_FloatChargeVoltage, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7316 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,7317 :: 		Glcd_Write_Text(WriteText,84 , Row6, 0);
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7319 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3150
;GRR3000LManagementPanel.mpas,7321 :: 		while (Ok_Button =0) do
L__Battery_Settings3153:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3154
;GRR3000LManagementPanel.mpas,7323 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7324 :: 		end;
	GOTO	L__Battery_Settings3153
L__Battery_Settings3154:
;GRR3000LManagementPanel.mpas,7326 :: 		EEPROM_Write(EE_FloatChargeVoltEeAddr, FloatChargeVoltage);
	MOV	_FloatChargeVoltage, W12
	MOV	#61472, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7327 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3158:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3158
;GRR3000LManagementPanel.mpas,7329 :: 		Chng[5] := 0;
	MOV	#lo_addr(_Chng+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7330 :: 		Glcd_Write_Text(WriteText,84 , Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7333 :: 		end;
L__Battery_Settings3150:
;GRR3000LManagementPanel.mpas,7337 :: 		end; // chng[5] while end
	GOTO	L__Battery_Settings3123
L__Battery_Settings3124:
;GRR3000LManagementPanel.mpas,7340 :: 		end;
L__Battery_Settings3115:
;GRR3000LManagementPanel.mpas,7341 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings3113:
;GRR3000LManagementPanel.mpas,7343 :: 		6: begin // hýzlý þarj süresi
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA Z	L__Battery_Settings5518
	GOTO	L__Battery_Settings3164
L__Battery_Settings5518:
;GRR3000LManagementPanel.mpas,7345 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3166
;GRR3000LManagementPanel.mpas,7347 :: 		while (Ok_Button =0) do
L__Battery_Settings3169:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3170
;GRR3000LManagementPanel.mpas,7349 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7350 :: 		end;
	GOTO	L__Battery_Settings3169
L__Battery_Settings3170:
;GRR3000LManagementPanel.mpas,7352 :: 		Chng[6] := 1;
	MOV	#lo_addr(_Chng+5), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7354 :: 		While (Chng[6] =1) do
L__Battery_Settings3174:
	MOV	#lo_addr(_Chng+5), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5519
	GOTO	L__Battery_Settings3175
L__Battery_Settings5519:
;GRR3000LManagementPanel.mpas,7356 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7358 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings3179
;GRR3000LManagementPanel.mpas,7360 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7361 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7362 :: 		while (ButonStop = 0) do
L__Battery_Settings3182:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3183
;GRR3000LManagementPanel.mpas,7364 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7365 :: 		end;
	GOTO	L__Battery_Settings3182
L__Battery_Settings3183:
;GRR3000LManagementPanel.mpas,7366 :: 		Inc(BoostChargeTimeSet);
	MOV	#1, W1
	MOV	#lo_addr(_BoostChargeTimeSet), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7367 :: 		if (BoostChargeTimeSet > 4320) then      // 4320dk 72s
	MOV	_BoostChargeTimeSet, W1
	MOV	#4320, W0
	CP	W1, W0
	BRA GTU	L__Battery_Settings5520
	GOTO	L__Battery_Settings3187
L__Battery_Settings5520:
;GRR3000LManagementPanel.mpas,7368 :: 		BoostChargeTimeSet := 4320;
	MOV	#4320, W0
	MOV	W0, _BoostChargeTimeSet
L__Battery_Settings3187:
;GRR3000LManagementPanel.mpas,7369 :: 		end else
	GOTO	L__Battery_Settings3180
L__Battery_Settings3179:
;GRR3000LManagementPanel.mpas,7370 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings3190
;GRR3000LManagementPanel.mpas,7372 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7373 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7374 :: 		while (ButonStop = 0) do
L__Battery_Settings3193:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3194
;GRR3000LManagementPanel.mpas,7376 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7377 :: 		end;
	GOTO	L__Battery_Settings3193
L__Battery_Settings3194:
;GRR3000LManagementPanel.mpas,7378 :: 		Dec(BoostChargeTimeSet);
	MOV	#1, W1
	MOV	#lo_addr(_BoostChargeTimeSet), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7379 :: 		if (BoostChargeTimeSet < 1) then      // 1dk
	MOV	_BoostChargeTimeSet, W0
	CP	W0, #1
	BRA LTU	L__Battery_Settings5521
	GOTO	L__Battery_Settings3198
L__Battery_Settings5521:
;GRR3000LManagementPanel.mpas,7380 :: 		BoostChargeTimeSet := 1;
	MOV	#1, W0
	MOV	W0, _BoostChargeTimeSet
L__Battery_Settings3198:
;GRR3000LManagementPanel.mpas,7381 :: 		end;
L__Battery_Settings3190:
L__Battery_Settings3180:
;GRR3000LManagementPanel.mpas,7383 :: 		ValueDivide(BoostChargeTimeSet, 0);
	CLR	W11
	MOV	_BoostChargeTimeSet, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7384 :: 		WriteText := Value_Text + MinuteText;
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV	#lo_addr(_MinuteText), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,7385 :: 		Glcd_Write_Text(WriteText,84 , Row7, 0);
	CLR	W13
	MOV.B	#6, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7387 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3201
;GRR3000LManagementPanel.mpas,7389 :: 		while (Ok_Button =0) do
L__Battery_Settings3204:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3205
;GRR3000LManagementPanel.mpas,7391 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7392 :: 		end;
	GOTO	L__Battery_Settings3204
L__Battery_Settings3205:
;GRR3000LManagementPanel.mpas,7394 :: 		EEPROM_Write(EE_BoostChargeTimeEeAddr, BoostChargeTimeSet);
	MOV	_BoostChargeTimeSet, W12
	MOV	#61474, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7395 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3209:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3209
;GRR3000LManagementPanel.mpas,7397 :: 		Chng[6] := 0;
	MOV	#lo_addr(_Chng+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7398 :: 		Glcd_Write_Text(WriteText,84 , Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7400 :: 		BoostChargeTime := BoostChargeTimeSet;
	MOV	_BoostChargeTimeSet, W0
	CLR	W1
	MOV	W0, _BoostChargeTime
	MOV	W1, _BoostChargeTime+2
;GRR3000LManagementPanel.mpas,7404 :: 		end;
L__Battery_Settings3201:
;GRR3000LManagementPanel.mpas,7409 :: 		end; // chng[6] while end
	GOTO	L__Battery_Settings3174
L__Battery_Settings3175:
;GRR3000LManagementPanel.mpas,7412 :: 		end;
L__Battery_Settings3166:
;GRR3000LManagementPanel.mpas,7413 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings3164:
;GRR3000LManagementPanel.mpas,7415 :: 		7: begin // deþarj gerilimi
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA Z	L__Battery_Settings5522
	GOTO	L__Battery_Settings3215
L__Battery_Settings5522:
;GRR3000LManagementPanel.mpas,7417 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3217
;GRR3000LManagementPanel.mpas,7419 :: 		while (Ok_Button =0) do
L__Battery_Settings3220:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3221
;GRR3000LManagementPanel.mpas,7421 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7422 :: 		end;
	GOTO	L__Battery_Settings3220
L__Battery_Settings3221:
;GRR3000LManagementPanel.mpas,7424 :: 		Chng[7] := 1;
	MOV	#lo_addr(_Chng+6), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7426 :: 		While (Chng[7] =1) do
L__Battery_Settings3225:
	MOV	#lo_addr(_Chng+6), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5523
	GOTO	L__Battery_Settings3226
L__Battery_Settings5523:
;GRR3000LManagementPanel.mpas,7428 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7430 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings3230
;GRR3000LManagementPanel.mpas,7432 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7433 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7434 :: 		while (ButonStop = 0) do
L__Battery_Settings3233:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3234
;GRR3000LManagementPanel.mpas,7436 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7437 :: 		end;
	GOTO	L__Battery_Settings3233
L__Battery_Settings3234:
;GRR3000LManagementPanel.mpas,7438 :: 		Inc(DeepDischargeVolt);
	MOV	#1, W1
	MOV	#lo_addr(_DeepDischargeVolt), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7439 :: 		if (DeepDischargeVolt > (HucreSayisi*20)) then      //
	MOV	_HucreSayisi, W1
	MOV	#20, W0
	MUL.UU	W1, W0, W2
	MOV	#lo_addr(_DeepDischargeVolt), W0
	CP	W2, [W0]
	BRA LTU	L__Battery_Settings5524
	GOTO	L__Battery_Settings3238
L__Battery_Settings5524:
;GRR3000LManagementPanel.mpas,7440 :: 		DeepDischargeVolt := (HucreSayisi*20);
	MOV	_HucreSayisi, W1
	MOV	#20, W0
	MUL.UU	W1, W0, W0
	MOV	W0, _DeepDischargeVolt
L__Battery_Settings3238:
;GRR3000LManagementPanel.mpas,7441 :: 		end else
	GOTO	L__Battery_Settings3231
L__Battery_Settings3230:
;GRR3000LManagementPanel.mpas,7442 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings3241
;GRR3000LManagementPanel.mpas,7444 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7445 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7446 :: 		while (ButonStop = 0) do
L__Battery_Settings3244:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3245
;GRR3000LManagementPanel.mpas,7448 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7449 :: 		end;
	GOTO	L__Battery_Settings3244
L__Battery_Settings3245:
;GRR3000LManagementPanel.mpas,7450 :: 		Dec(DeepDischargeVolt);
	MOV	#1, W1
	MOV	#lo_addr(_DeepDischargeVolt), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7451 :: 		if (DeepDischargeVolt < (HucreSayisi*17.5)) then
	MOV	_HucreSayisi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16780, W3
	CALL	__Mul_FP
	MOV	W0, [W14+30]
	MOV	W1, [W14+32]
	MOV	_DeepDischargeVolt, W0
	CLR	W1
	CALL	__Long2Float
	MOV	[W14+30], W2
	MOV	[W14+32], W3
	CALL	__Compare_Le_Fp
	CP0	W0
	CLR	W0
	BRA GE	L__Battery_Settings5525
	COM	W0
L__Battery_Settings5525:
	CP0	W0
	BRA NZ	L__Battery_Settings5526
	GOTO	L__Battery_Settings3249
L__Battery_Settings5526:
;GRR3000LManagementPanel.mpas,7452 :: 		DeepDischargeVolt := (HucreSayisi*17.5);
	MOV	_HucreSayisi, W0
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#16780, W3
	CALL	__Mul_FP
	CALL	__Float2Longint
	MOV	W0, _DeepDischargeVolt
L__Battery_Settings3249:
;GRR3000LManagementPanel.mpas,7453 :: 		end;
L__Battery_Settings3241:
L__Battery_Settings3231:
;GRR3000LManagementPanel.mpas,7455 :: 		ValueDivide(DeepDischargeVolt, 255);
	MOV.B	#255, W11
	MOV	_DeepDischargeVolt, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7456 :: 		WriteText := Value_Text + 'V';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,7457 :: 		Glcd_Write_Text(WriteText,84 , Row8, 0);
	CLR	W13
	MOV.B	#7, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7459 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3252
;GRR3000LManagementPanel.mpas,7461 :: 		while (Ok_Button =0) do
L__Battery_Settings3255:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3256
;GRR3000LManagementPanel.mpas,7463 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7464 :: 		end;
	GOTO	L__Battery_Settings3255
L__Battery_Settings3256:
;GRR3000LManagementPanel.mpas,7466 :: 		EEPROM_Write(EE_DeepDischargeVoltEeAddr, DeepDischargeVolt);
	MOV	_DeepDischargeVolt, W12
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7467 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3260:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3260
;GRR3000LManagementPanel.mpas,7469 :: 		Chng[7] := 0;
	MOV	#lo_addr(_Chng+6), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7470 :: 		Glcd_Write_Text(WriteText,84 , Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7474 :: 		end;
L__Battery_Settings3252:
;GRR3000LManagementPanel.mpas,7479 :: 		end; // chng[7] while end
	GOTO	L__Battery_Settings3225
L__Battery_Settings3226:
;GRR3000LManagementPanel.mpas,7482 :: 		end;
L__Battery_Settings3217:
;GRR3000LManagementPanel.mpas,7483 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings3215:
;GRR3000LManagementPanel.mpas,7485 :: 		8: begin // auto BF mode
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA Z	L__Battery_Settings5527
	GOTO	L__Battery_Settings3266
L__Battery_Settings5527:
;GRR3000LManagementPanel.mpas,7487 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3268
;GRR3000LManagementPanel.mpas,7489 :: 		while (Ok_Button =0) do
L__Battery_Settings3271:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3272
;GRR3000LManagementPanel.mpas,7491 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7492 :: 		end;
	GOTO	L__Battery_Settings3271
L__Battery_Settings3272:
;GRR3000LManagementPanel.mpas,7494 :: 		Chng[8] := 1;
	MOV	#lo_addr(_Chng+7), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7496 :: 		While (Chng[8] =1) do
L__Battery_Settings3276:
	MOV	#lo_addr(_Chng+7), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5528
	GOTO	L__Battery_Settings3277
L__Battery_Settings5528:
;GRR3000LManagementPanel.mpas,7498 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7500 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W4, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W4, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W4, #0
	BTSC	66, #0
	BRA	L__Battery_Settings5529
	BCLR	W4, #0
	BRA	L__Battery_Settings5532
L__Battery_Settings5529:
	BSET	W4, #0
L__Battery_Settings5532:
	BTSS	W4, #0
	GOTO	L__Battery_Settings3281
;GRR3000LManagementPanel.mpas,7503 :: 		while ((Up_Button =0)or(Down_Button =0)) do
L__Battery_Settings3284:
	BCLR	W4, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W4, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W4, #0
	BTSC	66, #0
	BRA	L__Battery_Settings5533
	BCLR	W4, #0
	BRA	L__Battery_Settings5536
L__Battery_Settings5533:
	BSET	W4, #0
L__Battery_Settings5536:
	BTSS	W4, #0
	GOTO	L__Battery_Settings3285
;GRR3000LManagementPanel.mpas,7505 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7506 :: 		end;
	GOTO	L__Battery_Settings3284
L__Battery_Settings3285:
;GRR3000LManagementPanel.mpas,7508 :: 		AutoBFMode := not AutoBFMode;
	MOV	#lo_addr(_AutoBFMode), W1
	MOV	#lo_addr(_AutoBFMode), W0
	BTG	[W0], BitPos(_AutoBFMode+0)
;GRR3000LManagementPanel.mpas,7509 :: 		end;
L__Battery_Settings3281:
;GRR3000LManagementPanel.mpas,7511 :: 		if (AutoBFMode =0) then Glcd_Write_Text(DisableText, 84, Row2, 0) else
	MOV	#lo_addr(_AutoBFMode), W0
	BTSC	[W0], BitPos(_AutoBFMode+0)
	GOTO	L__Battery_Settings3289
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Battery_Settings3290
L__Battery_Settings3289:
;GRR3000LManagementPanel.mpas,7512 :: 		if (AutoBFMode =1) then Glcd_Write_Text(EnableText, 84, Row2, 0);
	MOV	#lo_addr(_AutoBFMode), W0
	BTSS	[W0], BitPos(_AutoBFMode+0)
	GOTO	L__Battery_Settings3292
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
L__Battery_Settings3292:
L__Battery_Settings3290:
;GRR3000LManagementPanel.mpas,7514 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3295
;GRR3000LManagementPanel.mpas,7516 :: 		while (Ok_Button =0) do
L__Battery_Settings3298:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3299
;GRR3000LManagementPanel.mpas,7518 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7519 :: 		end;
	GOTO	L__Battery_Settings3298
L__Battery_Settings3299:
;GRR3000LManagementPanel.mpas,7521 :: 		EEPROM_Write(EE_AutoBFModeEeAddr, AutoBFMode);
	MOV	#lo_addr(_AutoBFMode), W0
	CLR	W12
	BTSC	[W0], BitPos(_AutoBFMode+0)
	INC	W12
	MOV	#61478, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7522 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3303:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3303
;GRR3000LManagementPanel.mpas,7524 :: 		Chng[8] := 0;
	MOV	#lo_addr(_Chng+7), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7525 :: 		if (AutoBFMode =0) then Glcd_Write_Text(DisableText, 84, Row2, Black) else
	MOV	#lo_addr(_AutoBFMode), W0
	BTSC	[W0], BitPos(_AutoBFMode+0)
	GOTO	L__Battery_Settings3308
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_DisableText), W10
	CALL	_Glcd_Write_Text
	GOTO	L__Battery_Settings3309
L__Battery_Settings3308:
;GRR3000LManagementPanel.mpas,7526 :: 		if (AutoBFMode =1) then Glcd_Write_Text(EnableText, 84, Row2, Black);
	MOV	#lo_addr(_AutoBFMode), W0
	BTSS	[W0], BitPos(_AutoBFMode+0)
	GOTO	L__Battery_Settings3311
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_EnableText), W10
	CALL	_Glcd_Write_Text
L__Battery_Settings3311:
L__Battery_Settings3309:
;GRR3000LManagementPanel.mpas,7530 :: 		end;
L__Battery_Settings3295:
;GRR3000LManagementPanel.mpas,7534 :: 		end; // chng[8] while end
	GOTO	L__Battery_Settings3276
L__Battery_Settings3277:
;GRR3000LManagementPanel.mpas,7537 :: 		end;
L__Battery_Settings3268:
;GRR3000LManagementPanel.mpas,7538 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings3266:
;GRR3000LManagementPanel.mpas,7540 :: 		9: begin // hýzlý þarj limit
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	BRA Z	L__Battery_Settings5537
	GOTO	L__Battery_Settings3315
L__Battery_Settings5537:
;GRR3000LManagementPanel.mpas,7542 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3317
;GRR3000LManagementPanel.mpas,7544 :: 		while (Ok_Button =0) do
L__Battery_Settings3320:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3321
;GRR3000LManagementPanel.mpas,7546 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7547 :: 		end;
	GOTO	L__Battery_Settings3320
L__Battery_Settings3321:
;GRR3000LManagementPanel.mpas,7549 :: 		Chng[9] := 1;
	MOV	#lo_addr(_Chng+8), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7551 :: 		While (Chng[9] =1) do
L__Battery_Settings3325:
	MOV	#lo_addr(_Chng+8), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5538
	GOTO	L__Battery_Settings3326
L__Battery_Settings5538:
;GRR3000LManagementPanel.mpas,7553 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7555 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings3330
;GRR3000LManagementPanel.mpas,7557 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7558 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7559 :: 		while (ButonStop = 0) do
L__Battery_Settings3333:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3334
;GRR3000LManagementPanel.mpas,7561 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7562 :: 		end;
	GOTO	L__Battery_Settings3333
L__Battery_Settings3334:
;GRR3000LManagementPanel.mpas,7563 :: 		Inc(BoostChargeLimit);
	MOV	#1, W1
	MOV	#lo_addr(_BoostChargeLimit), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7564 :: 		if (BoostChargeLimit > (BatteryAh * 2)) then BoostChargeLimit := (BatteryAh *2); // 0.2C ile
	MOV	_BatteryAh, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_BoostChargeLimit), W0
	CP	W1, [W0]
	BRA LTU	L__Battery_Settings5539
	GOTO	L__Battery_Settings3338
L__Battery_Settings5539:
	MOV	_BatteryAh, W0
	SL	W0, #1, W0
	MOV	W0, _BoostChargeLimit
L__Battery_Settings3338:
;GRR3000LManagementPanel.mpas,7566 :: 		end else
	GOTO	L__Battery_Settings3331
L__Battery_Settings3330:
;GRR3000LManagementPanel.mpas,7567 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings3341
;GRR3000LManagementPanel.mpas,7569 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7570 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7571 :: 		while (ButonStop = 0) do
L__Battery_Settings3344:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3345
;GRR3000LManagementPanel.mpas,7573 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7574 :: 		end;
	GOTO	L__Battery_Settings3344
L__Battery_Settings3345:
;GRR3000LManagementPanel.mpas,7575 :: 		Dec(BoostChargeLimit);
	MOV	#1, W1
	MOV	#lo_addr(_BoostChargeLimit), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7576 :: 		if (BoostChargeLimit < (BatteryAh + 1)) then BoostChargeLimit := (BatteryAh + 1);
	MOV	_BatteryAh, W0
	ADD	W0, #1, W1
	MOV	#lo_addr(_BoostChargeLimit), W0
	CP	W1, [W0]
	BRA GTU	L__Battery_Settings5540
	GOTO	L__Battery_Settings3349
L__Battery_Settings5540:
	MOV	_BatteryAh, W1
	MOV	#lo_addr(_BoostChargeLimit), W0
	ADD	W1, #1, [W0]
L__Battery_Settings3349:
;GRR3000LManagementPanel.mpas,7577 :: 		end;
L__Battery_Settings3341:
L__Battery_Settings3331:
;GRR3000LManagementPanel.mpas,7579 :: 		ValueDivide(BoostChargeLimit, 255);
	MOV.B	#255, W11
	MOV	_BoostChargeLimit, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7580 :: 		WriteText := Value_Text + 'A';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,7581 :: 		Glcd_Write_Text(WriteText,84 , Row3, 0);
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7584 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3352
;GRR3000LManagementPanel.mpas,7586 :: 		while (Ok_Button =0) do
L__Battery_Settings3355:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3356
;GRR3000LManagementPanel.mpas,7588 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7589 :: 		end;
	GOTO	L__Battery_Settings3355
L__Battery_Settings3356:
;GRR3000LManagementPanel.mpas,7592 :: 		EEPROM_Write(EE_BoostChargeLimitEeAddr, BoostChargeLimit);
	MOV	_BoostChargeLimit, W12
	MOV	#61480, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7593 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3360:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3360
;GRR3000LManagementPanel.mpas,7595 :: 		Chng[9] := 0;
	MOV	#lo_addr(_Chng+8), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7596 :: 		Glcd_Write_Text(WriteText,84 , Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7599 :: 		end;
L__Battery_Settings3352:
;GRR3000LManagementPanel.mpas,7604 :: 		end; // chng[9] while end
	GOTO	L__Battery_Settings3325
L__Battery_Settings3326:
;GRR3000LManagementPanel.mpas,7607 :: 		end;
L__Battery_Settings3317:
;GRR3000LManagementPanel.mpas,7608 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings3315:
;GRR3000LManagementPanel.mpas,7610 :: 		10: begin // normal þarj limit
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #10
	BRA Z	L__Battery_Settings5541
	GOTO	L__Battery_Settings3366
L__Battery_Settings5541:
;GRR3000LManagementPanel.mpas,7612 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3368
;GRR3000LManagementPanel.mpas,7614 :: 		while (Ok_Button =0) do
L__Battery_Settings3371:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3372
;GRR3000LManagementPanel.mpas,7616 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7617 :: 		end;
	GOTO	L__Battery_Settings3371
L__Battery_Settings3372:
;GRR3000LManagementPanel.mpas,7619 :: 		Chng[10] := 1;
	MOV	#lo_addr(_Chng+9), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7621 :: 		While (Chng[10] =1) do
L__Battery_Settings3376:
	MOV	#lo_addr(_Chng+9), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Battery_Settings5542
	GOTO	L__Battery_Settings3377
L__Battery_Settings5542:
;GRR3000LManagementPanel.mpas,7623 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7625 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Battery_Settings3381
;GRR3000LManagementPanel.mpas,7627 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7628 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7629 :: 		while (ButonStop = 0) do
L__Battery_Settings3384:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3385
;GRR3000LManagementPanel.mpas,7631 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7632 :: 		end;
	GOTO	L__Battery_Settings3384
L__Battery_Settings3385:
;GRR3000LManagementPanel.mpas,7633 :: 		Inc(FloatChargeLimit);
	MOV	#1, W1
	MOV	#lo_addr(_FloatChargeLimit), W0
	ADD	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7634 :: 		if (FloatChargeLimit > (BatteryAh)) then FloatChargeLimit := (BatteryAh); // 0.1C ile
	MOV	_FloatChargeLimit, W1
	MOV	#lo_addr(_BatteryAh), W0
	CP	W1, [W0]
	BRA GTU	L__Battery_Settings5543
	GOTO	L__Battery_Settings3389
L__Battery_Settings5543:
	MOV	_BatteryAh, W0
	MOV	W0, _FloatChargeLimit
L__Battery_Settings3389:
;GRR3000LManagementPanel.mpas,7636 :: 		end else
	GOTO	L__Battery_Settings3382
L__Battery_Settings3381:
;GRR3000LManagementPanel.mpas,7637 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Battery_Settings3392
;GRR3000LManagementPanel.mpas,7639 :: 		ButonStop       := 0;
	MOV	#lo_addr(_ButonStop), W0
	BCLR	[W0], BitPos(_ButonStop+0)
;GRR3000LManagementPanel.mpas,7640 :: 		BtCounterNormal := 0;
	CLR	W0
	MOV	W0, _BtCounterNormal
;GRR3000LManagementPanel.mpas,7641 :: 		while (ButonStop = 0) do
L__Battery_Settings3395:
	MOV	#lo_addr(_ButonStop), W0
	BTSC	[W0], BitPos(_ButonStop+0)
	GOTO	L__Battery_Settings3396
;GRR3000LManagementPanel.mpas,7643 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7644 :: 		end;
	GOTO	L__Battery_Settings3395
L__Battery_Settings3396:
;GRR3000LManagementPanel.mpas,7645 :: 		Dec(FloatChargeLimit);
	MOV	#1, W1
	MOV	#lo_addr(_FloatChargeLimit), W0
	SUBR	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7646 :: 		if (FloatChargeLimit < 1) then FloatChargeLimit := 1;
	MOV	_FloatChargeLimit, W0
	CP	W0, #1
	BRA LTU	L__Battery_Settings5544
	GOTO	L__Battery_Settings3400
L__Battery_Settings5544:
	MOV	#1, W0
	MOV	W0, _FloatChargeLimit
L__Battery_Settings3400:
;GRR3000LManagementPanel.mpas,7647 :: 		end;
L__Battery_Settings3392:
L__Battery_Settings3382:
;GRR3000LManagementPanel.mpas,7649 :: 		ValueDivide(FloatChargeLimit, 255);
	MOV.B	#255, W11
	MOV	_FloatChargeLimit, W10
	CALL	_ValueDivide
;GRR3000LManagementPanel.mpas,7650 :: 		WriteText := Value_Text + 'A';
	MOV	#lo_addr(_WriteText), W0
	MOV	#lo_addr(_Value_Text), W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
;GRR3000LManagementPanel.mpas,7651 :: 		Glcd_Write_Text(WriteText,84 , Row4, 0);
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7654 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3403
;GRR3000LManagementPanel.mpas,7656 :: 		while (Ok_Button =0) do
L__Battery_Settings3406:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3407
;GRR3000LManagementPanel.mpas,7658 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7659 :: 		end;
	GOTO	L__Battery_Settings3406
L__Battery_Settings3407:
;GRR3000LManagementPanel.mpas,7662 :: 		EEPROM_Write(EE_FloatChargeLimitEeAddr, FloatChargeLimit);
	MOV	_FloatChargeLimit, W12
	MOV	#61482, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7663 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3411:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3411
;GRR3000LManagementPanel.mpas,7665 :: 		Chng[10] := 0;
	MOV	#lo_addr(_Chng+9), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7666 :: 		Glcd_Write_Text(WriteText,84 , Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_WriteText), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7669 :: 		end;
L__Battery_Settings3403:
;GRR3000LManagementPanel.mpas,7674 :: 		end; // chng[10] while end
	GOTO	L__Battery_Settings3376
L__Battery_Settings3377:
;GRR3000LManagementPanel.mpas,7677 :: 		end;
L__Battery_Settings3368:
;GRR3000LManagementPanel.mpas,7678 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings3366:
;GRR3000LManagementPanel.mpas,7680 :: 		11: begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #11
	BRA Z	L__Battery_Settings5545
	GOTO	L__Battery_Settings3417
L__Battery_Settings5545:
;GRR3000LManagementPanel.mpas,7682 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3419
;GRR3000LManagementPanel.mpas,7684 :: 		while (Ok_Button =0) do
L__Battery_Settings3422:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Battery_Settings3423
;GRR3000LManagementPanel.mpas,7686 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7687 :: 		end;
	GOTO	L__Battery_Settings3422
L__Battery_Settings3423:
;GRR3000LManagementPanel.mpas,7688 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7690 :: 		end;
L__Battery_Settings3419:
;GRR3000LManagementPanel.mpas,7694 :: 		end;
	GOTO	L__Battery_Settings2792
L__Battery_Settings3417:
L__Battery_Settings2792:
;GRR3000LManagementPanel.mpas,7701 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7704 :: 		end;
	GOTO	L__Battery_Settings2749
L__Battery_Settings2750:
;GRR3000LManagementPanel.mpas,7706 :: 		if (FirstStartUpBattMenu = 120) then
	MOV	#lo_addr(_FirstStartUpBattMenu), W0
	MOV.B	[W0], W1
	MOV.B	#120, W0
	CP.B	W1, W0
	BRA Z	L__Battery_Settings5546
	GOTO	L__Battery_Settings3427
L__Battery_Settings5546:
;GRR3000LManagementPanel.mpas,7708 :: 		FirstStartUpBattMenu := 160; // 160 yaz bir daha bu menüye girmesin
	MOV	#lo_addr(_FirstStartUpBattMenu), W1
	MOV.B	#160, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7709 :: 		EEPROM_Write(EE_FirstBattMenuEeAddr, FirstStartUpBattMenu);
	MOV	#160, W12
	MOV	#61574, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,7710 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Battery_Settings3430:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Battery_Settings3430
;GRR3000LManagementPanel.mpas,7711 :: 		end;
L__Battery_Settings3427:
;GRR3000LManagementPanel.mpas,7713 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,7714 :: 		MenuSayacValue := 4;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#4, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7717 :: 		end;
L_end_Battery_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Battery_Settings

_Password_Entry_Screen:
	LNK	#8

;GRR3000LManagementPanel.mpas,7727 :: 		begin
;GRR3000LManagementPanel.mpas,7732 :: 		Pass_Change_Counter := 1;
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,7735 :: 		PasswordArray[1]    := 0;
	MOV	#lo_addr(_PasswordArray), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7736 :: 		PasswordArray[2]    := 0;
	MOV	#lo_addr(_PasswordArray+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7737 :: 		PasswordArray[3]    := 0;
	MOV	#lo_addr(_PasswordArray+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7738 :: 		PasswordArray[4]    := 0;
	MOV	#lo_addr(_PasswordArray+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7740 :: 		ChngA := 0;
	MOV	#lo_addr(_ChngA), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7741 :: 		ChngB := 0;
	MOV	#lo_addr(_ChngB), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7742 :: 		ChngC := 0;
	MOV	#lo_addr(_ChngC), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7743 :: 		ChngD := 0;
	MOV	#lo_addr(_ChngD), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7744 :: 		TempText := '   ';
	ADD	W14, #1, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,7745 :: 		PassText := ' ';
	ADD	W14, #5, W1
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,7747 :: 		Chng1 := 0;
	CLR	W0
	MOV.B	W0, [W14+7]
;GRR3000LManagementPanel.mpas,7749 :: 		Glcd_PartialImage(5, 15, 115, 41, 115, 41, @PasswordEntryBos);
	PUSH	W10
	MOV	#41, W13
	MOV	#115, W12
	MOV	#15, W11
	MOV	#5, W10
	MOV	#lo_addr(_PasswordEntryBos), W0
	MOV	#higher_addr(_PasswordEntryBos), W1
	PUSH.D	W0
	MOV	#41, W0
	PUSH	W0
	MOV	#115, W0
	PUSH	W0
	CALL	_Glcd_PartialImage
	SUB	#8, W15
;GRR3000LManagementPanel.mpas,7750 :: 		Glcd_Write_Char('x',48,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#48, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7751 :: 		Glcd_Write_Char('x',54,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7752 :: 		Glcd_Write_Char('x',60,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#60, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7753 :: 		Glcd_Write_Char('x',66,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#66, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7766 :: 		Glcd_Write_Text(SubTitle_Ok,84,Row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SubTitle_Ok), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7767 :: 		Glcd_Write_Text(SubTitle_Cancel,12,row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_SubTitle_Cancel), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7769 :: 		if (View = 0) then
	CP.B	W10, #0
	BRA Z	L__Password_Entry_Screen5548
	GOTO	L__Password_Entry_Screen3436
L__Password_Entry_Screen5548:
;GRR3000LManagementPanel.mpas,7771 :: 		Glcd_Write_Text(PassNewText,12,row4,black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_PassNewText), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7772 :: 		end else
	GOTO	L__Password_Entry_Screen3437
L__Password_Entry_Screen3436:
;GRR3000LManagementPanel.mpas,7773 :: 		if (View = 1) then
	CP.B	W10, #1
	BRA Z	L__Password_Entry_Screen5549
	GOTO	L__Password_Entry_Screen3439
L__Password_Entry_Screen5549:
;GRR3000LManagementPanel.mpas,7775 :: 		Glcd_Write_Text(PassInputText, 12, row4 ,black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_PassInputText), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7776 :: 		end;
L__Password_Entry_Screen3439:
L__Password_Entry_Screen3437:
;GRR3000LManagementPanel.mpas,7779 :: 		while (Chng1 = 0) do
L__Password_Entry_Screen3442:
	MOV.B	[W14+7], W0
	CP.B	W0, #0
	BRA Z	L__Password_Entry_Screen5550
	GOTO	L__Password_Entry_Screen3443
L__Password_Entry_Screen5550:
;GRR3000LManagementPanel.mpas,7782 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7784 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3447
;GRR3000LManagementPanel.mpas,7786 :: 		while (Down_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3450:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3451
	CLRWDT
	GOTO	L__Password_Entry_Screen3450
L__Password_Entry_Screen3451:
;GRR3000LManagementPanel.mpas,7787 :: 		Pass_Change_Counter := Pass_Change_Counter + 1;
	ADD	W14, #0, W0
	SE	[W0], W0
	INC	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,7788 :: 		if (Pass_Change_Counter > 6) then Pass_Change_Counter := 1;
	CP.B	W0, #6
	BRA GT	L__Password_Entry_Screen5551
	GOTO	L__Password_Entry_Screen3455
L__Password_Entry_Screen5551:
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
L__Password_Entry_Screen3455:
;GRR3000LManagementPanel.mpas,7789 :: 		end else
	GOTO	L__Password_Entry_Screen3448
L__Password_Entry_Screen3447:
;GRR3000LManagementPanel.mpas,7790 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3458
;GRR3000LManagementPanel.mpas,7792 :: 		while (Up_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3461:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3462
	CLRWDT
	GOTO	L__Password_Entry_Screen3461
L__Password_Entry_Screen3462:
;GRR3000LManagementPanel.mpas,7793 :: 		Pass_Change_Counter := Pass_Change_Counter - 1;
	ADD	W14, #0, W0
	SE	[W0], W0
	DEC	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,7794 :: 		if (Pass_Change_Counter < 1) then Pass_Change_Counter := 6;
	CP.B	W0, #1
	BRA LT	L__Password_Entry_Screen5552
	GOTO	L__Password_Entry_Screen3466
L__Password_Entry_Screen5552:
	MOV.B	#6, W0
	MOV.B	W0, [W14+0]
L__Password_Entry_Screen3466:
;GRR3000LManagementPanel.mpas,7795 :: 		end;
L__Password_Entry_Screen3458:
L__Password_Entry_Screen3448:
;GRR3000LManagementPanel.mpas,7798 :: 		1: begin  // þifrenin 4. karakteri
	MOV.B	[W14+0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Entry_Screen5553
	GOTO	L__Password_Entry_Screen3471
L__Password_Entry_Screen5553:
;GRR3000LManagementPanel.mpas,7800 :: 		Glcd_Write_Char('X',48,row5,white);
	PUSH	W10
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#48, W11
	MOV.B	#88, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7801 :: 		Glcd_Write_Char('x',54,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7802 :: 		Glcd_Write_Char('x',60,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#60, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7803 :: 		Glcd_Write_Char('x',66,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#66, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7816 :: 		Glcd_Write_Text(SubTitle_Ok,84,Row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SubTitle_Ok), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7817 :: 		Glcd_Write_Text(SubTitle_Cancel,12,row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_SubTitle_Cancel), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7819 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3473
;GRR3000LManagementPanel.mpas,7821 :: 		ChngA := 1;
	MOV	#lo_addr(_ChngA), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7823 :: 		while (Ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3476:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3477
	CLRWDT
	GOTO	L__Password_Entry_Screen3476
L__Password_Entry_Screen3477:
;GRR3000LManagementPanel.mpas,7824 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7826 :: 		while (ChngA = 1) do
L__Password_Entry_Screen3481:
	MOV	#lo_addr(_ChngA), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Entry_Screen5554
	GOTO	L__Password_Entry_Screen3482
L__Password_Entry_Screen5554:
;GRR3000LManagementPanel.mpas,7829 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7831 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3486
;GRR3000LManagementPanel.mpas,7833 :: 		while (Up_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3489:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3490
	CLRWDT
	GOTO	L__Password_Entry_Screen3489
L__Password_Entry_Screen3490:
;GRR3000LManagementPanel.mpas,7834 :: 		inc(PasswordArray[1]);
	MOV.B	#1, W1
	MOV	#lo_addr(_PasswordArray), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7835 :: 		if (PasswordArray[1] > 9) then
	MOV	#lo_addr(_PasswordArray), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	BRA GT	L__Password_Entry_Screen5555
	GOTO	L__Password_Entry_Screen3494
L__Password_Entry_Screen5555:
;GRR3000LManagementPanel.mpas,7836 :: 		PasswordArray[1] := 0;
	MOV	#lo_addr(_PasswordArray), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3494:
;GRR3000LManagementPanel.mpas,7837 :: 		end else
	GOTO	L__Password_Entry_Screen3487
L__Password_Entry_Screen3486:
;GRR3000LManagementPanel.mpas,7838 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3497
;GRR3000LManagementPanel.mpas,7840 :: 		while (Down_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3500:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3501
	CLRWDT
	GOTO	L__Password_Entry_Screen3500
L__Password_Entry_Screen3501:
;GRR3000LManagementPanel.mpas,7841 :: 		dec(PasswordArray[1]);
	MOV.B	#1, W1
	MOV	#lo_addr(_PasswordArray), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7842 :: 		if (PasswordArray[1] < 0) then
	MOV	#lo_addr(_PasswordArray), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__Password_Entry_Screen5556
	GOTO	L__Password_Entry_Screen3505
L__Password_Entry_Screen5556:
;GRR3000LManagementPanel.mpas,7843 :: 		PasswordArray[1] := 9;
	MOV	#lo_addr(_PasswordArray), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3505:
;GRR3000LManagementPanel.mpas,7844 :: 		end;
L__Password_Entry_Screen3497:
L__Password_Entry_Screen3487:
;GRR3000LManagementPanel.mpas,7846 :: 		ShortToStr(PasswordArray[1],TempText);
	ADD	W14, #1, W1
	MOV	#lo_addr(_PasswordArray), W0
	PUSH	W10
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ShortToStr
;GRR3000LManagementPanel.mpas,7847 :: 		ltrim(TempText);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_ltrim
	POP	W10
;GRR3000LManagementPanel.mpas,7848 :: 		PassText := TempText;
	ADD	W14, #5, W0
	ADD	W14, #1, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,7849 :: 		Glcd_Write_Text(PassText,48,row5,white);
	ADD	W14, #5, W0
	PUSH	W10
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#48, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7851 :: 		if (Ok_Button = 0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3508
;GRR3000LManagementPanel.mpas,7853 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7854 :: 		while (ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3511:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3512
	CLRWDT
	GOTO	L__Password_Entry_Screen3511
L__Password_Entry_Screen3512:
;GRR3000LManagementPanel.mpas,7855 :: 		ChngA := 0;
	MOV	#lo_addr(_ChngA), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7856 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7857 :: 		end;
L__Password_Entry_Screen3508:
;GRR3000LManagementPanel.mpas,7858 :: 		end;
	GOTO	L__Password_Entry_Screen3481
L__Password_Entry_Screen3482:
;GRR3000LManagementPanel.mpas,7859 :: 		end;
L__Password_Entry_Screen3473:
;GRR3000LManagementPanel.mpas,7860 :: 		end;
	GOTO	L__Password_Entry_Screen3468
L__Password_Entry_Screen3471:
;GRR3000LManagementPanel.mpas,7862 :: 		2: begin // þifrenin 3. karakteri
	MOV.B	[W14+0], W0
	CP.B	W0, #2
	BRA Z	L__Password_Entry_Screen5557
	GOTO	L__Password_Entry_Screen3517
L__Password_Entry_Screen5557:
;GRR3000LManagementPanel.mpas,7864 :: 		Glcd_Write_Char('x',48,row5,black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#48, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7865 :: 		Glcd_Write_Char('X',54,row5,white);
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#88, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7866 :: 		Glcd_Write_Char('x',60,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#60, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7867 :: 		Glcd_Write_Char('x',66,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#66, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7881 :: 		Glcd_Write_Text(SubTitle_Ok,84,Row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SubTitle_Ok), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7882 :: 		Glcd_Write_Text(SubTitle_Cancel,12,row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_SubTitle_Cancel), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7884 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3519
;GRR3000LManagementPanel.mpas,7886 :: 		ChngB := 1;
	MOV	#lo_addr(_ChngB), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7888 :: 		while (Ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3522:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3523
	CLRWDT
	GOTO	L__Password_Entry_Screen3522
L__Password_Entry_Screen3523:
;GRR3000LManagementPanel.mpas,7889 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7891 :: 		while (ChngB = 1) do
L__Password_Entry_Screen3527:
	MOV	#lo_addr(_ChngB), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Entry_Screen5558
	GOTO	L__Password_Entry_Screen3528
L__Password_Entry_Screen5558:
;GRR3000LManagementPanel.mpas,7894 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7896 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3532
;GRR3000LManagementPanel.mpas,7898 :: 		while (Up_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3535:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3536
	CLRWDT
	GOTO	L__Password_Entry_Screen3535
L__Password_Entry_Screen3536:
;GRR3000LManagementPanel.mpas,7899 :: 		inc(PasswordArray[2]);
	MOV.B	#1, W1
	MOV	#lo_addr(_PasswordArray+1), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7900 :: 		if (PasswordArray[2] > 9) then
	MOV	#lo_addr(_PasswordArray+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	BRA GT	L__Password_Entry_Screen5559
	GOTO	L__Password_Entry_Screen3540
L__Password_Entry_Screen5559:
;GRR3000LManagementPanel.mpas,7901 :: 		PasswordArray[2] := 0;
	MOV	#lo_addr(_PasswordArray+1), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3540:
;GRR3000LManagementPanel.mpas,7902 :: 		end else
	GOTO	L__Password_Entry_Screen3533
L__Password_Entry_Screen3532:
;GRR3000LManagementPanel.mpas,7903 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3543
;GRR3000LManagementPanel.mpas,7905 :: 		while (Down_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3546:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3547
	CLRWDT
	GOTO	L__Password_Entry_Screen3546
L__Password_Entry_Screen3547:
;GRR3000LManagementPanel.mpas,7906 :: 		dec(PasswordArray[2]);
	MOV.B	#1, W1
	MOV	#lo_addr(_PasswordArray+1), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7907 :: 		if (PasswordArray[2] < 0) then
	MOV	#lo_addr(_PasswordArray+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__Password_Entry_Screen5560
	GOTO	L__Password_Entry_Screen3551
L__Password_Entry_Screen5560:
;GRR3000LManagementPanel.mpas,7908 :: 		PasswordArray[2] := 9;
	MOV	#lo_addr(_PasswordArray+1), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3551:
;GRR3000LManagementPanel.mpas,7909 :: 		end;
L__Password_Entry_Screen3543:
L__Password_Entry_Screen3533:
;GRR3000LManagementPanel.mpas,7911 :: 		ShortToStr(PasswordArray[2],TempText);
	ADD	W14, #1, W1
	MOV	#lo_addr(_PasswordArray+1), W0
	PUSH	W10
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ShortToStr
;GRR3000LManagementPanel.mpas,7912 :: 		ltrim(TempText);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_ltrim
	POP	W10
;GRR3000LManagementPanel.mpas,7913 :: 		PassText := TempText;
	ADD	W14, #5, W0
	ADD	W14, #1, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,7914 :: 		Glcd_Write_Text(PassText,54,row5,white);
	ADD	W14, #5, W0
	PUSH	W10
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7916 :: 		if (Ok_Button = 0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3554
;GRR3000LManagementPanel.mpas,7918 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7919 :: 		while (ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3557:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3558
	CLRWDT
	GOTO	L__Password_Entry_Screen3557
L__Password_Entry_Screen3558:
;GRR3000LManagementPanel.mpas,7920 :: 		ChngB := 0;
	MOV	#lo_addr(_ChngB), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7921 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7922 :: 		end;
L__Password_Entry_Screen3554:
;GRR3000LManagementPanel.mpas,7923 :: 		end;
	GOTO	L__Password_Entry_Screen3527
L__Password_Entry_Screen3528:
;GRR3000LManagementPanel.mpas,7924 :: 		end;
L__Password_Entry_Screen3519:
;GRR3000LManagementPanel.mpas,7925 :: 		end;
	GOTO	L__Password_Entry_Screen3468
L__Password_Entry_Screen3517:
;GRR3000LManagementPanel.mpas,7926 :: 		3: begin // þifrenin 2. karakteri
	MOV.B	[W14+0], W0
	CP.B	W0, #3
	BRA Z	L__Password_Entry_Screen5561
	GOTO	L__Password_Entry_Screen3563
L__Password_Entry_Screen5561:
;GRR3000LManagementPanel.mpas,7928 :: 		Glcd_Write_Char('x',48,row5,black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#48, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7929 :: 		Glcd_Write_Char('x',54,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7930 :: 		Glcd_Write_Char('X',60,row5,white);
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#60, W11
	MOV.B	#88, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7931 :: 		Glcd_Write_Char('x',66,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#66, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7944 :: 		Glcd_Write_Text(SubTitle_Ok,84,Row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SubTitle_Ok), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,7945 :: 		Glcd_Write_Text(SubTitle_Cancel,12,row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_SubTitle_Cancel), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7947 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3565
;GRR3000LManagementPanel.mpas,7949 :: 		ChngC := 1;
	MOV	#lo_addr(_ChngC), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7951 :: 		while (Ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3568:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3569
	CLRWDT
	GOTO	L__Password_Entry_Screen3568
L__Password_Entry_Screen3569:
;GRR3000LManagementPanel.mpas,7952 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7954 :: 		while (ChngC = 1) do
L__Password_Entry_Screen3573:
	MOV	#lo_addr(_ChngC), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Entry_Screen5562
	GOTO	L__Password_Entry_Screen3574
L__Password_Entry_Screen5562:
;GRR3000LManagementPanel.mpas,7957 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,7959 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3578
;GRR3000LManagementPanel.mpas,7961 :: 		while (Up_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3581:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3582
	CLRWDT
	GOTO	L__Password_Entry_Screen3581
L__Password_Entry_Screen3582:
;GRR3000LManagementPanel.mpas,7962 :: 		inc(PasswordArray[3]);
	MOV.B	#1, W1
	MOV	#lo_addr(_PasswordArray+2), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7963 :: 		if (PasswordArray[3] > 9) then
	MOV	#lo_addr(_PasswordArray+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	BRA GT	L__Password_Entry_Screen5563
	GOTO	L__Password_Entry_Screen3586
L__Password_Entry_Screen5563:
;GRR3000LManagementPanel.mpas,7964 :: 		PasswordArray[3] := 0;
	MOV	#lo_addr(_PasswordArray+2), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3586:
;GRR3000LManagementPanel.mpas,7965 :: 		end else
	GOTO	L__Password_Entry_Screen3579
L__Password_Entry_Screen3578:
;GRR3000LManagementPanel.mpas,7966 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3589
;GRR3000LManagementPanel.mpas,7968 :: 		while (Down_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3592:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3593
	CLRWDT
	GOTO	L__Password_Entry_Screen3592
L__Password_Entry_Screen3593:
;GRR3000LManagementPanel.mpas,7969 :: 		dec(PasswordArray[3]);
	MOV.B	#1, W1
	MOV	#lo_addr(_PasswordArray+2), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,7970 :: 		if (PasswordArray[3] < 0) then
	MOV	#lo_addr(_PasswordArray+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__Password_Entry_Screen5564
	GOTO	L__Password_Entry_Screen3597
L__Password_Entry_Screen5564:
;GRR3000LManagementPanel.mpas,7971 :: 		PasswordArray[3] := 9;
	MOV	#lo_addr(_PasswordArray+2), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3597:
;GRR3000LManagementPanel.mpas,7972 :: 		end;
L__Password_Entry_Screen3589:
L__Password_Entry_Screen3579:
;GRR3000LManagementPanel.mpas,7974 :: 		ShortToStr(PasswordArray[3],TempText);
	ADD	W14, #1, W1
	MOV	#lo_addr(_PasswordArray+2), W0
	PUSH	W10
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ShortToStr
;GRR3000LManagementPanel.mpas,7975 :: 		ltrim(TempText);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_ltrim
	POP	W10
;GRR3000LManagementPanel.mpas,7976 :: 		PassText := TempText;
	ADD	W14, #5, W0
	ADD	W14, #1, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,7977 :: 		Glcd_Write_Text(PassText,60,row5,white);
	ADD	W14, #5, W0
	PUSH	W10
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#60, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,7979 :: 		if (Ok_Button = 0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3600
;GRR3000LManagementPanel.mpas,7981 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7982 :: 		while (ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3603:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3604
	CLRWDT
	GOTO	L__Password_Entry_Screen3603
L__Password_Entry_Screen3604:
;GRR3000LManagementPanel.mpas,7983 :: 		ChngC := 0;
	MOV	#lo_addr(_ChngC), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,7984 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,7985 :: 		end;
L__Password_Entry_Screen3600:
;GRR3000LManagementPanel.mpas,7988 :: 		end;
	GOTO	L__Password_Entry_Screen3573
L__Password_Entry_Screen3574:
;GRR3000LManagementPanel.mpas,7991 :: 		end;
L__Password_Entry_Screen3565:
;GRR3000LManagementPanel.mpas,7995 :: 		end;
	GOTO	L__Password_Entry_Screen3468
L__Password_Entry_Screen3563:
;GRR3000LManagementPanel.mpas,7996 :: 		4: begin  // þifrenin 1. karakteri
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA Z	L__Password_Entry_Screen5565
	GOTO	L__Password_Entry_Screen3609
L__Password_Entry_Screen5565:
;GRR3000LManagementPanel.mpas,7998 :: 		Glcd_Write_Char('x',48,row5,black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#48, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,7999 :: 		Glcd_Write_Char('x',54,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8000 :: 		Glcd_Write_Char('x',60,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#60, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8001 :: 		Glcd_Write_Char('X',66,row5,white);
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#66, W11
	MOV.B	#88, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8015 :: 		Glcd_Write_Text(SubTitle_Ok,84,Row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SubTitle_Ok), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8016 :: 		Glcd_Write_Text(SubTitle_Cancel,12,row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_SubTitle_Cancel), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,8018 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3611
;GRR3000LManagementPanel.mpas,8020 :: 		ChngD := 1;
	MOV	#lo_addr(_ChngD), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8022 :: 		while (Ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3614:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3615
	CLRWDT
	GOTO	L__Password_Entry_Screen3614
L__Password_Entry_Screen3615:
;GRR3000LManagementPanel.mpas,8023 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,8025 :: 		while (ChngD = 1) do
L__Password_Entry_Screen3619:
	MOV	#lo_addr(_ChngD), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Entry_Screen5566
	GOTO	L__Password_Entry_Screen3620
L__Password_Entry_Screen5566:
;GRR3000LManagementPanel.mpas,8028 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8030 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3624
;GRR3000LManagementPanel.mpas,8032 :: 		while (Up_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3627:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__Password_Entry_Screen3628
	CLRWDT
	GOTO	L__Password_Entry_Screen3627
L__Password_Entry_Screen3628:
;GRR3000LManagementPanel.mpas,8033 :: 		inc(PasswordArray[4]);
	MOV.B	#1, W1
	MOV	#lo_addr(_PasswordArray+3), W0
	ADD.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,8034 :: 		if (PasswordArray[4] > 9) then
	MOV	#lo_addr(_PasswordArray+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	BRA GT	L__Password_Entry_Screen5567
	GOTO	L__Password_Entry_Screen3632
L__Password_Entry_Screen5567:
;GRR3000LManagementPanel.mpas,8035 :: 		PasswordArray[4] := 0;
	MOV	#lo_addr(_PasswordArray+3), W1
	CLR	W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3632:
;GRR3000LManagementPanel.mpas,8036 :: 		end else
	GOTO	L__Password_Entry_Screen3625
L__Password_Entry_Screen3624:
;GRR3000LManagementPanel.mpas,8037 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3635
;GRR3000LManagementPanel.mpas,8039 :: 		while (Down_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3638:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__Password_Entry_Screen3639
	CLRWDT
	GOTO	L__Password_Entry_Screen3638
L__Password_Entry_Screen3639:
;GRR3000LManagementPanel.mpas,8040 :: 		dec(PasswordArray[4]);
	MOV.B	#1, W1
	MOV	#lo_addr(_PasswordArray+3), W0
	SUBR.B	W1, [W0], [W0]
;GRR3000LManagementPanel.mpas,8041 :: 		if (PasswordArray[4] < 0) then
	MOV	#lo_addr(_PasswordArray+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA LT	L__Password_Entry_Screen5568
	GOTO	L__Password_Entry_Screen3643
L__Password_Entry_Screen5568:
;GRR3000LManagementPanel.mpas,8042 :: 		PasswordArray[4] := 9;
	MOV	#lo_addr(_PasswordArray+3), W1
	MOV.B	#9, W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3643:
;GRR3000LManagementPanel.mpas,8043 :: 		end;
L__Password_Entry_Screen3635:
L__Password_Entry_Screen3625:
;GRR3000LManagementPanel.mpas,8045 :: 		ShortToStr(PasswordArray[4],TempText);
	ADD	W14, #1, W1
	MOV	#lo_addr(_PasswordArray+3), W0
	PUSH	W10
	MOV	W1, W11
	MOV.B	[W0], W10
	CALL	_ShortToStr
;GRR3000LManagementPanel.mpas,8046 :: 		ltrim(TempText);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_ltrim
	POP	W10
;GRR3000LManagementPanel.mpas,8047 :: 		PassText := TempText;
	ADD	W14, #5, W0
	ADD	W14, #1, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8048 :: 		Glcd_Write_Text(PassText,66,row5,white);
	ADD	W14, #5, W0
	PUSH	W10
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#66, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,8050 :: 		if (Ok_Button = 0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3646
;GRR3000LManagementPanel.mpas,8052 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,8053 :: 		while (ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3649:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3650
	CLRWDT
	GOTO	L__Password_Entry_Screen3649
L__Password_Entry_Screen3650:
;GRR3000LManagementPanel.mpas,8054 :: 		ChngD := 0;
	MOV	#lo_addr(_ChngD), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8055 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,8056 :: 		end;
L__Password_Entry_Screen3646:
;GRR3000LManagementPanel.mpas,8059 :: 		end;
	GOTO	L__Password_Entry_Screen3619
L__Password_Entry_Screen3620:
;GRR3000LManagementPanel.mpas,8062 :: 		end;
L__Password_Entry_Screen3611:
;GRR3000LManagementPanel.mpas,8063 :: 		end;
	GOTO	L__Password_Entry_Screen3468
L__Password_Entry_Screen3609:
;GRR3000LManagementPanel.mpas,8064 :: 		5: begin  //  ok
	MOV.B	[W14+0], W0
	CP.B	W0, #5
	BRA Z	L__Password_Entry_Screen5569
	GOTO	L__Password_Entry_Screen3655
L__Password_Entry_Screen5569:
;GRR3000LManagementPanel.mpas,8066 :: 		Glcd_Write_Char('x',48,row5,black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#48, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8067 :: 		Glcd_Write_Char('x',54,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8068 :: 		Glcd_Write_Char('x',60,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#60, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8069 :: 		Glcd_Write_Char('x',66,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#66, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8083 :: 		Glcd_Write_Text(SubTitle_Ok,84,Row6,white);
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SubTitle_Ok), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8084 :: 		Glcd_Write_Text(SubTitle_Cancel,12,row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_SubTitle_Cancel), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,8086 :: 		if (View = 0) then
	CP.B	W10, #0
	BRA Z	L__Password_Entry_Screen5570
	GOTO	L__Password_Entry_Screen3657
L__Password_Entry_Screen5570:
;GRR3000LManagementPanel.mpas,8088 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3660
;GRR3000LManagementPanel.mpas,8090 :: 		while (Ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3663:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3664
	CLRWDT
	GOTO	L__Password_Entry_Screen3663
L__Password_Entry_Screen3664:
;GRR3000LManagementPanel.mpas,8091 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,8092 :: 		PasswordHam        := PasswordArray[1] * 1000;
	MOV	#lo_addr(_PasswordArray), W0
	SE	[W0], W1
	MOV	#1000, W0
	MUL.SS	W1, W0, W2
	MOV	W2, _PasswordHam
;GRR3000LManagementPanel.mpas,8093 :: 		Temp_Word          := PasswordArray[2] * 100;
	MOV	#lo_addr(_PasswordArray+1), W0
	SE	[W0], W1
	MOV	#100, W0
	MUL.SS	W1, W0, W0
;GRR3000LManagementPanel.mpas,8094 :: 		PasswordHam        := PasswordHam + Temp_Word;
	ADD	W2, W0, W2
	MOV	W2, _PasswordHam
;GRR3000LManagementPanel.mpas,8095 :: 		Temp_Word          := PasswordArray[3] * 10;
	MOV	#lo_addr(_PasswordArray+2), W0
	SE	[W0], W1
	MOV	#10, W0
	MUL.SS	W1, W0, W0
;GRR3000LManagementPanel.mpas,8096 :: 		PasswordHam        := PasswordHam + Temp_Word;
	ADD	W2, W0, W1
	MOV	W1, _PasswordHam
;GRR3000LManagementPanel.mpas,8097 :: 		PasswordHam        := PasswordHam + PasswordArray[4];
	MOV	#lo_addr(_PasswordArray+3), W0
	SE	[W0], W0
	ADD	W1, W0, W0
	MOV	W0, _PasswordHam
;GRR3000LManagementPanel.mpas,8099 :: 		EEPROM_Write(EE_PasswordEeAddr, PasswordHam);
	MOV	W0, W12
	MOV	#61552, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
	POP	W10
;GRR3000LManagementPanel.mpas,8100 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__Password_Entry_Screen3668:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Entry_Screen3668
;GRR3000LManagementPanel.mpas,8101 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,8102 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8108 :: 		Chng1 := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+7]
;GRR3000LManagementPanel.mpas,8112 :: 		end;
L__Password_Entry_Screen3660:
;GRR3000LManagementPanel.mpas,8113 :: 		end else
	GOTO	L__Password_Entry_Screen3658
L__Password_Entry_Screen3657:
;GRR3000LManagementPanel.mpas,8114 :: 		if (View = 1) then
	CP.B	W10, #1
	BRA Z	L__Password_Entry_Screen5571
	GOTO	L__Password_Entry_Screen3673
L__Password_Entry_Screen5571:
;GRR3000LManagementPanel.mpas,8116 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3676
;GRR3000LManagementPanel.mpas,8119 :: 		while (Ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3679:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3680
	CLRWDT
	GOTO	L__Password_Entry_Screen3679
L__Password_Entry_Screen3680:
;GRR3000LManagementPanel.mpas,8120 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,8122 :: 		PasswordHam        := PasswordArray[1] * 1000;
	MOV	#lo_addr(_PasswordArray), W0
	SE	[W0], W1
	MOV	#1000, W0
	MUL.SS	W1, W0, W2
	MOV	W2, _PasswordHam
;GRR3000LManagementPanel.mpas,8123 :: 		Temp_Word          := PasswordArray[2] * 100;
	MOV	#lo_addr(_PasswordArray+1), W0
	SE	[W0], W1
	MOV	#100, W0
	MUL.SS	W1, W0, W0
;GRR3000LManagementPanel.mpas,8124 :: 		PasswordHam        := PasswordHam + Temp_Word;
	ADD	W2, W0, W2
	MOV	W2, _PasswordHam
;GRR3000LManagementPanel.mpas,8125 :: 		Temp_Word          := PasswordArray[3] * 10;
	MOV	#lo_addr(_PasswordArray+2), W0
	SE	[W0], W1
	MOV	#10, W0
	MUL.SS	W1, W0, W0
;GRR3000LManagementPanel.mpas,8126 :: 		PasswordHam        := PasswordHam + Temp_Word;
	ADD	W2, W0, W1
	MOV	W1, _PasswordHam
;GRR3000LManagementPanel.mpas,8127 :: 		PasswordHam        := PasswordHam + PasswordArray[4];
	MOV	#lo_addr(_PasswordArray+3), W0
	SE	[W0], W0
	ADD	W1, W0, W2
	MOV	W2, _PasswordHam
;GRR3000LManagementPanel.mpas,8129 :: 		if ((PasswordHam = User_Password)or(PasswordHam = Gemta_Password)) then
	MOV	#lo_addr(_User_Password), W0
	CP	W2, [W0]
	CLR	W1
	BRA NZ	L__Password_Entry_Screen5572
	COM	W1
L__Password_Entry_Screen5572:
	MOV	#8837, W0
	CP	W2, W0
	CLR	W0
	BRA NZ	L__Password_Entry_Screen5573
	COM	W0
L__Password_Entry_Screen5573:
	IOR	W1, W0, W0
	BRA NZ	L__Password_Entry_Screen5574
	GOTO	L__Password_Entry_Screen3684
L__Password_Entry_Screen5574:
;GRR3000LManagementPanel.mpas,8138 :: 		Glcd_Write_Text(SubTitle_PassOk,0,row8,Black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#7, W12
	CLR	W11
	MOV	#lo_addr(_SubTitle_PassOk), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8140 :: 		Pause_ms(500);
	MOV	#500, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,8141 :: 		Chng1 := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+7]
;GRR3000LManagementPanel.mpas,8142 :: 		MenuExit    := 0x00;  // menüye gir
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8143 :: 		end else
	GOTO	L__Password_Entry_Screen3685
L__Password_Entry_Screen3684:
;GRR3000LManagementPanel.mpas,8144 :: 		if ((PasswordHam <> User_Password)or(PasswordHam <> Gemta_Password)) then
	MOV	_PasswordHam, W2
	MOV	#lo_addr(_User_Password), W0
	CP	W2, [W0]
	CLR	W1
	BRA Z	L__Password_Entry_Screen5575
	COM	W1
L__Password_Entry_Screen5575:
	MOV	#8837, W0
	CP	W2, W0
	CLR	W0
	BRA Z	L__Password_Entry_Screen5576
	COM	W0
L__Password_Entry_Screen5576:
	IOR	W1, W0, W0
	BRA NZ	L__Password_Entry_Screen5577
	GOTO	L__Password_Entry_Screen3687
L__Password_Entry_Screen5577:
;GRR3000LManagementPanel.mpas,8153 :: 		Glcd_Write_Text(SubTitle_PassFlt,0,row8,Black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#7, W12
	CLR	W11
	MOV	#lo_addr(_SubTitle_PassFlt), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8154 :: 		Pause_ms(500);
	MOV	#500, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,8155 :: 		Chng1 := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+7]
;GRR3000LManagementPanel.mpas,8156 :: 		MenuExit    := 0xFF;  // menüden çýk
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8157 :: 		end;
L__Password_Entry_Screen3687:
L__Password_Entry_Screen3685:
;GRR3000LManagementPanel.mpas,8159 :: 		end;
L__Password_Entry_Screen3676:
;GRR3000LManagementPanel.mpas,8160 :: 		end;
L__Password_Entry_Screen3673:
L__Password_Entry_Screen3658:
;GRR3000LManagementPanel.mpas,8162 :: 		end;
	GOTO	L__Password_Entry_Screen3468
L__Password_Entry_Screen3655:
;GRR3000LManagementPanel.mpas,8164 :: 		6: begin  // geri
	MOV.B	[W14+0], W0
	CP.B	W0, #6
	BRA Z	L__Password_Entry_Screen5578
	GOTO	L__Password_Entry_Screen3691
L__Password_Entry_Screen5578:
;GRR3000LManagementPanel.mpas,8165 :: 		Glcd_Write_Char('x',48,row5,black);
	PUSH	W10
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#48, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8166 :: 		Glcd_Write_Char('x',54,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#54, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8167 :: 		Glcd_Write_Char('x',60,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#60, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8168 :: 		Glcd_Write_Char('x',66,row5,Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#66, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8182 :: 		Glcd_Write_Text(SubTitle_Ok,84,Row6,black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#84, W11
	MOV	#lo_addr(_SubTitle_Ok), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8183 :: 		Glcd_Write_Text(SubTitle_Cancel,12,row6,white);
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#12, W11
	MOV	#lo_addr(_SubTitle_Cancel), W10
	CALL	_Glcd_Write_Text
	POP	W10
;GRR3000LManagementPanel.mpas,8185 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3693
;GRR3000LManagementPanel.mpas,8189 :: 		while (Ok_Button =0) do begin asm clrwdt; end; end;
L__Password_Entry_Screen3696:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Entry_Screen3697
	CLRWDT
	GOTO	L__Password_Entry_Screen3696
L__Password_Entry_Screen3697:
;GRR3000LManagementPanel.mpas,8191 :: 		Pause_ms(100);
	PUSH	W10
	MOV	#100, W10
	CALL	_Pause_Ms
	POP	W10
;GRR3000LManagementPanel.mpas,8193 :: 		Chng1 := 1;
	MOV.B	#1, W0
	MOV.B	W0, [W14+7]
;GRR3000LManagementPanel.mpas,8194 :: 		if View = 1 then MenuExit := 0xFF;
	CP.B	W10, #1
	BRA Z	L__Password_Entry_Screen5579
	GOTO	L__Password_Entry_Screen3701
L__Password_Entry_Screen5579:
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#255, W0
	MOV.B	W0, [W1]
L__Password_Entry_Screen3701:
;GRR3000LManagementPanel.mpas,8196 :: 		end;
L__Password_Entry_Screen3693:
;GRR3000LManagementPanel.mpas,8198 :: 		end;
	GOTO	L__Password_Entry_Screen3468
L__Password_Entry_Screen3691:
L__Password_Entry_Screen3468:
;GRR3000LManagementPanel.mpas,8202 :: 		end;
	GOTO	L__Password_Entry_Screen3442
L__Password_Entry_Screen3443:
;GRR3000LManagementPanel.mpas,8203 :: 		end;
L_end_Password_Entry_Screen:
	POP	W13
	POP	W12
	POP	W11
	ULNK
	RETURN
; end of _Password_Entry_Screen

_Password_Settings:

;GRR3000LManagementPanel.mpas,8207 :: 		begin
;GRR3000LManagementPanel.mpas,8209 :: 		MenuExit        := 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#lo_addr(_MenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8210 :: 		MenuSayacValue  := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8211 :: 		Chng[11]        := 2;
	MOV	#lo_addr(_Chng+10), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8212 :: 		Chng[9]         := 1;
	MOV	#lo_addr(_Chng+8), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8215 :: 		Confirm_AcMenuBit       := EEPROM_Read(EE_ConfirmAcMenuEeAddr);
	MOV	#61534, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_AcMenuBit), W1
	BSET	[W1], BitPos(_Confirm_AcMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_AcMenuBit+0)
;GRR3000LManagementPanel.mpas,8216 :: 		Confirm_BattMenuBit     := EEPROM_Read(EE_ConfirmBattMenuEeAddr);
	MOV	#61538, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_BattMenuBit), W1
	BSET	[W1], BitPos(_Confirm_BattMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_BattMenuBit+0)
;GRR3000LManagementPanel.mpas,8217 :: 		Confirm_ClockMenuBit    := EEPROM_Read(EE_ConfirmClockMenuEeAddr);
	MOV	#61546, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_ClockMenuBit), W1
	BSET	[W1], BitPos(_Confirm_ClockMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_ClockMenuBit+0)
;GRR3000LManagementPanel.mpas,8218 :: 		Confirm_DcMenuBit       := EEPROM_Read(EE_ConfirmDcMenuEeAddr);
	MOV	#61536, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_DcMenuBit), W1
	BSET	[W1], BitPos(_Confirm_DcMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_DcMenuBit+0)
;GRR3000LManagementPanel.mpas,8220 :: 		Confirm_LeakaMenuBit    := EEPROM_Read(EE_ConfirmLeakMenuEeAddr);
	MOV	#61542, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W1
	BSET	[W1], BitPos(_Confirm_LeakaMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_LeakaMenuBit+0)
;GRR3000LManagementPanel.mpas,8221 :: 		Confirm_ModbusMenuBit   := EEPROM_Read(EE_ConfirmModbusMenuEeAddr);
	MOV	#61548, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W1
	BSET	[W1], BitPos(_Confirm_ModbusMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_ModbusMenuBit+0)
;GRR3000LManagementPanel.mpas,8222 :: 		Confirm_OperaMenuBit    := EEPROM_Read(EE_ConfirmOperaMenuEeAddr);
	MOV	#61540, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_OperaMenuBit), W1
	BSET	[W1], BitPos(_Confirm_OperaMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_OperaMenuBit+0)
;GRR3000LManagementPanel.mpas,8223 :: 		Confirm_TempeMenuBit    := EEPROM_Read(EE_ConfirmTempMenuEeAddr);
	MOV	#61544, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_TempeMenuBit), W1
	BSET	[W1], BitPos(_Confirm_TempeMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_TempeMenuBit+0)
;GRR3000LManagementPanel.mpas,8224 :: 		User_Password           := EEPROM_Read(EE_PasswordEeAddr);
	MOV	#61552, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _User_Password
;GRR3000LManagementPanel.mpas,8226 :: 		Password_Entry_Screen(1);
	MOV.B	#1, W10
	CALL	_Password_Entry_Screen
;GRR3000LManagementPanel.mpas,8227 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8229 :: 		While (MenuExit =0) do
L__Password_Settings3705:
	MOV	#lo_addr(_MenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__Password_Settings5581
	GOTO	L__Password_Settings3706
L__Password_Settings5581:
;GRR3000LManagementPanel.mpas,8233 :: 		MenuSayac := MenuButtonRead(10,255); // 10 satýr menu var
	MOV.B	#255, W11
	MOV.B	#10, W10
	CALL	_MenuButtonRead
	MOV	#lo_addr(_MenuSayac), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8234 :: 		Chng[9]   := 1;
	MOV	#lo_addr(_Chng+8), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8236 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8238 :: 		if (MenuSayac < 8) then
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA LT	L__Password_Settings5582
	GOTO	L__Password_Settings3710
L__Password_Settings5582:
;GRR3000LManagementPanel.mpas,8240 :: 		if (Chng[11] =2) then
	MOV	#lo_addr(_Chng+10), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Password_Settings5583
	GOTO	L__Password_Settings3713
L__Password_Settings5583:
;GRR3000LManagementPanel.mpas,8242 :: 		Chng[11] := 1;
	MOV	#lo_addr(_Chng+10), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8248 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8251 :: 		Glcd_Write_Text(Title_AuthMenu1     , 0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_AuthMenu1), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8252 :: 		Glcd_Write_Text(SubTitle_PswChng    , 6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_PswChng), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8253 :: 		Glcd_Write_Text(SubTitle_PswAcset   , 6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_PswAcset), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8254 :: 		Glcd_Write_Text(SubTitle_PswDcset   , 6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_PswDcset), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8255 :: 		Glcd_Write_Text(SubTitle_Pswbatset  , 6, Row5, Black);
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Pswbatset), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8256 :: 		Glcd_Write_Text(SubTitle_Pswopmod   , 6, Row6, Black);
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Pswopmod), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8257 :: 		Glcd_Write_Text(SubTitle_Pswleak    , 6, Row7, Black);
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Pswleak), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8258 :: 		Glcd_Write_Text(SubTitle_Pswtemp    , 6, Row8, Black);
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Pswtemp), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8264 :: 		if (Confirm_AcMenuBit = 1)    then Glcd_Write_Char('+', 114, Row3,Black) else Glcd_Write_Char('x', 114, Row3,Black);
	MOV	#lo_addr(_Confirm_AcMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_AcMenuBit+0)
	GOTO	L__Password_Settings3716
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3717
L__Password_Settings3716:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3717:
;GRR3000LManagementPanel.mpas,8265 :: 		if (Confirm_DcMenuBit = 1)    then Glcd_Write_Char('+', 114, Row4,Black) else Glcd_Write_Char('x', 114, Row4,Black);
	MOV	#lo_addr(_Confirm_DcMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_DcMenuBit+0)
	GOTO	L__Password_Settings3719
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3720
L__Password_Settings3719:
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3720:
;GRR3000LManagementPanel.mpas,8266 :: 		if (Confirm_BattMenuBit = 1)  then Glcd_Write_Char('+', 114, Row5,Black) else Glcd_Write_Char('x', 114, Row5,Black);
	MOV	#lo_addr(_Confirm_BattMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_BattMenuBit+0)
	GOTO	L__Password_Settings3722
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3723
L__Password_Settings3722:
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3723:
;GRR3000LManagementPanel.mpas,8267 :: 		if (Confirm_OperaMenuBit = 1) then Glcd_Write_Char('+', 114, Row6,Black) else Glcd_Write_Char('x', 114, Row6,Black);
	MOV	#lo_addr(_Confirm_OperaMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_OperaMenuBit+0)
	GOTO	L__Password_Settings3725
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3726
L__Password_Settings3725:
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3726:
;GRR3000LManagementPanel.mpas,8268 :: 		if (Confirm_LeakaMenuBit = 1) then Glcd_Write_Char('+', 114, Row7,Black) else Glcd_Write_Char('x', 114, Row7,Black);
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_LeakaMenuBit+0)
	GOTO	L__Password_Settings3728
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3729
L__Password_Settings3728:
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3729:
;GRR3000LManagementPanel.mpas,8269 :: 		if (Confirm_TempeMenuBit = 1) then Glcd_Write_Char('+', 114, Row8,Black) else Glcd_Write_Char('x', 114, Row8,Black);
	MOV	#lo_addr(_Confirm_TempeMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_TempeMenuBit+0)
	GOTO	L__Password_Settings3731
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3732
L__Password_Settings3731:
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3732:
;GRR3000LManagementPanel.mpas,8271 :: 		end;
L__Password_Settings3713:
;GRR3000LManagementPanel.mpas,8274 :: 		end else
	GOTO	L__Password_Settings3711
L__Password_Settings3710:
;GRR3000LManagementPanel.mpas,8275 :: 		if (MenuSayac >= 8) then
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA GE	L__Password_Settings5584
	GOTO	L__Password_Settings3734
L__Password_Settings5584:
;GRR3000LManagementPanel.mpas,8277 :: 		if (Chng[11] =1) then
	MOV	#lo_addr(_Chng+10), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5585
	GOTO	L__Password_Settings3737
L__Password_Settings5585:
;GRR3000LManagementPanel.mpas,8279 :: 		Chng[11] := 2;
	MOV	#lo_addr(_Chng+10), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8286 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8289 :: 		Glcd_Write_Text(Title_AuthMenu2     , 0, Row1, Black);
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	#lo_addr(_Title_AuthMenu2), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8290 :: 		Glcd_Write_Text(SubTitle_Pswclock   , 6, Row2, Black);
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Pswclock), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8291 :: 		Glcd_Write_Text(SubTitle_Pswmodbus  , 6, Row3, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Pswmodbus), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8292 :: 		Glcd_Write_Text(SubTitle_Back       , 6, Row4, Black);
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	#lo_addr(_SubTitle_Back), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8294 :: 		if (Confirm_ClockMenuBit = 1) then Glcd_Write_Char('+', 114, Row2,Black) else Glcd_Write_Char('x', 114, Row2,Black);
	MOV	#lo_addr(_Confirm_ClockMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_ClockMenuBit+0)
	GOTO	L__Password_Settings3740
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3741
L__Password_Settings3740:
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3741:
;GRR3000LManagementPanel.mpas,8295 :: 		if (Confirm_ModbusMenuBit = 1) then Glcd_Write_Char('+', 114, Row3,Black) else Glcd_Write_Char('x', 114, Row3,Black);
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_ModbusMenuBit+0)
	GOTO	L__Password_Settings3743
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3744
L__Password_Settings3743:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3744:
;GRR3000LManagementPanel.mpas,8297 :: 		end;
L__Password_Settings3737:
;GRR3000LManagementPanel.mpas,8299 :: 		end;
L__Password_Settings3734:
L__Password_Settings3711:
;GRR3000LManagementPanel.mpas,8302 :: 		1: begin // þifre deðiþtirme
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5586
	GOTO	L__Password_Settings3748
L__Password_Settings5586:
;GRR3000LManagementPanel.mpas,8303 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3750
;GRR3000LManagementPanel.mpas,8305 :: 		while (Ok_Button =0) do
L__Password_Settings3753:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3754
;GRR3000LManagementPanel.mpas,8307 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8308 :: 		end;
	GOTO	L__Password_Settings3753
L__Password_Settings3754:
;GRR3000LManagementPanel.mpas,8311 :: 		Password_Entry_Screen(0);
	CLR	W10
	CALL	_Password_Entry_Screen
;GRR3000LManagementPanel.mpas,8312 :: 		Chng[11] := 2; // ekraný yeniden yükle
	MOV	#lo_addr(_Chng+10), W1
	MOV.B	#2, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8314 :: 		end;
L__Password_Settings3750:
;GRR3000LManagementPanel.mpas,8315 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings3748:
;GRR3000LManagementPanel.mpas,8317 :: 		2: begin
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Password_Settings5587
	GOTO	L__Password_Settings3759
L__Password_Settings5587:
;GRR3000LManagementPanel.mpas,8321 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3761
;GRR3000LManagementPanel.mpas,8323 :: 		while (Ok_Button =0) do
L__Password_Settings3764:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3765
;GRR3000LManagementPanel.mpas,8325 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8326 :: 		end;
	GOTO	L__Password_Settings3764
L__Password_Settings3765:
;GRR3000LManagementPanel.mpas,8329 :: 		Chng[1] := 1;
	MOV	#lo_addr(_Chng), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8331 :: 		While (Chng[1] =1) do
L__Password_Settings3769:
	MOV	#lo_addr(_Chng), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5588
	GOTO	L__Password_Settings3770
L__Password_Settings5588:
;GRR3000LManagementPanel.mpas,8333 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8335 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5589
	BCLR	W2, #0
	BRA	L__Password_Settings5592
L__Password_Settings5589:
	BSET	W2, #0
L__Password_Settings5592:
	BTSS	W2, #0
	GOTO	L__Password_Settings3774
;GRR3000LManagementPanel.mpas,8337 :: 		while ((Up_Button =0)or(Down_Button=0)) do
L__Password_Settings3777:
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5593
	BCLR	W2, #0
	BRA	L__Password_Settings5596
L__Password_Settings5593:
	BSET	W2, #0
L__Password_Settings5596:
	BTSS	W2, #0
	GOTO	L__Password_Settings3778
;GRR3000LManagementPanel.mpas,8339 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8340 :: 		end;
	GOTO	L__Password_Settings3777
L__Password_Settings3778:
;GRR3000LManagementPanel.mpas,8342 :: 		Confirm_AcMenuBit := not Confirm_AcMenuBit;
	MOV	#lo_addr(_Confirm_AcMenuBit), W1
	MOV	#lo_addr(_Confirm_AcMenuBit), W0
	BTG	[W0], BitPos(_Confirm_AcMenuBit+0)
;GRR3000LManagementPanel.mpas,8344 :: 		end;
L__Password_Settings3774:
;GRR3000LManagementPanel.mpas,8346 :: 		if (Confirm_AcMenuBit = 1) then Glcd_Write_Char('+', 114, Row3, White) else Glcd_Write_Char('x', 114, Row3, White);
	MOV	#lo_addr(_Confirm_AcMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_AcMenuBit+0)
	GOTO	L__Password_Settings3782
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3783
L__Password_Settings3782:
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3783:
;GRR3000LManagementPanel.mpas,8348 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3785
;GRR3000LManagementPanel.mpas,8350 :: 		while (Ok_Button =0) do
L__Password_Settings3788:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3789
;GRR3000LManagementPanel.mpas,8352 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8353 :: 		end;
	GOTO	L__Password_Settings3788
L__Password_Settings3789:
;GRR3000LManagementPanel.mpas,8355 :: 		EEPROM_Write(EE_ConfirmAcMenuEeAddr, Confirm_AcMenuBit);
	MOV	#lo_addr(_Confirm_AcMenuBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_Confirm_AcMenuBit+0)
	INC	W12
	MOV	#61534, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,8356 :: 		while(WR_bit) do begin end;
L__Password_Settings3793:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Settings3793
;GRR3000LManagementPanel.mpas,8357 :: 		Chng[1] := 0;
	MOV	#lo_addr(_Chng), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8358 :: 		if (Confirm_AcMenuBit = 1) then Glcd_Write_Char('+', 114, Row3, Black) else Glcd_Write_Char('x', 114, Row3, Black);
	MOV	#lo_addr(_Confirm_AcMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_AcMenuBit+0)
	GOTO	L__Password_Settings3798
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3799
L__Password_Settings3798:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3799:
;GRR3000LManagementPanel.mpas,8360 :: 		end;
L__Password_Settings3785:
;GRR3000LManagementPanel.mpas,8364 :: 		end;
	GOTO	L__Password_Settings3769
L__Password_Settings3770:
;GRR3000LManagementPanel.mpas,8365 :: 		end;
L__Password_Settings3761:
;GRR3000LManagementPanel.mpas,8366 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings3759:
;GRR3000LManagementPanel.mpas,8369 :: 		3: begin // dc set menu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Password_Settings5597
	GOTO	L__Password_Settings3802
L__Password_Settings5597:
;GRR3000LManagementPanel.mpas,8371 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3804
;GRR3000LManagementPanel.mpas,8373 :: 		while (Ok_Button =0) do
L__Password_Settings3807:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3808
;GRR3000LManagementPanel.mpas,8375 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8376 :: 		end;
	GOTO	L__Password_Settings3807
L__Password_Settings3808:
;GRR3000LManagementPanel.mpas,8379 :: 		Chng[2] := 1;
	MOV	#lo_addr(_Chng+1), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8381 :: 		While (Chng[2] =1) do
L__Password_Settings3812:
	MOV	#lo_addr(_Chng+1), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5598
	GOTO	L__Password_Settings3813
L__Password_Settings5598:
;GRR3000LManagementPanel.mpas,8383 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8385 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5599
	BCLR	W2, #0
	BRA	L__Password_Settings5602
L__Password_Settings5599:
	BSET	W2, #0
L__Password_Settings5602:
	BTSS	W2, #0
	GOTO	L__Password_Settings3817
;GRR3000LManagementPanel.mpas,8387 :: 		while ((Up_Button =0)or(Down_Button=0)) do
L__Password_Settings3820:
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5603
	BCLR	W2, #0
	BRA	L__Password_Settings5606
L__Password_Settings5603:
	BSET	W2, #0
L__Password_Settings5606:
	BTSS	W2, #0
	GOTO	L__Password_Settings3821
;GRR3000LManagementPanel.mpas,8389 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8390 :: 		end;
	GOTO	L__Password_Settings3820
L__Password_Settings3821:
;GRR3000LManagementPanel.mpas,8392 :: 		Confirm_DcMenuBit := not Confirm_DcMenuBit;
	MOV	#lo_addr(_Confirm_DcMenuBit), W1
	MOV	#lo_addr(_Confirm_DcMenuBit), W0
	BTG	[W0], BitPos(_Confirm_DcMenuBit+0)
;GRR3000LManagementPanel.mpas,8394 :: 		end;
L__Password_Settings3817:
;GRR3000LManagementPanel.mpas,8396 :: 		if (Confirm_DcMenuBit = 1) then Glcd_Write_Char('+', 114, Row4, White) else Glcd_Write_Char('x', 114, Row4, White);
	MOV	#lo_addr(_Confirm_DcMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_DcMenuBit+0)
	GOTO	L__Password_Settings3825
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3826
L__Password_Settings3825:
	CLR	W13
	MOV.B	#3, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3826:
;GRR3000LManagementPanel.mpas,8398 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3828
;GRR3000LManagementPanel.mpas,8400 :: 		while (Ok_Button =0) do
L__Password_Settings3831:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3832
;GRR3000LManagementPanel.mpas,8402 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8403 :: 		end;
	GOTO	L__Password_Settings3831
L__Password_Settings3832:
;GRR3000LManagementPanel.mpas,8405 :: 		EEPROM_Write(EE_ConfirmDcMenuEeAddr, Confirm_DcMenuBit);
	MOV	#lo_addr(_Confirm_DcMenuBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_Confirm_DcMenuBit+0)
	INC	W12
	MOV	#61536, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,8406 :: 		while(WR_bit) do begin end;
L__Password_Settings3836:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Settings3836
;GRR3000LManagementPanel.mpas,8407 :: 		Chng[2] := 0;
	MOV	#lo_addr(_Chng+1), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8408 :: 		if (Confirm_DcMenuBit = 1) then Glcd_Write_Char('+', 114, Row4, Black) else Glcd_Write_Char('x', 114, Row4, Black);
	MOV	#lo_addr(_Confirm_DcMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_DcMenuBit+0)
	GOTO	L__Password_Settings3841
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3842
L__Password_Settings3841:
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3842:
;GRR3000LManagementPanel.mpas,8410 :: 		end;
L__Password_Settings3828:
;GRR3000LManagementPanel.mpas,8414 :: 		end;
	GOTO	L__Password_Settings3812
L__Password_Settings3813:
;GRR3000LManagementPanel.mpas,8415 :: 		end;
L__Password_Settings3804:
;GRR3000LManagementPanel.mpas,8416 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings3802:
;GRR3000LManagementPanel.mpas,8418 :: 		4: begin // akü set menu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA Z	L__Password_Settings5607
	GOTO	L__Password_Settings3845
L__Password_Settings5607:
;GRR3000LManagementPanel.mpas,8420 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3847
;GRR3000LManagementPanel.mpas,8422 :: 		while (Ok_Button =0) do
L__Password_Settings3850:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3851
;GRR3000LManagementPanel.mpas,8424 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8425 :: 		end;
	GOTO	L__Password_Settings3850
L__Password_Settings3851:
;GRR3000LManagementPanel.mpas,8428 :: 		Chng[3] := 1;
	MOV	#lo_addr(_Chng+2), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8430 :: 		While (Chng[3] =1) do
L__Password_Settings3855:
	MOV	#lo_addr(_Chng+2), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5608
	GOTO	L__Password_Settings3856
L__Password_Settings5608:
;GRR3000LManagementPanel.mpas,8432 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8434 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5609
	BCLR	W2, #0
	BRA	L__Password_Settings5612
L__Password_Settings5609:
	BSET	W2, #0
L__Password_Settings5612:
	BTSS	W2, #0
	GOTO	L__Password_Settings3860
;GRR3000LManagementPanel.mpas,8436 :: 		while ((Up_Button =0)or(Down_Button=0)) do
L__Password_Settings3863:
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5613
	BCLR	W2, #0
	BRA	L__Password_Settings5616
L__Password_Settings5613:
	BSET	W2, #0
L__Password_Settings5616:
	BTSS	W2, #0
	GOTO	L__Password_Settings3864
;GRR3000LManagementPanel.mpas,8438 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8439 :: 		end;
	GOTO	L__Password_Settings3863
L__Password_Settings3864:
;GRR3000LManagementPanel.mpas,8441 :: 		Confirm_BattMenuBit := not Confirm_BattMenuBit;
	MOV	#lo_addr(_Confirm_BattMenuBit), W1
	MOV	#lo_addr(_Confirm_BattMenuBit), W0
	BTG	[W0], BitPos(_Confirm_BattMenuBit+0)
;GRR3000LManagementPanel.mpas,8443 :: 		end;
L__Password_Settings3860:
;GRR3000LManagementPanel.mpas,8445 :: 		if (Confirm_BattMenuBit = 1) then Glcd_Write_Char('+', 114, Row5, White) else Glcd_Write_Char('x', 114, Row5, White);
	MOV	#lo_addr(_Confirm_BattMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_BattMenuBit+0)
	GOTO	L__Password_Settings3868
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3869
L__Password_Settings3868:
	CLR	W13
	MOV.B	#4, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3869:
;GRR3000LManagementPanel.mpas,8447 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3871
;GRR3000LManagementPanel.mpas,8449 :: 		while (Ok_Button =0) do
L__Password_Settings3874:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3875
;GRR3000LManagementPanel.mpas,8451 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8452 :: 		end;
	GOTO	L__Password_Settings3874
L__Password_Settings3875:
;GRR3000LManagementPanel.mpas,8454 :: 		EEPROM_Write(EE_ConfirmBattMenuEeAddr, Confirm_BattMenuBit);
	MOV	#lo_addr(_Confirm_BattMenuBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_Confirm_BattMenuBit+0)
	INC	W12
	MOV	#61538, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,8455 :: 		while(WR_bit) do begin end;
L__Password_Settings3879:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Settings3879
;GRR3000LManagementPanel.mpas,8456 :: 		Chng[3] := 0;
	MOV	#lo_addr(_Chng+2), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8457 :: 		if (Confirm_BattMenuBit = 1) then Glcd_Write_Char('+', 114, Row5, Black) else Glcd_Write_Char('x', 114, Row5, Black);
	MOV	#lo_addr(_Confirm_BattMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_BattMenuBit+0)
	GOTO	L__Password_Settings3884
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3885
L__Password_Settings3884:
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3885:
;GRR3000LManagementPanel.mpas,8459 :: 		end;
L__Password_Settings3871:
;GRR3000LManagementPanel.mpas,8463 :: 		end;
	GOTO	L__Password_Settings3855
L__Password_Settings3856:
;GRR3000LManagementPanel.mpas,8464 :: 		end;
L__Password_Settings3847:
;GRR3000LManagementPanel.mpas,8465 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings3845:
;GRR3000LManagementPanel.mpas,8467 :: 		5: begin // çalýþma modu menu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA Z	L__Password_Settings5617
	GOTO	L__Password_Settings3888
L__Password_Settings5617:
;GRR3000LManagementPanel.mpas,8469 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3890
;GRR3000LManagementPanel.mpas,8471 :: 		while (Ok_Button =0) do
L__Password_Settings3893:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3894
;GRR3000LManagementPanel.mpas,8473 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8474 :: 		end;
	GOTO	L__Password_Settings3893
L__Password_Settings3894:
;GRR3000LManagementPanel.mpas,8477 :: 		Chng[4] := 1;
	MOV	#lo_addr(_Chng+3), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8479 :: 		While (Chng[4] =1) do
L__Password_Settings3898:
	MOV	#lo_addr(_Chng+3), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5618
	GOTO	L__Password_Settings3899
L__Password_Settings5618:
;GRR3000LManagementPanel.mpas,8481 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8483 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5619
	BCLR	W2, #0
	BRA	L__Password_Settings5622
L__Password_Settings5619:
	BSET	W2, #0
L__Password_Settings5622:
	BTSS	W2, #0
	GOTO	L__Password_Settings3903
;GRR3000LManagementPanel.mpas,8485 :: 		while ((Up_Button =0)or(Down_Button=0)) do
L__Password_Settings3906:
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5623
	BCLR	W2, #0
	BRA	L__Password_Settings5626
L__Password_Settings5623:
	BSET	W2, #0
L__Password_Settings5626:
	BTSS	W2, #0
	GOTO	L__Password_Settings3907
;GRR3000LManagementPanel.mpas,8487 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8488 :: 		end;
	GOTO	L__Password_Settings3906
L__Password_Settings3907:
;GRR3000LManagementPanel.mpas,8490 :: 		Confirm_OperaMenuBit := not Confirm_OperaMenuBit;
	MOV	#lo_addr(_Confirm_OperaMenuBit), W1
	MOV	#lo_addr(_Confirm_OperaMenuBit), W0
	BTG	[W0], BitPos(_Confirm_OperaMenuBit+0)
;GRR3000LManagementPanel.mpas,8492 :: 		end;
L__Password_Settings3903:
;GRR3000LManagementPanel.mpas,8494 :: 		if (Confirm_OperaMenuBit = 1) then Glcd_Write_Char('+', 114, Row6, White) else Glcd_Write_Char('x', 114, Row6, White);
	MOV	#lo_addr(_Confirm_OperaMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_OperaMenuBit+0)
	GOTO	L__Password_Settings3911
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3912
L__Password_Settings3911:
	CLR	W13
	MOV.B	#5, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3912:
;GRR3000LManagementPanel.mpas,8496 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3914
;GRR3000LManagementPanel.mpas,8498 :: 		while (Ok_Button =0) do
L__Password_Settings3917:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3918
;GRR3000LManagementPanel.mpas,8500 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8501 :: 		end;
	GOTO	L__Password_Settings3917
L__Password_Settings3918:
;GRR3000LManagementPanel.mpas,8503 :: 		EEPROM_Write(EE_ConfirmOperaMenuEeAddr, Confirm_OperaMenuBit);
	MOV	#lo_addr(_Confirm_OperaMenuBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_Confirm_OperaMenuBit+0)
	INC	W12
	MOV	#61540, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,8504 :: 		while(WR_bit) do begin end;
L__Password_Settings3922:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Settings3922
;GRR3000LManagementPanel.mpas,8505 :: 		Chng[4] := 0;
	MOV	#lo_addr(_Chng+3), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8506 :: 		if (Confirm_OperaMenuBit = 1) then Glcd_Write_Char('+', 114, Row6, Black) else Glcd_Write_Char('x', 114, Row6, Black);
	MOV	#lo_addr(_Confirm_OperaMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_OperaMenuBit+0)
	GOTO	L__Password_Settings3927
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3928
L__Password_Settings3927:
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3928:
;GRR3000LManagementPanel.mpas,8508 :: 		end;
L__Password_Settings3914:
;GRR3000LManagementPanel.mpas,8512 :: 		end;
	GOTO	L__Password_Settings3898
L__Password_Settings3899:
;GRR3000LManagementPanel.mpas,8513 :: 		end;
L__Password_Settings3890:
;GRR3000LManagementPanel.mpas,8514 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings3888:
;GRR3000LManagementPanel.mpas,8516 :: 		6: begin // çalýþma modu menu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA Z	L__Password_Settings5627
	GOTO	L__Password_Settings3931
L__Password_Settings5627:
;GRR3000LManagementPanel.mpas,8518 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3933
;GRR3000LManagementPanel.mpas,8520 :: 		while (Ok_Button =0) do
L__Password_Settings3936:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3937
;GRR3000LManagementPanel.mpas,8522 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8523 :: 		end;
	GOTO	L__Password_Settings3936
L__Password_Settings3937:
;GRR3000LManagementPanel.mpas,8526 :: 		Chng[5] := 1;
	MOV	#lo_addr(_Chng+4), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8528 :: 		While (Chng[5] =1) do
L__Password_Settings3941:
	MOV	#lo_addr(_Chng+4), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5628
	GOTO	L__Password_Settings3942
L__Password_Settings5628:
;GRR3000LManagementPanel.mpas,8530 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8532 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5629
	BCLR	W2, #0
	BRA	L__Password_Settings5632
L__Password_Settings5629:
	BSET	W2, #0
L__Password_Settings5632:
	BTSS	W2, #0
	GOTO	L__Password_Settings3946
;GRR3000LManagementPanel.mpas,8534 :: 		while ((Up_Button =0)or(Down_Button=0)) do
L__Password_Settings3949:
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5633
	BCLR	W2, #0
	BRA	L__Password_Settings5636
L__Password_Settings5633:
	BSET	W2, #0
L__Password_Settings5636:
	BTSS	W2, #0
	GOTO	L__Password_Settings3950
;GRR3000LManagementPanel.mpas,8536 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8537 :: 		end;
	GOTO	L__Password_Settings3949
L__Password_Settings3950:
;GRR3000LManagementPanel.mpas,8539 :: 		Confirm_LeakaMenuBit := not Confirm_LeakaMenuBit;
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W1
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W0
	BTG	[W0], BitPos(_Confirm_LeakaMenuBit+0)
;GRR3000LManagementPanel.mpas,8541 :: 		end;
L__Password_Settings3946:
;GRR3000LManagementPanel.mpas,8543 :: 		if (Confirm_LeakaMenuBit = 1) then Glcd_Write_Char('+', 114, Row7, White) else Glcd_Write_Char('x', 114, Row7, White);
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_LeakaMenuBit+0)
	GOTO	L__Password_Settings3954
	CLR	W13
	MOV.B	#6, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3955
L__Password_Settings3954:
	CLR	W13
	MOV.B	#6, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3955:
;GRR3000LManagementPanel.mpas,8545 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3957
;GRR3000LManagementPanel.mpas,8547 :: 		while (Ok_Button =0) do
L__Password_Settings3960:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3961
;GRR3000LManagementPanel.mpas,8549 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8550 :: 		end;
	GOTO	L__Password_Settings3960
L__Password_Settings3961:
;GRR3000LManagementPanel.mpas,8552 :: 		EEPROM_Write(EE_ConfirmLeakMenuEeAddr, Confirm_LeakaMenuBit);
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_Confirm_LeakaMenuBit+0)
	INC	W12
	MOV	#61542, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,8553 :: 		while(WR_bit) do begin end;
L__Password_Settings3965:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Settings3965
;GRR3000LManagementPanel.mpas,8554 :: 		Chng[5] := 0;
	MOV	#lo_addr(_Chng+4), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8555 :: 		if (Confirm_LeakaMenuBit = 1) then Glcd_Write_Char('+', 114, Row7, Black) else Glcd_Write_Char('x', 114, Row7, Black);
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_LeakaMenuBit+0)
	GOTO	L__Password_Settings3970
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3971
L__Password_Settings3970:
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3971:
;GRR3000LManagementPanel.mpas,8557 :: 		end;
L__Password_Settings3957:
;GRR3000LManagementPanel.mpas,8561 :: 		end;
	GOTO	L__Password_Settings3941
L__Password_Settings3942:
;GRR3000LManagementPanel.mpas,8562 :: 		end;
L__Password_Settings3933:
;GRR3000LManagementPanel.mpas,8563 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings3931:
;GRR3000LManagementPanel.mpas,8565 :: 		7: begin // sýcaklýk menu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA Z	L__Password_Settings5637
	GOTO	L__Password_Settings3974
L__Password_Settings5637:
;GRR3000LManagementPanel.mpas,8567 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3976
;GRR3000LManagementPanel.mpas,8569 :: 		while (Ok_Button =0) do
L__Password_Settings3979:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings3980
;GRR3000LManagementPanel.mpas,8571 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8572 :: 		end;
	GOTO	L__Password_Settings3979
L__Password_Settings3980:
;GRR3000LManagementPanel.mpas,8575 :: 		Chng[6] := 1;
	MOV	#lo_addr(_Chng+5), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8577 :: 		While (Chng[6] =1) do
L__Password_Settings3984:
	MOV	#lo_addr(_Chng+5), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5638
	GOTO	L__Password_Settings3985
L__Password_Settings5638:
;GRR3000LManagementPanel.mpas,8579 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8581 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5639
	BCLR	W2, #0
	BRA	L__Password_Settings5642
L__Password_Settings5639:
	BSET	W2, #0
L__Password_Settings5642:
	BTSS	W2, #0
	GOTO	L__Password_Settings3989
;GRR3000LManagementPanel.mpas,8583 :: 		while ((Up_Button =0)or(Down_Button=0)) do
L__Password_Settings3992:
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5643
	BCLR	W2, #0
	BRA	L__Password_Settings5646
L__Password_Settings5643:
	BSET	W2, #0
L__Password_Settings5646:
	BTSS	W2, #0
	GOTO	L__Password_Settings3993
;GRR3000LManagementPanel.mpas,8585 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8586 :: 		end;
	GOTO	L__Password_Settings3992
L__Password_Settings3993:
;GRR3000LManagementPanel.mpas,8588 :: 		Confirm_TempeMenuBit := not Confirm_TempeMenuBit;
	MOV	#lo_addr(_Confirm_TempeMenuBit), W1
	MOV	#lo_addr(_Confirm_TempeMenuBit), W0
	BTG	[W0], BitPos(_Confirm_TempeMenuBit+0)
;GRR3000LManagementPanel.mpas,8590 :: 		end;
L__Password_Settings3989:
;GRR3000LManagementPanel.mpas,8592 :: 		if (Confirm_TempeMenuBit = 1) then Glcd_Write_Char('+', 114, Row8, White) else Glcd_Write_Char('x', 114, Row8, White);
	MOV	#lo_addr(_Confirm_TempeMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_TempeMenuBit+0)
	GOTO	L__Password_Settings3997
	CLR	W13
	MOV.B	#7, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings3998
L__Password_Settings3997:
	CLR	W13
	MOV.B	#7, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings3998:
;GRR3000LManagementPanel.mpas,8594 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4000
;GRR3000LManagementPanel.mpas,8596 :: 		while (Ok_Button =0) do
L__Password_Settings4003:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4004
;GRR3000LManagementPanel.mpas,8598 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8599 :: 		end;
	GOTO	L__Password_Settings4003
L__Password_Settings4004:
;GRR3000LManagementPanel.mpas,8601 :: 		EEPROM_Write(EE_ConfirmTempMenuEeAddr, Confirm_TempeMenuBit);
	MOV	#lo_addr(_Confirm_TempeMenuBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_Confirm_TempeMenuBit+0)
	INC	W12
	MOV	#61544, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,8602 :: 		while(WR_bit) do begin end;
L__Password_Settings4008:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Settings4008
;GRR3000LManagementPanel.mpas,8603 :: 		Chng[6] := 0;
	MOV	#lo_addr(_Chng+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8604 :: 		if (Confirm_TempeMenuBit = 1) then Glcd_Write_Char('+', 114, Row8, Black) else Glcd_Write_Char('x', 114, Row8, Black);
	MOV	#lo_addr(_Confirm_TempeMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_TempeMenuBit+0)
	GOTO	L__Password_Settings4013
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings4014
L__Password_Settings4013:
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings4014:
;GRR3000LManagementPanel.mpas,8606 :: 		end;
L__Password_Settings4000:
;GRR3000LManagementPanel.mpas,8610 :: 		end;
	GOTO	L__Password_Settings3984
L__Password_Settings3985:
;GRR3000LManagementPanel.mpas,8611 :: 		end;
L__Password_Settings3976:
;GRR3000LManagementPanel.mpas,8612 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings3974:
;GRR3000LManagementPanel.mpas,8614 :: 		8: begin // saat menu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA Z	L__Password_Settings5647
	GOTO	L__Password_Settings4017
L__Password_Settings5647:
;GRR3000LManagementPanel.mpas,8616 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4019
;GRR3000LManagementPanel.mpas,8618 :: 		while (Ok_Button =0) do
L__Password_Settings4022:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4023
;GRR3000LManagementPanel.mpas,8620 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8621 :: 		end;
	GOTO	L__Password_Settings4022
L__Password_Settings4023:
;GRR3000LManagementPanel.mpas,8624 :: 		Chng[7] := 1;
	MOV	#lo_addr(_Chng+6), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8626 :: 		While (Chng[7] =1) do
L__Password_Settings4027:
	MOV	#lo_addr(_Chng+6), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5648
	GOTO	L__Password_Settings4028
L__Password_Settings5648:
;GRR3000LManagementPanel.mpas,8628 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8630 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5649
	BCLR	W2, #0
	BRA	L__Password_Settings5652
L__Password_Settings5649:
	BSET	W2, #0
L__Password_Settings5652:
	BTSS	W2, #0
	GOTO	L__Password_Settings4032
;GRR3000LManagementPanel.mpas,8632 :: 		while ((Up_Button =0)or(Down_Button=0)) do
L__Password_Settings4035:
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5653
	BCLR	W2, #0
	BRA	L__Password_Settings5656
L__Password_Settings5653:
	BSET	W2, #0
L__Password_Settings5656:
	BTSS	W2, #0
	GOTO	L__Password_Settings4036
;GRR3000LManagementPanel.mpas,8634 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8635 :: 		end;
	GOTO	L__Password_Settings4035
L__Password_Settings4036:
;GRR3000LManagementPanel.mpas,8637 :: 		Confirm_ClockMenuBit := not Confirm_ClockMenuBit;
	MOV	#lo_addr(_Confirm_ClockMenuBit), W1
	MOV	#lo_addr(_Confirm_ClockMenuBit), W0
	BTG	[W0], BitPos(_Confirm_ClockMenuBit+0)
;GRR3000LManagementPanel.mpas,8639 :: 		end;
L__Password_Settings4032:
;GRR3000LManagementPanel.mpas,8641 :: 		if (Confirm_ClockMenuBit = 1) then Glcd_Write_Char('+', 114, Row2, White) else Glcd_Write_Char('x', 114, Row2, White);
	MOV	#lo_addr(_Confirm_ClockMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_ClockMenuBit+0)
	GOTO	L__Password_Settings4040
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings4041
L__Password_Settings4040:
	CLR	W13
	MOV.B	#1, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings4041:
;GRR3000LManagementPanel.mpas,8643 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4043
;GRR3000LManagementPanel.mpas,8645 :: 		while (Ok_Button =0) do
L__Password_Settings4046:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4047
;GRR3000LManagementPanel.mpas,8647 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8648 :: 		end;
	GOTO	L__Password_Settings4046
L__Password_Settings4047:
;GRR3000LManagementPanel.mpas,8650 :: 		EEPROM_Write(EE_ConfirmClockMenuEeAddr, Confirm_ClockMenuBit);
	MOV	#lo_addr(_Confirm_ClockMenuBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_Confirm_ClockMenuBit+0)
	INC	W12
	MOV	#61546, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,8651 :: 		while(WR_bit) do begin end;
L__Password_Settings4051:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Settings4051
;GRR3000LManagementPanel.mpas,8652 :: 		Chng[7] := 0;
	MOV	#lo_addr(_Chng+6), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8653 :: 		if (Confirm_ClockMenuBit = 1) then Glcd_Write_Char('+', 114, Row2, Black) else Glcd_Write_Char('x', 114, Row2, Black);
	MOV	#lo_addr(_Confirm_ClockMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_ClockMenuBit+0)
	GOTO	L__Password_Settings4056
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings4057
L__Password_Settings4056:
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings4057:
;GRR3000LManagementPanel.mpas,8655 :: 		end;
L__Password_Settings4043:
;GRR3000LManagementPanel.mpas,8659 :: 		end;
	GOTO	L__Password_Settings4027
L__Password_Settings4028:
;GRR3000LManagementPanel.mpas,8660 :: 		end;
L__Password_Settings4019:
;GRR3000LManagementPanel.mpas,8661 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings4017:
;GRR3000LManagementPanel.mpas,8663 :: 		9: begin // modbus menu
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	BRA Z	L__Password_Settings5657
	GOTO	L__Password_Settings4060
L__Password_Settings5657:
;GRR3000LManagementPanel.mpas,8665 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4062
;GRR3000LManagementPanel.mpas,8667 :: 		while (Ok_Button =0) do
L__Password_Settings4065:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4066
;GRR3000LManagementPanel.mpas,8669 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8670 :: 		end;
	GOTO	L__Password_Settings4065
L__Password_Settings4066:
;GRR3000LManagementPanel.mpas,8673 :: 		Chng[8] := 1;
	MOV	#lo_addr(_Chng+7), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8675 :: 		While (Chng[8] =1) do
L__Password_Settings4070:
	MOV	#lo_addr(_Chng+7), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA Z	L__Password_Settings5658
	GOTO	L__Password_Settings4071
L__Password_Settings5658:
;GRR3000LManagementPanel.mpas,8677 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8679 :: 		if ((Up_Button =0)or(Down_Button =0)) then
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5659
	BCLR	W2, #0
	BRA	L__Password_Settings5662
L__Password_Settings5659:
	BSET	W2, #0
L__Password_Settings5662:
	BTSS	W2, #0
	GOTO	L__Password_Settings4075
;GRR3000LManagementPanel.mpas,8681 :: 		while ((Up_Button =0)or(Down_Button=0)) do
L__Password_Settings4078:
	BCLR	W2, #0
	BTSS	RC13_bit, BitPos(RC13_bit+0)
	BSET	W2, #0
	BTSS	RD11_bit, BitPos(RD11_bit+0)
	BSET	66, #0
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	BCLR	66, #0
	BTSS	W2, #0
	BTSC	66, #0
	BRA	L__Password_Settings5663
	BCLR	W2, #0
	BRA	L__Password_Settings5666
L__Password_Settings5663:
	BSET	W2, #0
L__Password_Settings5666:
	BTSS	W2, #0
	GOTO	L__Password_Settings4079
;GRR3000LManagementPanel.mpas,8683 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8684 :: 		end;
	GOTO	L__Password_Settings4078
L__Password_Settings4079:
;GRR3000LManagementPanel.mpas,8686 :: 		Confirm_ModbusMenuBit := not Confirm_ModbusMenuBit;
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W1
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W0
	BTG	[W0], BitPos(_Confirm_ModbusMenuBit+0)
;GRR3000LManagementPanel.mpas,8688 :: 		end;
L__Password_Settings4075:
;GRR3000LManagementPanel.mpas,8690 :: 		if (Confirm_ModbusMenuBit = 1) then Glcd_Write_Char('+', 114, Row3, White) else Glcd_Write_Char('x', 114, Row3, White);
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_ModbusMenuBit+0)
	GOTO	L__Password_Settings4083
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings4084
L__Password_Settings4083:
	CLR	W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings4084:
;GRR3000LManagementPanel.mpas,8692 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4086
;GRR3000LManagementPanel.mpas,8694 :: 		while (Ok_Button =0) do
L__Password_Settings4089:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4090
;GRR3000LManagementPanel.mpas,8696 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8697 :: 		end;
	GOTO	L__Password_Settings4089
L__Password_Settings4090:
;GRR3000LManagementPanel.mpas,8699 :: 		EEPROM_Write(EE_ConfirmModbusMenuEeAddr, Confirm_ModbusMenuBit);
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W0
	CLR	W12
	BTSC	[W0], BitPos(_Confirm_ModbusMenuBit+0)
	INC	W12
	MOV	#61548, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,8700 :: 		while(WR_bit) do begin end;
L__Password_Settings4094:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__Password_Settings4094
;GRR3000LManagementPanel.mpas,8701 :: 		Chng[8] := 0;
	MOV	#lo_addr(_Chng+7), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8702 :: 		if (Confirm_ModbusMenuBit = 1) then Glcd_Write_Char('+', 114, Row3, Black) else Glcd_Write_Char('x', 114, Row3, Black);
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_ModbusMenuBit+0)
	GOTO	L__Password_Settings4099
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#43, W10
	CALL	_Glcd_Write_Char
	GOTO	L__Password_Settings4100
L__Password_Settings4099:
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#114, W11
	MOV.B	#120, W10
	CALL	_Glcd_Write_Char
L__Password_Settings4100:
;GRR3000LManagementPanel.mpas,8704 :: 		end;
L__Password_Settings4086:
;GRR3000LManagementPanel.mpas,8708 :: 		end;
	GOTO	L__Password_Settings4070
L__Password_Settings4071:
;GRR3000LManagementPanel.mpas,8709 :: 		end;
L__Password_Settings4062:
;GRR3000LManagementPanel.mpas,8710 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings4060:
;GRR3000LManagementPanel.mpas,8712 :: 		10: begin // geri
	MOV	#lo_addr(_MenuSayac), W0
	MOV.B	[W0], W0
	CP.B	W0, #10
	BRA Z	L__Password_Settings5667
	GOTO	L__Password_Settings4103
L__Password_Settings5667:
;GRR3000LManagementPanel.mpas,8714 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4105
;GRR3000LManagementPanel.mpas,8716 :: 		while (Ok_Button =0) do
L__Password_Settings4108:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__Password_Settings4109
;GRR3000LManagementPanel.mpas,8718 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8719 :: 		end;
	GOTO	L__Password_Settings4108
L__Password_Settings4109:
;GRR3000LManagementPanel.mpas,8720 :: 		MenuExit := 1;
	MOV	#lo_addr(_MenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8722 :: 		end;
L__Password_Settings4105:
;GRR3000LManagementPanel.mpas,8726 :: 		end;
	GOTO	L__Password_Settings3745
L__Password_Settings4103:
L__Password_Settings3745:
;GRR3000LManagementPanel.mpas,8732 :: 		end;
	GOTO	L__Password_Settings3705
L__Password_Settings3706:
;GRR3000LManagementPanel.mpas,8734 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8735 :: 		MenuSayacValue := 10;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#10, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8737 :: 		end;
L_end_Password_Settings:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Password_Settings

_MainMenu:
	LNK	#50

;GRR3000LManagementPanel.mpas,8744 :: 		begin
;GRR3000LManagementPanel.mpas,8746 :: 		MainMenuCounter := 1;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,8747 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8749 :: 		MainMenuExit        := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8750 :: 		MenuSayacValue      := 1;
	MOV	#lo_addr(_MenuSayacValue), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8751 :: 		i                   := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8753 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,8755 :: 		While (MainMenuExit = 0x00) do
L__MainMenu4114:
	MOV	#lo_addr(_MainMenuExit), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA Z	L__MainMenu5669
	GOTO	L__MainMenu4115
L__MainMenu5669:
;GRR3000LManagementPanel.mpas,8759 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8761 :: 		if (Down_Button =0) then
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__MainMenu4119
;GRR3000LManagementPanel.mpas,8763 :: 		while (Down_Button =0) do
L__MainMenu4122:
	BTSC	RD11_bit, BitPos(RD11_bit+0)
	GOTO	L__MainMenu4123
;GRR3000LManagementPanel.mpas,8765 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8766 :: 		end;
	GOTO	L__MainMenu4122
L__MainMenu4123:
;GRR3000LManagementPanel.mpas,8769 :: 		Glcd_Write_Char(' ', 0, MainMenuCounter, Black);
	MOV.B	#1, W13
	MOV.B	[W14+0], W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8770 :: 		Glcd_Write_Char(' ', 0, (MainMenuCounter-7), Black);
	ADD	W14, #0, W0
	ZE	[W0], W0
	SUB	W0, #7, W0
	MOV.B	#1, W13
	MOV.B	W0, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8772 :: 		Inc(MainMenuCounter);
	ADD	W14, #0, W0
	ZE	[W0], W0
	INC	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,8773 :: 		if (MainMenuCounter > 13) then MainMenuCounter := 1;
	CP.B	W0, #13
	BRA GTU	L__MainMenu5670
	GOTO	L__MainMenu4127
L__MainMenu5670:
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
L__MainMenu4127:
;GRR3000LManagementPanel.mpas,8774 :: 		end else
	GOTO	L__MainMenu4120
L__MainMenu4119:
;GRR3000LManagementPanel.mpas,8775 :: 		if (Up_Button =0) then
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__MainMenu4130
;GRR3000LManagementPanel.mpas,8777 :: 		while (Up_Button =0) do
L__MainMenu4133:
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__MainMenu4134
;GRR3000LManagementPanel.mpas,8779 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8780 :: 		end;
	GOTO	L__MainMenu4133
L__MainMenu4134:
;GRR3000LManagementPanel.mpas,8783 :: 		Glcd_Write_Char(' ', 0, MainMenuCounter, Black);
	MOV.B	#1, W13
	MOV.B	[W14+0], W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8784 :: 		Glcd_Write_Char(' ', 0, (MainMenuCounter-7), Black);
	ADD	W14, #0, W0
	ZE	[W0], W0
	SUB	W0, #7, W0
	MOV.B	#1, W13
	MOV.B	W0, W12
	CLR	W11
	MOV.B	#32, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8786 :: 		Dec(MainMenuCounter);
	ADD	W14, #0, W0
	ZE	[W0], W0
	DEC	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,8787 :: 		if (MainMenuCounter < 1) then MainMenuCounter := 13;
	CP.B	W0, #1
	BRA LTU	L__MainMenu5671
	GOTO	L__MainMenu4138
L__MainMenu5671:
	MOV.B	#13, W0
	MOV.B	W0, [W14+0]
L__MainMenu4138:
;GRR3000LManagementPanel.mpas,8788 :: 		end;
L__MainMenu4130:
L__MainMenu4120:
;GRR3000LManagementPanel.mpas,8793 :: 		if (MainMenuCounter < 8) then
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA LTU	L__MainMenu5672
	GOTO	L__MainMenu4141
L__MainMenu5672:
;GRR3000LManagementPanel.mpas,8796 :: 		Glcd_Write_Char('>', 0, MainMenuCounter, Black);
	MOV.B	#1, W13
	MOV.B	[W14+0], W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8798 :: 		if (i = 2) then // resmi sürekli basma
	MOV.B	[W14+1], W0
	CP.B	W0, #2
	BRA Z	L__MainMenu5673
	GOTO	L__MainMenu4144
L__MainMenu5673:
;GRR3000LManagementPanel.mpas,8801 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8804 :: 		Glcd_Write_Text('     ..MENU..     1-2',      0,  Row1, Black);
	ADD	W14, #23, W1
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
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#85, W0
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
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #23, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8806 :: 		TitleText := Title_AcMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_AcMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8807 :: 		ltrim(TitleText);
	ADD	W14, #2, W0
	MOV	W0, [W14+48]
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8808 :: 		Glcd_Write_Text(TitleText,                 6,  Row2, Black);  // 1
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8810 :: 		TitleText := Title_DcMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_DcMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8811 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8812 :: 		Glcd_Write_Text(TitleText,                 6,  Row3, Black);  // 2
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8814 :: 		TitleText := Title_DroppMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_DroppMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8815 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8816 :: 		Glcd_Write_Text(TitleText,                 6,  Row4, Black);  // 3
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8818 :: 		TitleText := Title_BattMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_BattMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8819 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8820 :: 		Glcd_Write_Text(TitleText,                 6,  Row5, Black);  // 4
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8822 :: 		TitleText := Title_BattServMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_BattServMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8823 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8824 :: 		Glcd_Write_Text(TitleText,                 6,  Row6, Black);  // 5
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8826 :: 		TitleText := Title_LeakMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_LeakMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8827 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8828 :: 		Glcd_Write_Text(TitleText,                 6,  Row7, Black);  // 6
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8830 :: 		TitleText := Title_TempMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_TempMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8831 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8832 :: 		Glcd_Write_Text(TitleText,                 6,  Row8, Black);  // 7
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#7, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8836 :: 		i := 3;
	MOV.B	#3, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8837 :: 		end;
L__MainMenu4144:
;GRR3000LManagementPanel.mpas,8839 :: 		end else
	GOTO	L__MainMenu4142
L__MainMenu4141:
;GRR3000LManagementPanel.mpas,8840 :: 		if (MainMenuCounter >= 8) then
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA GEU	L__MainMenu5674
	GOTO	L__MainMenu4147
L__MainMenu5674:
;GRR3000LManagementPanel.mpas,8843 :: 		Glcd_Write_Char('>', 0, (MainMenuCounter-7), Black);
	ADD	W14, #0, W0
	ZE	[W0], W0
	SUB	W0, #7, W0
	MOV.B	#1, W13
	MOV.B	W0, W12
	CLR	W11
	MOV.B	#62, W10
	CALL	_Glcd_Write_Char
;GRR3000LManagementPanel.mpas,8845 :: 		if (i = 3) then // resmi sürekli basma
	MOV.B	[W14+1], W0
	CP.B	W0, #3
	BRA Z	L__MainMenu5675
	GOTO	L__MainMenu4150
L__MainMenu5675:
;GRR3000LManagementPanel.mpas,8849 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8851 :: 		Glcd_Write_Text('     ..MENU..     2-2',      0,  Row1, Black);
	ADD	W14, #23, W1
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
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#85, W0
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
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	MOV.B	#45, W0
	MOV.B	W0, [W1++]
	MOV.B	#50, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #23, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8853 :: 		TitleText := Title_ClockMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_ClockMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8854 :: 		ltrim(TitleText);
	ADD	W14, #2, W0
	MOV	W0, [W14+48]
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8855 :: 		Glcd_Write_Text(TitleText,                 6,  Row2, Black);  // 8
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8857 :: 		TitleText := Title_ModbusMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_ModbusMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8858 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8859 :: 		Glcd_Write_Text(TitleText,                 6,  Row3, Black);  // 9
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8861 :: 		TitleText := Title_LangMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_LangMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8862 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8863 :: 		Glcd_Write_Text(TitleText,                 6,  Row4, Black);  // 10
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#3, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8865 :: 		TitleText := Title_Event;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_Event), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8866 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8867 :: 		Glcd_Write_Text(TitleText,                 6,  Row5, Black);  // 11
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#4, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8869 :: 		TitleText := Title_AuthMenu;
	ADD	W14, #2, W0
	MOV	#lo_addr(_Title_AuthMenu), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8870 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8871 :: 		Glcd_Write_Text(TitleText,                 6,  Row6, Black);  // 12
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8873 :: 		TitleText := SubTitle_Back;
	ADD	W14, #2, W0
	MOV	#lo_addr(_SubTitle_Back), W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,8874 :: 		ltrim(TitleText);
	MOV	[W14+48], W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,8875 :: 		Glcd_Write_Text(TitleText,                 6,  Row7, Black);  // 13
	ADD	W14, #2, W0
	MOV.B	#1, W13
	MOV.B	#6, W12
	MOV.B	#6, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,8877 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8878 :: 		end;
L__MainMenu4150:
;GRR3000LManagementPanel.mpas,8879 :: 		end;
L__MainMenu4147:
L__MainMenu4142:
;GRR3000LManagementPanel.mpas,8883 :: 		1: begin  // ac sett
	MOV.B	[W14+0], W0
	CP.B	W0, #1
	BRA Z	L__MainMenu5676
	GOTO	L__MainMenu4155
L__MainMenu5676:
;GRR3000LManagementPanel.mpas,8885 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4157
;GRR3000LManagementPanel.mpas,8887 :: 		while (Ok_Button =0) do
L__MainMenu4160:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4161
;GRR3000LManagementPanel.mpas,8889 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8890 :: 		end;
	GOTO	L__MainMenu4160
L__MainMenu4161:
;GRR3000LManagementPanel.mpas,8892 :: 		if (Confirm_AcMenuBit = 1) then
	MOV	#lo_addr(_Confirm_AcMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_AcMenuBit+0)
	GOTO	L__MainMenu4165
;GRR3000LManagementPanel.mpas,8894 :: 		AC_Settings;
	CALL	_AC_Settings
;GRR3000LManagementPanel.mpas,8895 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8896 :: 		i            := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8897 :: 		end else
	GOTO	L__MainMenu4166
L__MainMenu4165:
;GRR3000LManagementPanel.mpas,8899 :: 		Glcd_Image(@notauthority);
	MOV	#lo_addr(_notauthority), W10
	MOV	#higher_addr(_notauthority), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,8903 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,8904 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8905 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,8906 :: 		MainMenuExit := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8909 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8910 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8911 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8912 :: 		end;
L__MainMenu4166:
;GRR3000LManagementPanel.mpas,8913 :: 		end;
L__MainMenu4157:
;GRR3000LManagementPanel.mpas,8915 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4155:
;GRR3000LManagementPanel.mpas,8917 :: 		2: begin  // dc sett
	MOV.B	[W14+0], W0
	CP.B	W0, #2
	BRA Z	L__MainMenu5677
	GOTO	L__MainMenu4169
L__MainMenu5677:
;GRR3000LManagementPanel.mpas,8919 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4171
;GRR3000LManagementPanel.mpas,8921 :: 		while (Ok_Button =0) do
L__MainMenu4174:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4175
;GRR3000LManagementPanel.mpas,8923 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8924 :: 		end;
	GOTO	L__MainMenu4174
L__MainMenu4175:
;GRR3000LManagementPanel.mpas,8926 :: 		if (Confirm_DcMenuBit = 1) then
	MOV	#lo_addr(_Confirm_DcMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_DcMenuBit+0)
	GOTO	L__MainMenu4179
;GRR3000LManagementPanel.mpas,8928 :: 		DC_Settings;
	CALL	_DC_Settings
;GRR3000LManagementPanel.mpas,8929 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8930 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8931 :: 		end else
	GOTO	L__MainMenu4180
L__MainMenu4179:
;GRR3000LManagementPanel.mpas,8934 :: 		Glcd_Image(@notauthority);
	MOV	#lo_addr(_notauthority), W10
	MOV	#higher_addr(_notauthority), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,8935 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,8936 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8937 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,8938 :: 		MainMenuExit := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8940 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8941 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8942 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8943 :: 		end;
L__MainMenu4180:
;GRR3000LManagementPanel.mpas,8945 :: 		end;
L__MainMenu4171:
;GRR3000LManagementPanel.mpas,8947 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4169:
;GRR3000LManagementPanel.mpas,8949 :: 		3: begin //  dropper sett
	MOV.B	[W14+0], W0
	CP.B	W0, #3
	BRA Z	L__MainMenu5678
	GOTO	L__MainMenu4183
L__MainMenu5678:
;GRR3000LManagementPanel.mpas,8951 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4185
;GRR3000LManagementPanel.mpas,8953 :: 		while (Ok_Button =0) do
L__MainMenu4188:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4189
;GRR3000LManagementPanel.mpas,8955 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8956 :: 		end;
	GOTO	L__MainMenu4188
L__MainMenu4189:
;GRR3000LManagementPanel.mpas,8958 :: 		if (Confirm_OperaMenuBit = 1) then
	MOV	#lo_addr(_Confirm_OperaMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_OperaMenuBit+0)
	GOTO	L__MainMenu4193
;GRR3000LManagementPanel.mpas,8960 :: 		Dropper_Module;
	CALL	_Dropper_Module
;GRR3000LManagementPanel.mpas,8961 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8962 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8963 :: 		end else
	GOTO	L__MainMenu4194
L__MainMenu4193:
;GRR3000LManagementPanel.mpas,8966 :: 		Glcd_Image(@notauthority);
	MOV	#lo_addr(_notauthority), W10
	MOV	#higher_addr(_notauthority), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,8967 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,8968 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8969 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,8970 :: 		MainMenuExit := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8972 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8973 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,8974 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8975 :: 		end;
L__MainMenu4194:
;GRR3000LManagementPanel.mpas,8977 :: 		end;
L__MainMenu4185:
;GRR3000LManagementPanel.mpas,8979 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4183:
;GRR3000LManagementPanel.mpas,8981 :: 		4: begin // battery set
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA Z	L__MainMenu5679
	GOTO	L__MainMenu4197
L__MainMenu5679:
;GRR3000LManagementPanel.mpas,8983 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4199
;GRR3000LManagementPanel.mpas,8985 :: 		while (Ok_Button =0) do
L__MainMenu4202:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4203
;GRR3000LManagementPanel.mpas,8987 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,8988 :: 		end;
	GOTO	L__MainMenu4202
L__MainMenu4203:
;GRR3000LManagementPanel.mpas,8990 :: 		if (Confirm_BattMenuBit = 1) then
	MOV	#lo_addr(_Confirm_BattMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_BattMenuBit+0)
	GOTO	L__MainMenu4207
;GRR3000LManagementPanel.mpas,8992 :: 		Battery_Settings;
	CALL	_Battery_Settings
;GRR3000LManagementPanel.mpas,8993 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,8994 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,8995 :: 		end else
	GOTO	L__MainMenu4208
L__MainMenu4207:
;GRR3000LManagementPanel.mpas,8998 :: 		Glcd_Image(@notauthority);
	MOV	#lo_addr(_notauthority), W10
	MOV	#higher_addr(_notauthority), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,8999 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9000 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9001 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9002 :: 		MainMenuExit := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9004 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9005 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,9006 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9007 :: 		end;
L__MainMenu4208:
;GRR3000LManagementPanel.mpas,9009 :: 		end;
L__MainMenu4199:
;GRR3000LManagementPanel.mpas,9011 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4197:
;GRR3000LManagementPanel.mpas,9014 :: 		5: begin // battery maintenance
	MOV.B	[W14+0], W0
	CP.B	W0, #5
	BRA Z	L__MainMenu5680
	GOTO	L__MainMenu4211
L__MainMenu5680:
;GRR3000LManagementPanel.mpas,9016 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9018 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4213
;GRR3000LManagementPanel.mpas,9020 :: 		while (Ok_Button =0) do
L__MainMenu4216:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4217
;GRR3000LManagementPanel.mpas,9022 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9023 :: 		end;
	GOTO	L__MainMenu4216
L__MainMenu4217:
;GRR3000LManagementPanel.mpas,9025 :: 		AkuTestBakim();
	CALL	_AkuTestBakim
;GRR3000LManagementPanel.mpas,9026 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9027 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9029 :: 		end;
L__MainMenu4213:
;GRR3000LManagementPanel.mpas,9032 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4211:
;GRR3000LManagementPanel.mpas,9034 :: 		6: begin // kaçak
	MOV.B	[W14+0], W0
	CP.B	W0, #6
	BRA Z	L__MainMenu5681
	GOTO	L__MainMenu4222
L__MainMenu5681:
;GRR3000LManagementPanel.mpas,9036 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4224
;GRR3000LManagementPanel.mpas,9038 :: 		while (Ok_Button =0) do
L__MainMenu4227:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4228
;GRR3000LManagementPanel.mpas,9040 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9041 :: 		end;
	GOTO	L__MainMenu4227
L__MainMenu4228:
;GRR3000LManagementPanel.mpas,9043 :: 		if (Confirm_LeakaMenuBit = 1) then
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_LeakaMenuBit+0)
	GOTO	L__MainMenu4232
;GRR3000LManagementPanel.mpas,9045 :: 		Leakage_Settings;
	CALL	_Leakage_Settings
;GRR3000LManagementPanel.mpas,9046 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9047 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9048 :: 		end else
	GOTO	L__MainMenu4233
L__MainMenu4232:
;GRR3000LManagementPanel.mpas,9051 :: 		Glcd_Image(@notauthority);
	MOV	#lo_addr(_notauthority), W10
	MOV	#higher_addr(_notauthority), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,9052 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9053 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9054 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9055 :: 		MainMenuExit := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9057 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9058 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,9059 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9060 :: 		end;
L__MainMenu4233:
;GRR3000LManagementPanel.mpas,9062 :: 		end;
L__MainMenu4224:
;GRR3000LManagementPanel.mpas,9065 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4222:
;GRR3000LManagementPanel.mpas,9068 :: 		7: begin //  temperature set
	MOV.B	[W14+0], W0
	CP.B	W0, #7
	BRA Z	L__MainMenu5682
	GOTO	L__MainMenu4236
L__MainMenu5682:
;GRR3000LManagementPanel.mpas,9070 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4238
;GRR3000LManagementPanel.mpas,9072 :: 		while (Ok_Button =0) do
L__MainMenu4241:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4242
;GRR3000LManagementPanel.mpas,9074 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9075 :: 		end;
	GOTO	L__MainMenu4241
L__MainMenu4242:
;GRR3000LManagementPanel.mpas,9077 :: 		if (Confirm_TempeMenuBit = 1) then
	MOV	#lo_addr(_Confirm_TempeMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_TempeMenuBit+0)
	GOTO	L__MainMenu4246
;GRR3000LManagementPanel.mpas,9079 :: 		Temperature_Settings;
	CALL	_Temperature_Settings
;GRR3000LManagementPanel.mpas,9080 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9081 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9082 :: 		end else
	GOTO	L__MainMenu4247
L__MainMenu4246:
;GRR3000LManagementPanel.mpas,9085 :: 		Glcd_Image(@notauthority);
	MOV	#lo_addr(_notauthority), W10
	MOV	#higher_addr(_notauthority), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,9086 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9087 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9088 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9089 :: 		MainMenuExit := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9091 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9092 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,9093 :: 		i := 2;
	MOV.B	#2, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9094 :: 		end;
L__MainMenu4247:
;GRR3000LManagementPanel.mpas,9096 :: 		end;
L__MainMenu4238:
;GRR3000LManagementPanel.mpas,9098 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4236:
;GRR3000LManagementPanel.mpas,9100 :: 		8: begin // date-clock sett
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA Z	L__MainMenu5683
	GOTO	L__MainMenu4250
L__MainMenu5683:
;GRR3000LManagementPanel.mpas,9102 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4252
;GRR3000LManagementPanel.mpas,9104 :: 		while (Ok_Button =0) do
L__MainMenu4255:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4256
;GRR3000LManagementPanel.mpas,9106 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9107 :: 		end;
	GOTO	L__MainMenu4255
L__MainMenu4256:
;GRR3000LManagementPanel.mpas,9109 :: 		if (Confirm_ClockMenuBit = 1) then
	MOV	#lo_addr(_Confirm_ClockMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_ClockMenuBit+0)
	GOTO	L__MainMenu4260
;GRR3000LManagementPanel.mpas,9111 :: 		Clock_Settings;
	CALL	_Clock_Settings
;GRR3000LManagementPanel.mpas,9112 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9113 :: 		i := 3;
	MOV.B	#3, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9114 :: 		end else
	GOTO	L__MainMenu4261
L__MainMenu4260:
;GRR3000LManagementPanel.mpas,9117 :: 		Glcd_Image(@notauthority);
	MOV	#lo_addr(_notauthority), W10
	MOV	#higher_addr(_notauthority), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,9118 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9119 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9120 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9121 :: 		MainMenuExit := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9123 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9124 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,9125 :: 		i := 3;
	MOV.B	#3, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9126 :: 		end;
L__MainMenu4261:
;GRR3000LManagementPanel.mpas,9128 :: 		end;
L__MainMenu4252:
;GRR3000LManagementPanel.mpas,9130 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4250:
;GRR3000LManagementPanel.mpas,9132 :: 		9: begin // modbus sett
	MOV.B	[W14+0], W0
	CP.B	W0, #9
	BRA Z	L__MainMenu5684
	GOTO	L__MainMenu4264
L__MainMenu5684:
;GRR3000LManagementPanel.mpas,9134 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4266
;GRR3000LManagementPanel.mpas,9136 :: 		while (Ok_Button =0) do
L__MainMenu4269:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4270
;GRR3000LManagementPanel.mpas,9138 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9139 :: 		end;
	GOTO	L__MainMenu4269
L__MainMenu4270:
;GRR3000LManagementPanel.mpas,9141 :: 		if (Confirm_ModbusMenuBit = 1) then
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W0
	BTSS	[W0], BitPos(_Confirm_ModbusMenuBit+0)
	GOTO	L__MainMenu4274
;GRR3000LManagementPanel.mpas,9143 :: 		Modbus_Settings;
	CALL	_Modbus_Settings
;GRR3000LManagementPanel.mpas,9144 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9145 :: 		i := 3;
	MOV.B	#3, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9146 :: 		end else
	GOTO	L__MainMenu4275
L__MainMenu4274:
;GRR3000LManagementPanel.mpas,9149 :: 		Glcd_Image(@notauthority);
	MOV	#lo_addr(_notauthority), W10
	MOV	#higher_addr(_notauthority), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,9150 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9151 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9152 :: 		Pause_ms(600);
	MOV	#600, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9153 :: 		MainMenuExit := 0;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9155 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9156 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,9157 :: 		i := 3;
	MOV.B	#3, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9158 :: 		end;
L__MainMenu4275:
;GRR3000LManagementPanel.mpas,9160 :: 		end;
L__MainMenu4266:
;GRR3000LManagementPanel.mpas,9162 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4264:
;GRR3000LManagementPanel.mpas,9164 :: 		10: begin  // hakkýnda
	MOV.B	[W14+0], W0
	CP.B	W0, #10
	BRA Z	L__MainMenu5685
	GOTO	L__MainMenu4278
L__MainMenu5685:
;GRR3000LManagementPanel.mpas,9166 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4280
;GRR3000LManagementPanel.mpas,9168 :: 		while (Ok_Button =0) do
L__MainMenu4283:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4284
;GRR3000LManagementPanel.mpas,9170 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9171 :: 		end;
	GOTO	L__MainMenu4283
L__MainMenu4284:
;GRR3000LManagementPanel.mpas,9173 :: 		Language_Settings();
	CALL	_Language_Settings
;GRR3000LManagementPanel.mpas,9175 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9176 :: 		i := 3;
	MOV.B	#3, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9178 :: 		end;
L__MainMenu4280:
;GRR3000LManagementPanel.mpas,9180 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4278:
;GRR3000LManagementPanel.mpas,9182 :: 		11: begin  // log
	MOV.B	[W14+0], W0
	CP.B	W0, #11
	BRA Z	L__MainMenu5686
	GOTO	L__MainMenu4289
L__MainMenu5686:
;GRR3000LManagementPanel.mpas,9184 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4291
;GRR3000LManagementPanel.mpas,9186 :: 		while (Ok_Button =0) do
L__MainMenu4294:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4295
;GRR3000LManagementPanel.mpas,9188 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9189 :: 		end;
	GOTO	L__MainMenu4294
L__MainMenu4295:
;GRR3000LManagementPanel.mpas,9191 :: 		Log_Settings;
	CALL	_Log_Settings
;GRR3000LManagementPanel.mpas,9192 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9193 :: 		i := 3;
	MOV.B	#3, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9194 :: 		end;
L__MainMenu4291:
;GRR3000LManagementPanel.mpas,9196 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4289:
;GRR3000LManagementPanel.mpas,9198 :: 		12: begin  // password set
	MOV.B	[W14+0], W0
	CP.B	W0, #12
	BRA Z	L__MainMenu5687
	GOTO	L__MainMenu4300
L__MainMenu5687:
;GRR3000LManagementPanel.mpas,9200 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4302
;GRR3000LManagementPanel.mpas,9202 :: 		while (Ok_Button =0) do
L__MainMenu4305:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4306
;GRR3000LManagementPanel.mpas,9204 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9205 :: 		end;
	GOTO	L__MainMenu4305
L__MainMenu4306:
;GRR3000LManagementPanel.mpas,9207 :: 		Password_Settings;
	CALL	_Password_Settings
;GRR3000LManagementPanel.mpas,9208 :: 		MainMenuExit := 0x00;
	MOV	#lo_addr(_MainMenuExit), W1
	CLR	W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9209 :: 		i := 3;
	MOV.B	#3, W0
	MOV.B	W0, [W14+1]
;GRR3000LManagementPanel.mpas,9210 :: 		end;
L__MainMenu4302:
;GRR3000LManagementPanel.mpas,9211 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4300:
;GRR3000LManagementPanel.mpas,9215 :: 		13: begin  // geri
	MOV.B	[W14+0], W0
	CP.B	W0, #13
	BRA Z	L__MainMenu5688
	GOTO	L__MainMenu4311
L__MainMenu5688:
;GRR3000LManagementPanel.mpas,9217 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4313
;GRR3000LManagementPanel.mpas,9219 :: 		while (Ok_Button =0) do
L__MainMenu4316:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__MainMenu4317
;GRR3000LManagementPanel.mpas,9221 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9222 :: 		end;
	GOTO	L__MainMenu4316
L__MainMenu4317:
;GRR3000LManagementPanel.mpas,9223 :: 		MainMenuExit := 1;
	MOV	#lo_addr(_MainMenuExit), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9225 :: 		end;
L__MainMenu4313:
;GRR3000LManagementPanel.mpas,9226 :: 		end;
	GOTO	L__MainMenu4152
L__MainMenu4311:
L__MainMenu4152:
;GRR3000LManagementPanel.mpas,9230 :: 		end;
	GOTO	L__MainMenu4114
L__MainMenu4115:
;GRR3000LManagementPanel.mpas,9232 :: 		end;
L_end_MainMenu:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _MainMenu

_Data_EepromRead:

;GRR3000LManagementPanel.mpas,9236 :: 		begin
;GRR3000LManagementPanel.mpas,9238 :: 		HucreSayisi         := EEPROM_Read(EE_HucreSayisiEeAddr);
	PUSH	W10
	PUSH	W11
	MOV	#61444, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _HucreSayisi
;GRR3000LManagementPanel.mpas,9239 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9240 :: 		NomHucreGerilim     := EEPROM_Read(EE_NomHucreGerilimEeAddr);
	MOV	#61446, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _NomHucreGerilim
;GRR3000LManagementPanel.mpas,9241 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9242 :: 		F_ChargePercentLo   := EEPROM_Read(EE_F_ChargePercentLoEeAddr);
	MOV	#61448, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _F_ChargePercentLo
;GRR3000LManagementPanel.mpas,9243 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9244 :: 		F_ChargePercentHi   := EEPROM_Read(EE_F_ChargePercentHiEeAddr);
	MOV	#61450, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _F_ChargePercentHi
;GRR3000LManagementPanel.mpas,9245 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9246 :: 		B_ChargePercentLo   := EEPROM_Read(EE_B_ChargePercentLoEeAddr);
	MOV	#61452, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _B_ChargePercentLo
;GRR3000LManagementPanel.mpas,9247 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9249 :: 		NominalGerilim := ((NomHucreGerilim * HucreSayisi) div 10);
	MOV	_NomHucreGerilim, W1
	MOV	#lo_addr(_HucreSayisi), W0
	MUL.UU	W1, [W0], W4
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W4, W2
	MOV	W0, _NominalGerilim
;GRR3000LManagementPanel.mpas,9251 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9253 :: 		B_ChargePercentHi   := EEPROM_Read(EE_B_ChargePercentHiEeAddr);
	MOV	#61454, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _B_ChargePercentHi
;GRR3000LManagementPanel.mpas,9254 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9255 :: 		RedresorAkim        := EEPROM_Read(EE_RedresorAkimEeAddr);
	MOV	#61456, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _RedresorAkim
;GRR3000LManagementPanel.mpas,9256 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9257 :: 		LanguageBit         := EEPROM_Read(EE_LanguageBitEeAddr);
	MOV	#61516, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_LanguageBit), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9259 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9261 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9263 :: 		Dropper_OutStatus   := EEPROM_Read(EE_DropperOutStatusEeAddr);
	MOV	#61496, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Dropper_OutStatus), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9264 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9265 :: 		OperationMode       := EEPROM_Read(EE_OperationModeEeAddr);
	MOV	#61524, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_OperationMode), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9266 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9267 :: 		MasterSlave         := EEPROM_Read(EE_MasterSlaveEeAddr);
	MOV	#61526, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _MasterSlave
;GRR3000LManagementPanel.mpas,9268 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9270 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9272 :: 		ACMaxVoltSet        := EEPROM_Read(EE_ACMaxVoltSetEeAddr);
	MOV	#61498, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _ACMaxVoltSet
;GRR3000LManagementPanel.mpas,9273 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9274 :: 		ACMinVoltSet        := EEPROM_Read(EE_ACMinVoltSetEeAddr);
	MOV	#61500, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _ACMinVoltSet
;GRR3000LManagementPanel.mpas,9275 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9278 :: 		Leakage_Pos_Set     := EEPROM_Read(EE_LeakagePosEeAddr);
	MOV	#61518, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Leakage_Pos_Set), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9279 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9280 :: 		Leakage_Neg_Set     := EEPROM_Read(EE_LeakageNegEeAddr);
	MOV	#61520, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Leakage_Neg_Set), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9281 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9282 :: 		ModbusID            := EEPROM_Read(EE_ModbusIDEeAddr);
	MOV	#61512, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ModbusID), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9283 :: 		Modbus_Adress       := ModbusID;
	MOV	#lo_addr(_Modbus_Adress), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9284 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9285 :: 		ModbusBaudRate      := EEPROM_Read(EE_ModbusBaudRate);
	MOV	#61514, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ModbusBaudRate), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9287 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9288 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9292 :: 		TempFanOffSet       := EEPROM_Read(EE_TempFanOffSetEeAddr);
	MOV	#61508, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_TempFanOffSet), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9293 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9294 :: 		TempFanOnSet        := EEPROM_Read(EE_TempFanOnSetEeAddr);
	MOV	#61506, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_TempFanOnSet), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9295 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9297 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9299 :: 		TempAlarmSet        := EEPROM_Read(EE_TempAlarmSetEeAddr);
	MOV	#61504, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_TempAlarmSet), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9300 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9301 :: 		ChargeMode          := EEPROM_Read(EE_ChargeModeEeAddr);
	MOV	#61468, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ChargeMode), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9302 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9303 :: 		DCOutVoltSet        := EEPROM_Read(EE_DCOutVoltSetEeAddr);
	MOV	#61484, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _DCOutVoltSet
;GRR3000LManagementPanel.mpas,9304 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9305 :: 		DCOutAmpsSet        := EEPROM_Read(EE_DcOutAmpsSetEeAddr);
	MOV	#61486, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _DcOutAmpsSet
;GRR3000LManagementPanel.mpas,9306 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9307 :: 		MaxVoltSet          := EEPROM_Read(EE_MaxVoltSetEeAddr);
	MOV	#61488, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _MaxvoltSet
;GRR3000LManagementPanel.mpas,9308 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9309 :: 		MinVoltSet          := EEPROM_Read(EE_MinVoltSetEeAddr);
	MOV	#61490, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _MinVoltSet
;GRR3000LManagementPanel.mpas,9311 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9312 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9316 :: 		BatteryAh           := EEPROM_Read(EE_BatteryAhEeAddr);
	MOV	#61458, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAh
;GRR3000LManagementPanel.mpas,9317 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9318 :: 		BoostChargeLimit    := EEPROM_Read(EE_BoostChargeLimitEeAddr);
	MOV	#61480, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BoostChargeLimit
;GRR3000LManagementPanel.mpas,9319 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9320 :: 		FloatChargeLimit    := EEPROM_Read(EE_FloatChargeLimitEeAddr);
	MOV	#61482, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _FloatChargeLimit
;GRR3000LManagementPanel.mpas,9321 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9322 :: 		DeepDischargeVolt   := EEPROM_Read(EE_DeepDischargeVoltEeAddr);
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _DeepDischargeVolt
;GRR3000LManagementPanel.mpas,9323 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9324 :: 		BatteryAmpsSet      := EEPROM_Read(EE_BatteryAmpsBoostEeAddr);
	MOV	#61460, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BatteryAmpsSet
;GRR3000LManagementPanel.mpas,9326 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9327 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9329 :: 		BoostChargeVoltage  := EEPROM_Read(EE_BoostChargeVoltEeAddr);
	MOV	#61470, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BoostChargeVoltage
;GRR3000LManagementPanel.mpas,9330 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9331 :: 		FloatChargeVoltage  := EEPROM_Read(EE_FloatChargeVoltEeAddr);
	MOV	#61472, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _FloatChargeVoltage
;GRR3000LManagementPanel.mpas,9332 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9333 :: 		BoostChargeTimeSet  := EEPROM_Read(EE_BoostChargeTimeEeAddr);
	MOV	#61474, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BoostChargeTimeSet
;GRR3000LManagementPanel.mpas,9334 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9335 :: 		BoostChargeTime     := BoostChargeTimeSet;
	MOV	_BoostChargeTimeSet, W0
	CLR	W1
	MOV	W0, _BoostChargeTime
	MOV	W1, _BoostChargeTime+2
;GRR3000LManagementPanel.mpas,9336 :: 		DeepDischargeVolt   := EEPROM_Read(EE_DeepDischargeVoltEeAddr);
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _DeepDischargeVolt
;GRR3000LManagementPanel.mpas,9337 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9338 :: 		AutoBFMode          := EEPROM_Read(EE_AutoBFModeEeAddr);
	MOV	#61478, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_AutoBFMode), W1
	BSET	[W1], BitPos(_AutoBFMode+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_AutoBFMode+0)
;GRR3000LManagementPanel.mpas,9339 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9341 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9343 :: 		BoostChargeLimit    := EEPROM_Read(EE_BoostChargeLimitEeAddr);
	MOV	#61480, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _BoostChargeLimit
;GRR3000LManagementPanel.mpas,9344 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9345 :: 		FloatChargeLimit    := EEPROM_Read(EE_FloatChargeLimitEeAddr);
	MOV	#61482, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _FloatChargeLimit
;GRR3000LManagementPanel.mpas,9346 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9347 :: 		dV_LoadVolt         := EEPROM_Read(EE_dV_LoadVoltEeAddr);
	MOV	#61522, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	CLR	W1
	MOV	W0, _dV_LoadVolt
	MOV	W1, _dV_LoadVolt+2
;GRR3000LManagementPanel.mpas,9348 :: 		dV_LoadVolt         := dV_LoadVolt - 1000;
	MOV	#1000, W1
	MOV	#0, W2
	MOV	#lo_addr(_dV_LoadVolt), W0
	SUBR	W1, [W0], [W0++]
	SUBBR	W2, [W0], [W0--]
;GRR3000LManagementPanel.mpas,9353 :: 		diff_leak_pos := EEPROM_Read(EE_Data_Diff_leak_pos);
	MOV	#61528, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_diff_leak_pos), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9354 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9355 :: 		diff_leak_neg := EEPROM_Read(EE_Data_Diff_leak_neg);
	MOV	#61530, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_diff_leak_neg), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9356 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9358 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9360 :: 		Confirm_AcMenuBit       := EEPROM_Read(EE_ConfirmAcMenuEeAddr);
	MOV	#61534, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_AcMenuBit), W1
	BSET	[W1], BitPos(_Confirm_AcMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_AcMenuBit+0)
;GRR3000LManagementPanel.mpas,9361 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9363 :: 		Confirm_BattMenuBit     := EEPROM_Read(EE_ConfirmBattMenuEeAddr);
	MOV	#61538, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_BattMenuBit), W1
	BSET	[W1], BitPos(_Confirm_BattMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_BattMenuBit+0)
;GRR3000LManagementPanel.mpas,9364 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9366 :: 		Confirm_ClockMenuBit    := EEPROM_Read(EE_ConfirmClockMenuEeAddr);
	MOV	#61546, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_ClockMenuBit), W1
	BSET	[W1], BitPos(_Confirm_ClockMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_ClockMenuBit+0)
;GRR3000LManagementPanel.mpas,9367 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9369 :: 		Confirm_DcMenuBit       := EEPROM_Read(EE_ConfirmDcMenuEeAddr);
	MOV	#61536, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_DcMenuBit), W1
	BSET	[W1], BitPos(_Confirm_DcMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_DcMenuBit+0)
;GRR3000LManagementPanel.mpas,9370 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9375 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9377 :: 		Confirm_LeakaMenuBit    := EEPROM_Read(EE_ConfirmLeakMenuEeAddr);
	MOV	#61542, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_LeakaMenuBit), W1
	BSET	[W1], BitPos(_Confirm_LeakaMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_LeakaMenuBit+0)
;GRR3000LManagementPanel.mpas,9378 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9380 :: 		Confirm_ModbusMenuBit   := EEPROM_Read(EE_ConfirmModbusMenuEeAddr);
	MOV	#61548, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_ModbusMenuBit), W1
	BSET	[W1], BitPos(_Confirm_ModbusMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_ModbusMenuBit+0)
;GRR3000LManagementPanel.mpas,9381 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9383 :: 		Confirm_OperaMenuBit    := EEPROM_Read(EE_ConfirmOperaMenuEeAddr);
	MOV	#61540, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_OperaMenuBit), W1
	BSET	[W1], BitPos(_Confirm_OperaMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_OperaMenuBit+0)
;GRR3000LManagementPanel.mpas,9384 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9386 :: 		Confirm_TempeMenuBit    := EEPROM_Read(EE_ConfirmTempMenuEeAddr);
	MOV	#61544, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Confirm_TempeMenuBit), W1
	BSET	[W1], BitPos(_Confirm_TempeMenuBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Confirm_TempeMenuBit+0)
;GRR3000LManagementPanel.mpas,9387 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9389 :: 		User_Password           := EEPROM_Read(EE_PasswordEeAddr);
	MOV	#61552, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _User_Password
;GRR3000LManagementPanel.mpas,9390 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9392 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9412 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9416 :: 		Sample_RedDigital  := Org_LoadVolt;
	MOV	#3244, W0
	MOV	W0, _Sample_RedDigital
;GRR3000LManagementPanel.mpas,9418 :: 		if (HucreSayisi = 6) then
	MOV	_HucreSayisi, W0
	CP	W0, #6
	BRA Z	L__Data_EepromRead5690
	GOTO	L__Data_EepromRead4322
L__Data_EepromRead5690:
;GRR3000LManagementPanel.mpas,9422 :: 		Sample_RedVolt    := 15;
	MOV	#15, W0
	MOV	W0, _Sample_RedVolt
;GRR3000LManagementPanel.mpas,9424 :: 		end else
	GOTO	L__Data_EepromRead4323
L__Data_EepromRead4322:
;GRR3000LManagementPanel.mpas,9425 :: 		if (HucreSayisi = 12) then
	MOV	_HucreSayisi, W0
	CP	W0, #12
	BRA Z	L__Data_EepromRead5691
	GOTO	L__Data_EepromRead4325
L__Data_EepromRead5691:
;GRR3000LManagementPanel.mpas,9429 :: 		Sample_RedVolt    := 30;
	MOV	#30, W0
	MOV	W0, _Sample_RedVolt
;GRR3000LManagementPanel.mpas,9430 :: 		one_kohm_constant := 1000;
	MOV	#1000, W0
	MOV	W0, _one_kohm_constant
;GRR3000LManagementPanel.mpas,9431 :: 		Res_DivideValue   := 990;
	MOV	#990, W0
	MOV	W0, _Res_DivideValue
;GRR3000LManagementPanel.mpas,9433 :: 		end else
	GOTO	L__Data_EepromRead4326
L__Data_EepromRead4325:
;GRR3000LManagementPanel.mpas,9434 :: 		if (HucreSayisi = 24) then
	MOV	_HucreSayisi, W0
	CP	W0, #24
	BRA Z	L__Data_EepromRead5692
	GOTO	L__Data_EepromRead4328
L__Data_EepromRead5692:
;GRR3000LManagementPanel.mpas,9438 :: 		Sample_RedVolt    := 60;
	MOV	#60, W0
	MOV	W0, _Sample_RedVolt
;GRR3000LManagementPanel.mpas,9440 :: 		one_kohm_constant := 483;
	MOV	#483, W0
	MOV	W0, _one_kohm_constant
;GRR3000LManagementPanel.mpas,9441 :: 		Res_DivideValue   := 463;
	MOV	#463, W0
	MOV	W0, _Res_DivideValue
;GRR3000LManagementPanel.mpas,9443 :: 		end else
	GOTO	L__Data_EepromRead4329
L__Data_EepromRead4328:
;GRR3000LManagementPanel.mpas,9444 :: 		if ((HucreSayisi >= 54)and(HucreSayisi <= 60)) then
	MOV	#54, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W2
	BRA GTU	L__Data_EepromRead5693
	COM	W2
L__Data_EepromRead5693:
	MOV	#60, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W0
	BRA LTU	L__Data_EepromRead5694
	COM	W0
L__Data_EepromRead5694:
	AND	W2, W0, W0
	BRA NZ	L__Data_EepromRead5695
	GOTO	L__Data_EepromRead4331
L__Data_EepromRead5695:
;GRR3000LManagementPanel.mpas,9448 :: 		Sample_RedVolt    := 132;
	MOV	#132, W0
	MOV	W0, _Sample_RedVolt
;GRR3000LManagementPanel.mpas,9450 :: 		one_kohm_constant := 204;
	MOV	#204, W0
	MOV	W0, _one_kohm_constant
;GRR3000LManagementPanel.mpas,9451 :: 		Res_DivideValue   := 205;
	MOV	#205, W0
	MOV	W0, _Res_DivideValue
;GRR3000LManagementPanel.mpas,9453 :: 		end else
	GOTO	L__Data_EepromRead4332
L__Data_EepromRead4331:
;GRR3000LManagementPanel.mpas,9454 :: 		if ((HucreSayisi = 108)or(HucreSayisi =110)) then
	MOV	#108, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W2
	BRA NZ	L__Data_EepromRead5696
	COM	W2
L__Data_EepromRead5696:
	MOV	#110, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W0
	BRA NZ	L__Data_EepromRead5697
	COM	W0
L__Data_EepromRead5697:
	IOR	W2, W0, W0
	BRA NZ	L__Data_EepromRead5698
	GOTO	L__Data_EepromRead4334
L__Data_EepromRead5698:
;GRR3000LManagementPanel.mpas,9458 :: 		Sample_RedVolt    := 268;
	MOV	#268, W0
	MOV	W0, _Sample_RedVolt
;GRR3000LManagementPanel.mpas,9459 :: 		one_kohm_constant := 50;
	MOV	#50, W0
	MOV	W0, _one_kohm_constant
;GRR3000LManagementPanel.mpas,9460 :: 		Res_DivideValue   := 50;
	MOV	#50, W0
	MOV	W0, _Res_DivideValue
;GRR3000LManagementPanel.mpas,9461 :: 		end;
L__Data_EepromRead4334:
L__Data_EepromRead4332:
L__Data_EepromRead4329:
L__Data_EepromRead4326:
L__Data_EepromRead4323:
;GRR3000LManagementPanel.mpas,9464 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9465 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9467 :: 		if (LanguageBit = Turkish) then
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA Z	L__Data_EepromRead5699
	GOTO	L__Data_EepromRead4337
L__Data_EepromRead5699:
;GRR3000LManagementPanel.mpas,9469 :: 		Turkish_Lang;
	CALL	_Turkish_Lang
;GRR3000LManagementPanel.mpas,9470 :: 		end else
	GOTO	L__Data_EepromRead4338
L__Data_EepromRead4337:
;GRR3000LManagementPanel.mpas,9471 :: 		if (LanguageBit = English) then
	MOV	#lo_addr(_LanguageBit), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA Z	L__Data_EepromRead5700
	GOTO	L__Data_EepromRead4340
L__Data_EepromRead5700:
;GRR3000LManagementPanel.mpas,9473 :: 		English_Lang;
	CALL	_English_Lang
;GRR3000LManagementPanel.mpas,9474 :: 		end;
L__Data_EepromRead4340:
L__Data_EepromRead4338:
;GRR3000LManagementPanel.mpas,9476 :: 		ServiceCycle      := EEPROM_Read(EE_ServiceCycleEeAddr);
	MOV	#63028, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ServiceCycle), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9477 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9478 :: 		QuitVolt         := EEPROM_Read(EE_QuitVoltEeAddr);
	MOV	#63038, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _QuitVolt
;GRR3000LManagementPanel.mpas,9479 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9480 :: 		QuitTime         := EEPROM_Read(EE_QuitTimeEeAddr);
	MOV	#63040, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_QuitTime), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9481 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9484 :: 		Bakim_Start_Time := EEPROM_Read(EE_BkmStartTimeEeAddr);
	MOV	#63044, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _Bakim_Start_Time
;GRR3000LManagementPanel.mpas,9485 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9486 :: 		Bkm_Status       := EEPROM_Read(EE_BkmStatusEeAddr);
	MOV	#63046, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_Bkm_Status), W1
	BSET	[W1], BitPos(_Bkm_Status+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_Bkm_Status+0)
;GRR3000LManagementPanel.mpas,9487 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9489 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9491 :: 		QuitTime_Sec := (QuitTime * 3600000);// çýkýþ zamaný saat olarak // 1ms timer için 1 sýfýr daha atýldý, GAR24-L' de 10ms timer da 1 sýfýr eksik
	MOV	#lo_addr(_QuitTime), W2
	MOV	#61056, W0
	MOV	#54, W1
	ZE	[W2], W2
	CLR	W3
	CALL	__Multiply_32x32
	MOV	W0, _QuitTime_Sec
	MOV	W1, _QuitTime_Sec+2
;GRR3000LManagementPanel.mpas,9495 :: 		Service1_Date    := EEPROM_Read(EE_Service1EeAddr);
	MOV	#63030, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _Service1_Date
;GRR3000LManagementPanel.mpas,9496 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9497 :: 		Service2_Date    := EEPROM_Read(EE_Service2EeAddr);
	MOV	#63032, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _Service2_Date
;GRR3000LManagementPanel.mpas,9498 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9499 :: 		Service3_Date    := EEPROM_Read(EE_Service3EeAddr);
	MOV	#63034, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _Service3_Date
;GRR3000LManagementPanel.mpas,9500 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9501 :: 		Service4_Date    := EEPROM_Read(EE_Service4EeAddr);
	MOV	#63036, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _Service4_Date
;GRR3000LManagementPanel.mpas,9502 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9504 :: 		FirstStartUpBattMenu := EEPROM_Read(EE_FirstBattMenuEeAddr);
	MOV	#61574, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_FirstStartUpBattMenu), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9505 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9506 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9508 :: 		ACVolt_Different := EEPROM_Read(EE_ACVoltDifferentEeAddr);
	MOV	#61554, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_ACVolt_Different), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9509 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9510 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9512 :: 		AC_ProtectBit   := EEPROM_Read(EE_ACProtectEeAddr);
	MOV	#61556, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_AC_ProtectBit), W1
	BSET	[W1], BitPos(_AC_ProtectBit+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_AC_ProtectBit+0)
;GRR3000LManagementPanel.mpas,9513 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9514 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9516 :: 		KacakSensor   := EEPROM_Read(EE_KacakSensorEeAddr);
	MOV	#61558, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_KacakSensor), W1
	BSET	[W1], BitPos(_KacakSensor+0)
	BTSS	W0, #0
	BCLR	[W1], BitPos(_KacakSensor+0)
;GRR3000LManagementPanel.mpas,9517 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9518 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9520 :: 		DiodeValue    := EEPROM_Read(EE_DiodeValueEeAddr);
	MOV	#61576, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	#lo_addr(_DiodeValue), W1
	MOV.B	W0, [W1]
;GRR3000LManagementPanel.mpas,9521 :: 		Pause_ms(Pause);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9522 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9524 :: 		Glcd_Fill(0x00);
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,9525 :: 		end;
L_end_Data_EepromRead:
	POP	W11
	POP	W10
	RETURN
; end of _Data_EepromRead

_FactoryData_Write:
	LNK	#22

;GRR3000LManagementPanel.mpas,9528 :: 		begin
;GRR3000LManagementPanel.mpas,9530 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,9531 :: 		Glcd_Write_Text('Factory Data Reset...',0,Row1,Black);
	ADD	W14, #0, W1
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#99, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#68, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,9533 :: 		EEPROM_Write(EE_dV_LoadVoltEeAddr, 1001);  // loadvolt fark deðeri açýlýþta 1001 yüklensin saçma deðer yüklenmesin
	MOV	#1001, W12
	MOV	#61522, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9534 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4344:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4344
;GRR3000LManagementPanel.mpas,9536 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9537 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9539 :: 		EEPROM_Write(EE_LogListArrayEeAddr,0);  // log kaydetme listesi ilk yazýlým yüklemede 0 olarak atandý   -- liste boþ
	CLR	W12
	MOV	#61566, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9540 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4349:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4349
;GRR3000LManagementPanel.mpas,9542 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9543 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9545 :: 		EEPROM_Write(EE_DropperOutStatusEeAddr, 2); // dropper disable
	MOV	#2, W12
	MOV	#61496, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9546 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4354:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4354
;GRR3000LManagementPanel.mpas,9548 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9549 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9551 :: 		EEPROM_Write(EE_OperationModeEeAddr, 1); // çalýþma modu tekli
	MOV	#1, W12
	MOV	#61524, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9552 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4359:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4359
;GRR3000LManagementPanel.mpas,9554 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9555 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9557 :: 		EEPROM_Write(EE_MasterSlaveEeAddr, 1); // master mode
	MOV	#1, W12
	MOV	#61526, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9558 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4364:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4364
;GRR3000LManagementPanel.mpas,9560 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9561 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9563 :: 		EEPROM_Write(EE_ACMaxVoltSetEeAddr, 480); // ac max volt 480V
	MOV	#480, W12
	MOV	#61498, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9564 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4369:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4369
;GRR3000LManagementPanel.mpas,9566 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9567 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9569 :: 		EEPROM_Write(EE_ACMinVoltSetEeAddr, 320); // ac min volt 320V
	MOV	#320, W12
	MOV	#61500, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9570 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4374:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4374
;GRR3000LManagementPanel.mpas,9572 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9573 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9575 :: 		EEPROM_Write(EE_ACVoltDifferentEeAddr, 20); // AC gerilim farký 20V
	MOV	#20, W12
	MOV	#61554, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9576 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4379:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4379
;GRR3000LManagementPanel.mpas,9578 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9579 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9581 :: 		EEPROM_Write(EE_ACProtectEeAddr, 1); // AC Koruma açýk
	MOV	#1, W12
	MOV	#61556, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9582 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4384:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4384
;GRR3000LManagementPanel.mpas,9584 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9585 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9593 :: 		EEPROM_Write(EE_LeakagePosEeAddr, 50); //+ kaçak deðeri 50k
	MOV	#50, W12
	MOV	#61518, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9594 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4389:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4389
;GRR3000LManagementPanel.mpas,9596 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9597 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9599 :: 		EEPROM_Write(EE_LeakageNegEeAddr, 50);// - kaçak deðeri 50k
	MOV	#50, W12
	MOV	#61520, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9600 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4394:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4394
;GRR3000LManagementPanel.mpas,9602 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9603 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9605 :: 		EEPROM_Write(EE_ModbusIDEeAddr, 04); // modbus id 04
	MOV	#4, W12
	MOV	#61512, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9606 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4399:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4399
;GRR3000LManagementPanel.mpas,9608 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9609 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9611 :: 		EEPROM_Write(EE_ModbusBaudRate, 2); // baudrate 9600
	MOV	#2, W12
	MOV	#61514, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9612 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4404:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4404
;GRR3000LManagementPanel.mpas,9614 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9615 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9617 :: 		EEPROM_Write(EE_TempAlarmSetEeAddr, 55); // sýcaklýk alarmý 55C
	MOV	#55, W12
	MOV	#61504, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9618 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4409:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4409
;GRR3000LManagementPanel.mpas,9620 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9621 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9623 :: 		EEPROM_Write(EE_TempFanOnSetEeAddr, 40); // fan açma deðeri 40C
	MOV	#40, W12
	MOV	#61506, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9624 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4414:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4414
;GRR3000LManagementPanel.mpas,9626 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9627 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9629 :: 		EEPROM_Write(EE_TempFanOffSetEeAddr, 38); // fan kapama deðeri 38C
	MOV	#38, W12
	MOV	#61508, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9630 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4419:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4419
;GRR3000LManagementPanel.mpas,9632 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9633 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9641 :: 		if (HucreSayisi = 12) then // 24V ise
	MOV	_HucreSayisi, W0
	CP	W0, #12
	BRA Z	L__FactoryData_Write5702
	GOTO	L__FactoryData_Write4424
L__FactoryData_Write5702:
;GRR3000LManagementPanel.mpas,9643 :: 		EEPROM_Write(EE_DCOutVoltSetEeAddr, 276); // dc çýkýþ gerilimi 27.6V
	MOV	#276, W12
	MOV	#61484, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9644 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4427:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4427
;GRR3000LManagementPanel.mpas,9646 :: 		EEPROM_Write(EE_MaxVoltSetEeAddr, 348); // max volt alarm deðeri 30V
	MOV	#348, W12
	MOV	#61488, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9647 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4432:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4432
;GRR3000LManagementPanel.mpas,9649 :: 		EEPROM_Write(EE_MinVoltSetEeAddr, 210); // min volt alarm deðeri 21V
	MOV	#210, W12
	MOV	#61490, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9650 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4437:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4437
;GRR3000LManagementPanel.mpas,9652 :: 		EEPROM_Write(EE_BoostChargeVoltEeAddr, 300); // hýzlý þarj gerilimi = 28V
	MOV	#300, W12
	MOV	#61470, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9653 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4442:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4442
;GRR3000LManagementPanel.mpas,9655 :: 		EEPROM_Write(EE_FloatChargeVoltEeAddr, 276);// normal þarj gerilimi = 27.6V
	MOV	#276, W12
	MOV	#61472, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9656 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4447:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4447
;GRR3000LManagementPanel.mpas,9658 :: 		EEPROM_Write(EE_DeepDischargeVoltEeAddr, 210); // derin deþarj gerilimi = 21V
	MOV	#210, W12
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9659 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4452:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4452
;GRR3000LManagementPanel.mpas,9661 :: 		EEPROM_Write(EE_QuitVoltEeAddr, 210);
	MOV	#210, W12
	MOV	#63038, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9662 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4457:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4457
;GRR3000LManagementPanel.mpas,9664 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9665 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9667 :: 		end else
	GOTO	L__FactoryData_Write4425
L__FactoryData_Write4424:
;GRR3000LManagementPanel.mpas,9668 :: 		if (HucreSayisi = 24) then // 48V ise
	MOV	_HucreSayisi, W0
	CP	W0, #24
	BRA Z	L__FactoryData_Write5703
	GOTO	L__FactoryData_Write4462
L__FactoryData_Write5703:
;GRR3000LManagementPanel.mpas,9670 :: 		EEPROM_Write(EE_DCOutVoltSetEeAddr, 552); // dc çýkýþ gerilimi 55,2V
	MOV	#552, W12
	MOV	#61484, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9671 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4465:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4465
;GRR3000LManagementPanel.mpas,9673 :: 		EEPROM_Write(EE_MaxVoltSetEeAddr, 600); // max volt alarm deðeri 60V
	MOV	#600, W12
	MOV	#61488, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9674 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4470:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4470
;GRR3000LManagementPanel.mpas,9676 :: 		EEPROM_Write(EE_MinVoltSetEeAddr, 420); // min volt alarm deðeri 42V
	MOV	#420, W12
	MOV	#61490, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9677 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4475:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4475
;GRR3000LManagementPanel.mpas,9679 :: 		EEPROM_Write(EE_BoostChargeVoltEeAddr, 600); // hýzlý þarj gerilimi = 55.9V
	MOV	#600, W12
	MOV	#61470, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9680 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4480:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4480
;GRR3000LManagementPanel.mpas,9682 :: 		EEPROM_Write(EE_FloatChargeVoltEeAddr, 535);// normal þarj gerilimi = 53.5V
	MOV	#535, W12
	MOV	#61472, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9683 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4485:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4485
;GRR3000LManagementPanel.mpas,9685 :: 		EEPROM_Write(EE_DeepDischargeVoltEeAddr, 420); // derin deþarj gerilimi = 42V
	MOV	#420, W12
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9686 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4490:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4490
;GRR3000LManagementPanel.mpas,9688 :: 		EEPROM_Write(EE_QuitVoltEeAddr, 420);
	MOV	#420, W12
	MOV	#63038, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9689 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4495:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4495
;GRR3000LManagementPanel.mpas,9691 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9692 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9694 :: 		end else
	GOTO	L__FactoryData_Write4463
L__FactoryData_Write4462:
;GRR3000LManagementPanel.mpas,9695 :: 		if ((HucreSayisi = 54)or(HucreSayisi = 55)) then // 110V ise
	MOV	#54, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W2
	BRA NZ	L__FactoryData_Write5704
	COM	W2
L__FactoryData_Write5704:
	MOV	#55, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W0
	BRA NZ	L__FactoryData_Write5705
	COM	W0
L__FactoryData_Write5705:
	IOR	W2, W0, W0
	BRA NZ	L__FactoryData_Write5706
	GOTO	L__FactoryData_Write4500
L__FactoryData_Write5706:
;GRR3000LManagementPanel.mpas,9697 :: 		EEPROM_Write(EE_DCOutVoltSetEeAddr, 1265); // dc çýkýþ gerilimi 126,5V
	MOV	#1265, W12
	MOV	#61484, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9698 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4503:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4503
;GRR3000LManagementPanel.mpas,9700 :: 		EEPROM_Write(EE_MaxVoltSetEeAddr, 1590); // max volt alarm deðeri 159V
	MOV	#1590, W12
	MOV	#61488, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9701 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4508:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4508
;GRR3000LManagementPanel.mpas,9703 :: 		EEPROM_Write(EE_MinVoltSetEeAddr, 910); // min volt alarm deðeri 91V
	MOV	#910, W12
	MOV	#61490, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9704 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4513:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4513
;GRR3000LManagementPanel.mpas,9706 :: 		EEPROM_Write(EE_BoostChargeVoltEeAddr, 1375); // hýzlý þarj gerilimi = 124.2V
	MOV	#1375, W12
	MOV	#61470, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9707 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4518:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4518
;GRR3000LManagementPanel.mpas,9709 :: 		EEPROM_Write(EE_FloatChargeVoltEeAddr, 1265);// normal þarj gerilimi = 120.4V
	MOV	#1265, W12
	MOV	#61472, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9710 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4523:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4523
;GRR3000LManagementPanel.mpas,9712 :: 		EEPROM_Write(EE_DeepDischargeVoltEeAddr, 962); // derin deþarj gerilimi = 94.5V
	MOV	#962, W12
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9713 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4528:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4528
;GRR3000LManagementPanel.mpas,9715 :: 		EEPROM_Write(EE_QuitVoltEeAddr, 962);
	MOV	#962, W12
	MOV	#63038, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9716 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4533:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4533
;GRR3000LManagementPanel.mpas,9718 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9719 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9721 :: 		end else
	GOTO	L__FactoryData_Write4501
L__FactoryData_Write4500:
;GRR3000LManagementPanel.mpas,9722 :: 		if ((HucreSayisi = 108)or(HucreSayisi = 110)) then // 220V ise
	MOV	#108, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W2
	BRA NZ	L__FactoryData_Write5707
	COM	W2
L__FactoryData_Write5707:
	MOV	#110, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W0
	BRA NZ	L__FactoryData_Write5708
	COM	W0
L__FactoryData_Write5708:
	IOR	W2, W0, W0
	BRA NZ	L__FactoryData_Write5709
	GOTO	L__FactoryData_Write4538
L__FactoryData_Write5709:
;GRR3000LManagementPanel.mpas,9724 :: 		EEPROM_Write(EE_DCOutVoltSetEeAddr, 2530); // dc çýkýþ gerilimi 253,0V
	MOV	#2530, W12
	MOV	#61484, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9725 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4541:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4541
;GRR3000LManagementPanel.mpas,9727 :: 		EEPROM_Write(EE_MaxVoltSetEeAddr, 2700); // max volt alarm deðeri 270V
	MOV	#2700, W12
	MOV	#61488, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9728 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4546:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4546
;GRR3000LManagementPanel.mpas,9730 :: 		EEPROM_Write(EE_MinVoltSetEeAddr, 1890); // min volt alarm deðeri 189V
	MOV	#1890, W12
	MOV	#61490, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9731 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4551:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4551
;GRR3000LManagementPanel.mpas,9733 :: 		EEPROM_Write(EE_BoostChargeVoltEeAddr, 2700); // hýzlý þarj gerilimi = 248.4V
	MOV	#2700, W12
	MOV	#61470, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9734 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4556:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4556
;GRR3000LManagementPanel.mpas,9736 :: 		EEPROM_Write(EE_FloatChargeVoltEeAddr, 2408);// normal þarj gerilimi = 240.8V
	MOV	#2408, W12
	MOV	#61472, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9737 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4561:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4561
;GRR3000LManagementPanel.mpas,9739 :: 		EEPROM_Write(EE_DeepDischargeVoltEeAddr, 1925); // derin deþarj gerilimi = 189V
	MOV	#1925, W12
	MOV	#61476, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9740 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4566:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4566
;GRR3000LManagementPanel.mpas,9742 :: 		EEPROM_Write(EE_QuitVoltEeAddr, 1925);
	MOV	#1925, W12
	MOV	#63038, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9743 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4571:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4571
;GRR3000LManagementPanel.mpas,9745 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9746 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9748 :: 		end;
L__FactoryData_Write4538:
L__FactoryData_Write4501:
L__FactoryData_Write4463:
L__FactoryData_Write4425:
;GRR3000LManagementPanel.mpas,9750 :: 		EEPROM_Write(EE_DcOutAmpsSetEeAddr, RedresorAkim*10); // fabrika ayarlarýnda ayarlanan redresör akým deðeri yüklenir
	MOV	_RedresorAkim, W1
	MOV	#10, W0
	MUL.UU	W1, W0, W0
	MOV	W0, W12
	MOV	#61486, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9751 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4576:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4576
;GRR3000LManagementPanel.mpas,9753 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9754 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9759 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9760 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9762 :: 		EEPROM_Write(EE_BatteryAhEeAddr, 100); // akü Ah 100
	MOV	#100, W12
	MOV	#61458, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9763 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4581:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4581
;GRR3000LManagementPanel.mpas,9765 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9766 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9768 :: 		EEPROM_Write(EE_BatteryAmpsBoostEeAddr, 200); // akü hýzlý þarj akýmý 20,0A
	MOV	#200, W12
	MOV	#61460, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9769 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4586:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4586
;GRR3000LManagementPanel.mpas,9771 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9772 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9774 :: 		EEPROM_Write(EE_BatteryAmpsFloatEeAddr, 100);// akü normal þarj akýmý 10,0A
	MOV	#100, W12
	MOV	#61462, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9775 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4591:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4591
;GRR3000LManagementPanel.mpas,9777 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9778 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9780 :: 		EEPROM_Write(EE_BatteryAmpsTCompEeAddr, 100);// akü sýcaklýk komp. þarj akýmý 10,0A
	MOV	#100, W12
	MOV	#61464, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9781 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4596:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4596
;GRR3000LManagementPanel.mpas,9783 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9784 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9786 :: 		EEPROM_Write(EE_BatteryAmpsManuelEeAddr, 100); // akü manuel þarj akýmý 10,0A
	MOV	#100, W12
	MOV	#61466, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9787 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4601:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4601
;GRR3000LManagementPanel.mpas,9789 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9790 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9792 :: 		EEPROM_Write(EE_ChargeModeEeAddr, Manuel);  // þarj modu manuel
	MOV	#4, W12
	MOV	#61468, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9793 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4606:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4606
;GRR3000LManagementPanel.mpas,9795 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9796 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9798 :: 		EEPROM_Write(EE_BoostChargeTimeEeAddr, 30); // hýzlý þarj zamaný 30dk
	MOV	#30, W12
	MOV	#61474, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9799 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4611:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4611
;GRR3000LManagementPanel.mpas,9801 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9802 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9804 :: 		EEPROM_Write(EE_AutoBFModeEeAddr, 0); // hýzlý/normal þarj geçiþ kapalý
	CLR	W12
	MOV	#61478, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9805 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4616:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4616
;GRR3000LManagementPanel.mpas,9807 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9808 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9810 :: 		EEPROM_Write(EE_BoostChargeLimitEeAddr, 52); // 0.2C
	MOV	#52, W12
	MOV	#61480, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9811 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4621:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4621
;GRR3000LManagementPanel.mpas,9813 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9814 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9816 :: 		EEPROM_Write(EE_FloatChargeLimitEeAddr, 26); //
	MOV	#26, W12
	MOV	#61482, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9817 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4626:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4626
;GRR3000LManagementPanel.mpas,9819 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9820 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9822 :: 		EEPROM_Write(EE_Data_Diff_leak_neg, 0);
	CLR	W12
	MOV	#61530, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9823 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4631:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4631
;GRR3000LManagementPanel.mpas,9825 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9826 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9828 :: 		EEPROM_Write(EE_Data_Diff_leak_pos, 0);
	CLR	W12
	MOV	#61528, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9829 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4636:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4636
;GRR3000LManagementPanel.mpas,9831 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9832 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9834 :: 		EEPROM_Write(EE_ConfirmAcMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61534, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9835 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4641:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4641
;GRR3000LManagementPanel.mpas,9837 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9838 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9840 :: 		EEPROM_Write(EE_ConfirmBattMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61538, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9841 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4646:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4646
;GRR3000LManagementPanel.mpas,9843 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9844 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9846 :: 		EEPROM_Write(EE_ConfirmClockMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61546, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9847 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4651:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4651
;GRR3000LManagementPanel.mpas,9849 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9850 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9852 :: 		EEPROM_Write(EE_ConfirmDcMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61536, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9853 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4656:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4656
;GRR3000LManagementPanel.mpas,9855 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9856 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9858 :: 		EEPROM_Write(EE_ConfirmLanguMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61550, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9859 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4661:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4661
;GRR3000LManagementPanel.mpas,9861 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9862 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9864 :: 		EEPROM_Write(EE_ConfirmLeakMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61542, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9865 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4666:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4666
;GRR3000LManagementPanel.mpas,9867 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9868 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9870 :: 		EEPROM_Write(EE_ConfirmModbusMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61548, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9871 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4671:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4671
;GRR3000LManagementPanel.mpas,9873 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9874 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9876 :: 		EEPROM_Write(EE_ConfirmOperaMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61540, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9877 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4676:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4676
;GRR3000LManagementPanel.mpas,9879 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9880 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9882 :: 		EEPROM_Write(EE_ConfirmTempMenuEeAddr, 1);
	MOV	#1, W12
	MOV	#61544, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9883 :: 		while (WR_bit) do begin end;
L__FactoryData_Write4681:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4681
;GRR3000LManagementPanel.mpas,9885 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9886 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9888 :: 		EEPROM_Write(EE_PasswordEeAddr, 1234); // þifre default olarak 1234 atandý
	MOV	#1234, W12
	MOV	#61552, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9889 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4686:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4686
;GRR3000LManagementPanel.mpas,9891 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9892 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9930 :: 		EEPROM_Write(EE_LanguageBitEeAddr, Turkish);
	MOV	#3, W12
	MOV	#61516, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9931 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4691:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4691
;GRR3000LManagementPanel.mpas,9933 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9934 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9936 :: 		EEPROM_Write(EE_ServiceCycleEeAddr, 2);  // yýlda 2 defa
	MOV	#2, W12
	MOV	#63028, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9937 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4696:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4696
;GRR3000LManagementPanel.mpas,9939 :: 		Pause_ms(5);
	MOV	#5, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9940 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9942 :: 		EEPROM_Write(EE_QuitTimeEeAddr, 12); // 1 saat
	MOV	#12, W12
	MOV	#63040, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9943 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4701:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4701
;GRR3000LManagementPanel.mpas,9951 :: 		EEPROM_Write(EE_BkmStartTimeEeAddr, 0);
	CLR	W12
	MOV	#63044, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9952 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4706:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4706
;GRR3000LManagementPanel.mpas,9953 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9955 :: 		EEPROM_Write(EE_BkmStatusEeAddr, 0);
	CLR	W12
	MOV	#63046, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9956 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4711:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4711
;GRR3000LManagementPanel.mpas,9957 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9959 :: 		EEPROM_Write(EE_DiodeValueEeAddr, 7);
	MOV	#7, W12
	MOV	#61576, W10
	MOV	#127, W11
	CALL	_EEPROM_Write
;GRR3000LManagementPanel.mpas,9960 :: 		while (WR_bit) do begin end; // write/erase cycle waiting
L__FactoryData_Write4716:
	BTSC	WR_bit, BitPos(WR_bit+0)
	GOTO	L__FactoryData_Write4716
;GRR3000LManagementPanel.mpas,9961 :: 		asm clrwdt; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9964 :: 		end;
L_end_FactoryData_Write:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _FactoryData_Write

_Led_Test:
	LNK	#2

;GRR3000LManagementPanel.mpas,9970 :: 		begin
;GRR3000LManagementPanel.mpas,9972 :: 		Temp2 := 0;
	PUSH	W10
	PUSH	W11
	CLR	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,9974 :: 		for temp1 := 1 to 8 do
; Temp1 start address is: 12 (W6)
	MOV.B	#1, W6
; Temp1 end address is: 12 (W6)
L__Led_Test4722:
;GRR3000LManagementPanel.mpas,9976 :: 		HC595_CS1_Pin := 1;
; Temp1 start address is: 12 (W6)
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,9977 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,9978 :: 		HC595_CS1_Pin := 0;
	BCLR	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,9979 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,9984 :: 		1: temp2 := 128;
	CP.B	W6, #1
	BRA Z	L__Led_Test5711
	GOTO	L__Led_Test4729
L__Led_Test5711:
	MOV.B	#128, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4726
L__Led_Test4729:
;GRR3000LManagementPanel.mpas,9985 :: 		2: temp2 := 192;
	CP.B	W6, #2
	BRA Z	L__Led_Test5712
	GOTO	L__Led_Test4732
L__Led_Test5712:
	MOV.B	#192, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4726
L__Led_Test4732:
;GRR3000LManagementPanel.mpas,9986 :: 		3: temp2 := 224;
	CP.B	W6, #3
	BRA Z	L__Led_Test5713
	GOTO	L__Led_Test4735
L__Led_Test5713:
	MOV.B	#224, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4726
L__Led_Test4735:
;GRR3000LManagementPanel.mpas,9987 :: 		4: temp2 := 240;
	CP.B	W6, #4
	BRA Z	L__Led_Test5714
	GOTO	L__Led_Test4738
L__Led_Test5714:
	MOV.B	#240, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4726
L__Led_Test4738:
;GRR3000LManagementPanel.mpas,9988 :: 		5: temp2 := 248;
	CP.B	W6, #5
	BRA Z	L__Led_Test5715
	GOTO	L__Led_Test4741
L__Led_Test5715:
	MOV.B	#248, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4726
L__Led_Test4741:
;GRR3000LManagementPanel.mpas,9989 :: 		6: temp2 := 252;
	CP.B	W6, #6
	BRA Z	L__Led_Test5716
	GOTO	L__Led_Test4744
L__Led_Test5716:
	MOV.B	#252, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4726
L__Led_Test4744:
;GRR3000LManagementPanel.mpas,9990 :: 		7: temp2 := 254;
	CP.B	W6, #7
	BRA Z	L__Led_Test5717
	GOTO	L__Led_Test4747
L__Led_Test5717:
	MOV.B	#254, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4726
L__Led_Test4747:
;GRR3000LManagementPanel.mpas,9991 :: 		8: temp2 := 255;
	CP.B	W6, #8
	BRA Z	L__Led_Test5718
	GOTO	L__Led_Test4750
L__Led_Test5718:
	MOV.B	#255, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4726
L__Led_Test4750:
L__Led_Test4726:
;GRR3000LManagementPanel.mpas,9994 :: 		SPI1_Write(Temp2);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,9995 :: 		Pause_ms(25);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,9997 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,9999 :: 		HC595_CS1_Pin := 1;
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,10000 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10001 :: 		end;
	CP.B	W6, #8
	BRA NZ	L__Led_Test5719
	GOTO	L__Led_Test4725
L__Led_Test5719:
; Temp1 start address is: 0 (W0)
	ADD.B	W6, #1, W0
; Temp1 end address is: 12 (W6)
	MOV.B	W0, W6
; Temp1 end address is: 0 (W0)
	GOTO	L__Led_Test4722
L__Led_Test4725:
;GRR3000LManagementPanel.mpas,10005 :: 		Temp2 := 0;
	CLR	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,10007 :: 		for temp1 := 1 to 8 do
; Temp1 start address is: 12 (W6)
	MOV.B	#1, W6
; Temp1 end address is: 12 (W6)
L__Led_Test4752:
;GRR3000LManagementPanel.mpas,10009 :: 		HC595_CS2_Pin := 1;
; Temp1 start address is: 12 (W6)
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,10010 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10011 :: 		HC595_CS2_Pin := 0;
	BCLR	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,10012 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10016 :: 		1: temp2 := 128;
	CP.B	W6, #1
	BRA Z	L__Led_Test5720
	GOTO	L__Led_Test4759
L__Led_Test5720:
	MOV.B	#128, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4756
L__Led_Test4759:
;GRR3000LManagementPanel.mpas,10017 :: 		2: temp2 := 192;
	CP.B	W6, #2
	BRA Z	L__Led_Test5721
	GOTO	L__Led_Test4762
L__Led_Test5721:
	MOV.B	#192, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4756
L__Led_Test4762:
;GRR3000LManagementPanel.mpas,10018 :: 		3: temp2 := 224;
	CP.B	W6, #3
	BRA Z	L__Led_Test5722
	GOTO	L__Led_Test4765
L__Led_Test5722:
	MOV.B	#224, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4756
L__Led_Test4765:
;GRR3000LManagementPanel.mpas,10019 :: 		4: temp2 := 240;
	CP.B	W6, #4
	BRA Z	L__Led_Test5723
	GOTO	L__Led_Test4768
L__Led_Test5723:
	MOV.B	#240, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4756
L__Led_Test4768:
;GRR3000LManagementPanel.mpas,10020 :: 		5: temp2 := 248;
	CP.B	W6, #5
	BRA Z	L__Led_Test5724
	GOTO	L__Led_Test4771
L__Led_Test5724:
	MOV.B	#248, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4756
L__Led_Test4771:
;GRR3000LManagementPanel.mpas,10021 :: 		6: temp2 := 252;
	CP.B	W6, #6
	BRA Z	L__Led_Test5725
	GOTO	L__Led_Test4774
L__Led_Test5725:
	MOV.B	#252, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4756
L__Led_Test4774:
;GRR3000LManagementPanel.mpas,10022 :: 		7: temp2 := 254;
	CP.B	W6, #7
	BRA Z	L__Led_Test5726
	GOTO	L__Led_Test4777
L__Led_Test5726:
	MOV.B	#254, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4756
L__Led_Test4777:
;GRR3000LManagementPanel.mpas,10023 :: 		8: temp2 := 255;
	CP.B	W6, #8
	BRA Z	L__Led_Test5727
	GOTO	L__Led_Test4780
L__Led_Test5727:
	MOV.B	#255, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4756
L__Led_Test4780:
L__Led_Test4756:
;GRR3000LManagementPanel.mpas,10026 :: 		SPI1_Write(Temp2);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,10027 :: 		Pause_ms(25);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10029 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10031 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,10032 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10033 :: 		end;
	CP.B	W6, #8
	BRA NZ	L__Led_Test5728
	GOTO	L__Led_Test4755
L__Led_Test5728:
; Temp1 start address is: 0 (W0)
	ADD.B	W6, #1, W0
; Temp1 end address is: 12 (W6)
	MOV.B	W0, W6
; Temp1 end address is: 0 (W0)
	GOTO	L__Led_Test4752
L__Led_Test4755:
;GRR3000LManagementPanel.mpas,10038 :: 		Temp2 := 0;
	CLR	W0
	MOV.B	W0, [W14+0]
;GRR3000LManagementPanel.mpas,10040 :: 		for temp1 := 1 to 8 do
; Temp1 start address is: 12 (W6)
	MOV.B	#1, W6
; Temp1 end address is: 12 (W6)
L__Led_Test4782:
;GRR3000LManagementPanel.mpas,10042 :: 		HC595_CS3_Pin := 1;
; Temp1 start address is: 12 (W6)
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,10043 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10044 :: 		HC595_CS3_Pin := 0;
	BCLR	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,10045 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10048 :: 		1: temp2 := 1;
	CP.B	W6, #1
	BRA Z	L__Led_Test5729
	GOTO	L__Led_Test4789
L__Led_Test5729:
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4786
L__Led_Test4789:
;GRR3000LManagementPanel.mpas,10049 :: 		2: temp2 := 3;
	CP.B	W6, #2
	BRA Z	L__Led_Test5730
	GOTO	L__Led_Test4792
L__Led_Test5730:
	MOV.B	#3, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4786
L__Led_Test4792:
;GRR3000LManagementPanel.mpas,10050 :: 		3: temp2 := 7;
	CP.B	W6, #3
	BRA Z	L__Led_Test5731
	GOTO	L__Led_Test4795
L__Led_Test5731:
	MOV.B	#7, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4786
L__Led_Test4795:
;GRR3000LManagementPanel.mpas,10051 :: 		4: temp2 := 15;
	CP.B	W6, #4
	BRA Z	L__Led_Test5732
	GOTO	L__Led_Test4798
L__Led_Test5732:
	MOV.B	#15, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4786
L__Led_Test4798:
;GRR3000LManagementPanel.mpas,10052 :: 		5: temp2 := 31;
	CP.B	W6, #5
	BRA Z	L__Led_Test5733
	GOTO	L__Led_Test4801
L__Led_Test5733:
	MOV.B	#31, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4786
L__Led_Test4801:
;GRR3000LManagementPanel.mpas,10053 :: 		6: temp2 := 63;
	CP.B	W6, #6
	BRA Z	L__Led_Test5734
	GOTO	L__Led_Test4804
L__Led_Test5734:
	MOV.B	#63, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4786
L__Led_Test4804:
;GRR3000LManagementPanel.mpas,10054 :: 		7: temp2 := 127;
	CP.B	W6, #7
	BRA Z	L__Led_Test5735
	GOTO	L__Led_Test4807
L__Led_Test5735:
	MOV.B	#127, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4786
L__Led_Test4807:
;GRR3000LManagementPanel.mpas,10055 :: 		8: temp2 := 255;
	CP.B	W6, #8
	BRA Z	L__Led_Test5736
	GOTO	L__Led_Test4810
L__Led_Test5736:
	MOV.B	#255, W0
	MOV.B	W0, [W14+0]
	GOTO	L__Led_Test4786
L__Led_Test4810:
L__Led_Test4786:
;GRR3000LManagementPanel.mpas,10058 :: 		SPI1_Write(Temp2);
	ADD	W14, #0, W0
	ZE	[W0], W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,10059 :: 		Pause_ms(25);
	MOV	#25, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10061 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10063 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,10064 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10065 :: 		end;
	CP.B	W6, #8
	BRA NZ	L__Led_Test5737
	GOTO	L__Led_Test4785
L__Led_Test5737:
; Temp1 start address is: 0 (W0)
	ADD.B	W6, #1, W0
; Temp1 end address is: 12 (W6)
	MOV.B	W0, W6
; Temp1 end address is: 0 (W0)
	GOTO	L__Led_Test4782
L__Led_Test4785:
;GRR3000LManagementPanel.mpas,10068 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10069 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10071 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10072 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10074 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10075 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10077 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10079 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10082 :: 		Pause_ms(250);
	MOV	#250, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10084 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,10085 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10086 :: 		HC595_CS3_Pin := 0;
	BCLR	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,10087 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10089 :: 		SPI1_Write(0x00);
	CLR	W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,10091 :: 		HC595_CS3_Pin := 1;
	BSET	RC14_bit, BitPos(RC14_bit+0)
;GRR3000LManagementPanel.mpas,10092 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10097 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,10098 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10099 :: 		HC595_CS2_Pin := 0;
	BCLR	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,10100 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10102 :: 		SPI1_Write(0x00);
	CLR	W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,10104 :: 		HC595_CS2_Pin := 1;
	BSET	RD9_bit, BitPos(RD9_bit+0)
;GRR3000LManagementPanel.mpas,10105 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10111 :: 		HC595_CS1_Pin := 1;
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,10112 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10113 :: 		HC595_CS1_Pin := 0;
	BCLR	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,10114 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10116 :: 		SPI1_Write(0x00);
	CLR	W10
	CALL	_SPI1_Write
;GRR3000LManagementPanel.mpas,10118 :: 		HC595_CS1_Pin := 1;
	BSET	RD10_bit, BitPos(RD10_bit+0)
;GRR3000LManagementPanel.mpas,10119 :: 		Delay_Cyc_Long(5);
	MOV	#5, W10
	MOV	#0, W11
	CALL	_Delay_Cyc_Long
;GRR3000LManagementPanel.mpas,10122 :: 		end;
L_end_Led_Test:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Led_Test

_Start_Screen:
	LNK	#72

;GRR3000LManagementPanel.mpas,10128 :: 		begin
;GRR3000LManagementPanel.mpas,10130 :: 		Glcd_Write_Text('Firmware Version:6.06',0,Row2,Black);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W14, #28, W1
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#109, W0
	MOV.B	W0, [W1++]
	MOV.B	#119, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#86, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#58, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#54, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #28, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,10131 :: 		Glcd_Write_Text('Hardware Version: 3.3',0,Row3,Black);
	ADD	W14, #28, W1
	MOV.B	#72, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#100, W0
	MOV.B	W0, [W1++]
	MOV.B	#119, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#86, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#58, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#51, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#51, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #28, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,10134 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10136 :: 		HucreSayisi         := EEPROM_Read(EE_HucreSayisiEeAddr);
	MOV	#61444, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _HucreSayisi
;GRR3000LManagementPanel.mpas,10137 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10138 :: 		RedresorAkim        := EEPROM_Read(EE_RedresorAkimEeAddr);
	MOV	#61456, W10
	MOV	#127, W11
	CALL	_EEPROM_Read
	MOV	W0, _RedresorAkim
;GRR3000LManagementPanel.mpas,10139 :: 		Pause_ms(100);
	MOV	#100, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10141 :: 		Glcd_Write_Text('System Test...   ',0,Row5,black);
	ADD	W14, #28, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#109, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
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
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #28, W0
	MOV.B	#1, W13
	MOV.B	#4, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,10143 :: 		Led_Test;
	CALL	_Led_Test
;GRR3000LManagementPanel.mpas,10145 :: 		Glcd_Image(@StartLogo); // açýlýþ logosu
	MOV	#lo_addr(_StartLogo), W10
	MOV	#higher_addr(_StartLogo), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,10147 :: 		WordToStr(RedresorAkim,A_Text);
	ADD	W14, #22, W0
	MOV	W0, W11
	MOV	_RedresorAkim, W10
	CALL	_WordToStr
;GRR3000LManagementPanel.mpas,10148 :: 		ltrim(A_Text);
	ADD	W14, #22, W0
	MOV	W0, W10
	CALL	_ltrim
;GRR3000LManagementPanel.mpas,10150 :: 		if (HucreSayisi = 12) then
	MOV	_HucreSayisi, W0
	CP	W0, #12
	BRA Z	L__Start_Screen5739
	GOTO	L__Start_Screen4813
L__Start_Screen5739:
;GRR3000LManagementPanel.mpas,10152 :: 		Text := 'GRR3024-L 24V-'+A_Text+'A';
	MOV	#50, W0
	ADD	W14, W0, W0
	MOV.B	#71, W2
	MOV.B	W2, [W0++]
	MOV.B	#82, W2
	MOV.B	W2, [W0++]
	MOV.B	#82, W2
	MOV.B	W2, [W0++]
	MOV.B	#51, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#52, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#76, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#52, W2
	MOV.B	W2, [W0++]
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	ADD	W14, #22, W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	MOV	#50, W1
	ADD	W14, W1, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,10153 :: 		end else
	GOTO	L__Start_Screen4814
L__Start_Screen4813:
;GRR3000LManagementPanel.mpas,10154 :: 		if (HucreSayisi = 24) then
	MOV	_HucreSayisi, W0
	CP	W0, #24
	BRA Z	L__Start_Screen5740
	GOTO	L__Start_Screen4816
L__Start_Screen5740:
;GRR3000LManagementPanel.mpas,10156 :: 		Text := 'GRR3048-L 48V-'+A_Text+'A';
	MOV	#50, W0
	ADD	W14, W0, W0
	MOV.B	#71, W2
	MOV.B	W2, [W0++]
	MOV.B	#82, W2
	MOV.B	W2, [W0++]
	MOV.B	#82, W2
	MOV.B	W2, [W0++]
	MOV.B	#51, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV.B	#52, W2
	MOV.B	W2, [W0++]
	MOV.B	#56, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#76, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#52, W2
	MOV.B	W2, [W0++]
	MOV.B	#56, W2
	MOV.B	W2, [W0++]
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	ADD	W14, #22, W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	MOV	#50, W1
	ADD	W14, W1, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,10157 :: 		end else
	GOTO	L__Start_Screen4817
L__Start_Screen4816:
;GRR3000LManagementPanel.mpas,10158 :: 		if ((HucreSayisi >= 54)and(HucreSayisi <= 60)) then
	MOV	#54, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W2
	BRA GTU	L__Start_Screen5741
	COM	W2
L__Start_Screen5741:
	MOV	#60, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W0
	BRA LTU	L__Start_Screen5742
	COM	W0
L__Start_Screen5742:
	AND	W2, W0, W0
	BRA NZ	L__Start_Screen5743
	GOTO	L__Start_Screen4819
L__Start_Screen5743:
;GRR3000LManagementPanel.mpas,10160 :: 		Text := 'GRR3110-L 110V-'+A_Text+'A';
	MOV	#50, W0
	ADD	W14, W0, W0
	MOV.B	#71, W2
	MOV.B	W2, [W0++]
	MOV.B	#82, W2
	MOV.B	W2, [W0++]
	MOV.B	#82, W2
	MOV.B	W2, [W0++]
	MOV.B	#51, W2
	MOV.B	W2, [W0++]
	MOV.B	#49, W2
	MOV.B	W2, [W0++]
	MOV.B	#49, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#76, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#49, W2
	MOV.B	W2, [W0++]
	MOV.B	#49, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	ADD	W14, #22, W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	MOV	#50, W1
	ADD	W14, W1, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,10161 :: 		end else
	GOTO	L__Start_Screen4820
L__Start_Screen4819:
;GRR3000LManagementPanel.mpas,10162 :: 		if ((HucreSayisi >= 100)or(HucreSayisi <= 120)) then
	MOV	#100, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W2
	BRA GTU	L__Start_Screen5744
	COM	W2
L__Start_Screen5744:
	MOV	#120, W1
	MOV	#lo_addr(_HucreSayisi), W0
	CP	W1, [W0]
	CLR	W0
	BRA LTU	L__Start_Screen5745
	COM	W0
L__Start_Screen5745:
	IOR	W2, W0, W0
	BRA NZ	L__Start_Screen5746
	GOTO	L__Start_Screen4822
L__Start_Screen5746:
;GRR3000LManagementPanel.mpas,10164 :: 		Text := 'GRR3220-L 220V-'+A_Text+'A';
	MOV	#50, W0
	ADD	W14, W0, W0
	MOV.B	#71, W2
	MOV.B	W2, [W0++]
	MOV.B	#82, W2
	MOV.B	W2, [W0++]
	MOV.B	#82, W2
	MOV.B	W2, [W0++]
	MOV.B	#51, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	MOV.B	#76, W2
	MOV.B	W2, [W0++]
	MOV.B	#32, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#50, W2
	MOV.B	W2, [W0++]
	MOV.B	#48, W2
	MOV.B	W2, [W0++]
	MOV.B	#86, W2
	MOV.B	W2, [W0++]
	MOV.B	#45, W2
	MOV.B	W2, [W0++]
	ADD	W14, #22, W1
	CALL	___CS2S
	MOV.B	#65, W2
	MOV.B	W2, [W0++]
	CLR	W2
	MOV.B	W2, [W0++]
	ADD	W14, #0, W0
	MOV	#50, W1
	ADD	W14, W1, W1
	CALL	___CS2S
	MOV	W0, W1
	CLR	W0
	MOV.B	W0, [W1++]
;GRR3000LManagementPanel.mpas,10165 :: 		end;
L__Start_Screen4822:
L__Start_Screen4820:
L__Start_Screen4817:
L__Start_Screen4814:
;GRR3000LManagementPanel.mpas,10167 :: 		Glcd_Write_Text(Text,5, Row6, Black);
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#5, W12
	MOV.B	#5, W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,10169 :: 		Start_Screen_7Seg();
	CALL	_Start_Screen_7Seg
;GRR3000LManagementPanel.mpas,10171 :: 		end;
L_end_Start_Screen:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Start_Screen

_WDT_Reset_Flag:
	LNK	#22

;GRR3000LManagementPanel.mpas,10175 :: 		begin
;GRR3000LManagementPanel.mpas,10179 :: 		Glcd_Fill(0x00);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR	W10
	CALL	_Glcd_Fill
;GRR3000LManagementPanel.mpas,10180 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,10182 :: 		if (WDTO_bit = 1) then
	BTSS	WDTO_bit, BitPos(WDTO_bit+0)
	GOTO	L__WDT_Reset_Flag4826
;GRR3000LManagementPanel.mpas,10185 :: 		Glcd_Write_Text('System Fault....',0,Row1,Black);
	ADD	W14, #0, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#109, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#117, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,10186 :: 		Glcd_Write_Text('System Restarting   ',0,row2,Black);
	ADD	W14, #0, W1
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#121, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#109, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#82, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#114, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#105, W0
	MOV.B	W0, [W1++]
	MOV.B	#110, W0
	MOV.B	W0, [W1++]
	MOV.B	#103, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,10187 :: 		Glcd_Write_Text('Fault Code:0xC0015',0,row3,Black);
	ADD	W14, #0, W1
	MOV.B	#70, W0
	MOV.B	W0, [W1++]
	MOV.B	#97, W0
	MOV.B	W0, [W1++]
	MOV.B	#117, W0
	MOV.B	W0, [W1++]
	MOV.B	#108, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#67, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#100, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#58, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#120, W0
	MOV.B	W0, [W1++]
	MOV.B	#67, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#48, W0
	MOV.B	W0, [W1++]
	MOV.B	#49, W0
	MOV.B	W0, [W1++]
	MOV.B	#53, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#2, W12
	CLR	W11
	MOV	W0, W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,10189 :: 		for i:= 1 to 5 do
; i start address is: 20 (W10)
	MOV.B	#1, W10
; i end address is: 20 (W10)
L__WDT_Reset_Flag4829:
;GRR3000LManagementPanel.mpas,10191 :: 		Led_Test;
; i start address is: 20 (W10)
	CALL	_Led_Test
;GRR3000LManagementPanel.mpas,10192 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10194 :: 		end;
	CP.B	W10, #5
	BRA NZ	L__WDT_Reset_Flag5748
	GOTO	L__WDT_Reset_Flag4832
L__WDT_Reset_Flag5748:
; i start address is: 0 (W0)
	ADD.B	W10, #1, W0
; i end address is: 20 (W10)
	MOV.B	W0, W10
; i end address is: 0 (W0)
	GOTO	L__WDT_Reset_Flag4829
L__WDT_Reset_Flag4832:
;GRR3000LManagementPanel.mpas,10196 :: 		WDTO_bit := 0; // clear asm ClrWDT; end; flag
	BCLR	WDTO_bit, BitPos(WDTO_bit+0)
;GRR3000LManagementPanel.mpas,10199 :: 		end;
L__WDT_Reset_Flag4826:
;GRR3000LManagementPanel.mpas,10202 :: 		end;
L_end_WDT_Reset_Flag:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _WDT_Reset_Flag

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;GRR3000LManagementPanel.mpas,10205 :: 		begin
;GRR3000LManagementPanel.mpas,10208 :: 		Pause_ms(500);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#500, W10
	CALL	_Pause_Ms
;GRR3000LManagementPanel.mpas,10210 :: 		Start_Register_Config;
	CALL	_Start_Register_Config
;GRR3000LManagementPanel.mpas,10214 :: 		WDT_Reset_Flag;
	CALL	_WDT_Reset_Flag
;GRR3000LManagementPanel.mpas,10218 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,10220 :: 		Run_Timers; // timerlarý çalýþtýr
	CALL	_Run_Timers
;GRR3000LManagementPanel.mpas,10223 :: 		T2CON := $8030;  /// Frekans Okuma Timer
	MOV	#32816, W0
	MOV	WREG, T2CON
;GRR3000LManagementPanel.mpas,10260 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,10265 :: 		Data_EepromRead;
	CALL	_Data_EepromRead
;GRR3000LManagementPanel.mpas,10275 :: 		Uart_Procedures;
	CALL	_Uart_Procedures
;GRR3000LManagementPanel.mpas,10277 :: 		Glcd_Image(@mainscreen);
	MOV	#lo_addr(_mainscreen), W10
	MOV	#higher_addr(_mainscreen), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,10278 :: 		Glcd_PartialImage(67, 16, 58, 23, 58, 23, @AcVolt_View);
	MOV	#23, W13
	MOV	#58, W12
	MOV	#16, W11
	MOV	#67, W10
	MOV	#lo_addr(_AcVolt_View), W0
	MOV	#higher_addr(_AcVolt_View), W1
	PUSH.D	W0
	MOV	#23, W0
	PUSH	W0
	MOV	#58, W0
	PUSH	W0
	CALL	_Glcd_PartialImage
	SUB	#8, W15
;GRR3000LManagementPanel.mpas,10280 :: 		Program_StartBit := 1; // haberleþme için izin verildi
	MOV	#lo_addr(_Program_StartBit), W0
	BSET	[W0], BitPos(_Program_StartBit+0)
;GRR3000LManagementPanel.mpas,10284 :: 		while (TRUE) do
L__main4835:
;GRR3000LManagementPanel.mpas,10290 :: 		Glcd_Set_Font(@NewFont5x7, 5, 7, 32);     // Change font
	MOV.B	#7, W13
	MOV.B	#5, W12
	MOV	#lo_addr(_NewFont5x7), W10
	MOV	#higher_addr(_NewFont5x7), W11
	MOV	#32, W0
	PUSH	W0
	CALL	_Glcd_Set_Font
	SUB	#2, W15
;GRR3000LManagementPanel.mpas,10291 :: 		OERR_bit := 0;             // Set OERR to 0
	BCLR	OERR_bit, BitPos(OERR_bit+0)
;GRR3000LManagementPanel.mpas,10292 :: 		FERR_bit := 0;             // Set FERR to 0
	BCLR	FERR_bit, BitPos(FERR_bit+0)
;GRR3000LManagementPanel.mpas,10293 :: 		Glcd_Write_Text(test_Text, 0, 2, Black);
	MOV.B	#1, W13
	MOV.B	#2, W12
	CLR	W11
	MOV	#lo_addr(_test_Text), W10
	CALL	_Glcd_Write_Text
;GRR3000LManagementPanel.mpas,10295 :: 		if (Up_Button =0) then Send_Test_Text := 'GEMTA INC.' else
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__main4840
	MOV	#lo_addr(_Send_Test_Text), W1
	MOV.B	#71, W0
	MOV.B	W0, [W1++]
	MOV.B	#69, W0
	MOV.B	W0, [W1++]
	MOV.B	#77, W0
	MOV.B	W0, [W1++]
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#65, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#73, W0
	MOV.B	W0, [W1++]
	MOV.B	#78, W0
	MOV.B	W0, [W1++]
	MOV.B	#67, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
	GOTO	L__main4841
L__main4840:
;GRR3000LManagementPanel.mpas,10296 :: 		if (Up_Button =0) then Send_Test_Text := 'Test Soft.';
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L__main4843
	MOV	#lo_addr(_Send_Test_Text), W1
	MOV.B	#84, W0
	MOV.B	W0, [W1++]
	MOV.B	#101, W0
	MOV.B	W0, [W1++]
	MOV.B	#115, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#32, W0
	MOV.B	W0, [W1++]
	MOV.B	#83, W0
	MOV.B	W0, [W1++]
	MOV.B	#111, W0
	MOV.B	W0, [W1++]
	MOV.B	#102, W0
	MOV.B	W0, [W1++]
	MOV.B	#116, W0
	MOV.B	W0, [W1++]
	MOV.B	#46, W0
	MOV.B	W0, [W1++]
	CLR	W0
	MOV.B	W0, [W1++]
L__main4843:
L__main4841:
;GRR3000LManagementPanel.mpas,10298 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__main4846
;GRR3000LManagementPanel.mpas,10300 :: 		UART1_Write_Text(Send_Test_Text);
	MOV	#lo_addr(_Send_Test_Text), W10
	CALL	_UART1_Write_Text
;GRR3000LManagementPanel.mpas,10301 :: 		end;
L__main4846:
;GRR3000LManagementPanel.mpas,10305 :: 		if (Ok_Button =0) then
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__main4849
;GRR3000LManagementPanel.mpas,10307 :: 		while (Ok_Button =0) do
L__main4852:
	BTSC	Ok_Button, BitPos(Ok_Button+0)
	GOTO	L__main4853
;GRR3000LManagementPanel.mpas,10309 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10311 :: 		end;
	GOTO	L__main4852
L__main4853:
;GRR3000LManagementPanel.mpas,10313 :: 		MainMenu;
	CALL	_MainMenu
;GRR3000LManagementPanel.mpas,10315 :: 		Glcd_Image(@mainscreen); // menülerden gelince tekrar ana ekraný yükle
	MOV	#lo_addr(_mainscreen), W10
	MOV	#higher_addr(_mainscreen), W11
	CALL	_Glcd_Image
;GRR3000LManagementPanel.mpas,10316 :: 		Glcd_PartialImage(67, 16, 58, 23, 58, 23, @AcVolt_View);
	MOV	#23, W13
	MOV	#58, W12
	MOV	#16, W11
	MOV	#67, W10
	MOV	#lo_addr(_AcVolt_View), W0
	MOV	#higher_addr(_AcVolt_View), W1
	PUSH.D	W0
	MOV	#23, W0
	PUSH	W0
	MOV	#58, W0
	PUSH	W0
	CALL	_Glcd_PartialImage
	SUB	#8, W15
;GRR3000LManagementPanel.mpas,10319 :: 		end;
L__main4849:
;GRR3000LManagementPanel.mpas,10323 :: 		asm ClrWDT; end;
	CLRWDT
;GRR3000LManagementPanel.mpas,10328 :: 		end; // main loop while end...
	GOTO	L__main4835
;GRR3000LManagementPanel.mpas,10329 :: 		end.
L_end_main:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
