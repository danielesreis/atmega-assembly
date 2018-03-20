ldi r16, 64
out DDRD, r16

clr r16
out PORTD, r16
out TCNT0, r16

ldi r16, 42
out TCCR0A, r16

ldi r16, 1
out TCCR0B, r16

ldi r22, 255
out OCR0A, r22

ldi r16, 7
out TIFR0, r16

ldi r16, 0x02
sts TIMSK0, r16

sei

ldi r19, 0x40

loop:

no_overflow:
sbis TIFR0, 1
rjmp no_overflow

ldi r16, 2
out TIFR0, r16

in r16, OCR0A
dec r16
cpi r16, 0
breq set_255

continue:
out OCR0A, r16

rjmp toggle

set_255:
mov r16, r22
rjmp continue

toggle:
mov r20, r19
in r21, PORTD
eor r19, r21
out PORTD, r19
mov r19, r21
rjmp loop