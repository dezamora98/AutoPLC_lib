subtitle "Microchip MPLAB XC8 C Compiler v2.32 (Free license) build 20210201212658 Og9 "

pagewidth 120

	opt flic

	processor	18F4550
include "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\18f4550.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc   macro
	bcf	status,0
endm
setc   macro
	bsf	status,0
endm
clrz   macro
	bcf	status,2
endm
setz   macro
	bsf	status,2
endm
skipnz macro
	btfsc	status,2
endm
skipz  macro
	btfss	status,2
endm
skipnc macro
	btfsc	status,0
endm
skipc  macro
	btfss	status,0
endm
pushw macro
	movwf postinc1
endm
pushf macro arg1
	movff arg1, postinc1
endm
popw macro
	movf postdec1,f
	movf indf1,w
endm
popf macro arg1
	movf postdec1,f
	movff indf1,arg1
endm
popfc macro arg1
	movff plusw1,arg1
	decfsz fsr1,f
endm
	global	__ramtop
	global	__accesstop
# 55 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPDATA equ 0F62h ;# 
# 75 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPCFG equ 0F63h ;# 
# 152 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPEPS equ 0F64h ;# 
# 226 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPCON equ 0F65h ;# 
# 252 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRM equ 0F66h ;# 
# 259 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRML equ 0F66h ;# 
# 337 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRMH equ 0F67h ;# 
# 377 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UIR equ 0F68h ;# 
# 433 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UIE equ 0F69h ;# 
# 489 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEIR equ 0F6Ah ;# 
# 540 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEIE equ 0F6Bh ;# 
# 591 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
USTAT equ 0F6Ch ;# 
# 651 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UCON equ 0F6Dh ;# 
# 702 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UADDR equ 0F6Eh ;# 
# 766 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UCFG equ 0F6Fh ;# 
# 845 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP0 equ 0F70h ;# 
# 953 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP1 equ 0F71h ;# 
# 1061 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP2 equ 0F72h ;# 
# 1169 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP3 equ 0F73h ;# 
# 1277 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP4 equ 0F74h ;# 
# 1385 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP5 equ 0F75h ;# 
# 1493 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP6 equ 0F76h ;# 
# 1601 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP7 equ 0F77h ;# 
# 1709 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP8 equ 0F78h ;# 
# 1785 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP9 equ 0F79h ;# 
# 1861 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP10 equ 0F7Ah ;# 
# 1937 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP11 equ 0F7Bh ;# 
# 2013 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP12 equ 0F7Ch ;# 
# 2089 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP13 equ 0F7Dh ;# 
# 2165 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP14 equ 0F7Eh ;# 
# 2241 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP15 equ 0F7Fh ;# 
# 2317 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTA equ 0F80h ;# 
# 2456 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTB equ 0F81h ;# 
# 2566 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTC equ 0F82h ;# 
# 2708 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTD equ 0F83h ;# 
# 2829 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTE equ 0F84h ;# 
# 2976 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATA equ 0F89h ;# 
# 3076 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATB equ 0F8Ah ;# 
# 3188 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATC equ 0F8Bh ;# 
# 3266 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATD equ 0F8Ch ;# 
# 3378 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATE equ 0F8Dh ;# 
# 3430 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISA equ 0F92h ;# 
# 3435 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRA equ 0F92h ;# 
# 3628 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISB equ 0F93h ;# 
# 3633 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRB equ 0F93h ;# 
# 3850 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISC equ 0F94h ;# 
# 3855 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRC equ 0F94h ;# 
# 4004 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISD equ 0F95h ;# 
# 4009 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRD equ 0F95h ;# 
# 4226 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISE equ 0F96h ;# 
# 4231 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRE equ 0F96h ;# 
# 4328 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
OSCTUNE equ 0F9Bh ;# 
# 4387 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIE1 equ 0F9Dh ;# 
# 4471 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIR1 equ 0F9Eh ;# 
# 4555 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
IPR1 equ 0F9Fh ;# 
# 4639 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIE2 equ 0FA0h ;# 
# 4710 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIR2 equ 0FA1h ;# 
# 4781 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
IPR2 equ 0FA2h ;# 
# 4852 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EECON1 equ 0FA6h ;# 
# 4918 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EECON2 equ 0FA7h ;# 
# 4925 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EEDATA equ 0FA8h ;# 
# 4932 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EEADR equ 0FA9h ;# 
# 4939 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCSTA equ 0FABh ;# 
# 4944 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCSTA1 equ 0FABh ;# 
# 5149 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXSTA equ 0FACh ;# 
# 5154 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXSTA1 equ 0FACh ;# 
# 5405 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXREG equ 0FADh ;# 
# 5410 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXREG1 equ 0FADh ;# 
# 5417 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCREG equ 0FAEh ;# 
# 5422 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCREG1 equ 0FAEh ;# 
# 5429 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRG equ 0FAFh ;# 
# 5434 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRG1 equ 0FAFh ;# 
# 5441 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRGH equ 0FB0h ;# 
# 5448 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T3CON equ 0FB1h ;# 
# 5569 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3 equ 0FB2h ;# 
# 5576 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3L equ 0FB2h ;# 
# 5583 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3H equ 0FB3h ;# 
# 5590 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CMCON equ 0FB4h ;# 
# 5680 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CVRCON equ 0FB5h ;# 
# 5765 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1AS equ 0FB6h ;# 
# 5770 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1AS equ 0FB6h ;# 
# 5927 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1DEL equ 0FB7h ;# 
# 5932 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1DEL equ 0FB7h ;# 
# 6065 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BAUDCON equ 0FB8h ;# 
# 6070 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BAUDCTL equ 0FB8h ;# 
# 6245 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP2CON equ 0FBAh ;# 
# 6309 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2 equ 0FBBh ;# 
# 6316 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2L equ 0FBBh ;# 
# 6323 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2H equ 0FBCh ;# 
# 6330 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1CON equ 0FBDh ;# 
# 6335 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1CON equ 0FBDh ;# 
# 6492 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1 equ 0FBEh ;# 
# 6499 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1L equ 0FBEh ;# 
# 6506 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1H equ 0FBFh ;# 
# 6513 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON2 equ 0FC0h ;# 
# 6584 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON1 equ 0FC1h ;# 
# 6669 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON0 equ 0FC2h ;# 
# 6788 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRES equ 0FC3h ;# 
# 6795 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRESL equ 0FC3h ;# 
# 6802 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRESH equ 0FC4h ;# 
# 6809 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPCON2 equ 0FC5h ;# 
# 6871 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPCON1 equ 0FC6h ;# 
# 6941 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPSTAT equ 0FC7h ;# 
# 7189 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPADD equ 0FC8h ;# 
# 7196 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPBUF equ 0FC9h ;# 
# 7203 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T2CON equ 0FCAh ;# 
# 7301 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PR2 equ 0FCBh ;# 
# 7306 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
MEMCON equ 0FCBh ;# 
# 7411 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR2 equ 0FCCh ;# 
# 7418 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T1CON equ 0FCDh ;# 
# 7521 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1 equ 0FCEh ;# 
# 7528 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1L equ 0FCEh ;# 
# 7535 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1H equ 0FCFh ;# 
# 7542 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCON equ 0FD0h ;# 
# 7691 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
WDTCON equ 0FD1h ;# 
# 7719 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
HLVDCON equ 0FD2h ;# 
# 7724 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LVDCON equ 0FD2h ;# 
# 7989 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
OSCCON equ 0FD3h ;# 
# 8072 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T0CON equ 0FD5h ;# 
# 8142 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0 equ 0FD6h ;# 
# 8149 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0L equ 0FD6h ;# 
# 8156 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0H equ 0FD7h ;# 
# 8163 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
STATUS equ 0FD8h ;# 
# 8234 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2 equ 0FD9h ;# 
# 8241 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2L equ 0FD9h ;# 
# 8248 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2H equ 0FDAh ;# 
# 8255 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW2 equ 0FDBh ;# 
# 8262 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC2 equ 0FDCh ;# 
# 8269 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC2 equ 0FDDh ;# 
# 8276 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC2 equ 0FDEh ;# 
# 8283 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF2 equ 0FDFh ;# 
# 8290 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BSR equ 0FE0h ;# 
# 8297 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1 equ 0FE1h ;# 
# 8304 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1L equ 0FE1h ;# 
# 8311 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1H equ 0FE2h ;# 
# 8318 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW1 equ 0FE3h ;# 
# 8325 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC1 equ 0FE4h ;# 
# 8332 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC1 equ 0FE5h ;# 
# 8339 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC1 equ 0FE6h ;# 
# 8346 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF1 equ 0FE7h ;# 
# 8353 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
WREG equ 0FE8h ;# 
# 8360 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0 equ 0FE9h ;# 
# 8367 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0L equ 0FE9h ;# 
# 8374 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0H equ 0FEAh ;# 
# 8381 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW0 equ 0FEBh ;# 
# 8388 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC0 equ 0FECh ;# 
# 8395 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC0 equ 0FEDh ;# 
# 8402 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC0 equ 0FEEh ;# 
# 8409 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF0 equ 0FEFh ;# 
# 8416 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON3 equ 0FF0h ;# 
# 8508 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON2 equ 0FF1h ;# 
# 8585 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON equ 0FF2h ;# 
# 8702 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PROD equ 0FF3h ;# 
# 8709 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PRODL equ 0FF3h ;# 
# 8716 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PRODH equ 0FF4h ;# 
# 8723 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TABLAT equ 0FF5h ;# 
# 8732 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTR equ 0FF6h ;# 
# 8739 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRL equ 0FF6h ;# 
# 8746 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRH equ 0FF7h ;# 
# 8753 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRU equ 0FF8h ;# 
# 8762 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLAT equ 0FF9h ;# 
# 8769 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PC equ 0FF9h ;# 
# 8776 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCL equ 0FF9h ;# 
# 8783 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLATH equ 0FFAh ;# 
# 8790 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLATU equ 0FFBh ;# 
# 8797 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
STKPTR equ 0FFCh ;# 
# 8873 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOS equ 0FFDh ;# 
# 8880 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSL equ 0FFDh ;# 
# 8887 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSH equ 0FFEh ;# 
# 8894 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSU equ 0FFFh ;# 
# 55 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPDATA equ 0F62h ;# 
# 75 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPCFG equ 0F63h ;# 
# 152 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPEPS equ 0F64h ;# 
# 226 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPCON equ 0F65h ;# 
# 252 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRM equ 0F66h ;# 
# 259 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRML equ 0F66h ;# 
# 337 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRMH equ 0F67h ;# 
# 377 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UIR equ 0F68h ;# 
# 433 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UIE equ 0F69h ;# 
# 489 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEIR equ 0F6Ah ;# 
# 540 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEIE equ 0F6Bh ;# 
# 591 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
USTAT equ 0F6Ch ;# 
# 651 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UCON equ 0F6Dh ;# 
# 702 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UADDR equ 0F6Eh ;# 
# 766 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UCFG equ 0F6Fh ;# 
# 845 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP0 equ 0F70h ;# 
# 953 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP1 equ 0F71h ;# 
# 1061 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP2 equ 0F72h ;# 
# 1169 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP3 equ 0F73h ;# 
# 1277 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP4 equ 0F74h ;# 
# 1385 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP5 equ 0F75h ;# 
# 1493 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP6 equ 0F76h ;# 
# 1601 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP7 equ 0F77h ;# 
# 1709 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP8 equ 0F78h ;# 
# 1785 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP9 equ 0F79h ;# 
# 1861 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP10 equ 0F7Ah ;# 
# 1937 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP11 equ 0F7Bh ;# 
# 2013 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP12 equ 0F7Ch ;# 
# 2089 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP13 equ 0F7Dh ;# 
# 2165 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP14 equ 0F7Eh ;# 
# 2241 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP15 equ 0F7Fh ;# 
# 2317 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTA equ 0F80h ;# 
# 2456 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTB equ 0F81h ;# 
# 2566 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTC equ 0F82h ;# 
# 2708 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTD equ 0F83h ;# 
# 2829 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTE equ 0F84h ;# 
# 2976 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATA equ 0F89h ;# 
# 3076 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATB equ 0F8Ah ;# 
# 3188 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATC equ 0F8Bh ;# 
# 3266 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATD equ 0F8Ch ;# 
# 3378 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATE equ 0F8Dh ;# 
# 3430 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISA equ 0F92h ;# 
# 3435 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRA equ 0F92h ;# 
# 3628 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISB equ 0F93h ;# 
# 3633 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRB equ 0F93h ;# 
# 3850 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISC equ 0F94h ;# 
# 3855 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRC equ 0F94h ;# 
# 4004 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISD equ 0F95h ;# 
# 4009 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRD equ 0F95h ;# 
# 4226 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISE equ 0F96h ;# 
# 4231 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRE equ 0F96h ;# 
# 4328 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
OSCTUNE equ 0F9Bh ;# 
# 4387 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIE1 equ 0F9Dh ;# 
# 4471 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIR1 equ 0F9Eh ;# 
# 4555 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
IPR1 equ 0F9Fh ;# 
# 4639 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIE2 equ 0FA0h ;# 
# 4710 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIR2 equ 0FA1h ;# 
# 4781 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
IPR2 equ 0FA2h ;# 
# 4852 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EECON1 equ 0FA6h ;# 
# 4918 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EECON2 equ 0FA7h ;# 
# 4925 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EEDATA equ 0FA8h ;# 
# 4932 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EEADR equ 0FA9h ;# 
# 4939 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCSTA equ 0FABh ;# 
# 4944 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCSTA1 equ 0FABh ;# 
# 5149 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXSTA equ 0FACh ;# 
# 5154 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXSTA1 equ 0FACh ;# 
# 5405 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXREG equ 0FADh ;# 
# 5410 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXREG1 equ 0FADh ;# 
# 5417 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCREG equ 0FAEh ;# 
# 5422 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCREG1 equ 0FAEh ;# 
# 5429 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRG equ 0FAFh ;# 
# 5434 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRG1 equ 0FAFh ;# 
# 5441 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRGH equ 0FB0h ;# 
# 5448 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T3CON equ 0FB1h ;# 
# 5569 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3 equ 0FB2h ;# 
# 5576 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3L equ 0FB2h ;# 
# 5583 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3H equ 0FB3h ;# 
# 5590 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CMCON equ 0FB4h ;# 
# 5680 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CVRCON equ 0FB5h ;# 
# 5765 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1AS equ 0FB6h ;# 
# 5770 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1AS equ 0FB6h ;# 
# 5927 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1DEL equ 0FB7h ;# 
# 5932 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1DEL equ 0FB7h ;# 
# 6065 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BAUDCON equ 0FB8h ;# 
# 6070 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BAUDCTL equ 0FB8h ;# 
# 6245 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP2CON equ 0FBAh ;# 
# 6309 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2 equ 0FBBh ;# 
# 6316 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2L equ 0FBBh ;# 
# 6323 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2H equ 0FBCh ;# 
# 6330 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1CON equ 0FBDh ;# 
# 6335 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1CON equ 0FBDh ;# 
# 6492 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1 equ 0FBEh ;# 
# 6499 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1L equ 0FBEh ;# 
# 6506 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1H equ 0FBFh ;# 
# 6513 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON2 equ 0FC0h ;# 
# 6584 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON1 equ 0FC1h ;# 
# 6669 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON0 equ 0FC2h ;# 
# 6788 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRES equ 0FC3h ;# 
# 6795 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRESL equ 0FC3h ;# 
# 6802 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRESH equ 0FC4h ;# 
# 6809 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPCON2 equ 0FC5h ;# 
# 6871 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPCON1 equ 0FC6h ;# 
# 6941 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPSTAT equ 0FC7h ;# 
# 7189 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPADD equ 0FC8h ;# 
# 7196 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPBUF equ 0FC9h ;# 
# 7203 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T2CON equ 0FCAh ;# 
# 7301 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PR2 equ 0FCBh ;# 
# 7306 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
MEMCON equ 0FCBh ;# 
# 7411 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR2 equ 0FCCh ;# 
# 7418 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T1CON equ 0FCDh ;# 
# 7521 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1 equ 0FCEh ;# 
# 7528 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1L equ 0FCEh ;# 
# 7535 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1H equ 0FCFh ;# 
# 7542 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCON equ 0FD0h ;# 
# 7691 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
WDTCON equ 0FD1h ;# 
# 7719 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
HLVDCON equ 0FD2h ;# 
# 7724 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LVDCON equ 0FD2h ;# 
# 7989 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
OSCCON equ 0FD3h ;# 
# 8072 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T0CON equ 0FD5h ;# 
# 8142 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0 equ 0FD6h ;# 
# 8149 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0L equ 0FD6h ;# 
# 8156 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0H equ 0FD7h ;# 
# 8163 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
STATUS equ 0FD8h ;# 
# 8234 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2 equ 0FD9h ;# 
# 8241 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2L equ 0FD9h ;# 
# 8248 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2H equ 0FDAh ;# 
# 8255 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW2 equ 0FDBh ;# 
# 8262 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC2 equ 0FDCh ;# 
# 8269 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC2 equ 0FDDh ;# 
# 8276 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC2 equ 0FDEh ;# 
# 8283 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF2 equ 0FDFh ;# 
# 8290 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BSR equ 0FE0h ;# 
# 8297 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1 equ 0FE1h ;# 
# 8304 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1L equ 0FE1h ;# 
# 8311 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1H equ 0FE2h ;# 
# 8318 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW1 equ 0FE3h ;# 
# 8325 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC1 equ 0FE4h ;# 
# 8332 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC1 equ 0FE5h ;# 
# 8339 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC1 equ 0FE6h ;# 
# 8346 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF1 equ 0FE7h ;# 
# 8353 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
WREG equ 0FE8h ;# 
# 8360 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0 equ 0FE9h ;# 
# 8367 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0L equ 0FE9h ;# 
# 8374 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0H equ 0FEAh ;# 
# 8381 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW0 equ 0FEBh ;# 
# 8388 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC0 equ 0FECh ;# 
# 8395 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC0 equ 0FEDh ;# 
# 8402 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC0 equ 0FEEh ;# 
# 8409 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF0 equ 0FEFh ;# 
# 8416 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON3 equ 0FF0h ;# 
# 8508 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON2 equ 0FF1h ;# 
# 8585 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON equ 0FF2h ;# 
# 8702 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PROD equ 0FF3h ;# 
# 8709 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PRODL equ 0FF3h ;# 
# 8716 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PRODH equ 0FF4h ;# 
# 8723 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TABLAT equ 0FF5h ;# 
# 8732 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTR equ 0FF6h ;# 
# 8739 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRL equ 0FF6h ;# 
# 8746 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRH equ 0FF7h ;# 
# 8753 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRU equ 0FF8h ;# 
# 8762 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLAT equ 0FF9h ;# 
# 8769 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PC equ 0FF9h ;# 
# 8776 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCL equ 0FF9h ;# 
# 8783 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLATH equ 0FFAh ;# 
# 8790 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLATU equ 0FFBh ;# 
# 8797 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
STKPTR equ 0FFCh ;# 
# 8873 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOS equ 0FFDh ;# 
# 8880 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSL equ 0FFDh ;# 
# 8887 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSH equ 0FFEh ;# 
# 8894 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSU equ 0FFFh ;# 
# 55 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPDATA equ 0F62h ;# 
# 75 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPCFG equ 0F63h ;# 
# 152 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPEPS equ 0F64h ;# 
# 226 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPPCON equ 0F65h ;# 
# 252 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRM equ 0F66h ;# 
# 259 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRML equ 0F66h ;# 
# 337 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UFRMH equ 0F67h ;# 
# 377 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UIR equ 0F68h ;# 
# 433 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UIE equ 0F69h ;# 
# 489 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEIR equ 0F6Ah ;# 
# 540 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEIE equ 0F6Bh ;# 
# 591 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
USTAT equ 0F6Ch ;# 
# 651 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UCON equ 0F6Dh ;# 
# 702 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UADDR equ 0F6Eh ;# 
# 766 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UCFG equ 0F6Fh ;# 
# 845 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP0 equ 0F70h ;# 
# 953 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP1 equ 0F71h ;# 
# 1061 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP2 equ 0F72h ;# 
# 1169 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP3 equ 0F73h ;# 
# 1277 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP4 equ 0F74h ;# 
# 1385 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP5 equ 0F75h ;# 
# 1493 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP6 equ 0F76h ;# 
# 1601 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP7 equ 0F77h ;# 
# 1709 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP8 equ 0F78h ;# 
# 1785 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP9 equ 0F79h ;# 
# 1861 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP10 equ 0F7Ah ;# 
# 1937 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP11 equ 0F7Bh ;# 
# 2013 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP12 equ 0F7Ch ;# 
# 2089 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP13 equ 0F7Dh ;# 
# 2165 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP14 equ 0F7Eh ;# 
# 2241 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
UEP15 equ 0F7Fh ;# 
# 2317 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTA equ 0F80h ;# 
# 2456 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTB equ 0F81h ;# 
# 2566 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTC equ 0F82h ;# 
# 2708 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTD equ 0F83h ;# 
# 2829 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PORTE equ 0F84h ;# 
# 2976 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATA equ 0F89h ;# 
# 3076 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATB equ 0F8Ah ;# 
# 3188 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATC equ 0F8Bh ;# 
# 3266 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATD equ 0F8Ch ;# 
# 3378 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LATE equ 0F8Dh ;# 
# 3430 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISA equ 0F92h ;# 
# 3435 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRA equ 0F92h ;# 
# 3628 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISB equ 0F93h ;# 
# 3633 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRB equ 0F93h ;# 
# 3850 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISC equ 0F94h ;# 
# 3855 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRC equ 0F94h ;# 
# 4004 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISD equ 0F95h ;# 
# 4009 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRD equ 0F95h ;# 
# 4226 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TRISE equ 0F96h ;# 
# 4231 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
DDRE equ 0F96h ;# 
# 4328 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
OSCTUNE equ 0F9Bh ;# 
# 4387 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIE1 equ 0F9Dh ;# 
# 4471 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIR1 equ 0F9Eh ;# 
# 4555 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
IPR1 equ 0F9Fh ;# 
# 4639 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIE2 equ 0FA0h ;# 
# 4710 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PIR2 equ 0FA1h ;# 
# 4781 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
IPR2 equ 0FA2h ;# 
# 4852 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EECON1 equ 0FA6h ;# 
# 4918 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EECON2 equ 0FA7h ;# 
# 4925 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EEDATA equ 0FA8h ;# 
# 4932 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
EEADR equ 0FA9h ;# 
# 4939 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCSTA equ 0FABh ;# 
# 4944 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCSTA1 equ 0FABh ;# 
# 5149 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXSTA equ 0FACh ;# 
# 5154 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXSTA1 equ 0FACh ;# 
# 5405 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXREG equ 0FADh ;# 
# 5410 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TXREG1 equ 0FADh ;# 
# 5417 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCREG equ 0FAEh ;# 
# 5422 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCREG1 equ 0FAEh ;# 
# 5429 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRG equ 0FAFh ;# 
# 5434 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRG1 equ 0FAFh ;# 
# 5441 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SPBRGH equ 0FB0h ;# 
# 5448 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T3CON equ 0FB1h ;# 
# 5569 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3 equ 0FB2h ;# 
# 5576 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3L equ 0FB2h ;# 
# 5583 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR3H equ 0FB3h ;# 
# 5590 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CMCON equ 0FB4h ;# 
# 5680 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CVRCON equ 0FB5h ;# 
# 5765 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1AS equ 0FB6h ;# 
# 5770 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1AS equ 0FB6h ;# 
# 5927 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1DEL equ 0FB7h ;# 
# 5932 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1DEL equ 0FB7h ;# 
# 6065 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BAUDCON equ 0FB8h ;# 
# 6070 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BAUDCTL equ 0FB8h ;# 
# 6245 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP2CON equ 0FBAh ;# 
# 6309 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2 equ 0FBBh ;# 
# 6316 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2L equ 0FBBh ;# 
# 6323 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR2H equ 0FBCh ;# 
# 6330 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCP1CON equ 0FBDh ;# 
# 6335 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ECCP1CON equ 0FBDh ;# 
# 6492 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1 equ 0FBEh ;# 
# 6499 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1L equ 0FBEh ;# 
# 6506 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
CCPR1H equ 0FBFh ;# 
# 6513 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON2 equ 0FC0h ;# 
# 6584 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON1 equ 0FC1h ;# 
# 6669 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADCON0 equ 0FC2h ;# 
# 6788 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRES equ 0FC3h ;# 
# 6795 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRESL equ 0FC3h ;# 
# 6802 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
ADRESH equ 0FC4h ;# 
# 6809 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPCON2 equ 0FC5h ;# 
# 6871 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPCON1 equ 0FC6h ;# 
# 6941 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPSTAT equ 0FC7h ;# 
# 7189 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPADD equ 0FC8h ;# 
# 7196 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
SSPBUF equ 0FC9h ;# 
# 7203 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T2CON equ 0FCAh ;# 
# 7301 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PR2 equ 0FCBh ;# 
# 7306 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
MEMCON equ 0FCBh ;# 
# 7411 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR2 equ 0FCCh ;# 
# 7418 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T1CON equ 0FCDh ;# 
# 7521 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1 equ 0FCEh ;# 
# 7528 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1L equ 0FCEh ;# 
# 7535 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR1H equ 0FCFh ;# 
# 7542 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
RCON equ 0FD0h ;# 
# 7691 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
WDTCON equ 0FD1h ;# 
# 7719 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
HLVDCON equ 0FD2h ;# 
# 7724 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
LVDCON equ 0FD2h ;# 
# 7989 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
OSCCON equ 0FD3h ;# 
# 8072 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
T0CON equ 0FD5h ;# 
# 8142 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0 equ 0FD6h ;# 
# 8149 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0L equ 0FD6h ;# 
# 8156 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TMR0H equ 0FD7h ;# 
# 8163 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
STATUS equ 0FD8h ;# 
# 8234 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2 equ 0FD9h ;# 
# 8241 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2L equ 0FD9h ;# 
# 8248 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR2H equ 0FDAh ;# 
# 8255 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW2 equ 0FDBh ;# 
# 8262 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC2 equ 0FDCh ;# 
# 8269 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC2 equ 0FDDh ;# 
# 8276 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC2 equ 0FDEh ;# 
# 8283 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF2 equ 0FDFh ;# 
# 8290 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
BSR equ 0FE0h ;# 
# 8297 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1 equ 0FE1h ;# 
# 8304 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1L equ 0FE1h ;# 
# 8311 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR1H equ 0FE2h ;# 
# 8318 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW1 equ 0FE3h ;# 
# 8325 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC1 equ 0FE4h ;# 
# 8332 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC1 equ 0FE5h ;# 
# 8339 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC1 equ 0FE6h ;# 
# 8346 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF1 equ 0FE7h ;# 
# 8353 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
WREG equ 0FE8h ;# 
# 8360 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0 equ 0FE9h ;# 
# 8367 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0L equ 0FE9h ;# 
# 8374 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
FSR0H equ 0FEAh ;# 
# 8381 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PLUSW0 equ 0FEBh ;# 
# 8388 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PREINC0 equ 0FECh ;# 
# 8395 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTDEC0 equ 0FEDh ;# 
# 8402 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
POSTINC0 equ 0FEEh ;# 
# 8409 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INDF0 equ 0FEFh ;# 
# 8416 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON3 equ 0FF0h ;# 
# 8508 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON2 equ 0FF1h ;# 
# 8585 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
INTCON equ 0FF2h ;# 
# 8702 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PROD equ 0FF3h ;# 
# 8709 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PRODL equ 0FF3h ;# 
# 8716 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PRODH equ 0FF4h ;# 
# 8723 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TABLAT equ 0FF5h ;# 
# 8732 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTR equ 0FF6h ;# 
# 8739 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRL equ 0FF6h ;# 
# 8746 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRH equ 0FF7h ;# 
# 8753 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TBLPTRU equ 0FF8h ;# 
# 8762 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLAT equ 0FF9h ;# 
# 8769 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PC equ 0FF9h ;# 
# 8776 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCL equ 0FF9h ;# 
# 8783 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLATH equ 0FFAh ;# 
# 8790 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
PCLATU equ 0FFBh ;# 
# 8797 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
STKPTR equ 0FFCh ;# 
# 8873 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOS equ 0FFDh ;# 
# 8880 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSL equ 0FFDh ;# 
# 8887 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSH equ 0FFEh ;# 
# 8894 "D:\DOCUMENTOS\PROGRAMAS_ESCUELA\xc8\v2.32\pic\include\proc\pic18f4550.h"
TOSU equ 0FFFh ;# 
	debug_source C
	FNCALL	_main,_GPIO_CONFIG
	FNCALL	_main,_REG_CONFIG
	FNCALL	_main,_config
	FNCALL	_main,_loop
	FNCALL	_loop,_MODBUS_RW
	FNCALL	_loop,_REF_DIO
	FNCALL	_REF_DIO,_USART_OFF
	FNCALL	_REF_DIO,_USART_ON
	FNCALL	_MODBUS_RW,_CRC_calc
	FNCALL	_MODBUS_RW,_MODBUS_RX
	FNCALL	_MODBUS_RW,_MODBUS_TX
	FNCALL	_config,_USART_init
	FNCALL	_USART_init,_USART_ON
	FNROOT	_main
	global	_AOUT
