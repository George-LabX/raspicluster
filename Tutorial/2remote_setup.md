# Remote Control Setup
#### In this tutorial, "remote" will be refering to the AWOW mini PC controlling the setup and Raspberry Pis (RPis).
#
Now that the RPis have been built, Ubuntu partitioned on your remote, and SD Cards flashed with the OS system, the next step is programming the remote itself. The following procedure has been adapted from the [GitHub](https://github.com/alexcwsmith/PiRATeMC/tree/master/networking) mentioned in [Centanni and Smith (2023)](https://www.sciencedirect.com/science/article/pii/S2772392523000512), with a few steps we included for user accessibility as they were not intuitive during our setup. 


The first thing to do is to find a location that is best centralized or suited for your design to place the Cisco Catalyst 3650 (or other switchboard) and plug it into a power outlet and wait about five minutes for it to boot itself up with no lights blinking on the front panel. Once done, connect the remote to the switch by ethernet to one of its 24 front ports. Log into your Ubuntu machine and open the Terminal application by finding the icon or by pressing “ctrl+alt+T” and install the necessary packages with this code block:
```bash
sudo apt install openssh-server
sudo apt install isc-dhcp-server
sudo apt install bind9
sudo apt install clusterssh
```
Once done, click the links below that can be found in the [prog_files](https://github.com/George-LabX/raspicluster/tree/main/prog_files) folder that will take you to the respective codes on this GitHub site, then either copy and paste them into a Text Editor file or download them:

[01-network-manager-all.yaml](https://github.com/George-LabX/raspicluster/blob/main/prog_files/01-network-manager-all.yaml)  
[dhcpd.conf](https://github.com/George-LabX/raspicluster/blob/main/prog_files/dhcpd.conf)  
[isc-dhcp-server](https://github.com/George-LabX/raspicluster/blob/main/prog_files/isc-dhcp-server)  
[named.conf.options](https://github.com/George-LabX/raspicluster/blob/main/prog_files/named.conf.options)  
[writeNetworkConfigs.sh](https://github.com/George-LabX/raspicluster/blob/main/prog_files/writeNetworkConfigs.sh)

Each of these are to be used internally throughout this process or used as a template for up and coming codes. Open a terminal, make the following code executable by "changing" its "mode" ```(chmod)```and execute it to make backups of the current network configuration and useful files for reference in later sections. 
```bash
chmod +x writeNetworkConfigs.sh
./writeNetworkConfigs.sh
```
Next you will need to access the netplan of your device and alter it in order to recognize the switchboard and create a Local Area Network (LAN) connection with the remote. First thing we will want to do is locate what the ethernet ports are connected to by running:
```bash
ip a
```
This will bring up current connections and show the ethernet ports that begin with "enp1" and "enp2". The institutional network should have a line stating "inet" and an IP address, something like: XXX.XXX.XX.XX/24. Now that we know which ethernet corresponds to which connection, copy the 01-network-manager-all.yaml file we just previously made into the netplan as this is a template providing the proper indentations and areas for edits, and then open it to make the necessary edits. This is possible with the following code: 
```bash
sudo cp 01-network-manager-all.yaml /etc/netplan/
sudo nano /etc/netplan/*.yaml 
``` 
Now that we are into the network configuration, note the ethernet ports of interest. This template is set up to have enp1 be the organizational internet connection, and enp2 for the switchboard reading "10.1.1.243/24" that can be left alone unless you personally would like it to read differently. Switch these if need be. Next is to change the contents of the enp1 and enp2 listings to your system's IP address, gateway, and nameservers. If you are unsure what the necessary elements are to be changed to, you can find them in the default files we created above at the beginning with the second grouping of codes that made a backup network folder such as defaultIPaddress.conf for the remote IP address, defaultDNS.conf for the namesavers, and ipRoute.conf for the gateway, or in this case the "route". The 'to' and 'metric' locations can be left the same, while your 'via' is to be changed to your gateway and the namesaver to your namesaver.  

After saving the changes with ctrl+x to exit and y to save, enter the following code to update it to the settings specified: 
```bash
sudo netplan apply 
```  
If you receive errors simply retype:
```bash
sudo nano /etc/netplan/*.yaml 
```
to fix the errors, typically a word spelled wrong or indention issues.  

A simple short hand is pressing the “up” arrow on the keyboard to repopulate the terminal line with the previous code, and can keep pressing till you find the code you are looking for.
Next is to run the following codes that will copy the files we made earlier into portions of the remote that will allow us to connect to the switch and access the RPis over a secure shell (ssh) and a cluster secure shell (cssh). NOTE: If you set up the network plan differently than then template (enp1 = institution, enp2 = switch) then you need to edit the isc-dhcp-server file we made previously to be to the ethernet port you have assisgned for the switch at the very bottom. This file is set up for enp1 port.
```bash
sudo cp dhcpd.conf /etc/dhcp/dhcpd.conf
sudo cp isc-dhcp-server /etc/default/isc-dhcp-server       
sudo cp named.conf.options /etc/bind9/named.conf.options
```
For this last code, if your PC does not have a bind9 directory in the /etc directory it will give an error. This can be fixed as follows:
```bash
cd /etc                                                    # changes directory to /etc
sudo mkdir bind9                                           # creates bind9 directory for you to copy file into
cd                                                         # return to home
sudo cp named.conf.options /etc/bind9/named.conf.options   # copies file into directory
```      
And lastly, we turn on the necessary applications to access the switch:
```bash
sudo systemctl start isc-dhcp-server
sudo systemctl start bind9
```
Now, restart the AWOW remote to enact all the changes and connect to the switchboard. Plug in an RPi that has been built and the SD card flashed with the OS system you wish to use, wait about 30-60secs for the RPi to boot where the red light indicates power and green light indicates OS, then type:
```bash
dhcp-lease-list
```
And now you should see a the Pi connected with an IP address around 10.1.1.50 and named “raspberry”, something you can individuate once we now program the RPis.

[next](https://github.com/George-LabX/raspicluster/blob/main/Tutorial/3pi_setup.md)
