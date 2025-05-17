#!/bin/bash

# Define the folder to look into
FOLDER_PATH="/home/xenophon/Pictures/Wallpapers"
echo $FOLDER_PATH

# Randomly select a file and store its path in a variable
RANDOM_FILE=$(find "$FOLDER_PATH" -type f | shuf -n 1)

# Output the randomly chosen file path
echo "Randomly chosen file: $RANDOM_FILE"

swww img $RANDOM_FILE
