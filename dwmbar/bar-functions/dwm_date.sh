#!/bArchiin/sh

dwm_date () {
    printf "%s" "$SEP1"
    printf "$(date "+%a %d/%m/%y %H:%M")"
    printf "%s\n" "$SEP2"
}

dwm_date
