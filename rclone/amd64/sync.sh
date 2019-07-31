#!/bin/bash

# put your own backup strategy here.
# such as backup the whole data once a day,
# or sync at real time

while true; do

  # rclone sync /data/ dropbox:/ --local-no-check-updated --ignore-size --ignore-checksum
  # echo "synced at $(date)"

  echo 'rewrite file /root/sync.sh to enable sync'

  sleep 30

done
