#!/bin/bash
#This script records a video and copies it to network location defined in .bashrc (REMOTEVIDPATH)
#Arguments: $1:Name of Video, $2: Length (minutes), $3: Frames per second
ans=$(echo "$2 * 60000" | bc)
now=$(date "+%F")
echo "Started recording at" $(date +%H:%M:%S)
raspivid -t $ans -br 55 -w 800 -h 600 --framerate $3 -b 10000000 -awb greyworld -o $1_Box02_$now.h264
echo "Converting to mp4"
MP4Box -add $1_Box02_$now.h264 $1_Box02_$now.mp4 -fps $3
echo "Transfering..." $(date +%H:%M:%S)
sshpass -p georgelab1 scp $1_Box02_$now.mp4 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_B/Coc_B
echo "Session complete" $(date +%H:%M:%S)
