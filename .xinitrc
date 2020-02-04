setxkbmap us -variant colemak
brightnessctl -d tpacpi::kbd_backlight s 100%
xset r rate 200 30
xset r 66
xinput disable $(xinput list --short | grep Synaptics | grep -oP "id=\K..")
exec bspwm
