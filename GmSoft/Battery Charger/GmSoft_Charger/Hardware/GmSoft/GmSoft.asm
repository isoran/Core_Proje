
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;GmSoft.mpas,5 :: 		begin
;GmSoft.mpas,7 :: 		end.
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
