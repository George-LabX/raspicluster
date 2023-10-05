# Ubuntu Installation

Our lab is split into four rows of operant chambers and therefore each contains one AWOW mini PC to act as a remote controller with the latest version of Ubuntu installed via USB drive. 

As [Centanni and Smith (2023)](https://www.sciencedirect.com/science/article/pii/S2772392523000512) state, the Raspberry Pies use Raspbian, a Linux operating system, and although it can be used on Windows with some modifications and the AWOW PCs we used already come with Windows 10, we chose to install a partition of Ubuntu, a Linux operating system to interface smoothly with the Raspbian system. 

This can be done with a USB drive with 4GB or more of storage space, searching for “Ubuntu USB installation Rufus" in the internet browser of your choice to find the page at this link [here](https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#1-overview) on the Ubuntu website.

This will walk one through creating a bootable image on the USB to install Ubuntu on the AWOW PC utilizing Rufus, a free and simple open source USB writing tool.

#

# Raspberry Pi Imager Installation

If the version of Ubuntu is 16.04 LTS (Xenial Xerus) or later, including Ubuntu 18.04 LTS (Bionic Beaver) and Ubuntu 20.04 LTS (Focal Fossa), then snap is already installed on your device, and all you have to do is open a Terminal window and type:
```bash
sudo snap install rpi-imager. 
```
Once installed, if you have not already, visit the google drive found on the PiRATeMC site [here](https://drive.google.com/drive/folders/1Y9IGVBCkBdnRykqMNaKmlipFwnT6WQuY), of if you are a member of the George Lab, download the RPI clone found [here](https://www.dropbox.com/home/George_Lab/Experiments/RPi%20Video%20recordings/Equipment/Raspberry%20Pi%20Clone).
Download the appropriate OS system depending on your design, whether standalone or cluster. Note: this tutorial is for a cluster design. 

Plug in an SD card with a reader, and from left to right on the RPi Manager select “Custom Image” for the operating system dropdown, then the listed SD card as the storage device dropdown, and lastly “Write”. Once finished, remove the SD card and repeat as needed.

[next](https://github.com/George-LabX/raspicluster/blob/main/Tutorial/2remote_setup.md)
