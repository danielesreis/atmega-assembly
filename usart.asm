clr r16
sts UBRR0H, r16

ldi r16, 103
sts UBRR0L, r16

ldi r16, 64
sts UCSR0A, r16

ldi r16, 6
sts UCSR0C, r16

loop:

no_data:
;UCSR0A address = 0xC0
ldi r28, 0xC0
clr r29
ld r20, Y

sbrs r20, 7
rjmp no_data

;UDR0 address = 0xC6
ldi r28, 0xC6
ld r17, Y

tx_available:
ldi r28, 0xC0
ld r20,Y

sbrs r20, 5
rjmp tx_available

ldi r28, 0xC6
st Y, r17

transmission_ok:
ldi r28, 0xC0
ld r20,Y

sbrs r20, 6
rjmp transmission_ok

ldi r18, 0x40
sts UCSR0A, r18

rjmp loop