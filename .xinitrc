xset r rate 200 50
xset r 66
xset -r 82
xset -r 84

xinput disable $(xinput | grep Synaptics | grep -oP "id=\K..")
xinput set-prop $(xinput | grep TrackPoint | grep -oP "id=\K..") "libinput Accel Speed" 0.8

setxkbmap -model 'pc104angle-z' -layout 'us(cmk_ed_us)' -option 'caps:escape,misc:cmk_curl_dh'


#xrandr --output eDP-1 --mode 2560x1440

copyq &
flameshot &
xbanish &
picom &
emote &
dropbox &
nm-applet &
nitrogen --restore &

#xrandr --output HDMI-2 --same-as eDP-1
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1-2 --off --output HDMI-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --off

exec awesome
