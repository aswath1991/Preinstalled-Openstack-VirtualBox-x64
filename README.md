# Preinstalled-Openstack-VirtualBox-x64
A Pre-installed Openstack CentOS 7 x64 image that can be directly imported onto VirtualBox

Please find the compressed zip at: 
https://drive.google.com/a/colorado.edu/file/d/0Bw59oF2-DxdEdXR2OVdocTktc00/view?usp=sharing

Instructions:
1. Download and Extract the zip file inside "VirtualBox VMs" folder located under your Users/<username> folder in your PC.
2. Open VirtualBox application and import the contents of the zip file (Using Add option). You should see the entry centos-openstack in your VM after the import.
3. Ensure you have the capabilities for the following configuration, and ensure they are all present (else configure them):
4. Quit all other applications running in your laptop/PC. Only then run this VM. The preset settings require you have a quad core x64 PC along with 7GB ram at least. Trust me, this isn't enough for Openstack still.

5. For downloading the ngn.tiny iso, you can use: Ubuntu 14.04 mini image (37mb)

VM Settings:
Under Settings -> USB (turn off USB controller) if it shows up as invalid settings.
Adjust your RAM to be under 80 - 90% of your actual CPU capacity.
a. 

Under centos-openstack->Settings->Network
b.

c.Under Port Forwarding:

​
Now start the VM. Let it load. Use the following credentials:
username: openstack
password: openstack

Run the following command
$sudo dhclient enp0s3
Provide the password.
$ifconfig
Check that you have a valid IP. From your browser you should access http://localhost:8888
The openstack horizon dashboard should appear.
The credentials are:
username: admin
password: openstack


​
Hope this helps.
