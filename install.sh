#!/usr/bin/env bash

#Check if script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ ! $? = 0 ]; then
   exit 1
else
   apt-get install git whiptail #Installs packages which might be missing

   PiSupplySwitchDir="Pi-Supply-Switch"
   if [ -d "$PiSupplySwitchDir" ]; then
    whiptail --title "Installation aborted" --msgbox "$PiSupplySwitchDir already exists, please remove it and restart the installation" 8 78
    exit
   else
    git clone https://github.com/PiSupply/Pi-Supply-Switch.git
   fi

   mkdir /opt/piswitch

   cp $PiSupplySwitchDir/softshut.py /opt/piswitch
   if [ ! -f /opt/piswitch/softshut.py ]; then
     whiptail --title "Installation aborted" --msgbox "There was a problem writing the softshut.py file" 8 78
    exit
   fi
   cp $PiSupplySwitchDir/piswitch.service /etc/systemd/system
   if [ ! -f /etc/systemd/system/piswitch.service ]; then
    whiptail --title "Installation aborted" --msgbox "There was a problem writing the piswitch.service file" 8 78
    exit
   fi

   systemctl enable /etc/systemd/system/piswitch.service
   whiptail --title "Installation complete" --msgbox "Pi Switch installation complete. The system will power off." 8 78
   poweroff
fi
