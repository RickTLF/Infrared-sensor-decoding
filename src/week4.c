/*****************************************************************************/
/* Name			:	week4.c													 */
/* Authors		:	Rick Kock & Arther vd Berg								 */
/* Version		:	1														 */
/* Description	:	RC-5 decoding program using LPC1343						 */
/*****************************************************************************/

#ifdef __USE_CMSIS
#include "LPC13xx.h"
#endif

#include <cr_section_macros.h>

#include <stdio.h>

#include "irSensor.h"
#include "leds.h"

void updateLeds();

unsigned char currentLedSelect;
unsigned char previousLedSelect;
unsigned char ledValue = 1;

int main(void) {

	irSensorInit();
	ledsInit();

	while (1) {
		updateLeds();
	}
	return 0;
}

void updateLeds(void) {

	// We expect 14 bits
	if (getBitCount() == 14) {

		// Only interested in the last nibble
		currentLedSelect = getLastNibble();
		// Compare the last led that has been selected by the remote to the previous led

		if (currentLedSelect == previousLedSelect) {
			// If it's the same as before, switch the led on/off
			ledValue = getToggleBit();
		}

		// Reset Ir sensor values for receiving new data
		irSensorResetValues();
		// Save the current led selection as the previous
		previousLedSelect = currentLedSelect;
	}
	ledsWrite(ledValue << (currentLedSelect - 1)); // Led starts with 0
}
