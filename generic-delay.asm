; generic delay

clr r16
clr r17
; registers quantity
ldi r27, 4

; the sum of these values correspond to the desired delay in milliseconds
ldi r20, 4
ldi r21, 12
ldi r22, 1
ldi r23, 1

; stores r20 address into Y register
ldi r28, $14
clr r29

; stores r20 content into r19 
ld r19, Y+

start:
; checks if all 4 registers were already analyzed
cpi r27, 0
; if yes, exit application
breq end
clr r18

; checks if the current register content equals to zero
sub r18, r19
; if yes, jump to the next register content and decrement r27
breq next

loop:

continue:
; loop1 generates 16000 clock cycles
call loop1
clr r16

; decrement r19 
subi r19, 1
; if r19 now equals to zero, decrement r27 and get next register value. otherwise, go back to loop 
cpi r19, 0
brne loop

subi r27, 1
cpi r27, 0

ld r19, Y+
; if r27 equals to zero, jump to end
brne start

rjmp end

loop1:
inc r16
clr r17

loop2:
inc r17
cpi r17, 249
brne loop2

cpi r16, 16
brne loop1
ret

next:
ld r19, Y+
subi r27, 1
rjmp start

end:
nop