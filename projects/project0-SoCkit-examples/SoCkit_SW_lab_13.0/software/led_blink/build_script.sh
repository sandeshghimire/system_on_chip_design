#!/bin/sh -x

arm-linux-gnueabihf-gcc \
-g \
-O0 \
-Werror \
-Wall \
-I${SOCEDS_DEST_ROOT}/ip/altera/hps/altera_hps/hwlib/include \
-o led_blink \
main.c
