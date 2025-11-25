#!/bin/bash
echo "📊 Analyzing Cloud Phone Performance..."

RAM=$(grep -o '[0-9]\+' logs/ram_log.txt | head -1)
if [ $RAM -lt 15000000 ]; then
  echo "❌ RAM Less Than 16 GB - Issue Detected!"
else
  echo "✔ RAM PASS - 16 GB OK"
fi

ROM=$(adb shell df -h /data | awk 'NR==2 {print $2}' | sed 's/G//')
if [ ${ROM%.*} -lt 900 ]; then
  echo "❌ ROM below 1TB - Storage Warning!"
else
  echo "✔ ROM PASS - 1TB OK"
fi

FPS=$(grep -o '[0-9]\+.[0-9]\+' logs/fps_log.txt | head -1)
if (( $(echo "$FPS < 60" | bc -l) )); then
  echo "⚠ LOW FPS – Performance Issue Detected (${FPS} FPS)"
else
  echo "✔ FPS PASS (${FPS} FPS)"
fi

echo "📌 Performance Check Finished – See logs/health_report.txt"
