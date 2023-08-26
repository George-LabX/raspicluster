# Analyses file for RPi paper written in amalgamation of FFmpeg and Windows Power Shell
# Following code block contains:
  # Export first 5secs of frames (150)
  # Timestamps for 1hr sessions
  # Timestamps for 2hr sessions
  # SSIM for 1hr sessions
  # SSIM for 2hr sessions
  # PSNR for 1hr sessions
  # PSNR for 2hr sessions
  # VMAF for 1hr sessions
  # VMAF for 2hr sessions
  

&{
&Write-Host "Here goes nothing...`n`n"

&Write-Host "Exporting Light Event Frames`n`n"
}


&{
# Set the folder paths
$inpath = "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\mp4"
$outpath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums" 

# List video files in inpath
$videoFiles = Get-ChildItem -Path $inpath -Filter "*.mp4"

# Iterate through each video file
foreach ($videoFile in $videoFiles) {
    $outputDirectory = Join-Path -Path $outpath -ChildPath ($videoFile.BaseName + "_frames")
    New-Item -Path $outputDirectory -ItemType "directory" -Force

    $inputFile = Join-Path -Path $inpath -ChildPath $videoFile
    $outputFile = Join-Path -Path $outputDirectory -ChildPath ($videoFile.BaseName + "_frame_%03d.jpg")

    # Export frames using ffmpeg
    ffmpeg -ss 0 -t 5 -i "$inputFile" -an -q:v 2 "$outputFile"
}}


&{
&Write-Host "Light Event Frames Exported, Next Task`n`n"

&Write-Host "Exporting 1hr Session Frames`n`n"
}


&{
# Set the folder paths
$inpath = "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4"
$outpath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\timestamps\1hr"

# list video files in inpath
$videoFiles = Get-ChildItem -Path $inpath -Filter "*.mp4"

# Iterate through each video file
foreach ($videoFile in $videoFiles) {
    $inputFile = Join-Path -Path $inpath -ChildPath $videoFile
    $outputFile = Join-Path -Path $outpath -ChildPath ($videoFile.BaseName + "_timestamps.csv")
    
    # Export frames using ffmpeg
    ffprobe "$inputfile" -select_streams v -show_entries frame=coded_picture_number,pkt_pts_time -of csv=p=0:nk=1 -v 0 > "$outputFile"
    
    Write-Host "Complete: $($videoFile.Name) -> $($outputFile)"
}}


&{
&Write-Host "Frames From 1hr Session Exported, Next Task`n`n"

&Write-Host "Exporting 2hr Session Frames`n`n"
}


&{
# Set the folder paths
$inpath = "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4"
$outpath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\timestamps\2hr"

# list video files in inpath
$videoFiles = Get-ChildItem -Path $inpath -Filter "*.mp4"

# Iterate through each video file
foreach ($videoFile in $videoFiles) {
    $inputFile = Join-Path -Path $inpath -ChildPath $videoFile
    $outputFile = Join-Path -Path $outpath -ChildPath ($videoFile.BaseName + "_timestamps.csv")
    
    # Export frames using ffmpeg
    ffprobe "$inputfile" -select_streams v -show_entries frame=coded_picture_number,pkt_pts_time -of csv=p=0:nk=1 -v 0 > "$outputFile"
    
    Write-Host "Complete: $($videoFile.Name) -> $($outputFile)"
}}


&{
&Write-Host "Frames From 2hr Session Exported, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\ssim\1hr"

&Write-Host "Beginning SSIM 1hr Analyses`n`n"
}


&{
ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 01 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 02 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 03 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 04 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 05 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 06 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 07 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 08 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim09.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 09 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim10.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 10 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim11.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 11 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim12.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 12 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim13.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 13 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim14.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 14 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim15.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 15 Complete`n`n"

}


&{
&Write-Host "SSIM Analyses For 1hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\ssim\2hr"

&Write-Host "Beginning SSIM 2hr Analyses`n`n"
}


&{
ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 01 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 02 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 03 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 04 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 05 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 06 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 07 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 08 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim09.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 09 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim10.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 10 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim11.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 11 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim12.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 12 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim13.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 13 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim14.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 14 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim15.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 15 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim16.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 16 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim17.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 17 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim18.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 18 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim19.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 19 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim20.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 20 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim21.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 21 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim22.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 22 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim23.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 23 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim24.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 24 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "[0:v][1:v]ssim=stats_file=ssim25.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 25 Complete`n`n"

}


&{
&Write-Host "SSIM Analyses For 2hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\psnr\1hr"

&Write-Host "Beginning PSNR 1hr Analyses`n`n"
}


&{
ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 01 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 02 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 03 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 04 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 05 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 06 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 07 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 08 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr09.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 09 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr10.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 10 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr11.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 11 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr12.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 12 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr13.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 13 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr14.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 14 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr15.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 15 Complete`n`n"

}

&{
&Write-Host "PSNR Analyses For 1hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\psnr\2hr"

&Write-Host "Beginning PSNR 2hr Analyses`n`n"
}

&{
ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 01 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 02 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 03 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 04 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 05 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 06 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 07 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 08 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr09.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 09 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr10.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 10 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr11.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 11 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr12.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 12 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr13.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 13 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr14.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 14 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr15.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 15 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr16.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 16 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr17.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 17 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr18.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 18 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr19.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 19 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr20.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 20 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr21.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 21 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr22.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 22 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr23.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 23 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr24.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 24 Complete`n`n"

ffmpeg -i "ref.vid" -i "test.vid -lavfi "psnr=stats_file=psnr25.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 25 Complete`n`n"

}

&{
&Write-Host "PSNR Analyses For 2hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\vmaf\1hr"

&Write-Host "Beginning VMAF 1hr Analyses`n`n"
}

&{
{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf01.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf01.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "01 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf02.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf02.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "02 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf03.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf03.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "03 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf04.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf04.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "04 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf05.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf05.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "05 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf06.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf06.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "06 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf07.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf07.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "07 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf08.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf08.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "08 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf09.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf09.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "09 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf10.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf10.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "10 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf11.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf11.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "11 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf12.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf12.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "12 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf13.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf13.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "13 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf14.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf14.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "14 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf15.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf15.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "15 Complete"

}

&{
&Write-Host "VMAF Analyses For 1hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\vmaf\2hr"

&Write-Host "Beginning VMAF 2hr Analyses`n`n"
}

&{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf01.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf01.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "01 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf02.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf02.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "02 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf03.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf03.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "03 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf04.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf04.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "04 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf05.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf05.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "05 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf06.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf06.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "06 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf07.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf07.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "07 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf08.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf08.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "08 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf09.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf09.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "09 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf10.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf10.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "10 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf11.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf11.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "11 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf12.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf12.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "12 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf13.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf13.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "13 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf14.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf14.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "14 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf15.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf15.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "15 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf16.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf16.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "16 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf17.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf17.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "17 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf18.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf18.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "18 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf19.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf19.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "19 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf20.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf20.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "20 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf21.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf21.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "21 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf22.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf22.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "22 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf23.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf23.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "23 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf24.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf24.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "24 Complete"
}

{
ffmpeg -i "ref.vid" -i "dis.vid" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf25.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf25.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "25 Complete"

}

&{
&Write-Host "Breathe! It's all done!"
}
