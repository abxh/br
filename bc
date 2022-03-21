#!/bin/bash

# Backlight Control Script.

# Reimplemented code from:
# https://wiki.gentoo.org/wiki/ACPI/ThinkPad-special-buttons#Brightness_up
# https://wiki.gentoo.org/wiki/ACPI/ThinkPad-special-buttons#Brightness_down

BACKLIGHT_PATH='/sys/class/backlight/amdgpu_bl0'

NOTIFICATION_ICON='/usr/share/icons/Papirus-Dark/16x16/actions/brightnesssettings.svg'
NOTIFICATION_TAG="string:x-dunst-stack-tag:brightness"
NOTIFICATION_EXPIRE_TIME=2000

current_value=$(< $BACKLIGHT_PATH/brightness)
min_value=0
max_value=$(< $BACKLIGHT_PATH/max_brightness)

case $1 in
	-i) 
		new_value=$(($current_value + $2))
		threshold_value=$(($new_value<$max_value?$new_value:$max_value))
		echo $threshold_value > $BACKLIGHT_PATH/brightness
		;;
	-d) 
		new_value=$(($current_value - $2))
		threshold_value=$(($new_value>$min_value?$new_value:$min_value))
		echo $threshold_value > $BACKLIGHT_PATH/brightness
		;;
	-s) 	
		echo $2 > $BACKLIGHT_PATH/brightness
		threshold_value=$2
		;;
esac

notify-send \
	-i $NOTIFICATION_ICON \
	-h $NOTIFICATION_TAG \
	-t $NOTIFICATION_EXPIRE_TIME \
	-h int:value:$((100*$threshold_value/$max_value)) \
	"Brightness" \
	$threshold_value
