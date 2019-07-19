#!/bin/sh
PATH="$PATH:/usr/bin"

#setxkbmap -model abnt2 -layout br -variant abnt2 &
setxkbmap us -variant intl &
xsetroot -cursor_name left_ptr &
xset +fp /home/probst/.fonts &
xset fp rehash &
xset r rate 200 50 &
mpd &
#transmission-gtk -m &
redshift &
compton --config ~/.config/compton/compton.conf -b &
dunst &
xrdb -merge ~/.Xresources &
wal -R -n &
devmon &
#setxkbmap -option caps:swapescape &
#cd /home/probst/Softwares/nepnotify-master/ && sh nep.sh &

# SESSIONS
#exec startxfce4
#exec startkde
#exec i3
#exec ck-launch-session dbus-launch i3
exec ck-launch-session dbus-launch xmonad
#exec wmaker
