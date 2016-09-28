/*
 * 	irSensor.c
 *
 *  Created on: 25 sep. 2016
 *  Author: Rick Kock en Arther vd Berg
 */

#include "irSensor.h"
#include "timer.h"

#define TOGGLE(bit)				((~bit) & 0x1)

#define GPIO0		0x50000000
#define ISER1 		(*(unsigned int*) 0xE000E104)
#define GPIO0DATA	(*(unsigned int*) (GPIO0 + 0x3FFC))
#define GPIO0DIR 	(*(unsigned int*) (GPIO0 + 0x8000))
#define GPIO0IC		(*(unsigned int*) (GPIO0 + 0x801C)) // interrupt clear
#define GPIO0IS 	(*(unsigned int*) (GPIO0 + 0x8004)) // Interrupt sense
#define GPIO0IBE 	(*(unsigned int*) (GPIO0 + 0x8008)) // Interrupt both edges
#define GPIO0IEV 	(*(unsigned int*) (GPIO0 + 0x800C)) // Interrupt event
#define GPIO0IE 	(*(unsigned int*) (GPIO0 + 0x8010)) // Interrupt mask
#define GPIO0RIS 	(*(unsigned int*) (GPIO0 + 0x8014)) // Raw interrupt status
#define GPIO0MIS 	(*(unsigned int*) (GPIO0 + 0x8018)) // Masked interrupt status
#define GPIO0IC 	(*(unsigned int*) (GPIO0 + 0x801C)) // Interrupt clear

unsigned volatile char cntBit = 0;
unsigned volatile char halfBit = 0;
unsigned int bufferData = 0;

void clearIrSensorInterrupt(void);
void irSensorAddBit(unsigned char value);
void receiveStartBit(void);
unsigned int getPreviousBit(unsigned char index, unsigned int byte);
void irSensorAddPreviousBit(void);
void irSensorAddToggleBit(void);
unsigned char reverseNibble(unsigned char byte);

void irSensorInit(void) {
	// Initialize a timer
	timerMicrosInit();
	// Set sensitivity to edge sensitive
	GPIO0IS &= ~(1 << 8);
	// Interrupt generated on both edges
	GPIO0IBE |= (1 << 8);
	// Interrupt is not masked
	GPIO0IE |= (1 << 8);
	// Enable interrupt on port 0
	ISER1 |= (1 << 24);
}

unsigned char getIrSensorValue(void) {
	return TOGGLE((GPIO0DATA & (1 << 8)) >> 8);
}

void PIOINT0_IRQHandler(void) {
	receiveStartBit();
	if (cntBit < 14) {
		/* Check to see if two sequential short pulses have
		 * been received. If so, add previous bit. */
		irSensorAddPreviousBit();

		/* Check to see if a long pulse has been received
		 * and whether the previous bit should be included.
		 * If so, add a toggle bit. */
		irSensorAddToggleBit();
		resetTimer();
	}
	clearIrSensorInterrupt();
}

void clearIrSensorInterrupt(void) {
	GPIO0IC = (1 << 8);

	// Sending 2 nops is recommended (p.136)
	asm("nop");
	asm("nop");
}

void irSensorAddBit(unsigned char value) {
	if (value == 1) {
		bufferData |= (1 << cntBit);
	} else {
		bufferData &= ~(1 << cntBit);
	}
}

/* If long pulse occurred, a toggle is expected.
 * If a short pulse (half a bit) occurred twice, the
 * previous pulse is expected. However, receiving the previous bit
 * (of the first interrupt) and a toggle bit may also occur.
 *
 * EXAMPLE:
 *        ______
 *       |      |
 *  ~889 |      |
 * ______|~889  |_
 * */
void irSensorAddPreviousBit(void) {
	if ((timerRead() >= 700) && (timerRead() <= 1100)) {

		// Half a bit has been received after 889 us
		halfBit++;

		// half bit + half bit = 1 bit
		if (halfBit == 2) {
			irSensorAddBit(getPreviousBit(cntBit, bufferData));
			cntBit++;
			halfBit = 0;
		}

	}
}

/* Two different states may occur: half a bit may have already been received and is thus
 * waiting for the other half, or a toggle bit has been received previously.
 * A long pulse after two half bits is impossible. So, no programming need for that state
 * But since the next pulse may be a long pulse, it makes it 3 half bits. In that case a
 * previous bit and a toggle bit is expected.
 *
 * EXAMPLE: toggle bit
 *  ____________
 * |            |
 * |            |
 * |   ~1778	|_
 *
 * EXAMPLE: previous bit + toggle bit
 *        ____________
 *       |            |
 *       |            |
 * ______|~1778       |___*/
void irSensorAddToggleBit(void) {
	if ((timerRead() >= 1500) && (timerRead() <= 2000)) {

		// pulse width of one bit
		halfBit += 2;

		if (halfBit == 2) {
			irSensorAddBit(TOGGLE(getPreviousBit(cntBit, bufferData)));
			cntBit++;
		}
		else if (halfBit == 3) {

			// Two bits to be added
			irSensorAddBit(getPreviousBit(cntBit, bufferData));
			cntBit++;
			irSensorAddBit(TOGGLE(getPreviousBit(cntBit, bufferData)));
			cntBit++;
		}
		halfBit = 0;
	}
}

/* Because we add the previous bit to buffer,
 * we need to wait for cntBit to be 14 to add
 * bit 13 to buffer. */
void irSensorResetValues(void) {
	if (cntBit == 14) {
		stopTimer();
		cntBit = 0;
		halfBit = 0;
	}
}

unsigned int getPreviousBit(unsigned char index, unsigned int byte) {
	return ((byte & (1 << (index - 1))) >> (index - 1));
}

/* Simply receive a start bit. When this occurs, the timer should start
 * measuring a low signal pulse. */
void receiveStartBit(void) {

	// First bit received is always 1, so add 1 to data buffer
	if (cntBit == 0) {
		irSensorAddBit(1);
		cntBit++;
		startTimer();
	}
}

unsigned char reverseNibble(unsigned char byte) {
	unsigned char reversedNibble = 0;
	int i, j = 0;

	for (i = 3; i > -1; i--) {
		unsigned char thisBit = ((byte & (1 << i)) >> i);
		reversedNibble |= (thisBit << j);
		j++;
	}
	return reversedNibble;
}

unsigned int getBitCount(void) {
	return cntBit;
}

unsigned int getBufferData(void) {
	return bufferData;
}

unsigned char getToggleBit(void) {
	return ((bufferData & 0x4) >> 2);
}

unsigned char getLastNibble(void) {
	return reverseNibble(bufferData >> 10);
}
