#!/usr/bin/env bash

#Check if script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ ! $? = 0 ]; then
   exit 1
else

   systemctl stop piswitch.service
   systemctl disable /etc/systemd/piswitch.service

   rm /opt/piswitch/softshut.py 
   rm /opt/piswitch -d
   rm /etc/systemd/system/piswitch.service

   whiptail --title "Uninstall complete" --msgbox "Pi Switch uninstall complete.\nYou are safe to remove the folder Pi-Supply-Switch." 8 78
fi
