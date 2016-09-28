/*
 * 	timer.c
 *
 *  Created on: 25 sep. 2016
 *  Author: Rick Kock en Arther vd Berg
 */

#include "timer.h"

#define CT16B0 			0x4000C000
#define NVIC  			0xE000E000
#define SYSAHBCLKCTRL 	(*(unsigned int*) 0x40048080)
#define TMR16B0MR0 		(*(unsigned int*) (0x018 + CT16B0))
#define TMR16B0MCR 		(*(unsigned int*) (0x014 + CT16B0))
#define TMR16B0TC  		(*(unsigned int*) (0x008 + CT16B0))
#define TMR16B0TCR 		(*(unsigned int*) (0x004 + CT16B0))
#define TMR16B0IR  		(*(unsigned int*) (0x000 + CT16B0))
#define TMR16B0PR  		(*(unsigned int*) (0x00C + CT16B0))
#define ISER1	   		(*(unsigned int*) (0x104 + NVIC))

void timerInit(unsigned long prescaleValue);

void timerMicrosInit(void) {
	timerInit(11);
}

void timerInit(unsigned long prescaleValue) {
	// Enables clock for 16-bit counter/timer 0
	SYSAHBCLKCTRL |= (1 << 7);
	// Set speed to which the TC will increment
	TMR16B0PR |= (prescaleValue-1);
}

// Timer Counter and Prescale Counter are enabled for counting.
void startTimer(void) {
	TMR16B0TCR |= 0x1;
}

// Get timer counter value
unsigned long timerRead(void) {
	return TMR16B0TC;
}

// Disables timer
void stopTimer(void) {
	TMR16B0TCR &= ~0x1;
}

void resetTimer(void) {
	// Synchronously reset timer
	TMR16B0TCR |= (1 << 1);
	// The counter remains reset until
	// returned to 0
	TMR16B0TCR &= ~(1 << 1);
}
