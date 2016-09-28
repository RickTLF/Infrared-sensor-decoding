################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cr_startup_lpc13xx.c \
../src/crp.c \
../src/irSensor.c \
../src/leds.c \
../src/timer.c \
../src/week4.c 

OBJS += \
./src/cr_startup_lpc13xx.o \
./src/crp.o \
./src/irSensor.o \
./src/leds.o \
./src/timer.o \
./src/week4.o 

C_DEPS += \
./src/cr_startup_lpc13xx.d \
./src/crp.d \
./src/irSensor.d \
./src/leds.d \
./src/timer.d \
./src/week4.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DDONT_ENABLE_SWVTRACECLK -DCORE_M3 -D__LPC13XX__ -D__REDLIB__ -I"C:\Users\Mandrake\Documents\LPCXpresso_7.9.2_493\workspace\week4\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


