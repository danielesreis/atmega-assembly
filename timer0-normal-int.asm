ldi r16, 0x20
out DDRB, r16

ldi r16, 0x07
out TIFR0, r16 

ldi r16, 0x01
sts TIMSK0, r16

ldi r21, 0x20
ldi r22, 0x01

sei

clr r16
out PORTB, r16
out TCNT0, r16
out TCCR0A, r16

ldi r16, 0x01
out TCCR0B, r16

loop:

sbic TIFR0, 0
call toggle
rjmp loop	

toggle:
out TIFR0, r22

in r17, PORTB
mov r20, r21

eor r21, r17
out PORTB, r21
mov r21, r20
ret