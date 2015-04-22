#!/sbin/sh

## Dim the display and buttons
echo 120 > /sys/class/leds/lcd-backlight/brightness
echo 5 > /sys/class/leds/button-backlight/brightness
echo "0x404010 -1 -1" > /sys/class/leds/R/device/led_blink
# Clear "recovery --bnr_recovery-s" or etc flag.
dd if=/dev/zero of=/dev/block/platform/msm_sdcc.1/by-name/misc seek=64 count=20 bs=1

