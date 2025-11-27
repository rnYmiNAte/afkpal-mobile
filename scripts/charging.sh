#!/bin/bash
# charging.sh - Enable 55W fast charging via ADB over network

CLOUD_PHONE_IP="YOUR_CLOUD_PHONE_IP:5555"

# Ensure connection
adb connect $CLOUD_PHONE_IP

if adb devices | grep -q "$CLOUD_PHONE_IP"; then
    echo "⚡ Connected to cloud phone. Starting 55W charging..."
else
    echo "❌ Could not connect. Abort charging."
    exit 1
fi

# Enable AC + USB charging
adb shell dumpsys battery set ac 1
adb shell dumpsys battery set usb 1

# Disable wireless charging
adb shell dumpsys battery set wireless 0

# Show battery status
adb shell dumpsys battery

echo "✔ Charging enabled successfully!"
