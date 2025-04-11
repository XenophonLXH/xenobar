#!/bin/bash

    if [[ "$1" == "--kitty" ]]; then
        kitty --class "eww" --title "eww" --detach
    elif [[ "$1" == "--email-personal" ]]; then
        firefox --new-tab "https://mail.google.com/mail/u/1/#inbox"
    elif [[ "$1" == "--email-work" ]]; then
        firefox --new-tab "https://mail.google.com/mail/u/2/#inbox"
    elif [[ "$1" == "--explorer" ]]; then
        nautilus --new-window &
    fi
