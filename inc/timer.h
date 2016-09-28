/*
 * 	timer.h
 *
 *  Created on: 25 sep. 2016
 *  Author: Rick Kock en Arther vd Berg
 */

#ifndef TIMER_H_
#define TIMER_H_

void timerMicrosInit(void);
void startTimer(void);
unsigned long timerRead(void);
void stopTimer(void);
void resetTimer(void);

#endif /* TIMER_H_ */
