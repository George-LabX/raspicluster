#!/bin/bash

# Variables
ans=$(echo "$2 * 60000" | bc)
now=$(date "+%F")
file=${BOX}_${now}

# Recording Script
echo "Started recording at:" $(date +%H:%M:%S)
raspivid -t $ans -br 55 -w 800 -h 600 --framerate $3 -b 20000000 -awb greyworld -o $1_$file.h264
echo -e "\n"

# MP4 Conversion using MP4Box
echo "Converting to mp4 started at:" $(date +%H:%M:%S)
MP4Box -add $1_$file.h264 $1_j$file.mp4 -fps $3
echo -e "\n"

# FFmpeg "resizing" processing
echo "FFmpeg processing started at:" $(date +%H:%M:%S)
ffmpeg -i $1_j$file.mp4 -vf "scale=800:600" -loglevel panic $1_$file.mp4
echo -e "\n"

# Secure copy recording file to remote device
echo "Transfering started at:" $(date +%H:%M:%S)
sshpass -p $REMOTEPASS scp $1_$file.mp4 $REMOTE:$REMOTEVIDPATH/Oxy_$MINI
echo -e "\n"

# Clean up of unneeded files
rm $1_$file.h264
rm $1_j$file.mp4

# Notice of session complete
echo "Session completed at:" $(date +%H:%M:%S)
