/*

Para alcançar 490 Hertz, utiliza-se Phase Correct PWM com prescaler = 64:
f = 16000000/(64*510) = 490 Hertz aproximadamente, com período igual a 2ms

*/

#define F_CPU 16000000UL
#include <avr/io.h>

int main()
{
	int i, inc = 13, mult = 2;

	TCCR0A = 0b10000001;						//OC0A é resetado na contagem crescente e setado na contagem decrescente
						 						//OC0B desconectado e TOP = 0xFF
	TCCR0B = 0b00000011;						//TOP = 0xFF, prescaler = 64
	TIFR0  = 0b00000111;						//zero as flags de compare match e overflow

	OCR0A  = 0b00000000;						//duty cicle iniciando em 0
	TCNT0  = 0b00000000;

	while(1) 
	{
		for(i = 0; i < 250*mult; i++)			//se o duty cicle estiver crescendo, então i vai até 500, resultando em 1s. 
		{										//se estiver diminuindo, vai até 250, para que alcance 500ms
			while((TIFR0 & 0x02) != 0x02) {}
			TIFR0 = 0x02;
		}

		OCR0A = OCR0A + inc;
		if (OCR0A >= 255)
		{
			inc = -25; 							//redução de 10% aproximadamente
			mult = 1;
		}
		else if (OCR0A <= 0)
		{
			inc = 13; 							//aumento de 5% aproximadamente
			mult = 2;
		}
	}

}