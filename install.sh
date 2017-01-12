#!/usr/bin/env bash

#Check if script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ ! $? = 0 ]; then
   exit 1
else
   sudo apt-get install git whiptail #Installs packages which might be missing

   PiSupplySwitchDir="Pi-Supply-Switch"
   if [ -d "$PiSupplySwitchDir" ]; then
        whiptail --title "Installation aborted" --msgbox "$PiSupplySwitchDir already exists, please remove it and restart the installation" 8 78
        exit
   fi

   git clone https://github.com/PiSupply/Pi-Supply-Switch.git
   mkdir /opt/piswitch
   cp $PiSupplySwitchDir/softshut.py /opt/piswitch
   cp $PiSupplySwitchDir/piswitch.service /etc/systemd/system

   systemctl enable /etc/systemd/system/piswitch.service
   systemctl start piswitch.service
   whiptail --title "Installation complete" --msgbox "Pi Switch installation complete. Please reboot your Raspberry Pi now." 8 78
fi
