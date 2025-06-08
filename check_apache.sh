#!/bin/bash

# Script: check_apache.sh
# Purpose: Monitor if Apache2 is running, and restart if it's not
# Author: Muhammad Mobeen

status=$(systemctl is-active apache2)

if [ "$status" = "active" ]; then
  echo " Apache2 is running."
else
  echo " Apache2 is not running. Restarting..."
  sudo systemctl start apache2
  echo " Apache2 restarted."
fi