_AOUT	set	0x1E8
	global	_DOUT
_DOUT	set	0x1E0
	global	_M_ADU
_M_ADU	set	0x20
	global	_RCREG
_RCREG	set	0xFAE
	global	_PIR1bits
_PIR1bits	set	0xF9E
	global	_TXREG
_TXREG	set	0xFAD
	global	_T0CONbits
_T0CONbits	set	0xFD5
	global	_TMR0H
_TMR0H	set	0xFD7
	global	_TMR0L
_TMR0L	set	0xFD6
	global	_INTCONbits
_INTCONbits	set	0xFF2
	global	_T0CON
_T0CON	set	0xFD5
	global	_ADCON2
_ADCON2	set	0xFC0
	global	_ADCON1
_ADCON1	set	0xFC1
	global	_TRISE
_TRISE	set	0xF96
	global	_TRISD
_TRISD	set	0xF95
	global	_TRISC
_TRISC	set	0xF94
	global	_TRISB
_TRISB	set	0xF93
	global	_TRISA
_TRISA	set	0xF92
	global	_LATE
_LATE	set	0xF8D
	global	_LATD
_LATD	set	0xF8C
	global	_LATC
_LATC	set	0xF8B
	global	_LATB
_LATB	set	0xF8A
	global	_LATA
