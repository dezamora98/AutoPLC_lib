
	; Microchip MPLAB XC8 C Compiler V2.32
	; Copyright (C) 2021 Microchip Technology Inc.

	; Auto-generated runtime startup code for final link stage.

	;
	; Compiler options:
	;
	; -q --opt=none --chip=18f4550 --outdir=comp/ --opt=+2 --ASMLIST \
	; --runtime=+download --addrqual=request --std=c90 \
	; --output=+elf:multilocs -L--data-init -mno-keep-startup \
	; --runtime=+config --runtime=+c90lib --double=24 --float=24 \
	; --emi=wordwrite --output=+inhx032 \
	; --summary=-psect,-class,+mem,-hex,-file --rom=0-3000 main.c AutoPLC.c \
	; MODBUS_RTU_APLC.c --callgraph=none --warn=-3 \
	; --errformat=%f:%l:%c: error: (%n) %s \
	; --warnformat=%f:%l:%c: warning: (%n) %s \
	; --msgformat=%f:%l:%c: advisory: (%n) %s
	;


	processor	18F4550
	include "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\18f4550.cgen.inc"

	GLOBAL	_main,start
	FNROOT	_main

	pic18cxx	equ	1

	psect	const,class=CONST,delta=1,reloc=2,noexec
	psect	smallconst,class=SMALLCONST,delta=1,reloc=2,noexec
	psect	mediumconst,class=MEDIUMCONST,delta=1,reloc=2,noexec
	psect	rbss,class=COMRAM,space=1,noexec
	psect	bss,class=RAM,space=1,noexec
	psect	rdata,class=COMRAM,space=1,noexec
	psect	irdata,class=CODE,space=0,reloc=2,noexec
	psect	bss,class=RAM,space=1,noexec
	psect	data,class=RAM,space=1,noexec
	psect	idata,class=CODE,space=0,reloc=2,noexec
	psect	nvrram,class=COMRAM,space=1,noexec
	psect	nvbit,class=COMRAM,bit,space=1,noexec
	psect	temp,ovrld,class=COMRAM,space=1,noexec
	psect	struct,ovrld,class=COMRAM,space=1,noexec
	psect	rbit,class=COMRAM,bit,space=1,noexec
	psect	bigbss,class=BIGRAM,space=1,noexec
	psect	bigdata,class=BIGRAM,space=1,noexec
	psect	ibigdata,class=CODE,space=0,reloc=2,noexec
	psect	farbss,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	nvFARRAM,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	fardata,class=FARRAM,space=0,reloc=2,delta=1,noexec
	psect	ifardata,class=CODE,space=0,reloc=2,delta=1,noexec

	psect	reset_vec,class=CODE,delta=1,reloc=2
	psect	powerup,class=CODE,delta=1,reloc=2
	psect	init,class=CODE,delta=1,reloc=2
	psect	text,class=CODE,delta=1,reloc=2
GLOBAL	intlevel0,intlevel1,intlevel2
intlevel0:
intlevel1:
intlevel2:
GLOBAL	intlevel3
intlevel3:
	psect	clrtext,class=CODE,delta=1,reloc=2

	psect	config,class=CONFIG,delta=1,space=4,noexec
	psect	idloc,class=IDLOC,delta=1,space=5,noexec
	psect	intcode,class=CODE,delta=1,reloc=2
	psect	intcode_body,class=CODE,delta=1,reloc=2
	psect	intcodelo,class=CODE,delta=1,reloc=2
	psect	intret,class=CODE,delta=1,reloc=2
	psect	intentry,class=CODE,delta=1,reloc=2
	psect	intsave_regs,class=BIGRAM,space=1

	psect	eeprom_data,class=EEDATA,delta=1,noexec
	psect	smallconst
	GLOBAL	__smallconst
__smallconst:
	psect	mediumconst
	GLOBAL	__mediumconst
__mediumconst:
	PSECT	ramtop,class=RAM,noexec
	GLOBAL	__S1			; top of RAM usage
	GLOBAL	__ramtop
	GLOBAL	__LRAM,__HRAM
__ramtop:

	psect	reset_vec
reset_vec:
	; No powerup routine
	global start

; jump to start
	goto start
	; No interrupt routine
	GLOBAL __accesstop
__accesstop EQU 96

;Initialize the stack pointer (FSR1)
	global stacklo, stackhi
	stacklo	equ	060h
	stackhi	equ	07FFh


	psect	stack,class=STACK,space=2,noexec
	global ___sp,___inthi_sp,___intlo_sp
___sp:
___inthi_sp:
___intlo_sp:



	psect	init
start:
	global start_initialization
	goto start_initialization	;jump to C runtime clear & initialization

psect comram,class=COMRAM,space=1
psect abs1,class=ABS1,space=1
psect bigram,class=BIGRAM,space=1
psect ram,class=RAM,space=1
psect bank0,class=BANK0,space=1
psect bank1,class=BANK1,space=1
psect bank2,class=BANK2,space=1
psect bank3,class=BANK3,space=1
psect bank4,class=BANK4,space=1
psect bank5,class=BANK5,space=1
psect bank6,class=BANK6,space=1
psect bank7,class=BANK7,space=1
psect sfr,class=SFR,space=1


	end	start
