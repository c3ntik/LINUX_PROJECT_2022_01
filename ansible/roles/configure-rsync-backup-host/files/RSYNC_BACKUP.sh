#!/bin/bash
DATE=$(date '+%Y-%m-%d_%H-%M')

###
nice -n 19 ionice -c2 -n7 rsync -r -p -g -o --progress --ignore-existing rsync://10.10.10.50/RSYNC_WEB/ /opt/RSYNC_BACKUP/WEB

tar cvzf /opt/RSYNC_BACKUP/WEB_$DATE.tar.gz /opt/RSYNC_BACKUP/WEB

rm -rf /opt/RSYNC_BACKUP/WEB/*

mv /opt/RSYNC_BACKUP/*.tar.gz /opt/RSYNC_BACKUP/BACKUP/
