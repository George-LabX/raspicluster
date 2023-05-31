# Specific to Row B path
# Genereic "fetch" executable file that will take one RPi IP address as argument and acquire all mp4 videos from that single RPi

echo "File fetched at" $(date +%H:%M:%S)
scp pi@$1:/home/pi/*mp4 /media/georgelab/Expansion/RPi_Videos_B
echo "Fetch complete at" $(date +%H:%M:%S)
