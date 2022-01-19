#!/bin/sh

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
SEP1="["
SEP2="]"

dwm_date () {
     printf "${SEP1}$(date "+%a %d/%m/%y %H:%M")${SEP2}"
}

dwm_networkmanager () {
    CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
    if [ "$CONNAME" = "" ]; then
      CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
    fi

    # PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')
    # PUBLIC=$(curl -s https://ipinfo.io/ip)

    printf "${SEP1}${CONNAME}${SEP2}"
}

dwm_weather () {
    LOCATION=Bucharest

    DATA=$(curl -s wttr.in/$LOCATION?format=1 | grep -o ".[0-9].*")
    printf "${SEP1}WEA ${DATA}${SEP2}"
}

dwm_pulse () {
     VOL=$(pamixer --get-volume)
     STATE=$(pamixer --get-mute)

     printf "%s" "$SEP1"
     if [ "$STATE" = "true" ] || [ "$VOL" -eq 0 ]; then
         printf "MUTE"
     elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
         printf "VOL %s%%" "$VOL"
     elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
         printf "VOL %s%%" "$VOL"
     else
         printf "VOL %s%%" "$VOL"
     fi
     printf "%s\n" "$SEP2"
}

# Update dwm status bar every second
while true
do
    # Append results of each func one by one to the upperbar string
    upperbar=""
    upperbar="$upperbar$(dwm_pulse)"
    upperbar="$upperbar$(dwm_date)"

    # SHOULD HAPPEN ONE TIME PER HOUR
    # upperbar="$upperbar$(dwm_weather)"
    # upperbar="$upperbar$(dwm_networkmanager)"

    xsetroot -name "$upperbar"

    sleep 1m
done
