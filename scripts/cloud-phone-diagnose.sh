#!/bin/bash
echo "🔎 AFKPal Cloud Phone Diagnosis Started..."

mkdir -p logs

# 1️⃣ RESET ADB
adb kill-server
sleep 1
adb start-server
sleep 2

# 2️⃣ AUTO-DETECT DEVICE
echo "📡 Searching for Cloud Phone..."
CLOUD_PHONE_IP=$(adb devices -l | grep -oE '192\.168\.[0-9]+\.[0-9]+')

if [ -z "$CLOUD_PHONE_IP" ]; then
  echo "⚠ No device detected — Trying default AFKPal IP..."
  CLOUD_PHONE_IP="192.168.56.101"
fi

echo "🔌 Connecting to: $CLOUD_PHONE_IP"
adb connect $CLOUD_PHONE_IP
sleep 2

adb devices | grep device > /dev/null || {
  echo "❌ Still Not Detected — Manual Mode Required:"
  echo "   adb connect <IP>:5555"
  exit 1
}

echo "✔ Cloud Phone Connected"

# 3️⃣ DEVICE INFO
adb shell getprop > logs/device_info.txt
echo "ANDROID: $(adb shell getprop ro.build.version.release)" >> logs/device_info.txt
echo "CPU: $(adb shell getprop ro.hardware.chipname)" >> logs/device_info.txt
echo "BATTERY: $(adb shell dumpsys battery | grep level | awk '{print $2}')%" >> logs/device_info.txt

# 4️⃣ PERFORMANCE LOGGING
adb shell cat /proc/meminfo > logs/ram_log.txt
adb shell df -h > logs/storage_log.txt
adb shell dumpsys SurfaceFlinger --latency > logs/fps_log.txt 2>/dev/null

# 5️⃣ RUN ALL OTHER TESTS
bash analyze-performance.sh
bash ai-prediction.sh

echo "✨ Diagnosis Complete — Check /logs folder!"
