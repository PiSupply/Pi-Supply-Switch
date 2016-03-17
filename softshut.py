# Import the modules to send commands to the system and access GPIO pins
from subprocess import call
import RPi.GPIO as gpio
import time

# Define a function to keep script running
def loop():
    while 1:
        time.sleep(5)

# Define a function to run when an interrupt is called
def shutdown(pin):
    call('poweroff', shell=False)

gpio.setmode(gpio.BOARD) # Set pin numbering to board numbering
gpio.setup(7, gpio.IN) # Set up pin 7 as an input
gpio.add_event_detect(7, gpio.RISING, callback=shutdown, bouncetime=200) # Set up an interrupt to look for button presses

loop() # Run the loop function to keep script running
