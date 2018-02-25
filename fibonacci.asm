ldi r16, 10
ldi r17, 1
clr r18
clr r19

loop:
mov r19, r18
add r18, r17
mov r17, r19
dec r16
cpi r16, 0
brne loop

nop



