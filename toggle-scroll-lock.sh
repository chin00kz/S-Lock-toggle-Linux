#!/bin/bash
# toggle-scroll-lock.sh
# Safely toggle the Scroll Lock LED on Linux

LED="/sys/class/leds/input19::scrolllock/brightness"

# Ensure the LED device exists and is writable
if [ ! -r "$LED" ] || [ ! -w "$LED" ]; then
    echo "ERROR: LED device not accessible: $LED" >&2
    exit 1
fi

# Toggle LED
state=$(cat "$LED")
if [ "$state" -eq 0 ]; then
    echo 1 > "$LED"
else
    echo 0 > "$LED"
fi
