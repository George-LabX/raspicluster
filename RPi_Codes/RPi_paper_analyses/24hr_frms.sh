#!/bin/bash

# Set the paths
mp4path="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/mp4"
h264path="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/h264"
outpath="/media/georgelab/Expansion/RPi_Videos_B/Coc_B/24hr/results"

# List video files in mp4path and h264path
mp4_files=$(ls "$mp4path"/*.mp4)
h264_files=$(ls "$h264path"/*.h264)

# Iterate through each pair of video files
for mp4_file in $mp4_files; do
    baseMP4=$(basename "$mp4_file" .mp4)
    h264_file="$h264path/${baseMP4}.h264"

    # SSIM
    indv_ssim="$outpath/ssim/ssim_${baseMP4}.txt"
    all_ssim="$outpath/ssim/all_ssim.txt"
    ffmpeg -i "$h264_file" -i "$mp4_file" -lavfi "[0:v][1:v]ssim=stats_file=$indv_ssim" -f null - 2>&1 | tail -n 1 | tee -a $all_ssim

    # PSNR
    indv_psnr="$outpath/psnr/psnr_${baseMP4}.txt"
    all_psnr="$outpath/psnr/all_psnr.txt"
    ffmpeg -i "$h264_file" -i "$mp4_file" -lavfi "psnr=stats_file=$indv_psnr" -f null - 2>&1 | tail -n 1 | tee -a $all_psnr

    # VMAF
    indv_vmaf="$outpath/vmaf/vmaf_${baseMP4}.txt"
    all_vmaf="$outpath/vmaf/all_vmaf.txt"
    ffmpeg -i "$h264_file" -i "$mp4_file" -filter_complex libvmaf -f null - 2>&1 | tail -n 2 >> $indv_vmaf
    # Get the last 2 lines from the VMAF result and append to all_vmaf.txt
    tail -n 2 $indv_vmaf >> $all_vmaf
done

