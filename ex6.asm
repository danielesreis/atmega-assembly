; generic timer

; register that stores delay in milliseconds
ldi r18, 50
clr r19
clr r20

loop:

call loop1
clr r19

subi r18, 1
cpi r18, 0
brne loop
nop

loop1:
inc r19
clr r20

loop2:
inc r20
cpi r20, 249
brne loop2

cpi r19, 16
brne loop1
ret

nop