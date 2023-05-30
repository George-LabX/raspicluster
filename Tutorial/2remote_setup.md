# Remote Control Setup
#### In this tutorial, "remote" will be refering to the PC acting as a controller for the setup.
#
Now that the RPis have been built, Ubuntu partitioned on your remote device, and SD Cards flashed with the OS system, the next step is programming the remote itself. The following procedure has been adapted from the [GitHub](https://github.com/alexcwsmith/PiRATeMC/tree/master/networking) mentioned in [Centanni and Smith (2021)](https://www.biorxiv.org/content/10.1101/2021.07.23.453577v2.full), with a few steps we included for user accessibility as they were not intuitive during our setup nor referenced. 


The first thing to do is to find a location that is best centralized or suited for your design to place the Cisco Catalyst 3650 (or other switchboard) and plug it into a power outlet and wait about five minutes for it to boot itself up with no lights blinking on the front left panel, then connect the remote to the switch by ethernet to one of its front ports. Log into your Ubuntu machine and open the Terminal application by finding the icon or by pressing “ctrl+alt+T” and install the necessary packages:
```bash
sudo apt install openssh-server
sudo apt install isc-dhcp-server
sudo apt install bind9
sudo apt install clusterssh
```
Once done, click the links below that can be found in the [prog_files] folder that will take you to the respective codes on the GitHub site, then copy and paste them into a Text Editor file:

[network-manager-all.yaml](https://github.com/George-LabX/raspicluster/blob/main/prog_files/network-manager-all.yaml)  
[dhcpd.conf](https://github.com/George-LabX/raspicluster/blob/main/prog_files/dhcpd.conf)  
[isc-dhcp-server](https://github.com/George-LabX/raspicluster/blob/main/prog_files/isc-dhcp-server)  
[named.conf.options](https://github.com/George-LabX/raspicluster/blob/main/prog_files/named.conf.options)  
[writeNetworkConfigs.sh](https://github.com/George-LabX/raspicluster/blob/main/prog_files/writeNetworkConfigs.sh)

Each of these are to be used internally throughout this process or used as a template for up and coming codes. Open a terminal and execute the following code to make backups of the current network configuration and useful files for reference in later sections.
```bash
./writeNetworkConfigs.sh
```
Next you will need to access the netplan of your device and alter it in order to recognize the switchboard and create a Local Area Network (LAN) connection with the remote. This is possible with the following code: 
```bash
sudo nano /etc/netplan/*.yaml. 
``` 
Now that we are into the network configuration, erase what is currently present in the terminal, and paste the contents of the ```network-manager-all.yaml``` file we just made previously. Note that, for our design, the ethernet ports of interest are enp1 and enp2, enp1 being for the organizational internet connection and should be the IP address of the remote device, and enp2 for the switchboard reading "10.1.1.243" that can be left alone unless you personally would like it to read differently. Next is to change the contents of the enp1 and enp2 listings to your system's IP address, gateway, and nameservers. If you are unsure what the necessary elements are to be changed to, you can find them in the default files we created above at the beginning with the second grouping of codes such as defaultIPaddress.conf, defaultDNS.conf, and ipRoute.conf. The 'to' and 'metric' locations can be left the same, while your 'via' is to be changed to your gateway and the namesaver to your namesaver.  

After saving the changes with ctrl+x to exit and y to save, enter the following code to update it to the settings specified: 
```bash
sudo netplan apply.  
```  
If you receive errors simple retype:
```bash
sudo nano /etc/netplan/*.yaml 
```
to fix the errors, typically a word spelled wrong or indention issues.  

A simple short hand is pressing the “up” arrow on the keyboard to repopulate the terminal line with the previous code, and can keep pressing till you find the code you are looking for.
Next is to run the following codes that will copy the files we made earlier into portions of the remote that will allow us to connect to the switch and access the RPis over a secure shell (ssh) and and a cluster secure shell (cssh):
```bash
sudo cp dhcpd.conf /etc/dhcp/dhcpd.conf
sudo cp isc-dhcp-server /etc/default/isc-dhcp-server 
    # (note Centanni and Smith (2021) have this code ending with a "/", do NOT include it or it won't run)       
sudo cp named.conf.options /etc/bind9/named.conf.options
```
For this last code, if you haven't created a directory bind9 in the /etc directory it will give an error. This can be fixed as follows:
```bash
cd /etc                                                    # changes directory to /etc
sudo mkdir bind9                                           # creates bind9 directory for you to copy file into
sudo cp named.conf.options /etc/bind9/named.conf.options   # copies file into directory
```      
And lastly, we turn on the necessary applications to access the switch:
```bash
sudo systemctl start isc-dhcp-server
sudo systemctl start bind9
```
Now, restart the AWOW remote to enact all the changes and connect to the switchboard. Plug in an RPi that has been built and the SD card flashed with the OS system you wish to use, wait about 30-60secs for the RPi to boot, then type:
```bash
dhcp-lease-list
```
And now you should see a the Pi connected with an IP address around 10.1.1.50 and named “raspberry”, something you can individuate once we now program the RPis.

