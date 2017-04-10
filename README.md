# Preinstalled-Openstack-VirtualBox-x64

A Pre-installed Openstack CentOS 7 x64 image that can be directly imported onto VirtualBox. You can literally setup and test Openstack in under 10 minutes. There's no need to install Openstack using this VirtualBox (.vbox/.vdi) image.


## Preface:

I have spent hours setting up every solution out there to test Openstack. None of them are actually easy considering the heavy PC requirements and the time taken to build the Openstack modules from scratch. This solution would absolutely remove the hassle of installing Openstack, before being able to test it out. This solution does not require you to install any other application other than VirtualBox on your PC/Laptop. Openstack uses a lot of CPU and Memory resources. Please ensure that all  your other applications have been saved/closed before running this VM.

This method uses a pre-installed packstack Openstack binary. These binaries are installed on an IP address: 10.0.2.15, which is the default NAT IP that VirtualBox assigns a new machine using a NAT Adapter.


## Minimum Requirements:

- x64 compatible PC/Laptop that supports x64 compatible Virtual hosts
- Latest VirtualBox application installed on your PC/Laptop
- Atleast 4 GB Hard Drive space
- 6 GB RAM
- 4 CPU cores (Quad Core)


Note: You can always increase the RAM, Hard Disk space and the CPU Cores based on your Openstack requirements. Higher configuration is required for running Virtual instances within Openstack smoothly.

---
**Download the Centos-openstack compressed VirtualBox Image from:** https://drive.google.com/file/d/0Bw59oF2-DxdELUd0Qy1xY21Jc0E/view?usp=sharing
---

## Installation Instructions:

1. Download and Extract the zip file onto "VirtualBox VMs" folder located under your Users/<username> folder in your PC.

2. Open VirtualBox application and import the contents of the zip file (Using Machine -> Add option). You should see the entry Centos-openstack in your VM after the import.

3. Quit all other applications running in your laptop/PC. Only then run this VM. The preset settings require you have a quad core x64 PC along with 6GB ram at least. Trust me, this isn't enough for Openstack still.

4. Ensure that the Centos-openstack -> Settings page does not have any invalid settings. Also ensure that the following configurations are properly in-place:


## VM Settings:

a. Under Settings -> USB (turn off USB controller) if it shows up as invalid settings. Adjust your RAM to be at or below 80 % of your actual PC's Memory capacity.


b. Under Centos-openstack -> Settings -> Network, Check if the NAT Adapter is enabled. Ensure that your PC/Laptop running the VirtualBox application has internet connectivity.

![alt tag](https://raw.githubusercontent.com/aswath1991/Preinstalled-Openstack-VirtualBox-x64/master/Requirements/NAT.png)


c.Under Centos-openstack -> Settings -> Network -> Adapter 1 (NAT), Click the "Port Forwarding" button and check if the following Port Forwarding options are in-place, else configure them.

![alt tag](https://raw.githubusercontent.com/aswath1991/Preinstalled-Openstack-VirtualBox-x64/master/Requirements/Port%20Forwarding.png)


d. Check the Settings page of your Centos-openstack VM. It should more-or-less be having the following settings:

![alt tag](https://raw.githubusercontent.com/aswath1991/Preinstalled-Openstack-VirtualBox-x64/master/Requirements/VBox.png)


Now start the VM. Let it load. Use the following PC credentials:

**username: openstack**

**password: openstack**


In the console, run the following command: sudo dhclient enp0s3

[openstack@openstack ~]$ **sudo dhclient enp0s3**

Provide the "openstack" password.

Now, check if you have obtained the 10.0.2.15 IP for enp0s3 interface using the command: ifconfig

[openstack@openstack ~]$ **ifconfig**

![alt tag](https://raw.githubusercontent.com/aswath1991/Preinstalled-Openstack-VirtualBox-x64/master/Requirements/10.0.2.15%20NAT%20IP.png)


This may not work properly if you get any other IP than 10.0.2.15. From your PC/Laptop's browser you should access the following website: **http://localhost:8888**

Openstack's horizon web dashboard should appear with login credentials screen appearing first. 

The credentials are:

**username: admin**

**password: openstack**


This should take to your Openstack console, where you can experiment with Openstack.


## Debug:

If your Openstack web dashboard does not come up properly, check if your local port 8888 is not being blocked by your local firewall.

If the NAT IP obtained from dhclient was something other than 10.0.2.15, you can try this command and check if your Horizon web dashboard opens up from your PC after issuing this command:

[openstack@openstack ~]$ **sudo ifconfig enp0s3 10.0.2.15 netmask 255.255.255.0**

Try to open an ssh terminal from the host PC/Laptop's Putty or ssh client.
Use the command: **ssh openstack@localhost -p 2222**

If, this does not work, then the NAT Port Forwarding is not working properly.

---
Cheers trying out Openstack, the hassle-free way!

Let me know if you have improvements.
