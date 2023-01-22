#!/usr/bin/env bash

# (c)Volodymyr Korobtsov
# Linux & Bash Task #3


# First parameter must be SOURCE directory
# Second parameter must be DESTINATION directory


logFire="backup.log"

rsync -auz --delete --log-file $logFire  $1 $2

echo "Congratulations. Backup completed successfully."
echo "Log of backup saved in file - $logFire"
