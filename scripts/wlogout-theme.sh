#!/bin/bash

BASE="~/.config/mango/kohagi_personal_configs/wlogout"
TARGET="~/.config/wlogout"

mkdir -p "$TARGET"

cp -r "$BASE/"* "$TARGET/"

pkill wlogout 2>/dev/null

wlogout -l "$TARGET/layout"