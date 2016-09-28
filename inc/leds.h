/*
 * leds.h
 *
 *  Created on: 25 sep. 2016
 *  Author: Rick Kock en Arther vd Berg
 */

#ifndef LEDS_H_
#define LEDS_H_

void ledsInit(void);
void ledsWrite(unsigned char leds);
void ledsWriteRGB(unsigned char rgb);

#endif /* LEDS_H_ */

