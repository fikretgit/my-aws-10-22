#!/bin/bash

# Check if we are root privilage or not

if [[ $UID -ne 0 ]]; then
   echo "Please use this bash script with root privilage"
   exit
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
backup_files="/home/ec2-user/data /etc /boot /usr"
# Where do we backup to. Please crete this file before execute this script
dest="/mnt/backup"
# Create archive filename based on time
time=$(date +"%Y_%m_%d_%I_%M_%p")
hostname=$(hostname -s)
archive_file=$hostname-$time
# Print start status message.
echo "We will back up $backup_files to $dest/$archive_file"
echo
# Backup the files using tar.
tar czf $dest/$archive_file $backup_files
# Print end status message.
echo
echo "Congrulations! Your Backup is ready"
date
# Long listing of files in $dest to check file sizes.
ls -h $dest

#crontab a yazılacak olan komut: 
#crontab -e ile açıp (*/5 * * * * sudo /home/ec2-user/backup.sh) bunu yapıştırıyoruz..!!
#crontab -l komutu da listeliyor..