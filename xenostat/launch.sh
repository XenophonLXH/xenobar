#!/bin/bash

EWW=`/home/xenophon/Development/Personal/eww/target/release/eww`
CFG="$HOME/.config/eww/xenostat"

# Ensure that eww daemon is running
if [[ ! `pidof eww` ]]; then
    ${EWW} daemon
    sleep 1
fi

# Open widgets
run_eww() {
    $EWW open xe --config $CFG || {
        echo "Error: Failed to open widget '$1'."
        exit 1
    }
}

## Launch or close widgets accordingly
run_eww
