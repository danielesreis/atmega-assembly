ldi r16, 0x40
out DDRD, r16

ldi r16, 0x02
sts TIMSK0, r16

sei

ldi r16, 0x07
out TIFR0, r16 

ldi r21, 0x40
ldi r22, 0x02

clr r16
out PORTD, r16
out TCNT0, r16
out OCR0A, r16

ldi r16, 0x83
out TCCR0A, r16

ldi r16, 0x05
out TCCR0B, r16

loop:

sbic TIFR0, 1
call setup
rjmp loop	

setup:
out TIFR0, r22
in r23, OCR0A
inc r23
cpi r23, 255
breq mod

continue:
out OCR0A, r23

toggle:
in r17, PORTD
mov r20, r21

eor r21, r17
out PORTD, r21
mov r21, r20
ret

mod:
ldi r23, 0
rjmp continue