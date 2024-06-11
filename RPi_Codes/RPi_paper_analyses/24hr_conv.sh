#!/bin/bash

# Input folder containing H.264 files
input_folder="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/h264"

# Output folder for MP4 files
output_folder="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/mp4"


# Convert H.264 to MP4 using MP4Box
for file in "$input_folder"/*.h264; do
    # Get the base filename without extension
    base_filename=$(basename -- "$file")
    filename_no_extension="${base_filename%.*}"

    # Convert to MP4 using MP4Box
    MP4Box -add "$file" -fps 30 -new "$output_folder/$filename_no_extension.mp4"
done

