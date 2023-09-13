ffmpeg -i $1_Box02_$now.h264 -c:v h264_nvenc -preset slow -tune hq -profile high -level 4.2 -rc vbr -qp 18 -rc-lookahead 30 -vf "scale=1280:720" $1_jBox02_$now.mp4 -r $3

ans=$(echo "$2 * 60000" | bc)
now=$(date "+%F")
echo "Started recording at" $(date +%H:%M:%S)
raspivid -t $ans -br 55 -w 800 -h 600 --framerate $3 -b 10000000 -awb greyworld -o $1_Box02_$now.h264
echo "Converting to mp4"
MP4Box -add $1_Box02_$now.h264 $1_Box02_$now.mp4 -fps $3
echo "Transfering..."
sshpass -p georgelab1 scp $1_Box02_$now.mp4 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_B/Coc_B
rm $1_Box02_$now.h264
echo "Session complete"
