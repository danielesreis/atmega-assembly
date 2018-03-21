#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

void serial(char s);

int main(void)
{
	uint16_t data;
	uint8_t datal, datah;
	float t; 
	int temp;
	int d, r;
	
	
	ADMUX = 0b00000000;
	ADCSRA = 0b10000111;
	ADCSRB = 0b00000000;
	//DIDR0 = 0x01;
	
	UCSR0A = 0b01000000;
	UCSR0B = 0b00011000;
	UCSR0C = 0b00000110;
	UBRR0H = 0b00000000;
	UBRR0L = 0b01100111;
	
    while(1)
	{
		_delay_ms(1000);	
		ADCSRA = ADCSRA | 0x40;
		
		while((ADCSRA & 0x10) != 0x10) {}
		datal = ADCL;
		datah = ADCH;
		
		ADCSRA = ADCSRA | 0x10; //tentar com ADCSRA = 0x10
		
		data = (datah << 8) | datal;
		
		data = 900;
		t = ((float)(data*5)/1023);
		t = t*100;
		temp = t * 10;
		
		d = temp/1000;
		r = temp%1000;
		serial(d + 48);
		
		d = r/100;
		r = r%100;
		serial(d + 48);
		
		d = r%10;
		r = r%10;
		serial(d + 48);
		serial(',');
		serial(r + 48);
		serial(10);
	}
}

void serial(char s)
{
	_delay_ms(100);
	while((UCSR0A & 0x20) != 0x20) {}
	UDR0 = s;
	
	while((UCSR0A & 0x40) != 0x40) {}
	UCSR0A = 0x40;
}

