CC = /home/midas/openwrt_widora/staging_dir/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin/mipsel-openwrt-linux-gcc

INCLUDES = -I/home/midas/ctest/kmods/soopwm
#LDFLAGS  = 
#CFLAGS    = -Wall
LIBS	  = -lpthread -lm

pwm_motor: pwm_motor.c msg_common.h ipcsock_common.h pinctl_motor.h
	$(CC) $(CFLAGS) $(LIBS) -o pwm_motor pwm_motor.c

mouse_ctlmotor: mouse_ctlmotor.c ipcsock_common.h
	$(CC) $(CFLAGS) $(LIBS) -o mouse_ctlmotor mouse_ctlmotor.c

#pwm_actuator: pwm_actuator.c sooall_pwm.h msg_common.h
#---- !!! dependent files MUST be presented with path, if not included in current dir. !!!???
#---  INCLUDES has no effect on dependent files !!!!!!
pwm_actuator: pwm_actuator.c /home/midas/ctest/kmods/soopwm/sooall_pwm.h msg_common.h
	$(CC) $(INCLUDES) $(LIBS) -o pwm_actuator pwm_actuator.c

ipc_ctlmotor: ipc_ctlmotor.c ipcsock_common.h
	$(CC) $(CFLAGS) $(LIBS) -o ipc_ctlmotor ipc_ctlmotor.c


PHONY: all
all: pwm_motor mouse_ctlmotor pwm_actuator ipc_ctlmotor

clean:
	rm -rf pwm_motor mouse_ctlmotor pwm_actuator ipc_ctlmotor	
