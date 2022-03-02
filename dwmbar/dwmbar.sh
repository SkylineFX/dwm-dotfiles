#!/bin/bash

SEP1="["
SEP2="]"

bar_date () {
    printf "${SEP1}$(date "+%a %d/%m/%y %H:%M")${SEP2}"
}

bar_vol () {
    VOL=$(pamixer --get-volume)
    STATE=$(pamixer --get-mute)

    printf "${SEP1}"
    if [ "$STATE" = "true" ] || [ "$VOL" -eq 0 ]; then
        printf "MUTE"
    else
        printf "VOL ${VOL}"
    fi
    printf "${SEP2}"
}

bar_weather () {
    LOCATION=Earth

    DATA=$(curl -s wttr.in/$LOCATION?format=1 | grep -o ".[0-9].*")
    printf "${SEP1}WEA ${DATA}${SEP2}"
}

while true
do
    upperbar="$(bar_weather)$(bar_vol)$(bar_date)"
    xsetroot -name "$upperbar"

    sleep 1m
done

