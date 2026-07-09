#!/bin/sh

export XCURSOR_THEME=Animated-Mew-Cursor
export XCURSOR_SIZE=24
export XDG_CURRENT_DESKTOP=wlroots
export XDG_SESSION_TYPE=wayland


dbus-update-activation-environment \
    WAYLAND_DISPLAY \
    XDG_CURRENT_DESKTOP \
    XDG_SESSION_TYPE \
    XCURSOR_THEME \
    XCURSOR_SIZE

sleep 0.5

pgrep -x pipewire >/dev/null || pipewire &
pgrep -x wireplumber >/dev/null || wireplumber &
pgrep -x pipewire-pulse >/dev/null || pipewire-pulse &
sleep 0.5

pkill -x xdg-desktop-portal-wlr 2>/dev/null
pkill -x xdg-desktop-portal 2>/dev/null
sleep 0.3

/usr/lib/xdg-desktop-portal-wlr &
sleep 0.8
/usr/lib/xdg-desktop-portal --replace &
sleep 0.8

waybar -c ~/.config/mango/config.jsonc -s ~/.config/mango/style.css >/dev/null 2>&1 &
swaybg -o DP-1 -i ~/.config/mango/kohagi_personal_configs/wallpaper/wallpaper.png >/dev/null 2>&1 &
swaybg -o HDMI-A-1 -i ~/.config/mango/kohagi_personal_configs/wallpaper/wallpaper2.png >/dev/null 2>&1 &
kanshi &
swaync &
discord --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland &
spotify-launcher &
helium-browser &
wl-clip-persist --clipboard regular --reconnect-tries 0 &
wl-paste --type text --watch cliphist store &

echo "Xft.dpi: 140" | xrdb -merge