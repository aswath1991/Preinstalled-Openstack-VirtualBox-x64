#!/bin/bash

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
  lines=$1
else
  lines=$LINES # Default, if not specified on command-line.
fi

echo "Installing Packstack Openstack Repo"
yum install -y https://www.rdoproject.org/repos/rdo-release.rpm
echo "Performing yum update. Please wait..."
yum update -y
echo "Finished yum update"
echo "Downloading Packstack"
yum install -y openstack-packstack
echo "Installed Packstack"
echo "Performing final yum update"
yum update -y
echo "Completed yum update"
echo "Stopping NetworkManager"
service NetworkManager stop
chkconfig NetworkManager off
echo "Starting Manual Network Configuration"
sed -ie 's/BOOTPROTO=\"dhcp\"/BOOTPROTO=\"static\"/g' /etc/sysconfig/network-scripts/ifcfg-enp0s3
sed -ie 's/ONBOOT=\"no\"/ONBOOT=\"yes\"/g' /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "IPADDR=\"10.0.2.15\"" > /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "NETMASK=\"255.255.255.0\"" > /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "NM_CONTROLLED=\"no\"" > /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "DNS1=\"8.8.8.8\"" > /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "NETWORKING=yes"> /etc/sysconfig/network
echo "HOSTNAME=openstack"> /etc/sysconfig/network
route add default gw 10.0.2.2 dev enp0s3
echo "Completed Network Configuration"
echo "Restarting network"
service network restart
echo "Restarted network"
ifconfig enp0s3 down
ifconfig enp0s3 up
dhclient enp0s3
ifconfig
echo "Completed Network configuration"
echo "Installing Openstack. This may take 1 - 2 hours atleast. Please wait..."
packstack --allinone
echo "Packstack installation completed"
