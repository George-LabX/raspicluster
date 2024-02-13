#!/bin/bash
# This code is for instances where recordings were disrupted in some way that resulted in only H.264 files.
# This will take in the directory of the videos and convert them to mp4 using MP4Box, 
# then run them through ffmpeg.

# Input folder containing H.264 files
input_folder="/media/george/Expansion/RPi_Videos_B"

# Output folder for MP4 files
output_folder="/media/george/Expansion/RPi_Videos_B/Coc_B"


# Convert H.264 to MP4 using MP4Box
for file in "$input_folder"/*.h264; do
    # Get the base filename without extension
    base_filename=$(basename -- "$file")
    filename_no_extension="${base_filename%.*}"

    # Convert to MP4 using MP4Box
    MP4Box -add "$file" -fps 30 -new "$output_folder/$filename_no_extension.mp4"
done

# Resize MP4 files to 800x600 using FFmpeg
for mp4_file in "$output_folder"/*.mp4; do
    # Get the base filename without extension
    base_filename=$(basename -- "$mp4_file")
    filename_no_extension="${base_filename%.*}"

    # Resize using FFmpeg
    ffmpeg -i "$mp4_file" -vf "scale=800:600" -loglevel panic "$output_folder/${filename_no_extension}_j.mp4"
done

echo "Conversion and resizing completed."

