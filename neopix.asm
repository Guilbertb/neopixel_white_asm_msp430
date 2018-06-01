.include "msp430g2553.inc"

.msp430

.org 0xC000

start:
mov.w #WDTPW|WDTHOLD, &WDTCTL
;calibration 16Mh
mov.b &CALBC1_16MHZ, &BCSCTL1
mov.b &CALDCO_16MHZ, &DCOCTL



mov.b #0x01, &P2DIR
mov.b #0x00, &P2OUT

neo1:
mov #8 , R8
mov #3 , R7
bcl:
bis.b  #0x01, &P2OUT   ; mise a 1
nop 
nop
nop
nop
nop
nop
nop
nop

bic.b  #0x01, &P2OUT   ; mise a 0
nop
nop

dec R8
jnz bcl

;mov  #1,R6
;tmp1:
;dec R6
;jnz tmp1

dec R7
jnz bcl


bl:
mov #6000,R9
tmp:
dec R9
jnz tmp


jmp neo1 

.org 0xFFFE
dw start





