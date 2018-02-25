clr r16
ldi r17, 4

clr r18
clr r19
clr r20
clr r21

ldi r28, $11
clr r29  

start:
inc r28
ld r16, Y

sum:
inc r16
cpi r16, 255
brne sum

dec r17
cpi r17, 0
brne start

nop
