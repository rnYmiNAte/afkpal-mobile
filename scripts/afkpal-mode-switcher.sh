#!/bin/bash
echo "=============================================="
echo "🚀 AFKPal Master Mode Switcher (Cloud Phone)"
echo "=============================================="

# 1️⃣ Connect to Cloud Phone
echo "📡 Connecting to AFKPal Cloud Phone..."

adb kill-server
sleep 1
adb start-server
sleep 2

CLOUD_PHONE_IP=$(adb devices -l | grep -oE '192\.168\.[0-9]+\.[0-9]+')
if [ -z "$CLOUD_PHONE_IP" ]; then
  echo "⚠ No device found — Using default IP..."
  CLOUD_PHONE_IP="192.168.56.101"
fi

adb connect $CLOUD_PHONE_IP
sleep 2

adb devices | grep device > /dev/null || {
  echo "❌ No devices detected. Please connect manually:"
  echo "adb connect <CLOUD_PHONE_IP>:5555"
  exit 1
}
echo "✔ Cloud Phone Connected!"

# 2️⃣ Display Mode Menu
echo ""
echo "Select Mode to Activate:"
echo "1) Performance Boost Mode (Safe High Performance)"
echo "2) Overclock Mode (Extreme Performance - Advanced Users!)"
echo "3) Gaming Mode (Optimized for Cloud Gaming / 165Hz)"
echo "4) Run Full Diagnosis + AI Prediction"
echo "5) Exit"
echo ""

read -p "Enter your choice [1-5]: " mode

case $mode in
  1)
    echo "⚡ Activating Performance Boost Mode..."
    bash performance-boost-mode.sh
    ;;
  2)
    echo "🔥 Activating Overclock Mode..."
    bash afkpal-overclock-mode.sh
    ;;
  3)
    echo "🎮 Activating Gaming Mode..."
    bash afkpal-gaming-mode.sh
    ;;
  4)
    echo "🧠 Running Full Diagnosis + AI Prediction..."
    bash cloud-phone-diagnose.sh
    ;;
  5)
    echo "❌ Exiting..."
    exit 0
    ;;
  *)
    echo "⚠ Invalid choice. Exiting..."
    exit 1
    ;;
esac

echo ""
echo "✅ Mode Activation Complete!"
echo "📌 Check logs/ folder for performance reports."
