#!/bin/bash
echo "⚠️ Factory Reset Cloud Phone – Starting..."

# Check ADB connection
adb devices | grep "device"
if [ $? -ne 0 ]; then
  echo "❌ No Cloud Phone detected – please connect via adb first."
  exit 1
fi

# Perform reset (⚠️ THIS WILL ERASE EVERYTHING)
adb shell recovery --wipe_data
sleep 2

# Optional: reboot after reset
adb reboot
echo "✔️ Factory Reset Complete. Device Rebooted."
