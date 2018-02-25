ldi r16, 0b01111100
out DDRD, r16
ldi r16, 0b00000011
out DDRB, r16

start:
call disp0
call loop100
call disp1
call loop100
call disp2
call loop100
call disp3
call loop100
call disp4
call loop100
call disp5
call loop100
call disp6
call loop100
call disp7
call loop100
call disp8
call loop100
call disp9
call loop100

rjmp start

loop100:
inc r18
clr r19

loop:
inc r19
clr r20

loop2:
inc r20
cpi r20, 255
brne loop2

cpi r19, 223 
brne loop

cpi r18, 7
brne loop100
ret

disp0:
ldi r17, 0b11000011
out portd, r17
ldi r17, 0b11000000
out portb, r17
ret

disp1:
ldi r17, 0b11111011
out portd, r17
ldi r17, 0b11111101
out portb, r17
ret

disp2:
ldi r17, 0b10100111
out portd, r17
ldi r17, 0b10100100
out portb, r17
ret

disp3:
ldi r17, 0b10110011
out portd, r17
ldi r17, 0b10110000
out portb, r17
ret

disp4:
ldi r17, 0b10011011
out portd, r17
ldi r17, 0b10011001
out portb, r17
ret

disp5:
ldi r17, 0b10010011
out portd, r17
ldi r17, 0b10010010
out portb, r17
ret

disp6:
ldi r17, 0b10000011
out portd, r17
ldi r17, 0b10000010
out portb, r17
ret

disp7:
ldi r17, 0b11111011
out portd, r17
ldi r17, 0b11111000
out portb, r17
ret

disp8:
ldi r17, 0b10000011
out portd, r17
ldi r17, 0b10000000
out portb, r17
ret

disp9:
ldi r17, 0b10011011
out portd, r17
ldi r17, 0b10011000
out portb, r17
ret
