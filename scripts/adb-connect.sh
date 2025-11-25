#!/bin/bash
echo "🔍 Searching for AFKPal Cloud Phone..."

# Kill old ADB server
adb kill-server
sleep 1

# Start fresh ADB server
adb start-server
sleep 2

# Auto-detect IP of Cloud Phone via ADB over network
CLOUD_PHONE_IP=$(adb devices -l | grep -oE '192\.168\.[0-9]+\.[0-9]+')

if [ -z "$CLOUD_PHONE_IP" ]; then
  echo "⚠ No device found. Trying default AFKPal IP..."
  CLOUD_PHONE_IP="192.168.56.101"   # AFKPal Emulator Default (editable)
fi

echo "🔌 Connecting to device: $CLOUD_PHONE_IP"
adb connect $CLOUD_PHONE_IP

sleep 2

# Verify connection
adb devices | grep device
if [ $? -eq 0 ]; then
  echo "✔ Connected to AFKPal Cloud Phone!"
else
  echo "❌ Still Not Detected — Try Manual Mode:"
  echo "   adb connect <CLOUD_PHONE_IP>:5555"
fi
