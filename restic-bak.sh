#!/bin/bash

export RESTIC_REPOSITORY=/Volumes/storage/matt/backup/repos/shared/
export RESTIC_PASSWORD_FILE=/etc/restic/restic-pw.txt
export RESTIC_COMPRESSION=max

HOST=host_name
LOG=/var/log/restic/restic.log
RESTIC=/usr/local/bin/restic
TAG=full

#Define a timestamp function
timestamp() {
date "+%b %d %Y %T %Z"
}

# Add timestamp
echo "$(timestamp): restic.sh started" | tee -a $LOG
echo "-------------------------------------------------------------------------------" | tee -a $LOG

# Run Backups
$RESTIC backup \
--quiet \
--tag $TAG \
/ | tee -a $LOG

# Add timestamp
echo "-------------------------------------------------------------------------------" | tee -a $LOG
echo "$(timestamp): restic.sh finished" | tee -a $LOG
printf "\n" | tee -a $LOG
