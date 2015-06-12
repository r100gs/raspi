
#!/bin/bash

# monitor GPIO pin 3 (wiringPi pin 1) for shutdown signal

# export GPIO pin 3 and set to input with pull-up
echo "3" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio3/direction
echo "high" > /sys/class/gpio/gpio3/direction

# wait for pin to go low
while [ true ]
do
if [ "$(cat /sys/class/gpio/gpio3/value)" == '0' ]
then
 echo "Raspberry Pi Shutting Down!"
 poweroff &
 exit 0
fi
sleep 1
done
