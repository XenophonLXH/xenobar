#!/bin/bash

VPN_STATUS=$(nmcli connection show --active | grep $OFFICE_VPN_NAME)

if [ -z "$VPN_STATUS" ]; then
    # VPN is not connected
    nmcli con up id $OFFICE_VPN_NAME
    notify-send "$OFFICE_VPN_NAME connected"
    exit 1
else
    # VPN is connected
    nmcli con down id $OFFICE_VPN_NAME
    notify-send "$OFFICE_VPN_NAME disconnected"
    exit 1
fi
