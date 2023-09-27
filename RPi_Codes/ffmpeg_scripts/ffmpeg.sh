# Variables
ans=$(echo "$2 * 60000" | bc)
now=$(date "+%F")

# Recording Script
echo "Started recording at" $(date +%H:%M:%S)
raspivid -t $ans -br 55 -w 1280 -h 720 --framerate $3 -b 20000000 -awb greyworld -o $1_Box02_$now.h264

# MP4 Conversion
echo "Converting to mp4" $(date +%H:%M:%S)
MP4Box -add $1_Box02_$now.h264 $1_jBox02_$now.mp4 -fps $3

# FFmpeg "resizing"
echo "FFmpeg processing" $(date +%H:%M:%S)
ffmpeg -i $1_jBox02_$now.mp4 -vf "scale=1280:720" $1_Box02_$now.mp4

# Secure copy to remote
echo "Transfering..." $(date +%H:%M:%S)
sshpass -p georgelab1 scp $1_Box02_$now.mp4 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_B/Coc_B

# Clean up of unneeded files
rm $1_Box02_$now.h264
rm $1_jBox02_$now.mp4

# Notice of session complete
echo "Session complete" $(date +%H:%M:%S)
