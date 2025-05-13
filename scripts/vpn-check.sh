#!/bin/bash

VPN_STATUS=$(nmcli connection show --active | grep $OFFICE_VPN_NAME)

if [ -z "$VPN_STATUS" ]; then
    # VPN is not connected
    echo "0"
    exit 1
else
    # VPN is connected
    echo "1"
    exit 0
fi
