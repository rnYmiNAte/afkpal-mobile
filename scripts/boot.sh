#!/bin/bash
# boot.sh - Connect and boot cloud phone

echo "🔄 Connecting to cloud phone..."

# Check if ADB is available
if ! command -v adb &> /dev/null
then
    echo "❌ ADB not found. Install ADB first."
    exit 1
fi

# Connect to cloud phone
adb start-server
adb devices

# Optional: Wake up phone if asleep
adb shell input keyevent 26  # Power button
adb shell input keyevent 82  # Unlock screen

echo "✔ Cloud phone booted and connected successfully!"

