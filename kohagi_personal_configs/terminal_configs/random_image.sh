#!/bin/bash
#put this file in ur home
# Path to image folder
IMAGE_DIR="$HOME/.config/mango/kohagi_personal_configs/terminal_configs/img_terminal/"

# Set a random image
RANDOM_IMAGE=$(find "$IMAGE_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | shuf -n 1)

if [ -n "$RANDOM_IMAGE" ]; then
    kitty +kitten icat --align left --place 40x20@0x0 "$RANDOM_IMAGE"

sleep 0.1
fi

# Fastfetch
fastfetch --logo-type 'kitty' --logo-width 20
