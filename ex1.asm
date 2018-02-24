clr r15
clr r17
clr r18
clr r19
ldi r16, 0x20
out DDRB, r16

start:
out PORTB, r16
call loop500
out PORTB, r15

call loop500
rjmp start

loop500:

loop3:
inc r19
clr r17
clr r18

loop2:
inc r18
clr r17

loop1:
inc r17
cpi r17, 150
brne loop1

cpi r18, 115
brne loop2

cpi r19, 115
brne loop3

ret


