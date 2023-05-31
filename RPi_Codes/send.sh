# Specific to Row B path
# Generic "send" executable file that will transfer all mp4 videso from the RPi to the remote

#!/bin/bash

echo "Transfering..."

for i in $(find *mp4); do
	sshpass -p georgelab1 scp $i georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_B
	#rm $i
done

echo "Transfer complete"
