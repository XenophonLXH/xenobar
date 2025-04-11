#!/bin/bash
# This script will read the Wakatime API
# key from the file stored in $HOME/.wakatime.cfg and
# store the key as a variable, it will then fetch
# the target developers development time and display it using
# pingo markup
# For now I don't actually know where else to store the wakatime api
# key, I just know my key is stored in the 
API_KEY="$(grep -i "api_key" ~/.wakatime.cfg | cut -d '=' -f2)"
URL="https://wakatime.com/api/v1/users/current/status_bar/today"
TIME=$(curl -H "Authorization: Basic $API_KEY" -s $URL | python3 -c "import sys, json; print(json.load(sys.stdin)['data']['grand_total']['text'])")
echo "$TIME"
