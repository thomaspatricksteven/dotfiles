brightnessctl -d tpacpi::kbd_backlight s 0%
xset r rate 200 50
xset r 66
xset -r 82
xset -r 84

xinput disable $(xinput | grep Synaptics | grep -oP "id=\K..")
xinput set-prop $(xinput | grep TrackPoint | grep -oP "id=\K..") "libinput Accel Speed" 0.8

setxkbmap -model 'pc104curl-z' -layout 'us(cmk_ed_us)' -option 'caps:escape,misc:cmk_curl_dh'

exec bspwm
