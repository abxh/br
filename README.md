# br
Simple brightness script written in bash.

## Quickstart:

```
mkdir -p /etc/udev/rules.d
cp 90-backlight.rules /etc/udev/rules.d
./br -i 5 # Increase brightness by 5
./br -d 5 # Decrease brightness by 5
./br -s 255 
```

## Source(s):
- https://wiki.gentoo.org/wiki/ACPI/ThinkPad-special-buttons#Backlight_control
```
