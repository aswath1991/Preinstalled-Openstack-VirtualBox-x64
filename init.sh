#!/bin/bash
echo "Script started..."
echo "Checking for root access"
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi
echo "Configuring the NAT interface"
dhclient enp0s3
echo "Testing if Internet connectivity is present"
echo "Performing an update"
yum update -y
echo "Printing Network connections:"
ifconfig
echo "Script completed..."
