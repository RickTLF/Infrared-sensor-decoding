/*
 * 	irSensor.h
 *
 *  Created on: 25 sep. 2016
 *  Author: Rick Kock en Arther vd Berg
 */

#ifndef IRSENSOR_H_
#define IRSENSOR_H_

void irSensorInit(void);
unsigned char getIrSensorValue(void);
void irSensorResetValues(void);
void PIOINT0_IRQHandler(void);
unsigned char getLastNibble(void);
unsigned int getBitCount(void);
unsigned int getBufferData(void);
unsigned char getToggleBit(void);

#endif /* IRSENSOR_H_ */
