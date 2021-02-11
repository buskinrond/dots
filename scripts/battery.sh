#!/usr/bin/env bash


BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/dunstify "" "$BATTINFO"
fi


if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 4 -d " "` < 100% ]] ; then
    DISPLAY=:0.0 /usr/bin/dunstify "BATTERY IS DISCHARGING"
fi


if [[ `echo $BATTINFO | grep Charging` && `cat /sys/class/power_supply/ACAD/online | grep 1` == 1 ]] ; then
    DISPLAY=:0.0 /usr/bin/dunstify "The Battery is Now Charging"
fi
