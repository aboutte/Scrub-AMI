#!/bin/bash
# Written by Andy Boutte and David Balderston of howtoinstallghost.com and allaboutghost.com
# scrubAMI.sh is used to clean our Amazon AMI before submission to the Marketplacei
#
# To run this on our AMI:
# sudo wget -O - https://raw2.github.com/howtoinstallghost/Scrub-AMI/master/scrubAMI.sh | sudo bash

# Stop Ghost
forever stopall

# Things to delete for Ghost

rm -r /var/log/ghost
rm /var/www/ghost/content/data/*.db

# Things to delete at OS level

rm /var/log/cron*
rm /var/log/secure*
rm /var/log/messages*
rm /home/ec2-user/.ssh/authorized_keys
rm /root/.ssh/authorized_keys
find / -name "authorized_keys" –exec rm –f {} \;
find /root/.*history /home/*/.*history -exec rm -f {} \;
