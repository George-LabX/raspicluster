&{

&Write-Host "`n`n Here goes nothing... `n`n"

&Write-Host "Exporting Session Lengths (secs) `n`n"

}


&{
# Set the folder paths
$inpath = "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\mp4"
$outpath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\video_length" 

# List video files in inpath
$videoFiles = Get-ChildItem -Path $inpath -Filter "*.mp4"

# Iterate through each video file
foreach ($videoFile in $videoFiles) {
    $inputFile = Join-Path -Path $inpath -ChildPath $videoFile
    $outputFile = Join-Path -Path $outpath -ChildPath ($videoFile.BaseName + "_length.txt")

    # Export video duration using ffprobe
    $videoDuration = ffprobe -i $inputFile -v quiet -show_entries format=duration -hide_banner -of default=noprint_wrappers=1:nokey=1

    # Save video duration to the output file
    $videoDuration | Out-File -FilePath $outputFile

    # Append video duration to the CSV file
    Add-Content -Path vid_length.csv -Value "$videoDuration"
}}


&{

&Write-Host "`n`n Session Lengths (secs) Exported `n`n"

&Write-Host "Exporting Light Event Frames `n`n"

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

    New-Item -Path $outputDirectory -ItemType "file" -Name "light_frame.txt"

    $inputFile = Join-Path -Path $inpath -ChildPath $videoFile
    $outputFile = Join-Path -Path $outputDirectory -ChildPath ($videoFile.BaseName + "_frame_%03d.jpg")

    # Export frames using ffmpeg
    ffmpeg -ss 0 -t 11 -i "$inputFile" -an -q:v 2 "$outputFile"

Write-Host "`n`n $($inputFile) complete `n`n"
}}


&{

&Write-Host "`n`n Light Event Frames Exported, Next Task `n`n"

&Write-Host "`n`n Beginning Light Frame Extraction `n`n"

}



&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box02_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box02_2023-08-26_frames\hr1_05_Box02_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box07_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box07_2023-08-26_frames\hr1_05_Box07_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box08_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box08_2023-08-26_frames\hr1_05_Box08_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box09_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box09_2023-08-26_frames\hr1_05_Box09_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box10_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_05_Box10_2023-08-26_frames\hr1_05_Box10_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box01_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box01_2023-08-26_frames\hr1_10_Box01_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box02_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box02_2023-08-26_frames\hr1_10_Box02_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box03_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box03_2023-08-26_frames\hr1_10_Box03_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box05_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box05_2023-08-26_frames\hr1_10_Box05_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box06_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box06_2023-08-26_frames\hr1_10_Box06_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box07_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box07_2023-08-26_frames\hr1_10_Box07_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box08_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box08_2023-08-26_frames\hr1_10_Box08_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box09_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box09_2023-08-26_frames\hr1_10_Box09_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box10_2023-08-25_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box10_2023-08-25_frames\hr1_10_Box10_2023-08-25_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box11_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr1_10_Box11_2023-08-26_frames\_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box01_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box01_2023-08-26_frames\hr2_10_Box01_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box02_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box02_2023-08-26_frames\hr2_10_Box02_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box03_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box03_2023-08-26_frames\hr2_10_Box03_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box05_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box05_2023-08-26_frames\hr2_10_Box05_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box06_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box06_2023-08-26_frames\hr2_10_Box06_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box07_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box07_2023-08-26_frames\hr2_10_Box07_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box08_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box08_2023-08-26_frames\hr2_10_Box08_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box09_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box09_2023-08-26_frames\hr2_10_Box09_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box10_2023-08-25_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box10_2023-08-25_frames\hr2_10_Box10_2023-08-25_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box11_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_10_Box11_2023-08-26_frames\_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box01_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box01_2023-08-26_frames\hr2_15_Box01_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box02_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box02_2023-08-26_frames\hr2_15_Box02_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box03_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box03_2023-08-26_frames\hr2_15_Box03_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box05_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box05_2023-08-26_frames\hr2_15_Box05_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box06_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box06_2023-08-26_frames\hr2_15_Box06_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box07_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box07_2023-08-26_frames\hr2_15_Box07_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box08_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box08_2023-08-26_frames\hr2_15_Box08_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box09_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box09_2023-08-26_frames\hr2_15_Box09_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box10_2023-08-25_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box10_2023-08-25_frames\hr2_15_Box10_2023-08-25_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box11_2023-08-26_frames"

