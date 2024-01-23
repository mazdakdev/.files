#!/usr/bin/env bash

## Script To Manage Brightness For Archcraft (in Wayland).


# Get brightness
get_backlight() {
  LIGHT=$(printf "%.0f\n" $(light -Grs 'sysfs/leds/kbd_backlight'))
  echo "${LIGHT}%"
}


# Notify
notify_user() {
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Brightness : $(get_backlight)"
}

# Increase brightness
inc_backlight() {
  light -Ars 'sysfs/leds/kbd_backlight' 20 && notify_user
}

# Decrease brightness
dec_backlight() {
  light -Urs 'sysfs/leds/kbd_backlight' 20 && notify_user
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
  get_backlight
elif [[ "$1" == "--inc" ]]; then
  inc_backlight
elif [[ "$1" == "--dec" ]]; then
  dec_backlight
else
  get_backlight
fi
