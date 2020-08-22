brightnessctl -d tpacpi::kbd_backlight s 0%
xset r rate 200 50
xset r 66
setxkbmap us -variant colemak
xinput disable $(xinput | grep Synaptics | grep -oP "id=\K..")
setxkbmap -option keypad:pointerkeys
exec bspwm