_LATA	set	0xF89
	global	_SSPBUF
_SSPBUF	set	0xFC9
	global	_SSPCON1
_SSPCON1	set	0xFC6
	global	_SSPSTAT
_SSPSTAT	set	0xFC7
	global	_SPBRGH
_SPBRGH	set	0xFB0
	global	_SPBRG
_SPBRG	set	0xFAF
	global	_TXSTAbits
_TXSTAbits	set	0xFAC
	global	_BAUDCONbits
_BAUDCONbits	set	0xFB8
	global	_RCSTAbits
_RCSTAbits	set	0xFAB
	global	_LATDbits
_LATDbits	set	0xF8C
	global	_TRISCbits
_TRISCbits	set	0xF94
	global	_SSPIF
_SSPIF	set	0x7CF3
	global	_EAIN
_EAIN	set	0x1E6
	global	_SAIN
_SAIN	set	0x1E1
	global	_Z
psect	nvCOMRAMh,class=COMRAM,space=1,noexec,lowdata
global __pnvCOMRAMh
__pnvCOMRAMh:
	global	_Z
_Z:
       ds      2
	global	_DIN
_DIN	set	0x1DF
	global	_AIN
_AIN	set	0x1F0
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = always
	config default_idlocs  = always
	config PLLDIV = "4"
	config CPUDIV = "OSC1_PLL2"
	config USBDIV = "2"
	config FOSC = "HSPLL_HS"
	config FCMEN = "OFF"
	config IESO = "OFF"
	config PWRT = "OFF"
	config BOR = "ON"
	config BORV = "3"
	config VREGEN = "ON"
	config WDT = "OFF"
	config WDTPS = "32768"
	config PBADEN = "OFF"
	config LPT1OSC = "OFF"
	config MCLRE = "ON"
	config STVREN = "ON"
	config LVP = "OFF"
	config XINST = "OFF"
	config CP0 = "OFF"
	config CP1 = "OFF"
	config CPB = "OFF"
	config WRT0 = "OFF"
	config WRT1 = "OFF"
	config WRTC = "OFF"
	config WRTB = "OFF"
	config EBTR0 = "OFF"
	config EBTR1 = "OFF"
	config EBTRB = "OFF"
	file	"comp\main.s"
	line	#
