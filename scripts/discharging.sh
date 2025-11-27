#!/bin/bash
# discharging.sh - Discharge battery safely via ADB over network

CLOUD_PHONE_IP="YOUR_CLOUD_PHONE_IP:5555"

# Ensure connection
adb connect $CLOUD_PHONE_IP

if adb devices | grep -q "$CLOUD_PHONE_IP"; then
    echo "🔋 Connected. Starting discharging..."
else
    echo "❌ Could not connect. Abort discharging."
    exit 1
fi

# Disable all charging sources
adb shell dumpsys battery set ac 0
adb shell dumpsys battery set usb 0
adb shell dumpsys battery set wireless 0

# Optional: set battery level for testing
# adb shell dumpsys battery set level 20

# Show battery status
adb shell dumpsys battery

echo "✔ Discharging mode enabled!"
