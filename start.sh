#!/bin/bash

#Start XQuartz
/Applications/Utilities/XQuartz.app/Contents/MacOS/X11.bin &

#Wait a bit to be sure that XQuartz is started
sleep 5

#Get the display id to use
DISPLAY_NUMBER=$(ps -ef | grep "Xquartz :\d" | grep -v xinit | awk '{ print $9; }')

#Allow access to localhost
xhost + 127.0.0.1

#Add display number in env
export DISPLAY_NUMBER=$DISPLAY_NUMBER

echo $DISPLAY_NUMBER

#Stop container if already running
docker-compose stop
#Start container
docker-compose up $@
