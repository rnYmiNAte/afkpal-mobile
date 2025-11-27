#!/bin/bash
echo "Booting Cloud Phone..."
adb start-server
adb devices
echo "Phone booted successfully."
