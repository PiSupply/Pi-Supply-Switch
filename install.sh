#!/usr/bin/env bash

#Check if script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ ! $? = 0 ]; then
   exit 1
else
   mkdir /opt/piswitch
   cp softshut.py /opt/piswitch
   cp piswitch.service /etc/systemd/system

   systemctl enable /etc/systemd/system/piswitch.service
   systemctl start piswitch.service
   whiptail --title "Installation complete" --msgbox "Pi Switch installation complete. Please reboot your Raspberry Pi now." 8 78
fi
