/*
 * 	leds.c
 *
 *  Created on: 25 sep. 2016
 *  Author: Rick Kock en Arther vd Berg
 */

#include "leds.h"

#define GPIO2		0x50020000
#define GPIO2DIR	(*(unsigned int *)(GPIO2 + 0x8000))
#define GPIO2DATA	(*(unsigned int *)(GPIO2 + 0x3FFC))

void clearLedWrite(void);

void ledsInit(void) {
	// Set first twelve bits as output.
	GPIO2DIR = 0xFFF;
}

void ledsWrite(unsigned char mask) {
	/* Avoid FET (bit 0) by shifting left.
	So, first bit must remain 0  to turn on leds.*/
	GPIO2DATA = ((~(mask << 1) & 0x1FE) | 0xE00);
}

void ledsWriteRGB(unsigned char rgb) {
	GPIO2DATA &= ((~rgb) << 9) | 0x1FF;
}
