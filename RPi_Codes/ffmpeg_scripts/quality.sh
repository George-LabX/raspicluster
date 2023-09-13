

ans=$(echo "$2 * 60000" | bc)
now=$(date "+%F")

echo "Started recording at" $(date +%H:%M:%S)
raspivid -t $ans -br 55 -w 1280 -h 720 --framerate $3 -b 10000000 -awb greyworld -o $1_Box01_$now.h264

echo "Converting to MP4Box" $(date +%H:%M:%S)
MP4Box -add $1_Box01_$now.h264 MP4Box_$1_Box01_$now.mp4 -fps $3

echo "Converting to ffmpeg" $(date +%H:%M:%S)
ffmpeg -i "$1_Box01_$now.h264" -c:v libx264 -preset slow -tune film -crf 18 "ffmpeg_$1_Box01_$now.mp4"

echo "Transfering h264" $(date +%H:%M:%S)
sshpass -p georgelab1 scp $1_Box01_$now.h264 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_E/Coc_E

echo "Transfering MP4Box" $(date +%H:%M:%S)
sshpass -p georgelab1 scp MP4Box_$1_Box01_$now.mp4 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_E/Coc_E

echo "Transfering ffmpeg" $(date +%H:%M:%S)
sshpass -p georgelab1 scp ffmpeg_$1_Box01_$now.mp4 georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_E/Coc_E

echo "Session complete" $(date +%H:%M:%S)
