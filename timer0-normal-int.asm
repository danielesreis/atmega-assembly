ldi r16, 32
out DDRB, r16

ldi r16, 7
out TIFR0, r16 

ldi r16, 1
out TIMSK0, r16

sei

clr r16
out PORTB, r16
out TCNT0, r16
out TCCR0A, r16

ldi r16, 5
out TCCR0B, r16