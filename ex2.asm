; storing 0 to memory addresses from 0x100 to 0x120 

;inicializo Y com o endereço 0100
ldi r28, $0
ldi r29, $1

start:
;carrego no endereço 0100 o que está contido em r26
;sts $100, r26

;carrego nos registradores o que está contido em Y
;ld r25, Y+
;ld r24, Y+
;ld r23, Y

;armazeno no endereço apontado por Y o que está em r26
st Y, r26
inc r28

cpi r28, 33
brne start

nop