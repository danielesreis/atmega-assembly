ldi r16, 0x20
out DDRB, r16

ldi r16, 0x07
out TIFR0, r16

ldi r16, 0x00
out PORTB, r16
out TCNT0, r16
out TCCR0A, r16

ldi r16, 0x05
out TCCR0B, r16

ldi r19, 0x01
ldi r16, 0x20
clr r20

loop:
ldi r21, 49

loop2:
no_overflow: 
sbis TIFR0, 0
rjmp no_overflow

out TIFR0, r19
out TCNT0, r20

dec r21
cpi r21, 0
brne loop2

in r17, PORTB
mov r18, r16

eor r16, r17
out PORTB, r16
mov r16, r18

rjmp loop

