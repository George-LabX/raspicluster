#!/bin/bash
# For videos shot in 1280x720 resolution
# This code takes in a directory corresponding to a cohort,
# it will then enter each subdirectory (sessions) and use ffmpeg
# to set frame rates to 30 and "resize" the video using ffmpeg, 
# which lowers bits and thereby video file size.

# Specify the input directory containing subdirectories
input_directory="/media/george/Expansion/RPi_Videos_B/Oxy_B/Past_Cohorts/C20_Oxy_B"

# Specify the output directory for resized files
output_directory="/media/george/Expansion/RPi_Videos_B/Oxy_B/Past_Cohorts/C20_Oxy_B_Resized"

# Ensure the output directory exists
mkdir -p "$output_directory"

# Loop through each subdirectory in the input directory
for subdirectory in "$input_directory"/*/; do
    # Get the base name of the subdirectory
    base_name=$(basename "$subdirectory")
    
    # Loop through all mp4 files in the subdirectory
    for mp4_file in "$subdirectory"/*.mp4; do
        # Get the base filename without extension
        base_filename=$(basename -- "$mp4_file")
        filename_no_extension="${base_filename%.*}"

        # Resize using FFmpeg, suppress verbosity
        ffmpeg -i "$mp4_file" -vf "scale=1280:720" -r 30 -loglevel panic "$output_directory/${filename_no_extension}_j.mp4"
        
        echo "Resized: ${filename_no_extension}.mp4"
    done
done

echo "Resizing completed."

