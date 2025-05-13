if [ -z "$1" ]; then
    /usr/bin/notify-send "Please pass a VPN name as a parameter"
    exit 1
fi

VPN_EXISTS=$(/usr/bin/nmcli con show | grep $1)

if [ -z "$VPN_EXISTS" ]; then
    /usr/bin/notify-send "VPN '$1' does not exist, create it first"
    exit 1
fi

VPN_STATUS=$(/usr/bin/nmcli connection show --active | grep $1)

if [ -z "$VPN_STATUS" ]; then
    # VPN is not connected
    /usr/bin/nmcli con up id $1
    /usr/bin/notify-send "VPN '$1' connected"
    exit 1
else
    # VPN is connected
    /usr/bin/nmcli con down id $1
    /usr/bin/notify-send "VPN '$1' disconnected"
    exit 1
fi
