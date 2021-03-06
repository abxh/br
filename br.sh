#!/bin/bash: '
Copyright (C) 2022  Shamim Siddique abir09bs@gmail.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
'
: '
Copyright (C) 2022  Shamim Siddique abir09bs@gmail.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
'

# Backlight Control Script.
# Source(s):
# https://wiki.gentoo.org/wiki/ACPI/ThinkPad-special-buttons#Backlight_control

BACKLIGHT_PATH='/sys/class/backlight/amdgpu_bl0'

NOTIFICATION_ICON='/usr/share/icons/Papirus-Dark/16x16/actions/brightnesssettings.svg'
NOTIFICATION_TAG="string:x-dunst-stack-tag:brightness"
NOTIFICATION_EXPIRE_TIME=2000

current_value=$(< $BACKLIGHT_PATH/brightness)
min_value=0
max_value=255 # $(< $BACKLIGHT_PATH/max_brightness)

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
	"Brightness:" \
	$threshold_value
