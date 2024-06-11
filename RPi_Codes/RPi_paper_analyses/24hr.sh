#!/bin/bash

# Variables
ans=$(echo "$2 * 60000" | bc)
now=$(date "+%F")
file=${BOX}_${now}

# Recording Script
echo -e "Started recording at:" $(date +%H:%M:%S)

raspivid -t $ans -br 55 -w 800 -h 600 --framerate $3 -b 10000000 -awb greyworld -o $1_$file.h264

sshpass -p $REMOTEPASS scp $1_$file.mp4 $REMOTE:$REMOTEVIDPATH/Coc_$MINI

rm $1_$file.h264

