#!/usr/bin/env python

# Import the modules to send commands to the system and access GPIO pins
from subprocess import call
import RPi.GPIO as GPIO

# Map pin seven and eight on the Pi Switch PCB to chosen pins on the Raspberry Pi header
# The PCB numbering is a legacy with the original design of the board
PinSeven = 7
PinEight = 11
GPIO.setmode(GPIO.BOARD) # Set pin numbering to board numbering
GPIO.setup(PinSeven, GPIO.IN) # Set up PinSeven as an input
GPIO.setup(PinEight, GPIO.OUT, initial=1) # Setup PinEight as output

GPIO.wait_for_edge(PinSeven, GPIO.RISING) # Wait for a rising edge on PinSeven

GPIO.output(PinEight,0) # Bring down PinEight so that the capacitor can discharge an remove power to the Pi
call('poweroff', shell=False) # Initiate OS Poweroff
