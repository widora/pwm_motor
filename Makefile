CC = /home/midas/openwrt_widora/staging_dir/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/bin/mipsel-openwrt-linux-gcc

#INCLUDES += 
#LDFLAGS  += 
LIBS	  += -lpthread -lm

pwm_motor: pwm_motor.c
	$(CC) $(LIBS) -o pwm_motor pwm_motor.c

PHONY: all
all: pwm_motor


clean:
	rm -rf pwm_motor	
