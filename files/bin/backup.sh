#!/bin/sh -eux

PATH=/bin:/usr/bin

DATE=$(date '+%F_%R')
SERVER=10.1.0.3
echo "Starting rsync..."
rsync --hard-links --archive --progress --delete --stats --exclude-from ~/bin/backup-exclude.patterns ~/ $SERVER:laptop-backup/
echo "Make a snapshot on server..."
ssh -t "$USER"@"$SERVER" "sudo zfs snapshot hpool/home/mats@$DATE"
echo "Done!"

