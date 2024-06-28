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



# Set the paths
mp4path="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/mp4"
h264path="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/h264"
outpath="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/results"

# Create output directories if they don't exist
mkdir -p "$outpath/ssim" "$outpath/psnr" "$outpath/vmaf"

# List video files in mp4path
mp4_files=$(ls "$mp4path"/*.mp4)

# Iterate through each pair of video files
for mp4_file in $mp4_files; do
    baseMP4=$(basename "$mp4_file" .mp4)
    h264_file="$h264path/${baseMP4}.h264"

    # SSIM
    indv_ssim="$outpath/ssim/ssim_${baseMP4}.txt"
    all_ssim="$outpath/ssim/all_ssim.txt"
    ffmpeg -i "$h264_file" -i "$mp4_file" -lavfi "[0:v][1:v]ssim=stats_file=$indv_ssim" -f null - 2>&1 | tail -n 5 >> "$all_ssim"

    # PSNR
    indv_psnr="$outpath/psnr/psnr_${baseMP4}.txt"
    all_psnr="$outpath/psnr/all_psnr.txt"
    ffmpeg -i "$h264_file" -i "$mp4_file" -lavfi "psnr=stats_file=$indv_psnr" -f null - 2>&1 | tail -n 5 >> "$all_psnr"

    # VMAF
    indv_vmaf="$outpath/vmaf/vmaf_${baseMP4}.txt"
    all_vmaf="$outpath/vmaf/all_vmaf.txt"
    ffmpeg -i "$h264_file" -i "$mp4_file" -lavfi "libvmaf=log_path=$indv_vmaf" -f null - 2>&1 | tail -n 5 >> "$all_vmaf"
done

