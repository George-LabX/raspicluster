#!/bin/bash

# Set the folder paths
inpath="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/mp4"
outpath="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/results"

# List video files in inpath
videoFiles=$(ls "$inpath"/*.mp4)

# Iterate through each video file for timestamps and durations
for videoFile in $videoFiles; do
    baseName=$(basename "$videoFile" .mp4)
    inputFile="$videoFile"
    
    # Set the output file paths
    timestampOutputFile="$outpath/ts/${baseName}_timestamps.csv"
    durationOutputFile="$outpath/length/${baseName}_length.txt"
    alllength="$outpath/length/vid_length.csv"

    # Export frames using ffprobe for timestamps
    ffprobe "$inputFile" -select_streams v -show_entries frame=coded_picture_number,pkt_pts_time -of csv=p=0:nk=1 -v 0 > "$timestampOutputFile"
    echo "Timestamps complete: $(basename "$videoFile") -> $timestampOutputFile"

    # Export video duration using ffprobe
    videoDuration=$(ffprobe -i "$inputFile" -v quiet -show_entries format=duration -hide_banner -of default=noprint_wrappers=1:nokey=1)
    
    # Save video duration to the output file
    echo "$videoDuration" > "$durationOutputFile"
    echo "Duration complete: $(basename "$videoFile") -> $durationOutputFile"
    
    # Append video duration to the CSV file
    echo "$videoDuration" >> $alllength
done

