#!/bin/bash

LOG_PATH='/tmp/tm.log'
echo /dev/null > "$LOG_PATH"

while :
do
  current_time=$(($(date +%s%N)/1000000))
  echo "[$current_time]: im allive" >> "$LOG_PATH"
  sleep 10
done