# Programming a Raspberry Pi (RPi)
##### This tutorial we will walk you through the individual programming of each RPi to be in a cluster design. All the files mentioned for RPi programming can be found in the [RPi_Codes](https://github.com/George-LabX/raspicluster/tree/main/RPi_Codes) folder.
#  


To access a single RPi look for the IP address on the dhcp-lease-list and run the following code: 
```bash
ssh pi@10.1.1.XX # replacing “XX” with the respective ending numbers of the RPi

# password when prompted

raspberry
```

Now that we are connected, a habit to incorporate in both the RPi and remote terminals is to run the codes: 
```bash
sudo apt-get upgrade
sudo apt-get update 
```
This will keep your devices up to date and running smoothly. 

Next, we’ll change the file that we will be executing via ```cssh``` to set the recording parameters, converting to mp4, transferring to the AWOW, and deleting the other video format version (h264). 
This is a file already preinstalled from the OS SDcard flash from [PiRATeMC](https://drive.google.com/drive/folders/1Y9IGVBCkBdnRykqMNaKmlipFwnT6WQuY). In the RPi terminal type in:
```bash
nano recordVideo.sh 
```
And what you should see is the image below:

![recordVideo sh_image](https://github.com/George-LabX/raspicluster/assets/134438857/a4b45f60-b4ea-43ad-b761-9bab2419ef3b)

What you will change is the bitrate ```-br 55```, width of the resolution ```-w 800```, and the height of the resolution ```-h 600``` in line 3, as well as adding the name (or convention of your design choice) of this RPi to the outputs, so if it is the first box in your design it will be ```$1_Box01_$now.h264```. Once done, ctrl+x will exit, then follow the prompts to save. Note that in this recording file you can adjust the parameters to fit whatever configuration works best for your organization. The code filled out as such can be found [here](https://github.com/George-LabX/raspicluster/blob/main/RPi_Codes/recordVideo.sh).  

Next change the bashrc file of the RPi. Access this file by typing:
```bash
nano .bashrc 
```
![pi_bash_image](https://github.com/George-LabX/raspicluster/assets/134438857/225808a5-b60e-476e-a02d-4cf2780de86a)

The only thing one needs to change here (if one keeps the switch IP address assigned prior) is the hostname of your remote.  
This can be found as the first "export" line ```export REMOTE=rpicam@10.1.1.243``` and change it to ```export REMOTE=yourhostname@10.1.1.243```. Once done, ctrl+x will exit, then follow the prompts to save. Not that you will need to create folders with the names "RPi_SessionLogs" and "RPi_Videos" in your home directory if this is the convention/path you wish to use.   
  
Now in the RPi terminal, type in:
```bash
sudo raspi-config
```
This will allow you to alter the hostname of the RPi to match its respective box and representation on dhcp-lease-list (options 2), as well as ensure certain elements of the peripherals are active, such as ssh for connection and sending videos and that the camera interface is on (option 5), including other possible options such as changing the password (option 1) of the RPi.
![raspiconfig_image](https://github.com/George-LabX/raspicluster/assets/134438857/f9549933-4aea-446a-ba2e-e8fd169df4c2)
If you change the password and have a cluster system, it is crucial the password is exact across all RPis.  
Once done, press the right arrow key twice to access “finish” and press “enter”.  
The RPi will reset, in which case you can now plug in another RPi to allow it to boot and connect. 

This last step is important for the remote itself to be able to enact the cluster secure shell (cssh) and connect to all the RPis simultaneously. 
In the AWOW remote’s terminal, type:
```bash
nano .bashrc 
```
From here, you will add ```alias camconnect='cssh pi@10.1.1.50 …'``` as exemplified at the bottom of the picture below.  
Notice how they are not separated by commas and that the entire code beginning with cssh is within quotes.  
From here you can add all the RPis at one time and I have found it to be faster and not an issue, but if it is more convenient for yourself you can always add one at a time.
![mini_bash_image](https://github.com/George-LabX/raspicluster/assets/134438857/d8940123-d39f-44fa-95a4-9a75b94066a3)

[next](https://github.com/George-LabX/raspicluster/blob/main/Tutorial/4using_setup.md)