psect	cinit,class=CODE,delta=1,reloc=2
global __pcinit
__pcinit:
global start_initialization
start_initialization:

global __initialization
__initialization:
psect cinit,class=CODE,delta=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
movlb 0
goto _main	;jump to C main() function
psect	cstackCOMRAMh,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAMh
__pcstackCOMRAMh:
??_USART_init:	; 1 bytes @ 0x0
??_REF_DIO:	; 1 bytes @ 0x0
?_config:	; 1 bytes @ 0x0
??_config:	; 1 bytes @ 0x0
?_loop:	; 1 bytes @ 0x0
?_USART_ON:	; 1 bytes @ 0x0
??_USART_ON:	; 1 bytes @ 0x0
?_USART_OFF:	; 1 bytes @ 0x0
??_USART_OFF:	; 1 bytes @ 0x0
?_GPIO_CONFIG:	; 1 bytes @ 0x0
??_GPIO_CONFIG:	; 1 bytes @ 0x0
?_REG_CONFIG:	; 1 bytes @ 0x0
??_REG_CONFIG:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_MODBUS_TX:	; 1 bytes @ 0x0
??_MODBUS_TX:	; 1 bytes @ 0x0
?_MODBUS_RX:	; 1 bytes @ 0x0
??_MODBUS_RX:	; 1 bytes @ 0x0
	global	?_CRC_calc
?_CRC_calc:	; 2 bytes @ 0x0
	global	MODBUS_TX@M_size
MODBUS_TX@M_size:	; 1 bytes @ 0x0
	global	MODBUS_RX@i
MODBUS_RX@i:	; 1 bytes @ 0x0
	ds   1
	global	MODBUS_TX@i
MODBUS_TX@i:	; 1 bytes @ 0x1
	ds   1
??_CRC_calc:	; 1 bytes @ 0x2
	ds   7
	global	CRC_calc@size
CRC_calc@size:	; 1 bytes @ 0x9
	ds   1
	global	CRC_calc@i
CRC_calc@i:	; 1 bytes @ 0xA
	ds   1
	global	CRC_calc@j
CRC_calc@j:	; 1 bytes @ 0xB
	ds   1
	global	CRC_calc@CRC
CRC_calc@CRC:	; 2 bytes @ 0xC
	ds   2
	global	?_MODBUS_RW
?_MODBUS_RW:	; 2 bytes @ 0xE
	global	MODBUS_RW@FC
MODBUS_RW@FC:	; 1 bytes @ 0xE
	ds   1
	global	MODBUS_RW@ADDR
MODBUS_RW@ADDR:	; 2 bytes @ 0xF
	ds   2
	global	MODBUS_RW@N
MODBUS_RW@N:	; 2 bytes @ 0x11
	ds   2
??_MODBUS_RW:	; 1 bytes @ 0x13
	ds   4
	global	MODBUS_RW@CRC_s
MODBUS_RW@CRC_s:	; 2 bytes @ 0x17
	ds   2
	global	MODBUS_RW@slave
MODBUS_RW@slave:	; 1 bytes @ 0x19
	ds   1
	global	MODBUS_RW@CRC
MODBUS_RW@CRC:	; 2 bytes @ 0x1A
	ds   2
	global	MODBUS_RW@C_byte
MODBUS_RW@C_byte:	; 2 bytes @ 0x1C
	ds   2
??_loop:	; 1 bytes @ 0x1E
??_main:	; 1 bytes @ 0x1E
psect	cstackCOMRAMl,class=COMRAM,space=1,noexec,lowdata
global __pcstackCOMRAMl
__pcstackCOMRAMl:
?_USART_init:	; 1 bytes @ 0x0
?_REF_DIO:	; 1 bytes @ 0x0
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         0
;!    Persistent  2
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMRAMh          64     30      32
;!    COMRAMl          31      0       0
;!    BANK0           160      0       0
;!    BANK1hhh         16      0       0
;!    BANK1hhl          8      0       0
;!    BANK1hl           4      0       0
;!    BANK1l          223      0       0
;!    BANK2           256      0       0
;!    BANK3           256      0       0
;!    BANK4           256      0       0
;!    BANK5           256      0       0
;!    BANK6           256      0       0
;!    BANK7           256      0       0

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMRAMh
;!
;!    _loop->_MODBUS_RW
;!    _MODBUS_RW->_CRC_calc
;!
;!Critical Paths under _main in COMRAMl
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1hhh
;!
;!    None.
;!
;!Critical Paths under _main in BANK1hhl
;!
;!    None.
;!
;!Critical Paths under _main in BANK1hl
;!
;!    None.
;!
;!Critical Paths under _main in BANK1l
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK4
;!
;!    None.
;!
;!Critical Paths under _main in BANK5
;!
;!    None.
;!
;!Critical Paths under _main in BANK6
;!
;!    None.
;!
;!Critical Paths under _main in BANK7
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0    1039
;!                        _GPIO_CONFIG
;!                         _REG_CONFIG
;!                             _config
;!                               _loop
;! ---------------------------------------------------------------------------------
;! (1) _loop                                                 0     0      0    1039
;!                          _MODBUS_RW
;!                            _REF_DIO
;! ---------------------------------------------------------------------------------
;! (2) _REF_DIO                                              0     0      0       0
;!                          _USART_OFF
;!                           _USART_ON
;! ---------------------------------------------------------------------------------
;! (3) _USART_OFF                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _MODBUS_RW                                           16    11      5    1039
;!                                             14 COMRAMh   16    11      5
;!                           _CRC_calc
;!                          _MODBUS_RX
;!                          _MODBUS_TX
;! ---------------------------------------------------------------------------------
;! (3) _MODBUS_TX                                            2     2      0      68
;!                                              0 COMRAMh    2     2      0
;! ---------------------------------------------------------------------------------
;! (3) _MODBUS_RX                                            1     1      0      68
;!                                              0 COMRAMh    1     1      0
;! ---------------------------------------------------------------------------------
;! (3) _CRC_calc                                            14    12      2     228
;!                                              0 COMRAMh   14    12      2
;! ---------------------------------------------------------------------------------
;! (1) _config                                               0     0      0       0
;!                         _USART_init
;! ---------------------------------------------------------------------------------
;! (2) _USART_init                                           0     0      0       0
;!                           _USART_ON
;! ---------------------------------------------------------------------------------
;! (3) _USART_ON                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _REG_CONFIG                                           0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _GPIO_CONFIG                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _GPIO_CONFIG
;!   _REG_CONFIG
;!   _config
;!     _USART_init
;!       _USART_ON
;!   _loop
;!     _MODBUS_RW
;!       _CRC_calc
;!       _MODBUS_RX
;!       _MODBUS_TX
;!     _REF_DIO
;!       _USART_OFF
;!       _USART_ON
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BITCOMRAMh          40      0       0       0        0.0%
;!EEDATA             100      0       0       0        0.0%
;!NULL                 0      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!BITCOMRAMl          1F      0       0       1        0.0%
;!COMRAMh             40     1E      20       2       50.0%
;!COMRAMl             1F      0       0       3        0.0%
;!STACK                0      0       0       4        0.0%
;!DATA                 0      0      20       5        0.0%
;!BITBANK0            A0      0       0       6        0.0%
;!BANK0               A0      0       0       7        0.0%
;!BITBANK1hhh         10      0       0       8        0.0%
;!BITBANK1hhl          8      0       0       9        0.0%
;!BITBANK1hl           4      0       0      10        0.0%
;!BITBANK1l           DF      0       0      11        0.0%
;!BANK1hhh            10      0       0      12        0.0%
;!BANK1hhl             8      0       0      13        0.0%
;!BANK1hl              4      0       0      14        0.0%
;!BANK1l              DF      0       0      15        0.0%
;!BITBANK2           100      0       0      16        0.0%
;!BANK2              100      0       0      17        0.0%
;!BITBANK3           100      0       0      18        0.0%
;!BANK3              100      0       0      19        0.0%
;!BITBANK4           100      0       0      20        0.0%
;!BANK4              100      0       0      21        0.0%
;!BITBANK5           100      0       0      22        0.0%
;!BANK5              100      0       0      23        0.0%
;!ABS                  0      0      20      24        0.0%
;!BITBANK6           100      0       0      25        0.0%
;!BANK6              100      0       0      26        0.0%
;!BITBANK7           100      0       0      27        0.0%
;!BANK7              100      0       0      28        0.0%
;!BIGRAMhhh          610      0       0      29        0.0%
;!BIGRAMhhl            8      0       0      30        0.0%
;!BIGRAMhl             4      0       0      31        0.0%
;!BIGRAMlh           1BF      0       0      32        0.0%
;!BIGRAMll            1F      0       0      33        0.0%
;!BITSFR               0      0       0     200        0.0%
;!SFR                  0      0       0     200        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 286 in file "AutoPLC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called: 3
;; This function calls:
;;		_GPIO_CONFIG
;;		_REG_CONFIG
;;		_config
;;		_loop
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	text0,class=CODE,space=0,reloc=2,group=0
	file	"AutoPLC.c"
	line	286
