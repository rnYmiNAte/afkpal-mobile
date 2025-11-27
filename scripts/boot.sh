#!/bin/bash
# boot.sh - Connect and boot cloud phone via ADB over network

# Replace with your cloud phone IP (and port, usually 5555)
CLOUD_PHONE_IP="YOUR_CLOUD_PHONE_IP:5555"

echo "🔄 Connecting to cloud phone at $CLOUD_PHONE_IP..."
adb connect $CLOUD_PHONE_IP

# Verify device is connected
if adb devices | grep -q "$CLOUD_PHONE_IP"; then
    echo "✔ Cloud phone connected successfully!"
else
    echo "❌ Failed to connect to cloud phone. Check IP and network."
    exit 1
fi

# Wake up phone if asleep
adb shell input keyevent 26  # Power button
adb shell input keyevent 82  # Unlock screen
