# Pi-Supply-Switch
[Pi Supply Switch On/Off Switch](https://www.pi-supply.com/product/pi-supply-raspberry-pi-power-switch/) for Raspberry Pi

**Remember to install the code before connecting the switch to the Pi.**

## Installation
1. Login via SSH or via the console.
2. Run the following command and Pi Switch will be setup and installed: 
```bash
curl -sSL https://pisupp.ly/piswitchcode | sudo bash
```

With this new script any standard pin can be chosen to provide the function previusly covered by pins 7 and 8.
Within softshut.py you can change the assignement which by default is

```python
PinSeven = 7
PinEight = 11
```

This means that pin 7 coming from the Pi Switch goes to pin 7 on the Raspberry Pi and that pin 8 from the Pi Switch goes to pin 11 on the Raspberry Pi.

```
PiSwitch 7 <---> RPi 7
PiSwitch 8 <---> RPi 11
```

Rememeber that the notation used is the physical notation only.

## Usage

* Press the On button to power on the Raspberry Pi.
* Press the Off button to remove power to the Raspberry Pi. This is not a graceful shutdown!
* Press briefly the Soft button to gracefully shutdown the operating system. After 2 minutes the power is also cut off.
* Press the Soft button and keep pressed for a reboot.

# FAQ
## My Pi switches off before fully booting
To avoid the condition above always use the Pi Switch in conjuntion with the script above. Neither the switch nor the script will work on their own and will result in the powering off of the Raspberry Pi shortly after booting. As adviced above install the code before connecting the switch and use the uninstall.sh script before returning to powering the Raspberry Pi with a traditional PSU.
Should you not have been able to run the uninstall.sh in order to be able to access your OS without it prematurely powering off you can use the following work around.
Use the jumper cable provided with the switch and connect pin 7 on the Raspberry Pi to pin 9 (GND) and boot normally. This will trick the script into behaving as if the Pi Switch was connected. At this point you can run the uninstall.sh, power off the system and unplug the jumper cable.

## Where can I find an assembly guide?
A text guide can be found on [our website](https://www.pi-supply.com/pi-supply-switch-v1-1-assembly-instructions/) alternative you can also find a [steb by step video](https://www.youtube.com/watch?v=bHj_pMD7oLI&feature=youtu.be).

## I am still running Wheezy where can I find compatible code?
The original code for the Pi Switch can be found on [our website](https://www.pi-supply.com/pi-supply-switch-v1-1-code-examples/)

## Raspbian shows under-voltage warnings
The problem can be solved by using shorter, thicker USB cables. With Pi Switch we are now shipping 30cm 22AWG USB cables which solve the problem entirely.
