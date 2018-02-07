; 500 ms blinking interval

start:
clr r16 
clr r17
clr r18
clr r19

ldi r16, 0x20
out DDRB, r16

loop:
; setando PB5
out PORTB, r16

call loop500

; resetando PB5
ldi r16, 0x00
out PORTB, r16
rjmp loop

loop500:

loop1:
inc r17

loop2:
inc r18

loop3:
inc r19
cpi r19, 150
brne loop3

cpi r18, 110
brne loop2

cpi r17, 31
brne loop1

ret
