# Pi-Supply-Switch
[Pi Supply Switch On/Off Switch](https://www.pi-supply.com/product/pi-supply-raspberry-pi-power-switch/) for Raspberry Pi

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
