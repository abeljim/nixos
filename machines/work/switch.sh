#!/usr/bin/env bash

if grep open /proc/acpi/button/lid/LID/state; then
    hyprctl keyword monitor "eDP-1, preferred, 0x0, 1"
else
    if [[ `hyprctl monitors | grep "Monitor" | wc -l` != 1 ]]; then
        hyprctl keyword monitor "eDP-1, disable"
    fi
fi
