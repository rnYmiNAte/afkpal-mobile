#!/bin/bash

echo "🔌 Attempting ADB connection..."

# Load IP & Port from env or use default local emulator
CLOUD_PHONE_IP=${CLOUD_PHONE_IP_ENV:-"127.0.0.1"}
PORT=${CLOUD_PHONE_PORT_ENV:-5555}

echo "📡 Target: $CLOUD_PHONE_IP:$PORT"

# Restart ADB in TCP mode
adb tcpip $PORT

# Connect
adb connect $CLOUD_PHONE_IP:$PORT

# Verify
adb devices | grep $CLOUD_PHONE_IP
if [ $? -eq 0 ]; then
  echo "✔ Connected via ADB!"
else
  echo "❌ Failed to connect."
fi
