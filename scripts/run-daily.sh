#!/bin/bash

while true; do
  echo "Running backup..."
  dump.sh
  echo "Backup completed!"
  sleep 86400 # 24h
done
