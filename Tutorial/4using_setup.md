# Using the RPis
#### In this section we will instruct how to execute the recording file we just edited, remove old videos from the RPis, fetch videos from the RPis that were not transferred to the remote (often due to a connection loss), and review the overall process with some additional codes or simplifications that one may utilize. The executable codes for both the RPis and remote can be found in the [RPi_Codes](https://github.com/George-LabX/raspicluster/tree/main/RPi_Codes) folder.
#
First, connect to all of the RPis by using the ```cssh``` code found in the ```.bashrc``` file of the remote, for example: 
```bash
cssh pi@10.1.1.50 pi@10.1.1.51 pi@10.1.1.52 pi@10.1.1.53 pi@10.1.1.54 pi@10.1.1.55 pi@10.1.1.56
```
This can can be saved in a text file for easy reference and pasted into a terminal using the mouse option, not "ctrl+v" option.  

Once executed in the remote terminal, your screen should look something like the image below:

![cssh_image](https://github.com/George-LabX/raspicluster/assets/134438857/4c1dbebb-3bd4-4fa7-9064-c1ff22423b7d)

#
## Executing recordVideo.sh
To execute the ```recordVideo.sh``` file (found [here](https://github.com/George-LabX/raspicluster/blob/main/RPi_Codes/recordVideo.sh)) with the automated parameters and processes for the videos, you do so as follows:
```bash
./recordVideo.sh $1 $2 $3
  # $1 = argument 1, this is the name of the video ("LGA01" , "ShA02", "PR01" etc.)
  # $2 = argument 2, the length in minutes x 60 (6 hours = 360, 12 hours = 720)
  # $3 = argument 3, this is the framerate, typically set at 30
```
When put all together into a single example code, if one were on their 22nd Cocaine cohort that is presently in its third long access session which runs for six hours the code would look something like this:
```bash
./recordVideo.sh COCC22LGA03 360 30 
```
#
### Additions and Remarks to recordVideo.sh
#
Our lab currently operates with cohorts of Cocaine and Oxycodone rodents which run at varying lengths of access throughout the experiment, and in the past have studied vapor ethanol and nicotine.  

That being said, we wanted to simplify our operation by having a separate video code complete with their respective video paths so as to not have to hard code and change the one recording file for every different cohort that uses a different substance.  
This was done by first editing the ```recordVideo.sh``` file with:
```bash
nano recordVideo.sh 
```
From here we edited and saved it twice with the new and individualized paths for each drug cohort, and when saving, named them ```recoxy.sh``` ([Oxycodone](https://github.com/George-LabX/raspicluster/blob/main/RPi_Codes/recoxy.sh), image below) and ```recoc.sh``` ([Cocaine](https://github.com/George-LabX/raspicluster/blob/main/RPi_Codes/reccoc.sh)) respectively to make it simpler on our technicians.  

![recoxy sh_image](https://github.com/George-LabX/raspicluster/assets/134438857/d2d075ec-075d-49d6-87f0-980516e86897)

The original is still present on our RPis now acting as a template for future drugs if need be.  

After making them they need to be made executable which is possible with the code that changes its mode (```chmod```) to that which is executable with:
```bash
chmod +x recoxy.sh 
```
The new updated codes on GitHub have ```echo``` commands in the ```recordVideo.sh``` file, and as you can see we added some of our own that were more fitting to our operation to signal to our technicians that a video has begun recording, converting, transferring, and that all has completed without issue. We found this useful to prevent operator error or uncertainty. 



#
## Fetching and Deleting Videos off the Raspberry Pies


As one may have noticed, the ```recordVideo.sh``` command records the video, converts it from format h264 to mp4, transfers it to the remote controller, and then deletes the old h264 file. What this does not show is that the mp4 file is left on the RPi’s SD card. This is a good practice given the RPis can “lose connection” during the secure copy (scp) from the RPi to the remote and this ensures that the video that did not transfer is there to then be fetched.

### Fetching Videos from RPis
[PiRATeMC](https://github.com/alexcwsmith/PiRATeMC/blob/master/scripts/transferVideo.sh) has a code in the “scripts" folder in a file called ```transferVideo.sh``` that will be executed in all the RPis or in a single RPi that will send any and all videos from the RPi to your remote. Simply create a text file in Text Editor on Ubuntu, copy and paste the code from [PiRATeMC](https://github.com/alexcwsmith/PiRATeMC/blob/master/scripts/transferVideo.sh), and while connected to all RPis type:
```bash
scp yourremote:~/name_of_text_file_created.sh . 
```
with the necessary proxies as your design, and where this last period '''.''' is crucial to tell the file to be saved in the RPi’s home directory. Then, simply allow it to be executable with:
```bash
chmod +x name_of_text_file_created.sh
```
and you can now execute the code with:
```bash
./name_of_text_file_created.sh 
```
and transfer all videos from the RPis. A copy of ours can be found below complete with path and ```echo``` commands.
![send sh_image](https://github.com/George-LabX/raspicluster/assets/134438857/0c9d06a0-31c1-4f07-9c67-9968e521d4fd)

### Deleting Videos from RPis
Deleting videos, files, or any content is quite simple. Simply connect to all the RPis and type:
```bash
rm *mp4 
```
and this will remove any and all files ending in mp4, or simply type in the exact name of the file you wish to remove.

#
## Issues with Embedded Variables 
There is a file on the GitHub site called ```makePassFile.sh``` which is supposed to be executed to create a hidden password file that the RPi accesses when transferring videos in its bashrc file. We ran into issues with this file, as well as the variables ```$REMOTEPASS``` and ```$REMOTEVIDEOPATH```. You can find these variables in the ```.bashrc``` file of the RPis as well as the ```recordVideo.sh``` file. One may notice in the images above that all of our codes displayed have the exact password in place of ```$REMOTEPASS``` as well as the hostname of the ```$REMOTE``` and the exact path the video files will be sent to for storage in place of ```$REMOTEVIDEOPATH```. When replacing these variables in the ```.bashrc``` files there was always an error stating “permission denied” despite the passfile being created that could not be rectified. We worked around this by hard coding them, something that any individualized setup can do.  

Another was in the ```recordVideo.sh``` file as aforementioned. After replacing the necessary fields with our specifications we ran our setup line by line from this file, each executing with no errors, but when executing the file itself each time returned an error, specifically again stating “permission denied”, referencing the password to the remote. Here too we felt it simpler to replace the variables as you can do so in each RPi simultaneously through the cssh command feature.


Note: This has been rectified and enacted with call variables. It was found that after changing ```.bashrc``` portions of the RPi or the mini PC one needs to restart the device to allow changes to be implemented.
