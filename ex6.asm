; PORTB exercises

ldi r16, 0b01010101
ldi r17, 0b00000000
out DDRB, r16

start:
out PORTB, r17
call loop
clr r18
out PORTB, r16
call loop
clr r18
rjmp start

loop:
inc r18
clr r19

loop2:
inc r19
clr r20

loop3:
inc r20
cpi r20, 255
brne loop3

cpi r19, 223
brne loop2

cpi r18, 7
brne loop
ret
