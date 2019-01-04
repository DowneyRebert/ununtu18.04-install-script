#!/bin/bash
SUDO_USER=who | awk '{print $1}'
TERMINATOR_CONFIG=`pwd`/terminator.config

echo "staring common installation..."

apt install gnome-tweaks gnome-tweak-tool gnome-icon-theme sxiv
apt install git make gcc g++ vim terminator
apt install lib32ncurses5 lib32z1 libc6-dbg:i386
cp $TERMINATOR_CONFIG /home/$SUDO_USER/.config/terminator/config

# if ps -o cmd= -p $(ps -o ppid= -p $$) | grep -q gnome; then
#   nohup terminator &> /dev/null &
#   sleep 0.1s
#   exit
# fi
echo "common installation is complete!"
