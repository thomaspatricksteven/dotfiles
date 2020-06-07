setxkbmap us -variant colemak
brightnessctl -d tpacpi::kbd_backlight s 0%
xset r rate 200 50
xset r 66
xinput disable $(xinput list --short | grep Synaptics | grep -oP "id=\K..")
exec bspwm

