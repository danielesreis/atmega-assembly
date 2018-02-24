; assembly operations

ldi r16, 80
ldi r17, 10

ldi r28, $0
ldi r29, $1

add r16, r17
call save

sub r16, r17
call save

and r16, r17
call save

com r16
call save

rol r16
call save

save:
st Y, r16
inc r28

ldi r16, 80
ldi r17, 10
ret
