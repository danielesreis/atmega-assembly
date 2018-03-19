#include <avr/io.h>
#define F_CPU 16000000UL


int main(void)
{
	int i;
	DDRB = 0x20;
	
	TIFR0 = 0x07;
	PORTB = 0x00;
	TCNT0 = 0x00;
	
	TCCR0A = 0x00;
	TCCR0B = 0b00000101;
    
    while (1) 
    {
		for (i=0; i<49; i++)
		{
			while((TIFR0 & 0x01) != 0x01) {}
			TIFR0 = 0x01;
			TCNT0 = 0x00;	
		}
		PORTB ^= (1<<PB5);
    }
}

