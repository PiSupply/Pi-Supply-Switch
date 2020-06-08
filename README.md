![pisupply-switch-banner](https://user-images.githubusercontent.com/1878314/73882377-d9b49080-4859-11ea-9c7e-e3c351f821e5.png)
# Pi-Supply-Switch
[Pi Supply Switch On/Off Switch](https://www.pi-supply.com/product/pi-supply-raspberry-pi-power-switch/) for Raspberry Pi

**Remember to install the code before connecting the switch to the Pi.**

## Installation
1. Login via SSH or via the console.
2. Run the following command and Pi Switch will be setup and installed:
```bash
curl -sSL https://pisupp.ly/piswitchcode | sudo bash
```
For OctoPrint run the following:
```bash
curl -sSL https://pisupp.ly/piswitchoctoprint | bash
```

With this new script any standard pin can be chosen to provide the function previously covered by pins 7 and 8.
Within softshut.py you can change the assignment which by default is

```python
PinSeven = 7
PinEight = 11
```

This means that pin 7 coming from the Pi Switch goes to pin 7 on the Raspberry Pi and that pin 8 from the Pi Switch goes to pin 11 on the Raspberry Pi.

```
PiSwitch 7 <---> RPi 7
PiSwitch 8 <---> RPi 11
```

Remember that the notation used is the physical notation only.

**Note that the file to be changed once the installation has been carried out is located under /opt/piswitch/softshut.py and will need to be edited as root**
```bash
sudo nano /opt/piswitch/softshut.py
```

## Usage

* Press the On button to power on the Raspberry Pi.
* Press the Off button to remove power to the Raspberry Pi. This is not a graceful shutdown!
* Press briefly the Soft button to gracefully shutdown the operating system. After 2 minutes the power is also cut off.
* Press the Soft button and keep pressed for a reboot.

# FAQ
## My Pi switches off before fully booting
To avoid this condition always use the Pi Switch in conjunction with the script above. Neither the switch nor the script will work on their own and will result in the powering off of the Raspberry Pi shortly after booting. As previously pointed out you need to install the code before connecting the switch. To remove the switch run the uninstall.sh script before returning to powering the Raspberry Pi only with a traditional PSU.
Should you not have been able to run the uninstall.sh in order to be able to access your OS without it prematurely powering off you can use the following workaround.
Use the jumper cable provided with the switch and connect pin 7 on the Raspberry Pi to pin 9 (GND) and boot normally. This will trick the script into behaving as if the Pi Switch was connected. At this point you can run the uninstall.sh, power off the system and unplug the jumper cable.

## Where can I find an assembly guide?
A [text guide](https://learn.pi-supply.com/make/pi-supply-switch-assembly-instructions/) can be found on our website alternative you can also find a [steb by step video](https://www.youtube.com/watch?v=bHj_pMD7oLI&feature=youtu.be).

## I am still running Wheezy where can I find compatible code?
The [original code for the Pi Switch](https://learn.pi-supply.com/pi-supply-switch-v1-1-code-examples/) can be found on our website.

## Raspbian shows under-voltage warnings
The problem can be solved by using shorter, thicker USB cables. With Pi Switch we are now shipping 30cm 22AWG USB cables which solve the problem entirely.

## How do I know if the service is running properly?
Run the following command
```bash
systemctl status piswitch.service
```
which should return something like
```
● piswitch.service - Starts softshut for Pi Switch
   Loaded: loaded (/etc/systemd/system/piswitch.service; enabled)
   Active: active (running) since Thu 2017-06-29 09:56:13 UTC; 6min ago
 Main PID: 427 (python)
   CGroup: /system.slice/piswitch.service
           └─427 python /opt/piswitch/softshut.py

```
