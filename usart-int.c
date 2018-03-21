#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

ISR(USART_RX_vect)
{
	char data;
	data = UDR0;
	
	while((UCSR0A & 0x20) != 0x20) {}
	UDR0 = data;
	
	while((UCSR0A & 0x40) != 0x40) {}
	UCSR0A = 0x40;
}

int main(void)
{
	UCSR0A = 0b01000000;
	UCSR0B = 0b10011000;
	UCSR0C = 0b00000110;
	
	UBRR0H = 0b00000000;
	UBRR0L = 0b01100111;
	
	sei();
	
    while(1)
	{
		
	}
}

