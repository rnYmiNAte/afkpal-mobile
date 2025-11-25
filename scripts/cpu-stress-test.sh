#!/bin/bash
echo "🔥 Thermal Stress Test – AFKPal Phone"

adb shell "for i in {1..8}; do yes > /dev/null & done" &
sleep 10

TEMP=$(adb shell dumpsys thermalservice | grep -m 1 temperature | awk '{print $2}')
echo "🌡 Temp: $TEMP °C"

if [ $TEMP -gt 48 ]; then
  echo "⚠ WARNING: HOT – THROTTLING MAY START!"
else
  echo "✔ SAFE – PERFORMANCE OK"
fi

adb shell killall yes 2>/dev/null
echo "🛑 Stress Test Ended"
