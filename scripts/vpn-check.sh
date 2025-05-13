#!/bin/bash
if [ -z "$1" ]; then

    /usr/bin/notify-send "Please pass a VPN name as a parameter"
    exit 1
fi

VPN_EXISTS=$(/usr/bin/nmcli con show | grep $1)

if [ -z "$VPN_EXISTS" ]; then
    /usr/bin/notify-send "VPN '$1' does not exist, create it first"
    exit 1
fi


while true; do

    VPN_STATUS=$(/usr/bin/nmcli connection show --active | grep $1)

    if [ -z "$VPN_STATUS" ]; then
        # VPN is not connected
        echo "0"
    else
        # VPN is connected
        echo "1"
    fi
    sleep 1
done
