#!/bin/bash

echo "Transfering..."

for i in $(find *mp4); do
	sshpass -p georgelab1 scp $i georgelab@10.1.1.243:/media/georgelab/Expansion/RPi_Videos_B
	#rm $i
done

echo "Transfer complete"