$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box11_2023-08-26_frames\hr2_15_Box11_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box12_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box12_2023-08-26_frames\hr2_15_Box12_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box13_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box13_2023-08-26_frames\hr2_15_Box13_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box14_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box14_2023-08-26_frames\hr2_15_Box14_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box15_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box15_2023-08-26_frames\hr2_15_Box15_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{
# Set the folder path
$imageFolderPath = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box16_2023-08-26_frames"


$refImage = "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\frame_nums\hr2_15_Box16_2023-08-26_frames\hr2_15_Box16_2023-08-26_frame_181.jpg"


# Initialize to store results
$results = @()

# Iterate and conduct SSIM analyses
$imageFiles = Get-ChildItem -Path $imageFolderPath -Filter "*.jpg"
foreach ($imageFile in $imageFiles) {
    $output = ffmpeg -i "$refImage" -i "$($imageFile.FullName)" -lavfi "[0:v][1:v]ssim" -f null - 2>&1
    
    $results += $output
}

# Save results to text file
$results | Out-File -FilePath "$imageFolderPath\light_frame.txt" -Append


Write-Host "Results saved to: $imageFolderPath\light_frame.txt"

}


&{

&Write Host " `n`n All Light Event Frames Identified `n`n "

&Write-Host "Exporting 1hr Session Frames `n`n"

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

&Write-Host "`n`n Frames From 1hr Session Exported, Next Task `n`n"

&Write-Host "Exporting 2hr Session Frames `n`n"

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
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box02_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 01 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box07_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 02 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box08_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 03 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box09_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 04 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box10_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box10_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 05 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box01_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box01_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 06 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box02_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 07 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box03_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box03_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 08 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box05_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box05_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim09.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 09 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box06_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box06_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim10.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 10 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box07_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim11.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 11 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box08_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim12.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 12 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box09_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim13.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 13 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box10_2023-08-25.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim14.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 14 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box11_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim15.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 15 Complete`n`n"

}


&{

&Write-Host "SSIM Analyses For 1hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\ssim\2hr"

&Write-Host "Beginning SSIM 2hr Analyses`n`n"
}


&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box01_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box01_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 01 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box02_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 02 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box03_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box03_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 03 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box05_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box05_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 04 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box06_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box06_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 05 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box07_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 06 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box08_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 07 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box09_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 08 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box10_2023-08-25.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim09.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 09 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box11_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim10.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 10 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box01_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box01_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 11 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box02_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 12 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box03_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box03_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 13 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box05_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box05_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 14 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box06_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box06_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 15 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box07_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 16 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box08_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 17 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box09_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 18 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box10_2023-08-25.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim19.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 19 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box11_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim20.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 20 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box12_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box12_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim21.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 21 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box13_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box13_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim22.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 22 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box14_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box14_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim23.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 23 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box15_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box15_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim24.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 24 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box16_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box16_2023-08-26.mp4" -lavfi "[0:v][1:v]ssim=stats_file=ssim25.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_ssim.txt -Append

&Write-Host "SSIM 25 Complete`n`n"

}


&{
&Write-Host "SSIM Analyses For 2hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\psnr\1hr"

&Write-Host "Beginning PSNR 1hr Analyses`n`n"
}


&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box02_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 01 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box07_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 02 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box08_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 03 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box09_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 04 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_05_Box10_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_05_Box10_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 05 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box01_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box01_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 06 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box02_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 07 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box03_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box03_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 08 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box05_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box05_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr09.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 09 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box06_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box06_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr10.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 10 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box07_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr11.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 11 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box08_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr12.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 12 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box09_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr13.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 13 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box10_2023-08-25.mp4" -lavfi "psnr=stats_file=psnr14.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 14 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box11_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr15.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 15 Complete`n`n"

}


&{
&Write-Host "PSNR Analyses For 1hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\psnr\2hr"

&Write-Host "Beginning PSNR 2hr Analyses`n`n"
}


