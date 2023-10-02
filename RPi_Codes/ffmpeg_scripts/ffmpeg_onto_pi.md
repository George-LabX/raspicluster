# How to put a static FFmpeg build onto a headless and internetless Raspberry Pi and accessible Pi-wide

## Step 1. 
Go to https://johnvansickle.com/ffmpeg/ found on the FFmpeg website and download the latest static build and put it in your remote's home directory. This particular tutorial is using ffmpeg-release-armhf-static.tar.xz.

## Step 2.
Access all Raspberry Pis with the `cssh` command line, and enter the following:
```
scp yourremote@10.1.1.243:~/ffmpeg-release-armhf-static.tar.xz .
```
Make sure to replace the "yourremote@10.1.1.243" with the hostname off your remote machine and its IP address if made different than explained in the [Tutorial](https://github.com/George-LabX/raspicluster/tree/main/Tutorial)

## Step 3.
Now that the file has securely copied (`scp`) from your remote home directory to the home directories of your RPis, type the following into each Pi terminal to unzip/untar the file:
```
tar -xf ffmpeg-release-armhf-static.tar.xz
```
This will open the tarred file into your RPi, you can now delete said file with `rm *xz`

## Step 4. 
Now that the file is opened and contents available, type the following set of codes into each RPi to do the following:
```
cd ffmpeg-6.0-armhf-static             # enter directory
sudo cp ./ffmpeg /usr/local/bin        # copy FFmpeg function to be used locally system-wide
sudo chmod +x /usr/local/bin/ffmpeg    # make said function executable system-wide
```

## Step 5.
You should now be able to go back to the RPi home directory and test that FFmpeg is installed correctly:
```
cd ~/     # change directory to home
ffmpeg    # executes ffmpeg, revealing the packages installed and version
```
And now you should see the following:

