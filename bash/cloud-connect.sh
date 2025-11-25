#!/bin/bash

echo "🔌 Connecting to Cloud Phone..."

# IP From GitHub Secrets (Recommended)
CLOUD_PHONE_IP=${CLOUD_PHONE_IP_ENV:-"192.168.1.100"}
PORT=${CLOUD_PHONE_PORT:-5555}

echo "📡 Target: $CLOUD_PHONE_IP:$PORT"

# Enable ADB over TCP if needed
adb tcpip $PORT

# Connect to Cloud Phone
adb connect $CLOUD_PHONE_IP:$PORT

if [ $? -eq 0 ]; then
  echo "✔️ Cloud Phone Connected Successfully!"
  adb devices
else
  echo "❌ Connection Failed."
fi