global __ptext0
__ptext0:
psect	text0
	file	"AutoPLC.c"
	line	286
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:
;incstack = 0
	callstack 28
	line	288
	
l1309:
;AutoPLC.c: 288: GPIO_CONFIG();
	call	_GPIO_CONFIG	;wreg free
	line	289
;AutoPLC.c: 289: REG_CONFIG();
	call	_REG_CONFIG	;wreg free
	line	303
;AutoPLC.c: 303: config();
	call	_config	;wreg free
	line	307
	
l1311:
;AutoPLC.c: 306: {;AutoPLC.c: 307: loop();
	call	_loop	;wreg free
	goto	l1311
	global	start
	goto	start
	callstack 0
	line	309
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_loop

;; *************** function _loop *****************
;; Defined at:
;;		line 11 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_MODBUS_RW
;;		_REF_DIO
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	11
global __ptext1
__ptext1:
psect	text1
	file	"main.c"
	line	11
	global	__size_of_loop
	__size_of_loop	equ	__end_of_loop-_loop
	
_loop:
;incstack = 0
	callstack 28
	line	13
	
l1301:
;main.c: 13: Z = MODBUS_RW(0x01,0x04,0x00,1);
	movlw	low(04h)
	movwf	((c:MODBUS_RW@FC))^00h,c
	movlw	high(0)
	movwf	((c:MODBUS_RW@ADDR+1))^00h,c
	movlw	low(0)
	movwf	((c:MODBUS_RW@ADDR))^00h,c
	movlw	high(01h)
	movwf	((c:MODBUS_RW@N+1))^00h,c
	movlw	low(01h)
	movwf	((c:MODBUS_RW@N))^00h,c
	movlw	(01h)&0ffh
	
	call	_MODBUS_RW
	movff	0+?_MODBUS_RW,(c:_Z)	;volatile
	movff	1+?_MODBUS_RW,(c:_Z+1)	;volatile
	line	14
	
l1303:
;main.c: 14: if(Z > 0x0100)
		decf	((c:_Z))^00h,c,w	;volatile
	movlw	1
	subwfb	((c:_Z+1))^00h,c,w	;volatile
	btfss	status,0
	goto	u361
	goto	u360

u361:
	goto	l19
u360:
	line	16
	
l1305:
;main.c: 15: {;main.c: 16: DOUT=M_ADU[4];
	movff	0+((c:32)+04h),(480)
	line	17
	
l1307:
;main.c: 17: REF_DIO();
	call	_REF_DIO	;wreg free
	line	19
	
l19:
	return	;funcret
	callstack 0
GLOBAL	__end_of_loop
	__end_of_loop:
	signat	_loop,89
	global	_REF_DIO

;; *************** function _REF_DIO *****************
;; Defined at:
;;		line 126 in file "AutoPLC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_USART_OFF
;;		_USART_ON
;; This function is called by:
;;		_loop
;; This function uses a non-reentrant model
;;
psect	text2,class=CODE,space=0,reloc=2,group=0
	file	"AutoPLC.c"
	line	126
global __ptext2
__ptext2:
psect	text2
	file	"AutoPLC.c"
	line	126
	global	__size_of_REF_DIO
	__size_of_REF_DIO	equ	__end_of_REF_DIO-_REF_DIO
	
_REF_DIO:
;incstack = 0
	callstack 28
	line	129
	
l1279:
;AutoPLC.c: 129: USART_OFF();
	call	_USART_OFF	;wreg free
	line	130
	
l1281:
;AutoPLC.c: 130: SSPSTAT = 0b11000000;
	movlw	low(0C0h)
	movwf	((c:4039))^0f00h,c	;volatile
	line	131
	
l1283:
;AutoPLC.c: 131: SSPCON1 = 0b00100000;
	movlw	low(020h)
	movwf	((c:4038))^0f00h,c	;volatile
	line	134
	
l1285:
;AutoPLC.c: 134: LATDbits.LATD1 = 1;
	bsf	((c:3980))^0f00h,c,1	;volatile
	line	135
	
l1287:
;AutoPLC.c: 135: LATDbits.LATD1 = 0;
	bcf	((c:3980))^0f00h,c,1	;volatile
	line	136
	
l1289:
;AutoPLC.c: 136: LATDbits.LATD1 = 1;
	bsf	((c:3980))^0f00h,c,1	;volatile
	line	138
	
l1291:
;AutoPLC.c: 138: LATDbits.LATD0 = 0;
	bcf	((c:3980))^0f00h,c,0	;volatile
	line	140
	
l1293:
;AutoPLC.c: 140: SSPBUF = DOUT;
	movff	(480),(c:4041)	;volatile
	line	141
;AutoPLC.c: 141: while (!SSPIF);
	
l105:
	btfss	c:(31987/8),(31987)&7	;volatile
	goto	u351
	goto	u350
u351:
	goto	l105
u350:
	
l107:
	line	142
;AutoPLC.c: 142: SSPIF = 0;
	bcf	c:(31987/8),(31987)&7	;volatile
	line	145
;AutoPLC.c: 145: LATDbits.LATD0 = 1;
	bsf	((c:3980))^0f00h,c,0	;volatile
	line	147
;AutoPLC.c: 147: DIN = SSPBUF;
	movff	(c:4041),(479)	;volatile
	line	150
	
l1295:
;AutoPLC.c: 150: SSPSTAT = 0x00;
	movlw	low(0)
	movwf	((c:4039))^0f00h,c	;volatile
	line	151
;AutoPLC.c: 151: SSPCON1 = 0x00;
	movlw	low(0)
	movwf	((c:4038))^0f00h,c	;volatile
	line	152
	
l1297:
;AutoPLC.c: 152: USART_ON();
	call	_USART_ON	;wreg free
	line	154
	
l108:
	return	;funcret
	callstack 0
GLOBAL	__end_of_REF_DIO
	__end_of_REF_DIO:
	signat	_REF_DIO,89
	global	_USART_OFF

;; *************** function _USART_OFF *****************
;; Defined at:
;;		line 41 in file "AutoPLC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_REF_DIO
;; This function uses a non-reentrant model
;;
psect	text3,class=CODE,space=0,reloc=2,inline,group=0
	line	41
global __ptext3
__ptext3:
psect	text3
	file	"AutoPLC.c"
	line	41
	global	__size_of_USART_OFF
	__size_of_USART_OFF	equ	__end_of_USART_OFF-_USART_OFF
	
_USART_OFF:
;incstack = 0
	callstack 28
	line	43
	
l1147:
;AutoPLC.c: 43: RCSTAbits.SPEN = 0;
	bcf	((c:4011))^0f00h,c,7	;volatile
	line	44
;AutoPLC.c: 44: TRISCbits.RC7 = 0;
	bcf	((c:3988))^0f00h,c,7	;volatile
	line	45
;AutoPLC.c: 45: LATDbits.LATD4 = 1;
	bsf	((c:3980))^0f00h,c,4	;volatile
	line	46
	
l99:
	return	;funcret
	callstack 0
GLOBAL	__end_of_USART_OFF
	__end_of_USART_OFF:
	signat	_USART_OFF,89
	global	_MODBUS_RW

;; *************** function _MODBUS_RW *****************
;; Defined at:
;;		line 65 in file "MODBUS_RTU_APLC.c"
;; Parameters:    Size  Location     Type
;;  slave           1    wreg     unsigned char 
;;  FC              1   14[COMRAM] unsigned char 
;;  ADDR            2   15[COMRAM] unsigned int 
;;  N               2   17[COMRAM] unsigned int 
;; Auto vars:     Size  Location     Type
;;  slave           1   25[COMRAM] unsigned char 
;;  C_byte          2   28[COMRAM] unsigned int 
;;  CRC             2   26[COMRAM] unsigned int 
;;  CRC_s           2   23[COMRAM] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   14[COMRAM] unsigned int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         5       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         7       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        16       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_CRC_calc
;;		_MODBUS_RX
;;		_MODBUS_TX
;; This function is called by:
;;		_loop
;; This function uses a non-reentrant model
;;
psect	text4,class=CODE,space=0,reloc=2,group=0
	file	"MODBUS_RTU_APLC.c"
	line	65
global __ptext4
__ptext4:
psect	text4
	file	"MODBUS_RTU_APLC.c"
	line	65
	global	__size_of_MODBUS_RW
	__size_of_MODBUS_RW	equ	__end_of_MODBUS_RW-_MODBUS_RW
	
_MODBUS_RW:
;incstack = 0
	callstack 28
;MODBUS_RW@slave stored from wreg
	movwf	((c:MODBUS_RW@slave))^00h,c
	line	69
	
l1223:
	line	71
	
l1225:
;MODBUS_RTU_APLC.c: 71: M_ADU[0] = slave;
	movff	(c:MODBUS_RW@slave),(c:32)
	line	72
	
l1227:
;MODBUS_RTU_APLC.c: 72: M_ADU[1] = FC;
	movff	(c:MODBUS_RW@FC),0+((c:32)+01h)
	line	73
	
l1229:
;MODBUS_RTU_APLC.c: 73: M_ADU[2] = ADDR>>8;
	movff	0+((c:MODBUS_RW@ADDR)+01h),0+((c:32)+02h)
	line	74
	
l1231:
;MODBUS_RTU_APLC.c: 74: M_ADU[3] = ADDR & 0x00FF;
	movff	(c:MODBUS_RW@ADDR),0+((c:32)+03h)
	line	75
	
l1233:
;MODBUS_RTU_APLC.c: 75: M_ADU[4] = N>>8;
	movff	0+((c:MODBUS_RW@N)+01h),0+((c:32)+04h)
	line	76
	
l1235:
;MODBUS_RTU_APLC.c: 76: M_ADU[5] = N & 0x00FF;
	movff	(c:MODBUS_RW@N),0+((c:32)+05h)
	line	78
	
l1237:
;MODBUS_RTU_APLC.c: 78: CRC = CRC_calc(6);
	movlw	(06h)&0ffh
	
	call	_CRC_calc
	movff	0+?_CRC_calc,(c:MODBUS_RW@CRC)
	movff	1+?_CRC_calc,(c:MODBUS_RW@CRC+1)
	line	80
	
l1239:
;MODBUS_RTU_APLC.c: 80: M_ADU[6] = CRC & 0x00FF;
	movff	(c:MODBUS_RW@CRC),0+((c:32)+06h)
	line	81
	
l1241:
;MODBUS_RTU_APLC.c: 81: M_ADU[7] = CRC >> 8;
	movff	0+((c:MODBUS_RW@CRC)+01h),0+((c:32)+07h)
	line	83
	
l1243:
;MODBUS_RTU_APLC.c: 83: MODBUS_TX(8);
	movlw	(08h)&0ffh
	
	call	_MODBUS_TX
	line	84
	
l1245:
;MODBUS_RTU_APLC.c: 84: C_byte = MODBUS_RX();
	call	_MODBUS_RX	;wreg free
	movwf	(??_MODBUS_RW+0+0)^00h,c
	movf	((??_MODBUS_RW+0+0))^00h,c,w
	movwf	((c:MODBUS_RW@C_byte))^00h,c
	clrf	((c:MODBUS_RW@C_byte+1))^00h,c
	line	86
	
l1247:
;MODBUS_RTU_APLC.c: 86: if(C_byte == 0)
	movf	((c:MODBUS_RW@C_byte))^00h,c,w
iorwf	((c:MODBUS_RW@C_byte+1))^00h,c,w
	btfss	status,2
	goto	u281
	goto	u280

u281:
	goto	l1253
u280:
	line	88
	
l1249:
;MODBUS_RTU_APLC.c: 87: {;MODBUS_RTU_APLC.c: 88: return 0x0400;
	movlw	high(0400h)
	movwf	((c:?_MODBUS_RW+1))^00h,c
	movlw	low(0400h)
	movwf	((c:?_MODBUS_RW))^00h,c
	goto	l199
	line	90
	
l1253:
;MODBUS_RTU_APLC.c: 89: };MODBUS_RTU_APLC.c: 90: CRC_s = CRC_calc(C_byte-2);
	movf	((c:MODBUS_RW@C_byte))^00h,c,w
	addlw	low(0FEh)
	
	call	_CRC_calc
	movff	0+?_CRC_calc,(c:MODBUS_RW@CRC_s)
	movff	1+?_CRC_calc,(c:MODBUS_RW@CRC_s+1)
	line	92
	
l1255:
;MODBUS_RTU_APLC.c: 92: if(CRC_s != ( (M_ADU[C_byte-1] <<8) | (M_ADU[C_byte-2]) ) )
	movlw	low(32+0FFFFh)
	addwf	((c:MODBUS_RW@C_byte))^00h,c,w
	movwf	c:fsr2l
	movlw	high(32+0FFFFh)
	addwfc	((c:MODBUS_RW@C_byte+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_MODBUS_RW+0+0)^00h,c
	movf	((??_MODBUS_RW+0+0))^00h,c,w
	movwf	(??_MODBUS_RW+1+0+1)^00h,c
	clrf	(??_MODBUS_RW+1+0)^00h,c
	movlw	low(32+0FFFEh)
	addwf	((c:MODBUS_RW@C_byte))^00h,c,w
	movwf	c:fsr2l
	movlw	high(32+0FFFEh)
	addwfc	((c:MODBUS_RW@C_byte+1))^00h,c,w
	movwf	1+c:fsr2l
	movf	indf2,w
	movwf	(??_MODBUS_RW+3+0)^00h,c
	movf	((??_MODBUS_RW+3+0))^00h,c,w
	iorwf	(??_MODBUS_RW+1+0)^00h,c
	movlw	0
	iorwf	(??_MODBUS_RW+1+1)^00h,c
	movf	((c:MODBUS_RW@CRC_s))^00h,c,w
xorwf	(??_MODBUS_RW+1+0)^00h,c,w
	bnz	u290
movf	((c:MODBUS_RW@CRC_s+1))^00h,c,w
xorwf	(??_MODBUS_RW+1+1)^00h,c,w
	btfsc	status,2
	goto	u291
	goto	u290

u291:
	goto	l1261
u290:
	line	94
	
l1257:
;MODBUS_RTU_APLC.c: 93: {;MODBUS_RTU_APLC.c: 94: return 0x0100;
	movlw	high(0100h)
	movwf	((c:?_MODBUS_RW+1))^00h,c
	movlw	low(0100h)
	movwf	((c:?_MODBUS_RW))^00h,c
	goto	l199
	line	96
	
l1261:
;MODBUS_RTU_APLC.c: 95: };MODBUS_RTU_APLC.c: 96: if( M_ADU[0] != slave || M_ADU[1] == FC )
	movf	((c:MODBUS_RW@slave))^00h,c,w
xorwf	((c:32))^00h,c,w
	btfss	status,2
	goto	u301
	goto	u300

u301:
	goto	l1265
u300:
	
l1263:
	movf	((c:MODBUS_RW@FC))^00h,c,w
xorwf	(0+((c:32)+01h))^00h,c,w
	btfss	status,2
	goto	u311
	goto	u310

u311:
	goto	l1269
u310:
	line	98
	
l1265:
;MODBUS_RTU_APLC.c: 97: {;MODBUS_RTU_APLC.c: 98: return 0x0200;
	movlw	high(0200h)
	movwf	((c:?_MODBUS_RW+1))^00h,c
	movlw	low(0200h)
	movwf	((c:?_MODBUS_RW))^00h,c
	goto	l199
	line	100
	
l1269:
;MODBUS_RTU_APLC.c: 99: };MODBUS_RTU_APLC.c: 100: if(FC == 0x05 || FC == 0x06)
		movlw	5
	xorwf	((c:MODBUS_RW@FC))^00h,c,w
	btfsc	status,2
	goto	u321
	goto	u320

u321:
	goto	l1273
u320:
	
l1271:
		movlw	6
	xorwf	((c:MODBUS_RW@FC))^00h,c,w
	btfss	status,2
	goto	u331
	goto	u330

u331:
	goto	l204
u330:
	line	102
	
l1273:
;MODBUS_RTU_APLC.c: 101: {;MODBUS_RTU_APLC.c: 102: if(CRC != CRC_s)
	movf	((c:MODBUS_RW@CRC_s))^00h,c,w
xorwf	((c:MODBUS_RW@CRC))^00h,c,w
	bnz	u340
movf	((c:MODBUS_RW@CRC_s+1))^00h,c,w
xorwf	((c:MODBUS_RW@CRC+1))^00h,c,w
	btfsc	status,2
	goto	u341
	goto	u340

u341:
	goto	l204
u340:
	line	104
	
l1275:
;MODBUS_RTU_APLC.c: 103: {;MODBUS_RTU_APLC.c: 104: return 0x0300;
	movlw	high(0300h)
	movwf	((c:?_MODBUS_RW+1))^00h,c
	movlw	low(0300h)
	movwf	((c:?_MODBUS_RW))^00h,c
	goto	l199
	line	106
	
l204:
	line	108
;MODBUS_RTU_APLC.c: 105: };MODBUS_RTU_APLC.c: 106: };MODBUS_RTU_APLC.c: 108: return C_byte;
	movff	(c:MODBUS_RW@C_byte),(c:?_MODBUS_RW)
	movff	(c:MODBUS_RW@C_byte+1),(c:?_MODBUS_RW+1)
	line	109
	
l199:
	return	;funcret
	callstack 0
GLOBAL	__end_of_MODBUS_RW
	__end_of_MODBUS_RW:
	signat	_MODBUS_RW,16506
	global	_MODBUS_TX

;; *************** function _MODBUS_TX *****************
;; Defined at:
;;		line 4 in file "MODBUS_RTU_APLC.c"
;; Parameters:    Size  Location     Type
;;  M_size          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  M_size          1    0[COMRAM] unsigned char 
;;  i               1    1[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MODBUS_RW
;; This function uses a non-reentrant model
;;
psect	text5,class=CODE,space=0,reloc=2,group=0
	line	4
global __ptext5
__ptext5:
psect	text5
	file	"MODBUS_RTU_APLC.c"
	line	4
	global	__size_of_MODBUS_TX
	__size_of_MODBUS_TX	equ	__end_of_MODBUS_TX-_MODBUS_TX
	
_MODBUS_TX:
;incstack = 0
	callstack 28
;MODBUS_TX@M_size stored from wreg
	movwf	((c:MODBUS_TX@M_size))^00h,c
	line	8
	
l1149:
;MODBUS_RTU_APLC.c: 6: uint8_t i;;MODBUS_RTU_APLC.c: 8: T0CON = 0b00000111;
	movlw	low(07h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	9
	
l1151:
;MODBUS_RTU_APLC.c: 9: INTCONbits.TMR0IF = 0;
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	10
;MODBUS_RTU_APLC.c: 10: TMR0L = (uint8_t)((0x10000 - ( 500 * 48000000/1024000))&0x00FF);
	movlw	low(0C0h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	11
;MODBUS_RTU_APLC.c: 11: TMR0H = (uint8_t)((0x10000 - ( 500 * 48000000/1024000))>>8);
	movlw	low(06h)
	movwf	((c:4055))^0f00h,c	;volatile
	line	12
	
l1153:
;MODBUS_RTU_APLC.c: 12: T0CONbits.TMR0ON = 1;
	bsf	((c:4053))^0f00h,c,7	;volatile
	line	13
;MODBUS_RTU_APLC.c: 13: while(INTCONbits.TMR0IF==0);
	
l177:
	btfss	((c:4082))^0f00h,c,2	;volatile
	goto	u191
	goto	u190
u191:
	goto	l177
u190:
	
l179:
	line	14
;MODBUS_RTU_APLC.c: 14: INTCONbits.TMR0IF = 0;
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	15
;MODBUS_RTU_APLC.c: 15: T0CONbits.TMR0ON = 0;
	bcf	((c:4053))^0f00h,c,7	;volatile
	line	17
	
l1155:
;MODBUS_RTU_APLC.c: 17: for(i=0;i<M_size;++i)
	movlw	low(0)
	movwf	((c:MODBUS_TX@i))^00h,c
	goto	l1161
	line	19
	
l1157:
;MODBUS_RTU_APLC.c: 18: {;MODBUS_RTU_APLC.c: 19: TXREG=M_ADU[i];
	movlw	low(32)
	addwf	((c:MODBUS_TX@i))^00h,c,w
	movwf	c:fsr2l
	clrf	1+c:fsr2l
	movlw	high(32)
	addwfc	1+c:fsr2l
	movf	indf2,w
	movwf	((c:4013))^0f00h,c	;volatile
	line	20
;MODBUS_RTU_APLC.c: 20: while(PIR1bits.TXIF == 0);
	
l182:
	btfss	((c:3998))^0f00h,c,4	;volatile
	goto	u201
	goto	u200
u201:
	goto	l182
u200:
	
l184:
	line	21
;MODBUS_RTU_APLC.c: 21: PIR1bits.TXIF = 0;
	bcf	((c:3998))^0f00h,c,4	;volatile
	line	17
	
l1159:
	incf	((c:MODBUS_TX@i))^00h,c
	
l1161:
		movf	((c:MODBUS_TX@M_size))^00h,c,w
	subwf	((c:MODBUS_TX@i))^00h,c,w
	btfss	status,0
	goto	u211
	goto	u210

u211:
	goto	l1157
u210:
	line	23
	
l186:
	return	;funcret
	callstack 0
GLOBAL	__end_of_MODBUS_TX
	__end_of_MODBUS_TX:
	signat	_MODBUS_TX,4217
	global	_MODBUS_RX

;; *************** function _MODBUS_RX *****************
;; Defined at:
;;		line 25 in file "MODBUS_RTU_APLC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    0[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MODBUS_RW
;; This function uses a non-reentrant model
;;
psect	text6,class=CODE,space=0,reloc=2,group=0
	line	25
global __ptext6
__ptext6:
psect	text6
	file	"MODBUS_RTU_APLC.c"
	line	25
	global	__size_of_MODBUS_RX
	__size_of_MODBUS_RX	equ	__end_of_MODBUS_RX-_MODBUS_RX
	
_MODBUS_RX:
;incstack = 0
	callstack 28
	line	27
	
l1163:
;MODBUS_RTU_APLC.c: 27: uint8_t i=0;
	movlw	low(0)
	movwf	((c:MODBUS_RX@i))^00h,c
	line	32
;MODBUS_RTU_APLC.c: 32: T0CON = 0b00000111;
	movlw	low(07h)
	movwf	((c:4053))^0f00h,c	;volatile
	line	35
	
l1165:
;MODBUS_RTU_APLC.c: 35: INTCONbits.TMR0IF = 0;
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	36
;MODBUS_RTU_APLC.c: 36: TMR0L = (uint8_t)((0x10000 - ( 500 * 48000000/1024000))&0x00FF);
	movlw	low(0C0h)
	movwf	((c:4054))^0f00h,c	;volatile
	line	37
;MODBUS_RTU_APLC.c: 37: TMR0H = (uint8_t)((0x10000 - ( 500 * 48000000/1024000))>>8);
	movlw	low(06h)
	movwf	((c:4055))^0f00h,c	;volatile
	line	38
	
l1167:
;MODBUS_RTU_APLC.c: 38: T0CONbits.TMR0ON = 1;
	bsf	((c:4053))^0f00h,c,7	;volatile
	line	40
;MODBUS_RTU_APLC.c: 40: while(INTCONbits.TMR0IF == 0 && i < 20)
	goto	l1181
	
l190:
	line	48
;MODBUS_RTU_APLC.c: 41: {;MODBUS_RTU_APLC.c: 48: if(PIR1bits.RCIF == 1)
	btfss	((c:3998))^0f00h,c,5	;volatile
	goto	u221
	goto	u220
u221:
	goto	l1181
u220:
	line	50
	
l1169:
;MODBUS_RTU_APLC.c: 49: {;MODBUS_RTU_APLC.c: 50: M_ADU[i++]=RCREG;
	movlw	low(32)
	addwf	((c:MODBUS_RX@i))^00h,c,w
	movwf	c:fsr2l
	clrf	1+c:fsr2l
	movlw	high(32)
	addwfc	1+c:fsr2l
	movff	(c:4014),indf2	;volatile

	
l1171:
	incf	((c:MODBUS_RX@i))^00h,c
	line	51
	
l1173:
;MODBUS_RTU_APLC.c: 51: PIR1bits.RCIF = 0;
	bcf	((c:3998))^0f00h,c,5	;volatile
	line	52
	
l1175:
;MODBUS_RTU_APLC.c: 52: INTCONbits.TMR0IF = 0;
	bcf	((c:4082))^0f00h,c,2	;volatile
	line	53
	
l1177:
;MODBUS_RTU_APLC.c: 53: TMR0L = (uint8_t)((0x10000 - ( (11/9600)*3500 * 48000000/1024000))&0x00FF);
	movlw	low(0)
	movwf	((c:4054))^0f00h,c	;volatile
	line	54
	
l1179:
;MODBUS_RTU_APLC.c: 54: TMR0H = (uint8_t)((0x10000 - ( (11/9600)*3500 * 48000000/1024000))>>8);
	movlw	low(0)
	movwf	((c:4055))^0f00h,c	;volatile
	line	40
	
l1181:
	btfsc	((c:4082))^0f00h,c,2	;volatile
	goto	u231
	goto	u230
u231:
	goto	l194
u230:
	
l1183:
		movlw	014h-1
	cpfsgt	((c:MODBUS_RX@i))^00h,c
	goto	u241
	goto	u240

u241:
	goto	l190
u240:
	
l194:
	line	61
;MODBUS_RTU_APLC.c: 55: };MODBUS_RTU_APLC.c: 56: };MODBUS_RTU_APLC.c: 61: T0CONbits.TMR0ON = 0;
	bcf	((c:4053))^0f00h,c,7	;volatile
	line	62
	
l1185:
;MODBUS_RTU_APLC.c: 62: return i;
	movf	((c:MODBUS_RX@i))^00h,c,w
	line	63
	
l195:
	return	;funcret
	callstack 0
GLOBAL	__end_of_MODBUS_RX
	__end_of_MODBUS_RX:
	signat	_MODBUS_RX,89
	global	_CRC_calc

;; *************** function _CRC_calc *****************
;; Defined at:
;;		line 111 in file "MODBUS_RTU_APLC.c"
;; Parameters:    Size  Location     Type
;;  size            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  size            1    9[COMRAM] unsigned char 
;;  CRC             2   12[COMRAM] unsigned int 
;;  j               1   11[COMRAM] unsigned char 
;;  i               1   10[COMRAM] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMRAM] unsigned int 
;; Registers used:
;;		wreg, fsr2l, fsr2h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         2       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         5       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          7       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:        14       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MODBUS_RW
;; This function uses a non-reentrant model
;;
psect	text7,class=CODE,space=0,reloc=2,group=0
	line	111
global __ptext7
__ptext7:
psect	text7
	file	"MODBUS_RTU_APLC.c"
	line	111
	global	__size_of_CRC_calc
	__size_of_CRC_calc	equ	__end_of_CRC_calc-_CRC_calc
	
_CRC_calc:
;incstack = 0
	callstack 28
;CRC_calc@size stored from wreg
	movwf	((c:CRC_calc@size))^00h,c
	line	113
	
l1189:
;MODBUS_RTU_APLC.c: 113: uint16_t CRC = 0xFFFF;
	setf	((c:CRC_calc@CRC))^00h,c
	setf	((c:CRC_calc@CRC+1))^00h,c
	line	116
	
l1191:
;MODBUS_RTU_APLC.c: 114: uint8_t i,j;;MODBUS_RTU_APLC.c: 116: for(i = 0; i < size ;++i)
	movlw	low(0)
	movwf	((c:CRC_calc@i))^00h,c
	goto	l1209
	line	118
	
l1193:
;MODBUS_RTU_APLC.c: 117: {;MODBUS_RTU_APLC.c: 118: CRC = (CRC & 0xFF00) | ( (CRC ^ M_ADU[i]) & 0x00FF);
	movlw	low(0FF00h)
	movwf	(??_CRC_calc+0+0)^00h,c
	movlw	high(0FF00h)
	movwf	1+(??_CRC_calc+0+0)^00h,c
	movff	(c:CRC_calc@CRC),??_CRC_calc+2+0
	movff	(c:CRC_calc@CRC+1),??_CRC_calc+2+0+1
	movf	(??_CRC_calc+0+0)^00h,c,w
	andwf	(??_CRC_calc+2+0)^00h,c
	movf	(??_CRC_calc+0+1)^00h,c,w
	andwf	(??_CRC_calc+2+1)^00h,c
	movlw	low(32)
	addwf	((c:CRC_calc@i))^00h,c,w
	movwf	c:fsr2l
	clrf	1+c:fsr2l
	movlw	high(32)
	addwfc	1+c:fsr2l
	movf	indf2,w
	movwf	(??_CRC_calc+4+0)^00h,c
	movf	((??_CRC_calc+4+0))^00h,c,w
	xorwf	((c:CRC_calc@CRC))^00h,c,w
	movwf	(??_CRC_calc+5+0)^00h,c
	movlw	0
	xorwf	((c:CRC_calc@CRC+1))^00h,c,w
	movwf	(??_CRC_calc+5+0+1)^00h,c
	movf	(??_CRC_calc+5+0)^00h,c,w
	iorwf	(??_CRC_calc+2+0)^00h,c,w
	movwf	((c:CRC_calc@CRC))^00h,c
	movf	(??_CRC_calc+2+1)^00h,c,w
	movwf	1+((c:CRC_calc@CRC))^00h,c
	line	119
	
l1195:
;MODBUS_RTU_APLC.c: 119: for(j = 0; j<8; ++j)
	movlw	low(0)
	movwf	((c:CRC_calc@j))^00h,c
	line	120
	
l212:
	line	121
;MODBUS_RTU_APLC.c: 120: {;MODBUS_RTU_APLC.c: 121: if(CRC & 0x0001)
	
	btfss	((c:CRC_calc@CRC))^00h,c,(0)&7
	goto	u251
	goto	u250
u251:
	goto	l1203
u250:
	line	123
	
l1201:
;MODBUS_RTU_APLC.c: 122: {;MODBUS_RTU_APLC.c: 123: CRC = (CRC>>1)^ 0xA001;
	bcf	status,0
	rrcf	((c:CRC_calc@CRC+1))^00h,c,w
	movwf	(??_CRC_calc+0+0+1)^00h,c
	rrcf	((c:CRC_calc@CRC))^00h,c,w
	movwf	(??_CRC_calc+0+0)^00h,c
	movlw	01h
	xorwf	(??_CRC_calc+0+0)^00h,c,w
	movwf	((c:CRC_calc@CRC))^00h,c
	movlw	0A0h
	xorwf	(??_CRC_calc+0+1)^00h,c,w
	movwf	1+((c:CRC_calc@CRC))^00h,c
	line	124
;MODBUS_RTU_APLC.c: 124: }
	goto	l215
	line	125
	
l1203:
;MODBUS_RTU_APLC.c: 125: else CRC>>=1;
	bcf	status,0
	rrcf	((c:CRC_calc@CRC+1))^00h,c
	rrcf	((c:CRC_calc@CRC))^00h,c
	
l215:
	line	119
	incf	((c:CRC_calc@j))^00h,c
	
l1205:
		movlw	08h-1
	cpfsgt	((c:CRC_calc@j))^00h,c
	goto	u261
	goto	u260

u261:
	goto	l212
u260:
	line	116
	
l1207:
	incf	((c:CRC_calc@i))^00h,c
	
l1209:
		movf	((c:CRC_calc@size))^00h,c,w
	subwf	((c:CRC_calc@i))^00h,c,w
	btfss	status,0
	goto	u271
	goto	u270

u271:
	goto	l1193
u270:
	
l216:
	line	128
;MODBUS_RTU_APLC.c: 126: };MODBUS_RTU_APLC.c: 127: };MODBUS_RTU_APLC.c: 128: return CRC;
	movff	(c:CRC_calc@CRC),(c:?_CRC_calc)
	movff	(c:CRC_calc@CRC+1),(c:?_CRC_calc+1)
	line	130
	
l217:
	return	;funcret
	callstack 0
GLOBAL	__end_of_CRC_calc
	__end_of_CRC_calc:
	signat	_CRC_calc,4218
	global	_config

;; *************** function _config *****************
;; Defined at:
;;		line 6 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		_USART_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text8,class=CODE,space=0,reloc=2,group=0
	file	"main.c"
	line	6
global __ptext8
__ptext8:
psect	text8
	file	"main.c"
	line	6
	global	__size_of_config
	__size_of_config	equ	__end_of_config-_config
	
_config:
;incstack = 0
	callstack 28
	line	8
	
l1299:; BSR set to: 1

;main.c: 8: USART_init();;
	call	_USART_init	;wreg free
	line	9
	
l15:
	return	;funcret
	callstack 0
GLOBAL	__end_of_config
	__end_of_config:
	signat	_config,89
	global	_USART_init

;; *************** function _USART_init *****************
;; Defined at:
;;		line 48 in file "AutoPLC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, cstack
;; Tracked objects:
;;		On entry : 3F/1
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		_USART_ON
;; This function is called by:
;;		_config
;; This function uses a non-reentrant model
;;
psect	text9,class=CODE,space=0,reloc=2,group=0
	file	"AutoPLC.c"
	line	48
global __ptext9
__ptext9:
psect	text9
	file	"AutoPLC.c"
	line	48
	global	__size_of_USART_init
	__size_of_USART_init	equ	__end_of_USART_init-_USART_init
	
_USART_init:
;incstack = 0
	callstack 28
	line	51
	
l1211:; BSR set to: 1

;AutoPLC.c: 51: BAUDCONbits.BRG16 = 1;
	bsf	((c:4024))^0f00h,c,3	;volatile
	line	52
;AutoPLC.c: 52: TXSTAbits.SYNC = 0;
	bcf	((c:4012))^0f00h,c,4	;volatile
	line	53
;AutoPLC.c: 53: TXSTAbits.BRGH = 0;
	bcf	((c:4012))^0f00h,c,2	;volatile
	line	54
	
l1213:; BSR set to: 1

;AutoPLC.c: 54: SPBRG = (uint8_t)((((48000000/9600)/16)-1) & 0x00FF);
	movlw	low(037h)
	movwf	((c:4015))^0f00h,c	;volatile
	line	55
;AutoPLC.c: 55: SPBRGH = (uint8_t)((((48000000/9600)/16)-1) >> 8);
	movlw	low(01h)
	movwf	((c:4016))^0f00h,c	;volatile
	line	70
	
l1215:; BSR set to: 1

;AutoPLC.c: 70: TRISCbits.RC6 = 0;
	bcf	((c:3988))^0f00h,c,6	;volatile
	line	71
	
l1217:; BSR set to: 1

;AutoPLC.c: 71: TXSTAbits.TXEN = 1;
	bsf	((c:4012))^0f00h,c,5	;volatile
	line	72
	
l1219:; BSR set to: 1

;AutoPLC.c: 72: RCSTAbits.CREN = 1;
	bsf	((c:4011))^0f00h,c,4	;volatile
	line	73
	
l1221:; BSR set to: 1

;AutoPLC.c: 73: USART_ON();
	call	_USART_ON	;wreg free
	line	74
	
l102:
	return	;funcret
	callstack 0
GLOBAL	__end_of_USART_init
	__end_of_USART_init:
	signat	_USART_init,89
	global	_USART_ON

;; *************** function _USART_ON *****************
;; Defined at:
;;		line 35 in file "AutoPLC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_USART_init
;;		_REF_DIO
;; This function uses a non-reentrant model
;;
psect	text10,class=CODE,space=0,reloc=2,inline,group=0
	line	35
global __ptext10
__ptext10:
psect	text10
	file	"AutoPLC.c"
	line	35
	global	__size_of_USART_ON
	__size_of_USART_ON	equ	__end_of_USART_ON-_USART_ON
	
_USART_ON:
;incstack = 0
	callstack 28
	line	37
	
l1145:
;AutoPLC.c: 37: TRISCbits.RC7 = 1;
	bsf	((c:3988))^0f00h,c,7	;volatile
	line	38
;AutoPLC.c: 38: LATDbits.LATD4 = 0;
	bcf	((c:3980))^0f00h,c,4	;volatile
	line	39
;AutoPLC.c: 39: RCSTAbits.SPEN = 1;
	bsf	((c:4011))^0f00h,c,7	;volatile
	line	40
	
l96:
	return	;funcret
	callstack 0
GLOBAL	__end_of_USART_ON
	__end_of_USART_ON:
	signat	_USART_ON,89
	global	_REG_CONFIG

;; *************** function _REG_CONFIG *****************
;; Defined at:
;;		line 272 in file "AutoPLC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 3F/1
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text11,class=CODE,space=0,reloc=2,inline,group=0
	line	272
global __ptext11
__ptext11:
psect	text11
	file	"AutoPLC.c"
	line	272
	global	__size_of_REG_CONFIG
	__size_of_REG_CONFIG	equ	__end_of_REG_CONFIG-_REG_CONFIG
	
_REG_CONFIG:
;incstack = 0
	callstack 30
	line	274
	
l1139:
;AutoPLC.c: 274: ADCON1 = 0b00010101;
	movlw	low(015h)
	movwf	((c:4033))^0f00h,c	;volatile
	line	275
;AutoPLC.c: 275: ADCON2 = 0b10000000;
	movlw	low(080h)
	movwf	((c:4032))^0f00h,c	;volatile
	line	277
;AutoPLC.c: 277: EAIN = 0b00000001011110111;
	movlw	high(02F7h)
	movlb	1	; () banked
	movwf	((486+1))&0ffh
	movlw	low(02F7h)
	movwf	((486))&0ffh
	line	278
;AutoPLC.c: 278: SAIN = 0x00;
	movlw	low(0)
	movwf	((481))&0ffh
	line	279
;AutoPLC.c: 279: DOUT = 0x00;
	movlw	low(0)
	movwf	((480))&0ffh
	line	280
;AutoPLC.c: 280: DIN = 0x00;
	movlw	low(0)
	movwf	((479))&0ffh
	line	281
	
l146:; BSR set to: 1

	return	;funcret
	callstack 0
GLOBAL	__end_of_REG_CONFIG
	__end_of_REG_CONFIG:
	signat	_REG_CONFIG,89
	global	_GPIO_CONFIG

;; *************** function _GPIO_CONFIG *****************
;; Defined at:
;;		line 258 in file "AutoPLC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:    COMRAMh COMRAMl   BANK0BANK1hhhBANK1hhl BANK1hl  BANK1l   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text12,class=CODE,space=0,reloc=2,inline,group=0
	line	258
global __ptext12
__ptext12:
psect	text12
	file	"AutoPLC.c"
	line	258
	global	__size_of_GPIO_CONFIG
	__size_of_GPIO_CONFIG	equ	__end_of_GPIO_CONFIG-_GPIO_CONFIG
	
_GPIO_CONFIG:; BSR set to: 1

;incstack = 0
	callstack 30
	line	260
	
l1129:
;AutoPLC.c: 260: LATA = 0xFF;
	setf	((c:3977))^0f00h,c	;volatile
	line	261
	
l1131:
;AutoPLC.c: 261: LATB = 0b00011101;
	movlw	low(01Dh)
	movwf	((c:3978))^0f00h,c	;volatile
	line	262
;AutoPLC.c: 262: LATC = 0xF3;
	movlw	low(0F3h)
	movwf	((c:3979))^0f00h,c	;volatile
	line	263
;AutoPLC.c: 263: LATD = 0x0F;
	movlw	low(0Fh)
	movwf	((c:3980))^0f00h,c	;volatile
	line	264
	
l1133:
;AutoPLC.c: 264: LATE = 0xFF;
	setf	((c:3981))^0f00h,c	;volatile
	line	266
	
l1135:
;AutoPLC.c: 266: TRISA = 0b11111111;
	setf	((c:3986))^0f00h,c	;volatile
	line	267
;AutoPLC.c: 267: TRISB = 0b00011100;
	movlw	low(01Ch)
	movwf	((c:3987))^0f00h,c	;volatile
	line	268
;AutoPLC.c: 268: TRISC = 0b00111000;
	movlw	low(038h)
	movwf	((c:3988))^0f00h,c	;volatile
	line	269
;AutoPLC.c: 269: TRISD = 0b00000000;
	movlw	low(0)
	movwf	((c:3989))^0f00h,c	;volatile
	line	270
	
l1137:
;AutoPLC.c: 270: TRISE = 0b11111111;
	setf	((c:3990))^0f00h,c	;volatile
	line	271
	
l143:
	return	;funcret
	callstack 0
GLOBAL	__end_of_GPIO_CONFIG
	__end_of_GPIO_CONFIG:
	signat	_GPIO_CONFIG,89
	GLOBAL	__activetblptr
__activetblptr	EQU	0
	psect	intsave_regs,class=BIGRAM,space=1,noexec
	PSECT	rparam,class=COMRAM,space=1,noexec
	GLOBAL	__Lrparam
	FNCONF	rparam,??,?
	GLOBAL	___rparam_used
	___rparam_used EQU 1
	GLOBAL	___param_bank
	___param_bank EQU 0
GLOBAL	__Lparam, __Hparam
GLOBAL	__Lrparam, __Hrparam
__Lparam	EQU	__Lrparam
__Hparam	EQU	__Hrparam
	end
