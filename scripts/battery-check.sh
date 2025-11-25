#!/bin/bash
echo "🔋 Checking Battery..."

BATTERY=$(adb shell dumpsys battery | grep level | awk '{print $2}')

if [ $BATTERY -lt 35 ]; then
  echo "⚠ LOW BATTERY ($BATTERY%) – Enabling Low Power Mode"
  adb shell settings put global low_power 1
else
  echo "✔ Battery OK ($BATTERY%)"
fi
