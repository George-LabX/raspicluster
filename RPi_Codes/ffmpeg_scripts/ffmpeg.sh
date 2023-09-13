ans=$(echo "$2 * 60000" | bc)
now=$(date "+%F")

echo "Started recording at" $(date +%H:%M:%S)

raspivid -t $ans -br 55 -w 800 -h 600 --framerate $3 -b 10000000 -awb greyworld -o $1_Box02_$now.h264

echo "Converting to mp4"

MP4Box -add $1_Box02_$now.h264 $1_jBox02_$now.mp4 -fps $3

echo "FFmpeg processing"
ffmpeg -i $1_jBox02_$now.mp4 -vf "scale=1280:720" -c:a copy $1_Box02_$now.mp4

echo "Transfering..."

sshpass -p georgelab1 scp $1_Box02_$now.mp4 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_B/Coc_B

# Clean up
rm $1_Box02_$now.h264
rm $1_jBox02_$now.mp4

echo "Session complete"
