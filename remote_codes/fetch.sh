echo "File fetched at" $(date +%H:%M:%S)
scp pi@$1:/home/pi/*mp4 /media/georgelab/Expansion/RPi_Videos_B
echo "Fetch complete at" $(date +%H:%M:%S)
