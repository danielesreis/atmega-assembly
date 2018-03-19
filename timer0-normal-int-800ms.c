#include <avr/io.h>
#include <avr/interrupt.h>
#define F_CPU 16000000UL

/*ISR(TIMER0_OVF_vect)
{
	PORTB^=(1 << PB5);
}*/

int main(void)
{
	int i;
			
	DDRB = 0b00100000;
	PORTB = 0b00000000;
	
	TIMSK0 = 0b00000001;
	sei();
		
	TCCR0A = 0b00000000;
	TCCR0B = 0b00000001;
	
    /* Replace with your application code */
    while (1) 
    {
	    for(i=0; i<49; i++)
	    {
		    while((TIFR0 & 0x01) != 0x01) {}
		    TIFR0 = 0b00000111;
		    TCNT0 = 0b00000000;
	    }
		PORTB^=(1 << PB5);
	}
}

