warning: LF will be replaced by CRLF in Debug/sources.mk.
The file will have its original line endings in your working directory.
[1mdiff --git a/.settings/language.settings.xml b/.settings/language.settings.xml[m
[1mdeleted file mode 100644[m
[1mindex 62c90c0..0000000[m
[1m--- a/.settings/language.settings.xml[m
[1m+++ /dev/null[m
[36m@@ -1,17 +0,0 @@[m
[31m-<?xml version="1.0" encoding="UTF-8" standalone="no"?>[m
[31m-<project>[m
[31m-	<configuration id="com.crt.advproject.config.exe.debug.2031392034" name="Debug">[m
[31m-		<extension point="org.eclipse.cdt.core.LanguageSettingsProvider">[m
[31m-			<provider copy-of="extension" id="org.eclipse.cdt.ui.UserLanguageSettingsProvider"/>[m
[31m-			<provider class="org.eclipse.cdt.managedbuilder.language.settings.providers.GCCBuildCommandParser" id="com.crt.advproject.GCCBuildCommandParser" keep-relative-paths="false" name="MCU GCC Build Output Parser" parameter="(arm-none-eabi-gcc)|(arm-none-eabi-[gc]\+\+)|(gcc)|([gc]\+\+)|(clang)" prefer-non-shared="true"/>[m
[31m-			<provider-reference id="org.eclipse.cdt.managedbuilder.core.MBSLanguageSettingsProvider" ref="shared-provider"/>[m
[31m-		</extension>[m
[31m-	</configuration>[m
[31m-	<configuration id="com.crt.advproject.config.exe.release.655506128" name="Release">[m
[31m-		<extension point="org.eclipse.cdt.core.LanguageSettingsProvider">[m
[31m-			<provider copy-of="extension" id="org.eclipse.cdt.ui.UserLanguageSettingsProvider"/>[m
[31m-			<provider copy-of="extension" id="com.crt.advproject.GCCBuildCommandParser"/>[m
[31m-			<provider-reference id="org.eclipse.cdt.managedbuilder.core.MBSLanguageSettingsProvider" ref="shared-provider"/>[m
[31m-		</extension>[m
[31m-	</configuration>[m
[31m-</project>[m
[1mdiff --git a/Debug/makefile b/Debug/makefile[m
[1mindex b8cf570..7f9206a 100644[m
[1m--- a/Debug/makefile[m
[1m+++ b/Debug/makefile[m
[36m@@ -23,25 +23,25 @@[m [mendif[m
 # Add inputs and outputs from these tool invocations to the build variables [m
 [m
 # All Target[m
[31m-all: week4.axf[m
[32m+[m[32mall: Infrared-sensor-decoding.axf[m
 [m
 # Tool invocations[m
[31m-week4.axf: $(OBJS) $(USER_OBJS)[m
[32m+[m[32mInfrared-sensor-decoding.axf: $(OBJS) $(USER_OBJS)[m
 	@echo 'Building target: $@'[m
 	@echo 'Invoking: MCU Linker'[m
[31m-	arm-none-eabi-gcc -nostdlib -Xlinker -Map="week4.map" -Xlinker --gc-sections -mcpu=cortex-m3 -mthumb -T "week4_Debug.ld" -o "week4.axf" $(OBJS) $(USER_OBJS) $(LIBS)[m
[32m+[m	[32marm-none-eabi-gcc -nostdlib -Xlinker -Map="Infrared-sensor-decoding.map" -Xlinker --gc-sections -mcpu=cortex-m3 -mthumb -T "week4_Debug.ld" -o "Infrared-sensor-decoding.axf" $(OBJS) $(USER_OBJS) $(LIBS)[m
 	@echo 'Finished building target: $@'[m
 	@echo ' '[m
 	$(MAKE) --no-print-directory post-build[m
 [m
 # Other Targets[m
 clean:[m
[31m-	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) week4.axf[m
[32m+[m	[32m-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) Infrared-sensor-decoding.axf[m
 	-@echo ' '[m
 [m
 post-build:[m
 	-@echo 'Performing post-build steps'[m
[31m-	-arm-none-eabi-size "week4.axf"; # arm-none-eabi-objcopy -v -O binary "week4.axf" "week4.bin" ; # checksum -p LPC1343 -d "week4.bin";[m
[32m+[m	[32m-arm-none-eabi-size "Infrared-sensor-decoding.axf"; # arm-none-eabi-objcopy -v -O binary "Infrared-sensor-decoding.axf" "Infrared-sensor-decoding.bin" ; # checksum -p LPC1343 -d "Infrared-sensor-decoding.bin";[m
 	-@echo ' '[m
 [m
 .PHONY: all clean dependents[m
[1mdiff --git a/Debug/src/subdir.mk b/Debug/src/subdir.mk[m
[1mindex 29dd997..5cb57d6 100644[m
[1m--- a/Debug/src/subdir.mk[m
[1m+++ b/Debug/src/subdir.mk[m
[36m@@ -32,7 +32,7 @@[m [mC_DEPS += \[m
 src/%.o: ../src/%.c[m
 	@echo 'Building file: $<'[m
 	@echo 'Invoking: MCU C Compiler'[m
[31m-	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -DDONT_ENABLE_SWVTRACECLK -DCORE_M3 -D__LPC13XX__ -D__REDLIB__ -I"C:\Users\Mandrake\Documents\LPCXpresso_7.9.2_493\workspace\week4\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"[m
[32m+[mwarning: LF will be replaced by CRLF in Debug/src/subdir.mk.
The file will have its original line endings in your working directory.
	[32marm-none-eabi-gcc -DDEBUG -D__CODE_RED -DDONT_ENABLE_SWVTRACECLK -DCORE_M3 -D__LPC13XX__ -D__REDLIB__ -I"C:\Users\Mandrake\Documents\LPCXpresso_7.9.2_493\workspace\Infrared-sensor-decoding\inc" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m3 -mthumb -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"[m
 	@echo 'Finished building: $<'[m
 	@echo ' '[m
 [m
[1mdiff --git a/Debug/week4_Debug.ld b/Debug/week4_Debug.ld[m
[1mindex 8222ffd..a098963 100644[m
[1m--- a/Debug/week4_Debug.ld[m
[1m+++ b/Debug/week4_Debug.ld[m
[36m@@ -5,7 +5,7 @@[m
  * Generated linker script file for LPC1343[m
  * Created from linkscript.ldt by FMCreateLinkLibraries[m
  * Using Freemarker v2.3.23[m
[31m- * LPCXpresso v7.9.2 [Build 493] [2015-09-14]  on Sep 28, 2016 9:35:59 PM[m
[32m+[m[32m * LPCXpresso v7.9.2 [Build 493] [2015-09-14]  on Sep 28, 2016 9:42:07 PM[m
  */[m
 [m
 INCLUDE "week4_Debug_library.ld"[m
[1mdiff --git a/Debug/week4_Debug_library.ld b/Debug/week4_Debug_library.ld[m
[1mindex e5320b4..13b7555 100644[m
[1m--- a/Debug/week4_Debug_library.ld[m
[1m+++ b/Debug/week4_Debug_library.ld[m
[36m@@ -5,7 +5,7 @@[m
  * Generated linker script file for LPC1343[m
  * Created from library.ldt by FMCreateLinkLibraries[m
  * Using Freemarker v2.3.23[m
[31m- * LPCXpresso v7.9.2 [Build 493] [2015-09-14]  on Sep 28, 2016 9:35:59 PM[m
[32m+[m[32m * LPCXpresso v7.9.2 [Build 493] [2015-09-14]  on Sep 28, 2016 9:42:07 PM[m
  */[m
 [m
 GROUP ([m
[1mdiff --git a/Debug/week4_Debug_memory.ld b/Debug/week4_Debug_memory.ld[m
[1mindex bfb0413..6808e6e 100644[m
[1m--- a/Debug/week4_Debug_memory.ld[m
[1m+++ b/Debug/week4_Debug_memory.ld[m
[36m@@ -5,7 +5,7 @@[m
  * Generated linker script file for LPC1343[m
  * Created from memory.ldt by FMCreateLinkMemory[m
  * Using Freemarker v2.3.23[m
[31m- * LPCXpresso v7.9.2 [Build 493] [2015-09-14]  on Sep 28, 2016 9:35:59 PM[m
[32m+[m[32m * LPCXpresso v7.9.2 [Build 493] [2015-09-14]  on Sep 28, 2016 9:42:07 PM[m
  */[m
 [m
 MEMORY[m
[1mdiff --git a/Debug/week4_Debug_old.ld b/Debug/week4_Debug_old.ld[m
[1mindex 7ac181c..29b982f 100644[m
[1m--- a/Debug/week4_Debug_old.ld[m
[1m+++ b/Debug/week4_Debug_old.ld[m
[36m@@ -4,7 +4,7 @@[m
  * (c) NXP Semiconductors 2013-2016[m
  * Generated linker script file for LPC1343[m
  * Created from generic_c.ld (7.9.2 ())[m
[31m- * By LPCXpresso v7.9.2 [Build 493] [2015-09-14]  on Wed Sep 28 21:35:57 CEST 2016[m
[32m+[m[32m * By LPCXpresso v7.9.2 [Build 493] [2015-09-14]  on Wed Sep 28 21:42:07 CEST 2016[m
  */[m
 [m
 [m
[1mdiff --git a/src/irSensor.c b/src/irSensor.c[m
[1mindex 55c21a5..45244d9 100644[m
[1m--- a/src/irSensor.c[m
[1m+++ b/src/irSensor.c[m
[36m@@ -90,9 +90,9 @@[m [mvoid irSensorAddBit(unsigned char value) {[m
  * (of the first interrupt) and a toggle bit may also occur.[m
  *[m
  * EXAMPLE:[m
[31m- *  	  ______[m
[31m- * 		 |		|[m
[31m- * 	~889 |		|[m
[32m+[m[32m *        ______[m
[32m+[m[32m *       |      |[m
[32m+[m[32m *  ~889 |      |[m
  * ______|~889	|_[m
  * */[m
 void irSensorAddPreviousBit(void) {[m
[1mdiff --git a/src/leds.c b/src/leds.c[m
[1mindex b1c20b8..a70ca18 100644[m
[1m--- a/src/leds.c[m
[1m+++ b/src/leds.c[m
[36m@@ -25,5 +25,5 @@[m [mvoid ledsWrite(unsigned char mask) {[m
 }[m
 [m
 void ledsWriteRGB(unsigned char rgb) {[m
[31m-	GPIO2DATA &= ((~rgb) << 9) | 0x1FF;[m
[32m+[m	[32mGPIO2DATA &= ((~rgb) << 9) | 0x1FE;[m
 }[m
[1mdiff --git a/src/week4.c b/src/week4.c[m
[1mindex 12b5215..df75fe6 100644[m
[1m--- a/src/week4.c[m
[1m+++ b/src/week4.c[m
[36m@@ -1,8 +1,8 @@[m
 /*****************************************************************************/[m
[31m-/* Name			:	week4.c													 */[m
[31m-/* Authors		:	Rick Kock & Arther vd Berg								 */[m
[31m-/* Version		:	1														 */[m
[31m-/* Description	:	RC-5 decoding program using LPC1343						 */[m
[32m+[m[32m/* Name	: week4.c[m
[32m+[m[32m/* Authors : Rick Kock & Arther vd Berg[m
[32m+[m[32m/* Version : 1[m
[32m+[m[32m/* Description : RC-5 decoding program using LPC1343[m
 /*****************************************************************************/[m
 [m
 #ifdef __USE_CMSIS[m
warning: LF will be replaced by CRLF in Debug/week4_Debug_old.ld.
The file will have its original line endings in your working directory.
