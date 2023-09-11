#!/bin/bash
# Code for RPi experimental sessions.
ans=$(echo "$2 * 60000" | bc)
now=$(date "+%F")
echo "Started recording at" $(date +%H:%M:%S)
raspivid -t $ans -br 55 -w 800 -h 600 --framerate $3 -b 10000000 -awb greyworld -o $1_Box02_$now.h264
echo "Converting to mp4" $(date +%H:%M:%S)
MP4Box -add $1_Box02_$now.h264 $1_Box02_$now.mp4 -fps $3
echo "Transfering..." $(date +%H:%M:%S)
sshpass -p georgelab1 scp $1_Box02_$now.mp4 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_B
echo "mp4 transfer complete" $(date +%H:%M:%S)
sshpass -p georgelab1 scp $1_Box02_$now.h264 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_B
echo "Session complete" $(date +%H:%M:%S)