&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box01_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box01_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr01.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 01 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box02_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr02.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 02 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box03_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box03_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr03.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 03 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box05_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box05_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr04.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 04 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box06_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box06_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr05.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 05 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box07_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr06.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 06 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box08_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr07.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 07 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box09_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr08.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 08 Complete`n`n"

ffmpeg -i ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box10_2023-08-25.mp4" -lavfi "psnr=stats_file=psnr09.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 09 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box11_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr10.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 10 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box01_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box01_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr11.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 11 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box02_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr12.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 12 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box03_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box03_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr13.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 13 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box05_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box05_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr14.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 14 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box06_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box06_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr15.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 15 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box07_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr16.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 16 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box08_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr17.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 17 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box09_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr18.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 18 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box10_2023-08-25.mp4" -lavfi "psnr=stats_file=psnr19.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 19 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box11_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr20.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 20 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box12_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box12_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr21.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 21 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box13_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box13_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr22.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 22 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box14_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box14_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr23.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 23 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box15_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box15_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr24.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 24 Complete`n`n"

ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box16_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box16_2023-08-26.mp4" -lavfi "psnr=stats_file=psnr25.txt" -f null - 2>&1 | Select-Object -Last 1 | tee -FilePath all_psnr.txt -Append

&Write-Host "PSNR 25 Complete`n`n"

}


&{
&Write-Host "PSNR Analyses For 2hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\vmaf\1hr"

&Write-Host "Beginning VMAF 1hr Analyses`n`n"
}


&{
&Write-Host "PSNR Analyses For 2hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\vmaf\1hr"

&Write-Host "Beginning VMAF 1hr Analyses`n`n"
}


&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box01_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box01_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf01.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf01.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 01 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box02_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf02.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf02.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 02 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box03_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box03_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf03.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf03.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 03 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box05_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box05_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf04.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf04.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 04 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box06_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box06_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf05.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf05.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 05 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box07_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf06.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf06.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 06 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box08_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf07.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf07.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 07 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box09_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf08.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf08.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 08 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box10_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box10_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf09.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf09.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 09 Complete"
}

{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_10\hr2_10_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_10\hr2_10_Box11_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf10.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf10.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 10 Complete`n`n"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box07_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf11.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf11.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 11 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box08_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf12.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf12.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 12 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box09_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf13.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf13.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 13 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box10_2023-08-25.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf14.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf14.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 14 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box11_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf15.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf15.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 15 Complete"
}


&{
&Write-Host "VMAF Analyses For 1hr Sessions Complete, Next Task`n`n"

& cd "C:\Users\Jarryd\Documents\Employment\Dr. George Lab\Assignments\Pi Paper\stats_data\vmaf\2hr"

&Write-Host "Beginning VMAF 2hr Analyses`n`n"
}


&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box01_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box01_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf11.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf11.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 11 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box02_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box02_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf12.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf12.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 12 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box03_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box03_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf13.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf13.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 13 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box10_2023-08-25.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf14.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf14.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 14 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\h264\hr1_10_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\1hr\mp4\hr1_10_Box11_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf15.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf15.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 15 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box07_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box07_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf16.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf16.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 16 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box08_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box08_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf17.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf17.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 17 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box09_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box09_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf18.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf18.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 18 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box10_2023-08-25.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box10_2023-08-25.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf19.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf19.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 19 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box11_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box11_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf20.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf20.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 20 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box12_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box12_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf21.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf21.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 21 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box13_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box13_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf22.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf22.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 22 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box14_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box14_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf23.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf23.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 23 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box15_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box15_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf24.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf24.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 24 Complete"
}

&{
ffmpeg -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\h264\hr2_15_Box16_2023-08-26.h264" -i "C:\Users\Jarryd\George Lab Dropbox\George_Lab\Experiments\RPi Video recordings\Jarryd_RPi_Test\2hr\mp4\hr2_15_Box16_2023-08-26.mp4" -filter_complex libvmaf -f null - 2>&1 | Out-File -FilePath vmaf25.txt

# Get the last 2 lines from result
$lastLines = Get-Content vmaf25.txt | Select-Object -Last 1

# Append the last 2 lines to all_vmaf.txt
$lastLines | Out-File -FilePath all_vmaf.txt -Append

Write-Host "VMAF 25 Complete"
}



&{

&Write-Host "`n`n Breathe! It's all done! `n`n"

}
