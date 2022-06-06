# br
Simple brightness script with notification.

## Requirements:
Add udev rule to modify brightness file.
```
mkdir -p /etc/udev/rules.d
cp 90-backlight.rules /etc/udev/rules.d
```
and install `libnotify` and a [notification server](https://wiki.archlinux.org/title/Desktop_notifications#Standalone) for notifcation.

Restart your computer to ensure the udev rule is in effect.
## Examples:
```
./br.sh -i 5   # Increase brightness by 5
./br.sh -d 5   # Decrease brightness by 5
./br.sh -s 255 # Set brightness to 255.
```

## Source(s):
- https://wiki.gentoo.org/wiki/ACPI/ThinkPad-special-buttons#Backlight_control
